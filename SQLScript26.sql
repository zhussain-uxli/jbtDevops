/**********************************************************************************************************************
Stored Procedure Name: [dwhcda].[SP_10_order_fact_hist]
Description: This stored procedure is used to load the data from Sales Order Lines History Transformation table.

Delta mechanish is handeled by extracting only latest data from Source table based on max "dwh_load_time" from Target table.

Based on the key columns for each record in the target table, if there already exist a record for the same key then Overwrite the record else Insert the record.

In Sales order Lines History file the key columns are compnr,orno,pono,sqnb,ckor,sern,trdt, so we are conconating all the columns and storing in a new key column (order_fct_key).

We are joining [acq101].[dst_tdsls400] to get "cofc" column value as this field has null values in source table.

Data Type: Fact Table
Source Table: [dwhcda].[lnc_trn_tdsls451]
Target Table: [dwhcda].[lnc_fct_orders_hist]

Lookup Tables: [acq101].[dst_tdsls400]
Data Load Frequency: Automatic
Load Type: Delta load
Integration Framework: 

Original Project: JBT
Developer: Mohammed Majid
Date: 16-06-2021
Reviewed By: Atul Raje

Change History:
Dt:05/08/2021
History Action field "hisa" added to Sales Order history fact table to update the amta field with -ve when the hisa = 40.
**********************************************************************************************************************/

CREATE PROCEDURE [dwhcda].[SP_10_order_fact_hist] AS
BEGIN
	SET NOCOUNT ON;
	
	IF OBJECT_ID('[dwhcda].[temp_lnc_fct_orders_hist]', 'U') IS NOT NULL
	DROP TABLE [dwhcda].[temp_lnc_fct_orders_hist]

    Select * INTO [dwhcda].[temp_lnc_fct_orders_hist]    
	From [dwhcda].[lnc_fct_orders_hist] where 1 = 2;

	BEGIN TRANSACTION;

	BEGIN TRY
		
