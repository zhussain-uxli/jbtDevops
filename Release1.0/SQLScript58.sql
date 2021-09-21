/**********************************************************************************************************************
Stored Procedure Name: [dwhcda].[SP_17_GL_finalized_transactions_fct]
Description: This stored procedure is used to load the data from DST table (Actual Finalized Transactions) to Fact Actual Finalized Transactions Table.

Delta mechanish is handeled by extracting only latest data from Source table based on max "dwh_load_time" from Target table.

Based on the key columns for each record in the target table, if there already exist a record for the same key then Overwrite the record else Insert the record.

Data Type: Fact Table
Source Table: [acq101].[dst_tfgld106]
Target Table: [dwhcda].[lnc_fct_GL_finalized_transactions]

Lookup Tables: [acq101].[dst_whinh200],[acq101].[dst_tirpt401]
Data Load Frequency: Automatic
Load Type: Delta load
Integration Framework: 

Original Project: JBT FI-GL
Developer: Mohammed Majid
Date: 26/08/2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/
--DROP PROCEDURE [dwhcda].[SP_17_GL_finalized_transactions_fct];

--EXEC [dwhcda].[SP_17_GL_finalized_transactions_fct];

CREATE PROCEDURE [dwhcda].[SP_17_GL_finalized_transactions_fct] 
AS
BEGIN

	SET NOCOUNT ON;
	
	IF OBJECT_ID('tempdb..#gl_finz_trns', 'U') IS NOT NULL
    DROP TABLE #gl_finz_trns;

    Select * INTO #gl_finz_trns    
	From [dwhcda].[lnc_fct_GL_finalized_transactions] where 1 = 2;

	BEGIN TRANSACTION;

	BEGIN TRY
		
--Actual Finalized Transactions

	Insert into #gl_finz_trns
	([adty],[adty_kw],[amnt],[amth_1],[amth_2],[amth_3],[bpid],[buex],[buex_kw],[cacc],[catg],[catg_kw],[ccty],[ccur],[cdln],[cfrs],[cinv],[clin],[compnr],[cont],[cont_kw],[corn],[crdt],[csrn],[ctyp],[cvat],[zdate],[dbcr],[dbcr_kw],[dcdt],[dele],[dele_kw],[deleted],[dim1],[dim2],[dim3],[dim4],[dim5],[dim6],[dim7],[dim8],[dim9],[dm10],[dm11],[dm12],[expd],[expd_kw],[fact_1],[fact_2],[fact_3],[fdoc],[fprd],[ftyp],[fyer],[intt],[intt_kw],[leac],[obat],[ocmp],[odoc],[olin],[osrl],[osrn],[otyp],[oyer],[qty1],[qty2],[ratd],[rate_1],[rate_2],[rate_3],[recl],[recl_kw],[reco],[reco_kw],[recs],[ref2],[refr],[rprd],[rtyp],[ryer],[secd],[tcsh],[tcsh_kw],[tedt],[ztime],[ztimestamp],[ztran],[tran_kw],[trun],[txta],[typ1],[typ2],[typ3],[typ4],[typ5],[zuser],[vamh_1],[vamh_2],[vamh_3],[vamt],[vlac],[vprd],[vtyp],[vtyp_kw],[vyer],[wtsc],[wtsc_kw],[file_name],[dwh_load_time],[db_cr_amnt],GL_finz_trans_key)
	SELECT A.[adty],A.[adty_kw],A.[amnt],A.[amth_1],A.[amth_2],A.[amth_3],A.[bpid],A.[buex],A.[buex_kw],A.[cacc],A.[catg],A.[catg_kw],A.[ccty],A.[ccur],A.[cdln],A.[cfrs],A.[cinv],A.[clin],A.[compnr],A.[cont],A.[cont_kw],A.[corn],A.[crdt],A.[csrn],A.[ctyp],A.[cvat],A.[zdate],A.[dbcr],A.[dbcr_kw],A.[dcdt],A.[dele],A.[dele_kw],A.[deleted],A.[dim1],A.[dim2],A.[dim3],A.[dim4],A.[dim5],A.[dim6],A.[dim7],A.[dim8],A.[dim9],A.[dm10],A.[dm11],A.[dm12],A.[expd],A.[expd_kw],A.[fact_1],A.[fact_2],A.[fact_3],A.[fdoc],A.[fprd],A.[ftyp],A.[fyer],A.[intt],A.[intt_kw],A.[leac],A.[obat],A.[ocmp],A.[odoc],A.[olin],A.[osrl],A.[osrn],A.[otyp],A.[oyer],A.[qty1],A.[qty2],A.[ratd],A.[rate_1],A.[rate_2],A.[rate_3],A.[recl],A.[recl_kw],A.[reco],A.[reco_kw],A.[recs],A.[ref2],A.[refr],A.[rprd],A.[rtyp],A.[ryer],A.[secd],A.[tcsh],A.[tcsh_kw],A.[tedt],A.[ztime],A.[ztimestamp],A.[ztran],A.[tran_kw],A.[trun],A.[txta],A.[typ1],A.[typ2],A.[typ3],A.[typ4],A.[typ5],A.[zuser],A.[vamh_1],A.[vamh_2],A.[vamh_3],A.[vamt],A.[vlac],A.[vprd],A.[vtyp],A.[vtyp_kw],A.[vyer],A.[wtsc],A.[wtsc_kw],A.[file_name],A.[dwh_load_time],
	Case When Upper(A.dbcr_kw) = Upper('tfgld.dbcr.debit') Then Isnull(A.amnt,0)
		 When Upper(A.dbcr_kw) = Upper('tfgld.dbcr.credit') Then (Isnull(A.amnt,0) * -1) Else Isnull(A.amnt,0) End As db_cr_amnt,
	Isnull(A.compnr,'') + '_' + Cast(A.odoc As Varchar) + '_' + Cast(A.olin As Varchar) + '_' + Cast(A.osrl As Varchar) + '_' + Cast(A.osrn As Varchar) + '_' + Isnull(A.otyp,'') As GL_finz_trans_key  
	FROM [acq101].[dst_tfgld106] A
	Where A.[dwh_load_time] > CASE WHEN (( SELECT count(*) AS count
                                      FROM [dwhcda].[lnc_fct_GL_finalized_transactions])) = 0 THEN convert(datetime,'1900-01-01 00:00:00')
                                      ELSE ( SELECT max(dwh_load_time) FROM [dwhcda].[lnc_fct_GL_finalized_transactions]) END OPTION (LABEL = '[SP_17_GL_finalized_transactions_fct_1]');

	MERGE [dwhcda].[lnc_fct_GL_finalized_transactions] As A
	USING #gl_finz_trns B 
	ON A.[GL_finz_trans_key] = B.[GL_finz_trans_key]
	WHEN Matched AND B.[ztimestamp] > A.[ztimestamp] THEN UPDATE SET A.[adty] = B.[adty],A.[adty_kw] = B.[adty_kw],A.[amnt] = B.[amnt],A.[amth_1] = B.[amth_1],A.[amth_2] = B.[amth_2],A.[amth_3] = B.[amth_3],A.[bpid] = B.[bpid],A.[buex] = B.[buex],A.[buex_kw] = B.[buex_kw],A.[cacc] = B.[cacc],A.[catg] = B.[catg],A.[catg_kw] = B.[catg_kw],A.[ccty] = B.[ccty],A.[ccur] = B.[ccur],A.[cdln] = B.[cdln],A.[cfrs] = B.[cfrs],A.[cinv] = B.[cinv],A.[clin] = B.[clin],A.[cont] = B.[cont],A.[cont_kw] = B.[cont_kw],A.[corn] = B.[corn],A.[crdt] = B.[crdt],A.[csrn] = B.[csrn],A.[ctyp] = B.[ctyp],A.[cvat] = B.[cvat],A.[zdate] = B.[zdate],A.[dbcr] = B.[dbcr],A.[dbcr_kw] = B.[dbcr_kw],A.[dcdt] = B.[dcdt],A.[dele] = B.[dele],A.[dele_kw] = B.[dele_kw],A.[deleted] = B.[deleted],A.[dim1] = B.[dim1],A.[dim2] = B.[dim2],A.[dim3] = B.[dim3],A.[dim4] = B.[dim4],A.[dim5] = B.[dim5],A.[dim6] = B.[dim6],A.[dim7] = B.[dim7],A.[dim8] = B.[dim8],A.[dim9] = B.[dim9],A.[dm10] = B.[dm10],A.[dm11] = B.[dm11],A.[dm12] = B.[dm12],A.[expd] = B.[expd],A.[expd_kw] = B.[expd_kw],A.[fact_1] = B.[fact_1],A.[fact_2] = B.[fact_2],A.[fact_3] = B.[fact_3],A.[fdoc] = B.[fdoc],A.[fprd] = B.[fprd],A.[ftyp] = B.[ftyp],A.[fyer] = B.[fyer],A.[intt] = B.[intt],A.[intt_kw] = B.[intt_kw],A.[leac] = B.[leac],A.[obat] = B.[obat],A.[ocmp] = B.[ocmp],A.[oyer] = B.[oyer],A.[qty1] = B.[qty1],A.[qty2] = B.[qty2],A.[ratd] = B.[ratd],A.[rate_1] = B.[rate_1],A.[rate_2] = B.[rate_2],A.[rate_3] = B.[rate_3],A.[recl] = B.[recl],A.[recl_kw] = B.[recl_kw],A.[reco] = B.[reco],A.[reco_kw] = B.[reco_kw],A.[recs] = B.[recs],A.[ref2] = B.[ref2],A.[refr] = B.[refr],A.[rprd] = B.[rprd],A.[rtyp] = B.[rtyp],A.[ryer] = B.[ryer],A.[secd] = B.[secd],A.[tcsh] = B.[tcsh],A.[tcsh_kw] = B.[tcsh_kw],A.[tedt] = B.[tedt],A.[ztime] = B.[ztime],A.[ztimestamp] = B.[ztimestamp],A.[ztran] = B.[ztran],A.[tran_kw] = B.[tran_kw],A.[trun] = B.[trun],A.[txta] = B.[txta],A.[typ1] = B.[typ1],A.[typ2] = B.[typ2],A.[typ3] = B.[typ3],A.[typ4] = B.[typ4],A.[typ5] = B.[typ5],A.[zuser] = B.[zuser],A.[vamh_1] = B.[vamh_1],A.[vamh_2] = B.[vamh_2],A.[vamh_3] = B.[vamh_3],A.[vamt] = B.[vamt],A.[vlac] = B.[vlac],A.[vprd] = B.[vprd],A.[vtyp] = B.[vtyp],A.[vtyp_kw] = B.[vtyp_kw],A.[vyer] = B.[vyer],A.[wtsc] = B.[wtsc],A.[wtsc_kw] = B.[wtsc_kw],A.[file_name] = B.[file_name],A.[dwh_load_time] = B.[dwh_load_time],
	A.[db_cr_amnt] = B.[db_cr_amnt]
	WHEN NOT MATCHED BY TARGET THEN 
	INSERT ([adty],[adty_kw],[amnt],[amth_1],[amth_2],[amth_3],[bpid],[buex],[buex_kw],[cacc],[catg],[catg_kw],[ccty],[ccur],[cdln],[cfrs],[cinv],[clin],[compnr],[cont],[cont_kw],[corn],[crdt],[csrn],[ctyp],[cvat],[zdate],[dbcr],[dbcr_kw],[dcdt],[dele],[dele_kw],[deleted],[dim1],[dim2],[dim3],[dim4],[dim5],[dim6],[dim7],[dim8],[dim9],[dm10],[dm11],[dm12],[expd],[expd_kw],[fact_1],[fact_2],[fact_3],[fdoc],[fprd],[ftyp],[fyer],[intt],[intt_kw],[leac],[obat],[ocmp],[odoc],[olin],[osrl],[osrn],[otyp],[oyer],[qty1],[qty2],[ratd],[rate_1],[rate_2],[rate_3],[recl],[recl_kw],[reco],[reco_kw],[recs],[ref2],[refr],[rprd],[rtyp],[ryer],[secd],[tcsh],[tcsh_kw],[tedt],[ztime],[ztimestamp],[ztran],[tran_kw],[trun],[txta],[typ1],[typ2],[typ3],[typ4],[typ5],[zuser],[vamh_1],[vamh_2],[vamh_3],[vamt],[vlac],[vprd],[vtyp],[vtyp_kw],[vyer],[wtsc],[wtsc_kw],[file_name],[dwh_load_time],[db_cr_amnt],GL_finz_trans_key)
	VALUES (B.[adty],B.[adty_kw],B.[amnt],B.[amth_1],B.[amth_2],B.[amth_3],B.[bpid],B.[buex],B.[buex_kw],B.[cacc],B.[catg],B.[catg_kw],B.[ccty],B.[ccur],B.[cdln],B.[cfrs],B.[cinv],B.[clin],B.[compnr],B.[cont],B.[cont_kw],B.[corn],B.[crdt],B.[csrn],B.[ctyp],B.[cvat],B.[zdate],B.[dbcr],B.[dbcr_kw],B.[dcdt],B.[dele],B.[dele_kw],B.[deleted],B.[dim1],B.[dim2],B.[dim3],B.[dim4],B.[dim5],B.[dim6],B.[dim7],B.[dim8],B.[dim9],B.[dm10],B.[dm11],B.[dm12],B.[expd],B.[expd_kw],B.[fact_1],B.[fact_2],B.[fact_3],B.[fdoc],B.[fprd],B.[ftyp],B.[fyer],B.[intt],B.[intt_kw],B.[leac],B.[obat],B.[ocmp],B.[odoc],B.[olin],B.[osrl],B.[osrn],B.[otyp],B.[oyer],B.[qty1],B.[qty2],B.[ratd],B.[rate_1],B.[rate_2],B.[rate_3],B.[recl],B.[recl_kw],B.[reco],B.[reco_kw],B.[recs],B.[ref2],B.[refr],B.[rprd],B.[rtyp],B.[ryer],B.[secd],B.[tcsh],B.[tcsh_kw],B.[tedt],B.[ztime],B.[ztimestamp],B.[ztran],B.[tran_kw],B.[trun],B.[txta],B.[typ1],B.[typ2],B.[typ3],B.[typ4],B.[typ5],B.[zuser],B.[vamh_1],B.[vamh_2],B.[vamh_3],B.[vamt],B.[vlac],B.[vprd],B.[vtyp],B.[vtyp_kw],B.[vyer],B.[wtsc],B.[wtsc_kw],B.[file_name],B.[dwh_load_time],
	B.[db_cr_amnt],B.GL_finz_trans_key) 
	OPTION (LABEL = '[SP_17_GL_finalized_transactions_fct_2]');

									  
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


