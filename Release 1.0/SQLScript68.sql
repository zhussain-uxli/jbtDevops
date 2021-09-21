/**********************************************************************************************************************
Stored Procedure Name: [dwhcda].[SP_12_rep_production_receipts_fct]
Description: This stored procedure is used to load the data from 3 DST table (Warehouse receipts,Warehousing orders,
Production Schedule) to Fact Warehouse Production Receipt Table.

Delta mechanish is handeled by extracting only latest data from Source table based on max "dwh_load_time" from Target table.

Based on the key columns for each record in the target table, if there already exist a record for the same key then Overwrite the record else Insert the record.

Data Type: Fact Table
Source Table: [acq101].[dst_whinh312]
Target Table: [dwhcda].[lnc_fct_Rep_Production_Receipts]

Lookup Tables: [acq101].[dst_whinh200],[acq101].[dst_tirpt401]
Data Load Frequency: Automatic
Load Type: Delta load
Integration Framework: 

Original Project: JBT Production Planning & Scheduling
Developer: Mohammed Majid
Date: 10/08/2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/
--DROP PROCEDURE [dwhcda].[SP_12_rep_production_receipts_fct];

--EXEC [dwhcda].[SP_12_rep_production_receipts_fct];

CREATE PROCEDURE [dwhcda].[SP_12_rep_production_receipts_fct] 
AS
BEGIN

	SET NOCOUNT ON;
	
	IF OBJECT_ID('[dwhcda].[temp_lnc_fct_Rep_Production_Receipts]', 'U') IS NOT NULL
	DROP TABLE [dwhcda].[temp_lnc_fct_Rep_Production_Receipts]

    Select * INTO [dwhcda].[temp_lnc_fct_Rep_Production_Receipts]    
	From [dwhcda].[lnc_fct_Rep_Production_Receipts] where 1 = 2;

	BEGIN TRANSACTION;

	BEGIN TRY
		
--Production Warehouse Receipts

	Insert into [dwhcda].[temp_lnc_fct_Rep_Production_Receipts]
	([acti],[adin],[ardt],[arej],[arej_kw],[bgxc],[bgxc_kw],[blck],[blck_kw],[casi],[cdck],[cdck_kw],[cdcr],[cdcr_kw],[circ],[clot],[cmnf],[cmpl],[cmpl_kw],[compnr],[conf],[conf_kw],[cpro],[cwar],[deleted],[disp],[disp_kw],[dmse],[dmse_kw],[dslo],[effn],[exhu],[exrr],[fire],[fire_kw],[huid],[hupr],[hupr_kw],[idat],[insp],[insp_kw],[item],[itxt],[ksig],[zload],[logn],[lsta],[lsta_kw],[ltbp],[mpnr],[oorg],[oorg_kw],[orno],[oset],[pkdf],[pmsk],[pono],[psno],[psqr],[psqu],[psun],[qadi],[qadv],[qapr],[qdes],[qdms],[qpui],[qput],[qrcr],[qrec],[qrej],[qrsc],[rcln],[rclo],[rcno],[rcun],[refe],[resn],[revi],[rtcf],[seqn],[serl],[sfbp],[shdt],[shid],[shpm],[shsq],[spcn],[tcst],[tcst_kw],[ztimestamp],[tlot],[trdt],[tsrl],[txtn],[wght],[wtun],[file_name],[dwh_load_time],[carr],[cdec],[hsta],[hsta_kw],[ittp],[ittp_kw],[odat],[sfsi],[sfad],[stad],[wdep],[clsd],[clsd_kw],[cwoc],[prfd],[prmd],[prsd],[prsh],[qrdr],[sdtp],[sdtp_kw],[site],[prod_rec_fct_key])
	SELECT A.[acti],A.[adin],A.[ardt],A.[arej],A.[arej_kw],A.[bgxc],A.[bgxc_kw],A.[blck],A.[blck_kw],A.[casi],A.[cdck],A.[cdck_kw],A.[cdcr],A.[cdcr_kw],A.[circ],A.[clot],A.[cmnf],A.[cmpl],A.[cmpl_kw],A.[compnr],A.[conf],A.[conf_kw],A.[cpro],A.[cwar],A.[deleted],A.[disp],A.[disp_kw],A.[dmse],A.[dmse_kw],A.[dslo],A.[effn],A.[exhu],A.[exrr],A.[fire],A.[fire_kw],A.[huid],A.[hupr],A.[hupr_kw],A.[idat],A.[insp],A.[insp_kw],A.[item],A.[itxt],A.[ksig],A.[zload],A.[logn],A.[lsta],A.[lsta_kw],A.[ltbp],A.[mpnr],A.[oorg],A.[oorg_kw],A.[orno],A.[oset],A.[pkdf],A.[pmsk],A.[pono],A.[psno],A.[psqr],A.[psqu],A.[psun],A.[qadi],A.[qadv],A.[qapr],A.[qdes],A.[qdms],A.[qpui],A.[qput],A.[qrcr],A.[qrec],A.[qrej],A.[qrsc],A.[rcln],A.[rclo],A.[rcno],A.[rcun],A.[refe],A.[resn],A.[revi],A.[rtcf],A.[seqn],A.[serl],A.[sfbp],A.[shdt],A.[shid],A.[shpm],A.[shsq],A.[spcn],A.[tcst],A.[tcst_kw],A.[ztimestamp],A.[tlot],A.[trdt],A.[tsrl],A.[txtn],A.[wght],A.[wtun],A.[file_name],A.[dwh_load_time],
	B.[carr],B.[cdec],B.[hsta],B.[hsta_kw],B.[ittp],B.[ittp_kw],B.[odat],B.[sfsi],B.[sfad],B.[stad],B.[wdep],
	C.[clsd],C.[clsd_kw],C.[cwoc],C.[prfd],C.[prmd],C.[prsd],C.[prsh],C.[qrdr],C.[sdtp],C.[sdtp_kw],C.[site],
	Isnull(A.compnr,'') + '_' + Isnull(A.rcno,'') + '_' + Cast(A.rcln As Varchar) As Prod_Rec_fct_key
	FROM [acq101].[dst_whinh312] A
	LEFT JOIN (Select Distinct [carr],[cdec],[compnr],[hsta],[hsta_kw],[ittp],[ittp_kw],[odat],[oorg],[oorg_kw],[orno],[oset],[sfsi],
				[sfad],[stad],[wdep] 
	FROM [acq101].[dst_whinh200] Where [deleted] = 'False') B
	ON A.[compnr] = B.[compnr] And A.[orno] = B.[orno] And A.[oorg] = B.[oorg] And A.[oset] = B.[oset]
	LEFT JOIN (SELECT [clsd],[clsd_kw],[compnr],[cwoc],[prfd],[prmd],[prsd],[prsh],[qrdr],[sdtp],[sdtp_kw],[site]
	FROM [acq101].[dst_tirpt401] Where [deleted] = 'False') C
	ON A.[compnr] = C.[compnr] And A.orno = C.prsh
	Where A.[dwh_load_time] > CASE WHEN (( SELECT count(*) AS count
                                      FROM [dwhcda].[lnc_fct_Rep_Production_Receipts])) = 0 THEN convert(datetime,'1900-01-01 00:00:00')
                                      ELSE ( SELECT max(dwh_load_time) FROM [dwhcda].[lnc_fct_Rep_Production_Receipts]) END OPTION (LABEL = '[SP_12_rep_production_receipts_fct_1]');

	MERGE [dwhcda].[lnc_fct_Rep_Production_Receipts] As A
	USING [dwhcda].[temp_lnc_fct_Rep_Production_Receipts] B 
	ON A.[Prod_Rec_fct_key] = B.[Prod_Rec_fct_key]
	WHEN Matched AND B.[ztimestamp] > A.[ztimestamp] THEN UPDATE SET A.[acti] = B.[acti],A.[adin] = B.[adin],A.[ardt] = B.[ardt],A.[arej] = B.[arej],A.[arej_kw] = B.[arej_kw],A.[bgxc] = B.[bgxc],A.[bgxc_kw] = B.[bgxc_kw],A.[blck] = B.[blck],A.[blck_kw] = B.[blck_kw],A.[casi] = B.[casi],A.[cdck] = B.[cdck],A.[cdck_kw] = B.[cdck_kw],A.[cdcr] = B.[cdcr],A.[cdcr_kw] = B.[cdcr_kw],A.[circ] = B.[circ],A.[clot] = B.[clot],A.[cmnf] = B.[cmnf],A.[cmpl] = B.[cmpl],A.[cmpl_kw] = B.[cmpl_kw],A.[conf] = B.[conf],A.[conf_kw] = B.[conf_kw],A.[cpro] = B.[cpro],A.[cwar] = B.[cwar],A.[deleted] = B.[deleted],A.[disp] = B.[disp],A.[disp_kw] = B.[disp_kw],A.[dmse] = B.[dmse],A.[dmse_kw] = B.[dmse_kw],A.[dslo] = B.[dslo],A.[effn] = B.[effn],A.[exhu] = B.[exhu],A.[exrr] = B.[exrr],A.[fire] = B.[fire],A.[fire_kw] = B.[fire_kw],A.[huid] = B.[huid],A.[hupr] = B.[hupr],A.[hupr_kw] = B.[hupr_kw],A.[idat] = B.[idat],A.[insp] = B.[insp],A.[insp_kw] = B.[insp_kw],A.[item] = B.[item],A.[itxt] = B.[itxt],A.[ksig] = B.[ksig],A.[zload] = B.[zload],A.[logn] = B.[logn],A.[lsta] = B.[lsta],A.[lsta_kw] = B.[lsta_kw],A.[ltbp] = B.[ltbp],A.[mpnr] = B.[mpnr],A.[oorg] = B.[oorg],A.[oorg_kw] = B.[oorg_kw],A.[orno] = B.[orno],A.[oset] = B.[oset],A.[pkdf] = B.[pkdf],A.[pmsk] = B.[pmsk],A.[pono] = B.[pono],A.[psno] = B.[psno],A.[psqr] = B.[psqr],A.[psqu] = B.[psqu],A.[psun] = B.[psun],A.[qadi] = B.[qadi],A.[qadv] = B.[qadv],A.[qapr] = B.[qapr],A.[qdes] = B.[qdes],A.[qdms] = B.[qdms],A.[qpui] = B.[qpui],A.[qput] = B.[qput],A.[qrcr] = B.[qrcr],A.[qrec] = B.[qrec],A.[qrej] = B.[qrej],A.[qrsc] = B.[qrsc],A.[rclo] = B.[rclo],A.[rcun] = B.[rcun],A.[refe] = B.[refe],A.[resn] = B.[resn],A.[revi] = B.[revi],A.[rtcf] = B.[rtcf],A.[seqn] = B.[seqn],A.[serl] = B.[serl],A.[sfbp] = B.[sfbp],A.[shdt] = B.[shdt],A.[shid] = B.[shid],A.[shpm] = B.[shpm],A.[shsq] = B.[shsq],A.[spcn] = B.[spcn],A.[tcst] = B.[tcst],A.[tcst_kw] = B.[tcst_kw],A.[ztimestamp] = B.[ztimestamp],A.[tlot] = B.[tlot],A.[trdt] = B.[trdt],A.[tsrl] = B.[tsrl],A.[txtn] = B.[txtn],A.[wght] = B.[wght],A.[wtun] = B.[wtun],A.[file_name] = B.[file_name],A.[dwh_load_time] = B.[dwh_load_time],A.[carr] = B.[carr],A.[cdec] = B.[cdec],A.[hsta] = B.[hsta],A.[hsta_kw] = B.[hsta_kw],A.[ittp] = B.[ittp],A.[ittp_kw] = B.[ittp_kw],A.[odat] = B.[odat],A.[sfsi] = B.[sfsi],
	A.[sfad] = B.[sfad],A.[stad] = B.[stad],A.[wdep] = B.[wdep],A.[clsd] = B.[clsd],A.[clsd_kw] = B.[clsd_kw],A.[cwoc] = B.[cwoc],A.[prfd] = B.[prfd],A.[prmd] = B.[prmd],A.[prsd] = B.[prsd],A.[prsh] = B.[prsh],A.[qrdr] = B.[qrdr],A.[sdtp] = B.[sdtp],A.[sdtp_kw] = B.[sdtp_kw],A.[site] = B.[site]
	WHEN NOT MATCHED BY TARGET THEN 
	INSERT ([acti],[adin],[ardt],[arej],[arej_kw],[bgxc],[bgxc_kw],[blck],[blck_kw],[casi],[cdck],[cdck_kw],[cdcr],[cdcr_kw],[circ],[clot],[cmnf],[cmpl],[cmpl_kw],[compnr],[conf],[conf_kw],[cpro],[cwar],[deleted],[disp],[disp_kw],[dmse],[dmse_kw],[dslo],[effn],[exhu],[exrr],[fire],[fire_kw],[huid],[hupr],[hupr_kw],[idat],[insp],[insp_kw],[item],[itxt],[ksig],[zload],[logn],[lsta],[lsta_kw],[ltbp],[mpnr],[oorg],[oorg_kw],[orno],[oset],[pkdf],[pmsk],[pono],[psno],[psqr],[psqu],[psun],[qadi],[qadv],[qapr],[qdes],[qdms],[qpui],[qput],[qrcr],[qrec],[qrej],[qrsc],[rcln],[rclo],[rcno],[rcun],[refe],[resn],[revi],[rtcf],[seqn],[serl],[sfbp],[shdt],[shid],[shpm],[shsq],[spcn],[tcst],[tcst_kw],[ztimestamp],[tlot],[trdt],[tsrl],[txtn],[wght],[wtun],[file_name],[dwh_load_time],[carr],[cdec],[hsta],[hsta_kw],[ittp],[ittp_kw],[odat],[sfsi],[sfad],[stad],[wdep],[clsd],[clsd_kw],[cwoc],[prfd],[prmd],[prsd],[prsh],[qrdr],[sdtp],[sdtp_kw],[site],[prod_rec_fct_key])
	VALUES (B.[acti],B.[adin],B.[ardt],B.[arej],B.[arej_kw],B.[bgxc],B.[bgxc_kw],B.[blck],B.[blck_kw],B.[casi],B.[cdck],B.[cdck_kw],B.[cdcr],B.[cdcr_kw],B.[circ],B.[clot],B.[cmnf],B.[cmpl],B.[cmpl_kw],B.[compnr],B.[conf],B.[conf_kw],B.[cpro],B.[cwar],B.[deleted],B.[disp],B.[disp_kw],B.[dmse],B.[dmse_kw],B.[dslo],B.[effn],B.[exhu],B.[exrr],B.[fire],B.[fire_kw],B.[huid],B.[hupr],B.[hupr_kw],B.[idat],B.[insp],B.[insp_kw],B.[item],B.[itxt],B.[ksig],B.[zload],B.[logn],B.[lsta],B.[lsta_kw],B.[ltbp],B.[mpnr],B.[oorg],B.[oorg_kw],B.[orno],B.[oset],B.[pkdf],B.[pmsk],B.[pono],B.[psno],B.[psqr],B.[psqu],B.[psun],B.[qadi],B.[qadv],B.[qapr],B.[qdes],B.[qdms],B.[qpui],B.[qput],B.[qrcr],B.[qrec],B.[qrej],B.[qrsc],B.[rcln],B.[rclo],B.[rcno],B.[rcun],B.[refe],B.[resn],B.[revi],B.[rtcf],B.[seqn],B.[serl],B.[sfbp],B.[shdt],B.[shid],B.[shpm],B.[shsq],B.[spcn],B.[tcst],B.[tcst_kw],B.[ztimestamp],B.[tlot],B.[trdt],B.[tsrl],B.[txtn],B.[wght],B.[wtun],B.[file_name],B.[dwh_load_time],B.[carr],B.[cdec],B.[hsta],B.[hsta_kw],B.[ittp],B.[ittp_kw],B.[odat],B.[sfsi],B.[sfad],B.[stad],B.[wdep],B.[clsd],B.[clsd_kw],B.[cwoc],B.[prfd],B.[prmd],B.[prsd],B.[prsh],B.[qrdr],B.[sdtp],B.[sdtp_kw],B.[site],B.[prod_rec_fct_key]) 
	OPTION (LABEL = '[SP_12_rep_production_receipts_fct_8]');

									  
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