--Sales Order History
	Insert into [dwhcda].[temp_lnc_fct_orders_hist]
	(amld,bkyn,clyn,cono,crcd,cubs,cwar,ddta,ddtb,ddtc,ddtd,odat,pono,pric,qidl,qoor,ratt,scon,sfwh,shpm,sqnb,stwh,osrp,retr,sotp,cpls,ddat,futo,hdst,amod,bpcl,cdec,cdis_1,cfrw,compnr,cups,cuqs,disc_1,dltp,item,ldam_1,orno,porg,ptpa,cbrn,cpay,crep,fdpt,itad,itbp,ofad,paym,rtyp,ccur,oamt,odis,stad,stbp,styp,cvat,cofc,delc,invd,ofbp,cwoc,corn,prdt,ztimestamp,orderno,[lineno],Table_ID,Table_Flag,ordvaldue,remoqty,deleted,
	qbbo,hdst_kw,amta,ckor,sern,trdt,order_fct_key,site,hisa,dwh_load_time)
	Select A.amld,A.bkyn,B.clyn,A.cono,A.crcd,A.cubs,A.cwar,A.ddta,A.ddtb,A.ddtc,A.ddtd,A.odat,A.pono,A.pric,A.qidl,A.qoor,A.ratt,A.scon,A.sfwh,A.shpm,A.sqnb,A.stwh,A.osrp,A.retr,A.sotp,A.cpls,A.ddat,A.futo,A.hdst,A.amod,A.bpcl,A.cdec,A.cdis_1,A.cfrw,A.compnr,A.cups,A.cuqs,A.disc_1,A.dltp,A.item,A.ldam_1,A.orno,A.porg,A.ptpa,A.cbrn,A.cpay,A.crep,A.fdpt,A.itad,A.itbp,A.ofad,A.paym,A.rtyp,A.ccur,A.oamt,A.odis,A.stad,A.stbp,A.styp,A.cvat,B.cofc,A.delc,A.invd,A.ofbp,A.cwoc,A.corn,A.prdt,A.ztimestamp,A.orno as orderno,A.pono As [lineno],'Sales Orders' As Table_ID,
	'SO' as Table_Flag,
	Case When A.qoor = 0 then 0 else ((A.qoor - A.qidl) / A.qoor ) * (Case When A.hisa = 40 then IsNull(A.amta,0) * -1 Else A.amta End) End as ordvaldue,(A.qoor - A.qidl) as remoqty,A.deleted,A.qbbo,A.hdst_kw,
	Case When A.hisa = 40 then IsNull(A.amta,0) * -1 Else A.amta End As amta,A.ckor,A.sern,A.trdt,
	A.compnr + '_' + A.orno + '_' + Cast(A.pono As Varchar) + '_' + Cast(A.sqnb As Varchar) + '_' + Cast(A.ckor As Varchar) + '_' + Cast(A.sern As Varchar) + '_' + CONVERT(NVARCHAR,A.trdt, 21) + '_SO' As order_fct_key,site,A.hisa,A.dwh_load_time  
	From 	[dwhcda].[lnc_trn_tdsls451] A
	LEFT JOIN (Select Distinct compnr,orno,cofc,clyn From [acq101].[dst_tdsls400]) B
	ON A.compnr = B.compnr And A.orno = B.orno
	Where 	A.[dwh_load_time] > CASE WHEN (( SELECT count(*) AS count
                                      FROM [dwhcda].[lnc_fct_orders_hist] )) = 0 THEN convert(datetime,'1900-01-01 00:00:00')
                                      ELSE ( SELECT max(dwh_load_time) FROM [dwhcda].[lnc_fct_orders_hist]
									  Where [Table_Flag] = 'SO') END OPTION (LABEL = '[SP_10_order_fact_hist_1]');
									  
	MERGE [dwhcda].[lnc_fct_orders_hist] As A
	USING [dwhcda].[temp_lnc_fct_orders_hist] B 
	--ON A.compnr = B.compnr And A.Orderno = B.Orderno And A.[lineno] = B.[lineno] And A.[Table_Flag] = B.[Table_Flag]
	ON A.order_fct_key = B.order_fct_key
	WHEN Matched AND B.[ztimestamp] > A.[ztimestamp] THEN UPDATE SET A.amld = B.amld,A.bkyn = B.bkyn,A.clyn = B.clyn,A.cono = B.cono,A.crcd = B.crcd,A.cubs = B.cubs,A.cwar = B.cwar,A.ddta = B.ddta,A.ddtb = B.ddtb,A.ddtc = B.ddtc,A.ddtd = B.ddtd,A.dldt = B.dldt,A.odat = B.odat,A.pric = B.pric,A.qidl = B.qidl,A.qoor = B.qoor,A.ratt = B.ratt,A.scon = B.scon,A.sfwh = B.sfwh,A.shpm = B.shpm,A.stwh = B.stwh,A.osrp = B.osrp,A.retr = B.retr,A.sotp = B.sotp,A.cpls = B.cpls,A.ddat = B.ddat,A.futo = B.futo,A.hdst = B.hdst,A.amod = B.amod,A.bpcl = B.bpcl,A.cdec = B.cdec,A.cdis_1 = B.cdis_1,A.cfrw = B.cfrw,A.cups = B.cups,A.cuqs = B.cuqs,A.disc_1 = B.disc_1,A.dltp = B.dltp,A.item = B.item,A.ldam_1 = B.ldam_1,A.porg = B.porg,A.ptpa = B.ptpa,A.cbrn = B.cbrn,A.cpay = B.cpay,A.crep = B.crep,A.fdpt = B.fdpt,A.itad = B.itad,A.itbp = B.itbp,A.ofad = B.ofad,A.paym = B.paym,A.rtyp = B.rtyp,A.ccur = B.ccur,A.oamt = B.oamt,A.odis = B.odis,A.stad = B.stad,A.stbp = B.stbp,A.styp = B.styp,A.cvat = B.cvat,A.cofc = B.cofc,A.acco_1 = B.acco_1,A.acfc_1 = B.acfc_1,A.acin_1 = B.acin_1,A.acln = B.acln,A.acoc_1 = B.acoc_1,A.acpr_1 = B.acpr_1,A.acqu_1 = B.acqu_1,A.actl = B.actl,A.acwa_1 = B.acwa_1,A.adqt = B.adqt,A.adtm = B.adtm,A.amnt_1 = B.amnt_1,A.apam_1 = B.apam_1,A.asco = B.asco,A.asdi = B.asdi,A.asfc = B.asfc,A.asin = B.asin,A.asoc = B.asoc,A.asqu = B.asqu,A.asto = B.asto,A.aswa = B.aswa,A.blyn = B.blyn,A.clst = B.clst,A.ctyn = B.ctyn,A.delc = B.delc,A.ecpr_1 = B.ecpr_1,A.eqan = B.eqan,A.escl = B.escl,A.espr = B.espr,A.ival_1 = B.ival_1,A.lino = B.lino,A.pcac = B.pcac,A.pitm = B.pitm,A.pris = B.pris,A.qtdl = B.qtdl,A.rwca_1 = B.rwca_1,A.rwsa = B.rwsa,A.rwty = B.rwty,A.smto = B.smto,A.cosh = B.cosh,A.acwr_1 = B.acwr_1,A.chlt = B.chlt,A.clrt = B.clrt,A.ctsk = B.ctsk,A.disc = B.disc,A.ecwr_1 = B.ecwr_1,A.eqtm = B.eqtm,A.inam = B.inam,A.invd = B.invd,A.shlt = B.shlt,A.wtyn = B.wtyn,A.acwa_2 = B.acwa_2,A.aqan = B.aqan,A.cotp = B.cotp,A.cuni = B.cuni,A.elgd = B.elgd,A.tltp = B.tltp,A.artm = B.artm,A.cmso = B.cmso,A.dcfw = B.dcfw,A.dlyn = B.dlyn,A.dqty = B.dqty,A.dwrh = B.dwrh,A.lsta = B.lsta,A.pdtm = B.pdtm,A.prtm = B.prtm,A.quan = B.quan,A.racw = B.racw,A.rcfw = B.rcfw,A.rqty = B.rqty,A.rshm = B.rshm,A.rwrh = B.rwrh,A.wono = B.wono,A.wrty = B.wrty,A.zdesc = B.zdesc,A.inpl = B.inpl,A.ordt = B.ordt,A.osta = B.osta,A.cstp = B.cstp,A.pmtd = B.pmtd,A.wrtp = B.wrtp,A.ofbp = B.ofbp,A.amth_1 = B.amth_1,A.amti = B.amti,A.msid = B.msid,A.msln = B.msln,A.sfcp = B.sfcp,A.txah_1 = B.txah_1,A.acam = B.acam,A.apac = B.apac,A.apby = B.apby,A.apdc = B.apdc,A.apdt = B.apdt,A.aper = B.aper,A.ccno = B.ccno,A.clam = B.clam,A.clmt = B.clmt,A.cuaq = B.cuaq,A.cucq = B.cucq,A.ival = B.ival,A.odln = B.odln,A.odsn = B.odsn,A.qaac = B.qaac,A.qccl = B.qccl,A.rjac = B.rjac,A.rjby = B.rjby,A.rjdt = B.rjdt,A.rjre = B.rjre,A.rmrq = B.rmrq,A.stat = B.stat,A.tgto = B.tgto,A.wscl = B.wscl,A.cndt = B.cndt,A.crtm = B.crtm,A.fldt = B.fldt,A.irep = B.irep,A.ocmp = B.ocmp,A.odno = B.odno,A.odty = B.odty,A.oosy = B.oosy,A.zuser = B.zuser,A.cwoc = B.cwoc,A.corn = B.corn,A.prdt = B.prdt,A.amnt = B.amnt,A.cadt = B.cadt,A.cctp = B.cctp,A.csco = B.csco,
	A.pstm = B.pstm,A.ztimestamp = B.ztimestamp,A.Table_ID = B.Table_ID,A.ordvaldue = B.ordvaldue,A.remoqty = B.remoqty,A.deleted = B.deleted,
	A.qbbo = B.qbbo,A.hdst_kw = B.hdst_kw,A.amta = B.amta,A.site = B.site,A.hisa = B.hisa,A.dwh_load_time = B.dwh_load_time
	WHEN NOT MATCHED BY TARGET THEN 
	INSERT (amld,bkyn,clyn,cono,crcd,cubs,cwar,ddta,ddtb,ddtc,ddtd,dldt,odat,pono,pric,qidl,qoor,ratt,scon,sfwh,shpm,sqnb,stwh,osrp,retr,sotp,cpls,ddat,futo,hdst,amod,bpcl,cdec,cdis_1,cfrw,compnr,cups,cuqs,disc_1,dltp,item,ldam_1,orno,porg,ptpa,cbrn,cpay,crep,fdpt,itad,itbp,ofad,paym,rtyp,ccur,oamt,odis,stad,stbp,styp,cvat,cofc,acco_1,acfc_1,acin_1,acln,acoc_1,acpr_1,acqu_1,actl,acwa_1,adqt,adtm,amnt_1,apam_1,asco,asdi,asfc,asin,asoc,asqu,asto,aswa,blyn,clst,ctyn,delc,ecpr_1,eqan,escl,espr,ival_1,lino,pcac,pitm,pris,qtdl,rwca_1,rwsa,rwty,smto,cosh,acwr_1,chlt,clrt,ctsk,disc,ecwr_1,eqtm,inam,invd,shlt,wtyn,acwa_2,aqan,cotp,cuni,elgd,tltp,artm,cmso,dcfw,dlyn,dqty,dwrh,lsta,pdtm,prtm,quan,racw,rcfw,rqty,rshm,rwrh,wono,wrty,zdesc,inpl,ordt,osta,cstp,pmtd,wrtp,ofbp,amth_1,amti,msid,msln,sfcp,txah_1,acam,apac,apby,apdc,apdt,aper,ccno,clam,clmt,cuaq,cucq,ival,odln,odsn,qaac,qccl,rjac,rjby,rjdt,rjre,rmrq,stat,tgto,wscl,cndt,crtm,fldt,irep,ocmp,odno,odty,oosy,zuser,cwoc,corn,prdt,amnt,cadt,cctp,csco,
	pstm,ztimestamp,Orderno,[lineno],Table_ID,Table_Flag,ordvaldue,remoqty,deleted,qbbo,hdst_kw,amta,ckor,sern,trdt,order_fct_key,site,hisa,dwh_load_time)
	VALUES (B.amld,B.bkyn,B.clyn,B.cono,B.crcd,B.cubs,B.cwar,B.ddta,B.ddtb,B.ddtc,B.ddtd,B.dldt,B.odat,B.pono,B.pric,B.qidl,B.qoor,
    B.ratt,B.scon,B.sfwh,B.shpm,B.sqnb,B.stwh,B.osrp,B.retr,B.sotp,B.cpls,B.ddat,B.futo,B.hdst,B.amod,B.bpcl,B.cdec,B.cdis_1,B.cfrw,B.compnr,
    B.cups,B.cuqs,B.disc_1,B.dltp,B.item,B.ldam_1,B.orno,B.porg,B.ptpa,B.cbrn,B.cpay,B.crep,B.fdpt,B.itad,B.itbp,B.ofad,B.paym,B.rtyp,
    B.ccur,B.oamt,B.odis,B.stad,B.stbp,B.styp,B.cvat,B.cofc,B.acco_1,B.acfc_1,B.acin_1,B.acln,B.acoc_1,B.acpr_1,B.acqu_1,B.actl,B.acwa_1,
    B.adqt,B.adtm,B.amnt_1,B.apam_1,B.asco,B.asdi,B.asfc,B.asin,B.asoc,B.asqu,B.asto,B.aswa,B.blyn,B.clst,B.ctyn,B.delc,B.ecpr_1,B.eqan,
    B.escl,B.espr,B.ival_1,B.lino,B.pcac,B.pitm,B.pris,B.qtdl,B.rwca_1,B.rwsa,B.rwty,B.smto,B.cosh,B.acwr_1,B.chlt,B.clrt,B.ctsk,B.disc,
    B.ecwr_1,B.eqtm,B.inam,B.invd,B.shlt,B.wtyn,B.acwa_2,B.aqan,B.cotp,B.cuni,B.elgd,B.tltp,B.artm,B.cmso,B.dcfw,B.dlyn,B.dqty,B.dwrh,B.lsta,B.pdtm,B.prtm,B.quan,B.racw,B.rcfw,B.rqty,B.rshm,B.rwrh,B.wono,B.wrty,B.zdesc,B.inpl,B.ordt,B.osta,B.cstp,B.pmtd,B.wrtp,B.ofbp,B.amth_1,B.amti,B.msid,B.msln,B.sfcp,B.txah_1,B.acam,B.apac,B.apby,B.apdc,B.apdt,B.aper,B.ccno,B.clam,B.clmt,B.cuaq,B.cucq,B.ival,B.odln,B.odsn,B.qaac,B.qccl,B.rjac,B.rjby,B.rjdt,B.rjre,B.rmrq,B.stat,B.tgto,B.wscl,B.cndt,B.crtm,B.fldt,B.irep,B.ocmp,B.odno,B.odty,B.oosy,B.zuser,B.cwoc,B.corn,B.prdt,
	B.amnt,B.cadt,B.cctp,B.csco,B.pstm,B.ztimestamp,B.Orderno,B.[lineno],B.Table_ID,B.Table_Flag,B.ordvaldue,B.remoqty,B.deleted,B.qbbo,
	B.hdst_kw,B.amta,B.ckor,B.sern,B.trdt,B.order_fct_key,B.site,B.hisa,B.dwh_load_time) 
	OPTION (LABEL = '[SP_10_order_fact_hist_2]');

									  
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		ELSE
			COMMIT TRANSACTION;

		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

		SELECT @ErrorMessage = ERROR_MESSAGE();

		SELECT @ErrorSeverity = ERROR_SEVERITY();

		SELECT @ErrorState = ERROR_STATE();

		RAISERROR (
				@ErrorMessage
				,@ErrorSeverity
				,@ErrorState
				);
	END CATCH

	COMMIT TRANSACTION;
END;
GO


