/**********************************************************************************************************************
Stored Procedure Name: [dwhcda].[SP_3_items_master]
Description: This stored procedure is used to load the Items dimension table. 

Delta mechanish is handeled by extracting only latest data from Source table based on max "dwh_load_time" from Target table.

Based on the key columns for each record in the target table, if there already exist a record for the same key then Overwrite the record else Insert the record.

Data Type: Master Data Dimension
Source Table: [acq101].[dst_tcibd001]
Target Table: [dwhcda].[lnc_dim_tcibd001]
Lookup Tables:dst_tcmcs062,dst_tcmcs015,dst_tcmcs061

Data Load Frequency: Automatic
Load Type: Delta load
Integration Framework: 

Original Project: JBT
Developer: Srilatha Naregudam
Date: 26-04-2021
Reviewed By: Atul Raje

Change History:

Developer: Mohammed Majid
Changed Date:26-05-2021
Description: Changed the distribution type of dim table(lnc_dim_tcibd001) to "Replicate" and changed the Stored Procedure logic to delete and
Insert records from the previous Merge query.
**********************************************************************************************************************/
CREATE PROCEDURE [dwhcda].[SP_3_items_master] 
AS
BEGIN
	SET NOCOUNT ON;
	
	/* Creating Temporary table as per the Target Structure */
	
	IF OBJECT_ID('tempdb..#items_master', 'U') IS NOT NULL
    DROP TABLE #items_master;
	
	Select * into #items_master FROM [dwhcda].[lnc_dim_tcibd001] Where 1=2;
	
	BEGIN TRANSACTION;

	BEGIN TRY
	
	/* Query to insert data into Temporary table from the source table by joining with lookup table,which was defined based on delta mechanism*/
	
	Insert into #items_master (ccde,ccde_ref_compnr,ccfg,ccfg_ref_compnr,cean,chma,chma_kw,citg,citg_ref_compnr,cmnf,cmnf_ref_compnr,cnfg,cnfg_kw,cntr,cntr_ref_compnr,coeu,coeu_kw,compnr,cont,cont_kw,cood,cood_ref_compnr,cpcl,cpcl_ref_compnr,cpcp,cpcp_ref_compnr,cpln,cpln_ref_compnr,cprj,cprj_ref_compnr,cpva,cpva_rcmp,crdt,csel,csel_ref_compnr,csig,csig_ref_compnr,ctyo,ctyo_ref_compnr,ctyp,ctyp_ref_compnr,cuni,cuni_ref_compnr,cust,cust_kw,cwun,cwun_ref_compnr,deleted,dfit,dfit_ref_compnr,dpcr,dpcr_kw,dpeg,dpeg_kw,dptp,dptp_kw,dpuu,dpuu_kw,dsca,dscb,dscc,dscd,edco,edco_kw,efco,efpr,efpr_kw,eitm,eitm_kw,elcm,elcm_kw,elrq,elrq_kw,envc,envc_kw,exin,ichg,ichg_kw,icsi,icsi_kw,imag,indt,ippg,ippg_kw,item,itmt,itmt_kw,kitm,kitm_kw,lmdt,ltct,ltct_kw,mcoa,mcoa_kw,oktm,opol,opol_kw,opts,osys,osys_kw,ppeg,ppeg_kw,ppss,ppss_kw,psiu,psiu_kw,rdpt,rdpt_ref_compnr,repl,repl_kw,sayn,sayn_kw,seab,seak,sequencenumber,seri,seri_kw,sgtc,sgtc_kw,srce,srce_kw,stoi,stoi_kw,styp,styp_kw,subc,subc_kw,ztimestamp,txta,txta_ref_compnr,uefs,uefs_kw,umer,umer_kw,unef,unef_kw,username,uset,uset_cwun_ref_compnr,uset_ref_compnr,wght,wpcs,wpcs_kw,file_name,dwh_load_time,product_line_desc,product_type_desc,product_class_desc)
	(Select ccde,ccde_ref_compnr,ccfg,ccfg_ref_compnr,cean,chma,chma_kw,citg,citg_ref_compnr,cmnf,cmnf_ref_compnr,cnfg,cnfg_kw,cntr,			cntr_ref_compnr,coeu,coeu_kw,compnr,cont,cont_kw,cood,cood_ref_compnr,src_items.cpcl As cpcl,cpcl_ref_compnr,cpcp,cpcp_ref_compnr,src_items.cpln As cpln,cpln_ref_compnr,cprj,cprj_ref_compnr,cpva,cpva_rcmp,crdt,csel,csel_ref_compnr,csig,csig_ref_compnr,ctyo,ctyo_ref_compnr,src_items.ctyp As ctyp,ctyp_ref_compnr,cuni,cuni_ref_compnr,cust,cust_kw,cwun,cwun_ref_compnr,deleted,dfit,dfit_ref_compnr,dpcr,dpcr_kw,dpeg,dpeg_kw,dptp,dptp_kw,dpuu,dpuu_kw,src_items.dsca,dscb,dscc,dscd,edco,edco_kw,efco,efpr,efpr_kw,eitm,eitm_kw,elcm,elcm_kw,elrq,elrq_kw,envc,envc_kw,exin,ichg,ichg_kw,icsi,icsi_kw,imag,indt,ippg,ippg_kw,item,itmt,itmt_kw,kitm,kitm_kw,lmdt,ltct,ltct_kw,mcoa,mcoa_kw,oktm,opol,opol_kw,opts,osys,osys_kw,ppeg,ppeg_kw,ppss,ppss_kw,psiu,psiu_kw,rdpt,rdpt_ref_compnr,repl,repl_kw,sayn,sayn_kw,seab,seak,sequencenumber,seri,seri_kw,sgtc,sgtc_kw,srce,srce_kw,stoi,stoi_kw,styp,styp_kw,subc,subc_kw,ztimestamp,txta,txta_ref_compnr,uefs,uefs_kw,umer,umer_kw,unef,unef_kw,username,uset,uset_cwun_ref_compnr,uset_ref_compnr,wght,wpcs,wpcs_kw,src_items.file_name as file_name,src_items.dwh_load_time as dwh_load_time,prd_lines.product_line_desc,prd_types.product_type_desc,prd_class.product_class_desc
	FROM [acq101].[dst_tcibd001] src_items
	left join
	(select cpln,dsca as product_line_desc from [acq101].[dst_tcmcs061]) prd_lines on src_items.cpln=prd_lines.cpln
	left join 
	(select ctyp,dsca as product_type_desc from [acq101].[dst_tcmcs015]) prd_types on src_items.ctyp=prd_types.ctyp
	left join 
	(select cpcl,dsca as product_class_desc from [acq101].[dst_tcmcs062]) prd_class on src_items.cpcl=prd_class.cpcl
	Where src_items.[dwh_load_time] > CASE WHEN (( SELECT count(*) AS count
                                      FROM [dwhcda].[lnc_dim_tcibd001] )) = 0 THEN convert(datetime,'1900-01-01 00:00:00')
                                      ELSE ( SELECT max(dwh_load_time) FROM [dwhcda].[lnc_dim_tcibd001]
                               ) END
		 ) OPTION (LABEL = 'SP_3_items_master_1');
	
	/*Deleting Matching records from #table where ztimestamp of source #table is less than or equal to ztimestamp of target table. */
	
	DELETE B 
	FROM [dwhcda].[lnc_dim_tcibd001] AS A 
	INNER JOIN #items_master AS B 
	ON A.compnr = B.compnr And A.item = B.item AND B.ztimestamp <= A.ztimestamp;
	 
	/* Deleting Matching records from Target table where ztimestamp of source table is greater than ztimestamp of target table. As these updated records need to be inserted into Target table after deletion */
	
	DELETE B
	FROM #items_master as A 
	INNER JOIN [dwhcda].[lnc_dim_tcibd001] AS B
	ON A.compnr = B.compnr And A.item = B.item AND A.ztimestamp > B.ztimestamp;
	
	
	INSERT INTO [dwhcda].[lnc_dim_tcibd001](ccde,ccde_ref_compnr,ccfg,ccfg_ref_compnr,cean,chma,chma_kw,citg,citg_ref_compnr,cmnf,cmnf_ref_compnr,cnfg,cnfg_kw,cntr,cntr_ref_compnr,coeu,coeu_kw,compnr,cont,cont_kw,cood,cood_ref_compnr,cpcl,cpcl_ref_compnr,cpcp,cpcp_ref_compnr,cpln,cpln_ref_compnr,cprj,cprj_ref_compnr,cpva,cpva_rcmp,crdt,csel,csel_ref_compnr,csig,csig_ref_compnr,ctyo,ctyo_ref_compnr,ctyp,ctyp_ref_compnr,cuni,cuni_ref_compnr,cust,cust_kw,cwun,cwun_ref_compnr,deleted,dfit,dfit_ref_compnr,dpcr,dpcr_kw,dpeg,dpeg_kw,dptp,dptp_kw,dpuu,dpuu_kw,dsca,dscb,dscc,dscd,edco,edco_kw,efco,efpr,efpr_kw,eitm,eitm_kw,elcm,elcm_kw,elrq,elrq_kw,envc,envc_kw,exin,ichg,ichg_kw,icsi,icsi_kw,imag,indt,ippg,ippg_kw,item,itmt,itmt_kw,kitm,kitm_kw,lmdt,ltct,ltct_kw,mcoa,mcoa_kw,oktm,opol,opol_kw,opts,osys,osys_kw,ppeg,ppeg_kw,ppss,ppss_kw,psiu,psiu_kw,rdpt,rdpt_ref_compnr,repl,repl_kw,sayn,sayn_kw,seab,seak,sequencenumber,seri,seri_kw,sgtc,sgtc_kw,srce,srce_kw,stoi,stoi_kw,styp,styp_kw,subc,subc_kw,ztimestamp,txta,txta_ref_compnr,uefs,uefs_kw,umer,umer_kw,unef,unef_kw,username,uset,uset_cwun_ref_compnr,uset_ref_compnr,wght,wpcs,wpcs_kw,file_name,dwh_load_time,product_line_desc,product_type_desc,product_class_desc)
	(Select B.ccde,B.ccde_ref_compnr,B.ccfg,B.ccfg_ref_compnr,B.cean,B.chma,B.chma_kw,B.citg,B.citg_ref_compnr,B.cmnf,B.cmnf_ref_compnr,B.cnfg,B.cnfg_kw,B.cntr,B.cntr_ref_compnr,B.coeu,B.coeu_kw,B.compnr,B.cont,B.cont_kw,B.cood,B.cood_ref_compnr,B.cpcl,B.cpcl_ref_compnr,B.cpcp,B.cpcp_ref_compnr,B.cpln,B.cpln_ref_compnr,B.cprj,B.cprj_ref_compnr,B.cpva,B.cpva_rcmp,B.crdt,B.csel,B.csel_ref_compnr,B.csig,B.csig_ref_compnr,B.ctyo,B.ctyo_ref_compnr,B.ctyp,B.ctyp_ref_compnr,B.cuni,B.cuni_ref_compnr,B.cust,B.cust_kw,B.cwun,B.cwun_ref_compnr,B.deleted,B.dfit,B.dfit_ref_compnr,B.dpcr,B.dpcr_kw,B.dpeg,B.dpeg_kw,B.dptp,B.dptp_kw,B.dpuu,B.dpuu_kw,B.dsca,B.dscb,B.dscc,B.dscd,B.edco,B.edco_kw,B.efco,B.efpr,B.efpr_kw,B.eitm,B.eitm_kw,B.elcm,B.elcm_kw,B.elrq,B.elrq_kw,B.envc,B.envc_kw,B.exin,B.ichg,B.ichg_kw,B.icsi,B.icsi_kw,B.imag,B.indt,B.ippg,B.ippg_kw,B.item,B.itmt,B.itmt_kw,B.kitm,B.kitm_kw,B.lmdt,B.ltct,B.ltct_kw,B.mcoa,B.mcoa_kw,B.oktm,B.opol,B.opol_kw,B.opts,B.osys,B.osys_kw,B.ppeg,B.ppeg_kw,B.ppss,B.ppss_kw,B.psiu,B.psiu_kw,B.rdpt,B.rdpt_ref_compnr,B.repl,B.repl_kw,B.sayn,B.sayn_kw,B.seab,B.seak,B.sequencenumber,B.seri,B.seri_kw,B.sgtc,B.sgtc_kw,B.srce,B.srce_kw,B.stoi,B.stoi_kw,B.styp,B.styp_kw,B.subc,B.subc_kw,B.ztimestamp,B.txta,B.txta_ref_compnr,B.uefs,B.uefs_kw,B.umer,B.umer_kw,B.unef,B.unef_kw,B.username,B.uset,B.uset_cwun_ref_compnr,B.uset_ref_compnr,B.wght,B.wpcs,B.wpcs_kw,B.file_name,B.dwh_load_time,B.product_line_desc,B.product_type_desc,B.product_class_desc
	FROM #items_master as B ) OPTION (LABEL = 'SP_3_items_master_2');
	
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


