/**********************************************************************************************************************
Stored Procedure Name: [dwhcda].[SP_15_GL_hist_transactions_fct]
Description: This stored procedure is used to load the data from DST table (Actual Ledger History GL Transactions) to Fact Actual Ledger History GL Transactions Table.

Delta mechanish is handeled by extracting only latest data from Source table based on max "dwh_load_time" from Target table.

Based on the key columns for each record in the target table, if there already exist a record for the same key then Overwrite the record else Insert the record.

Data Type: Fact Table
Source Table: [acq101].[dst_tfgld205]
Target Table: [dwhcda].[lnc_fct_GL_hist_transactions]

Lookup Tables: [acq101].[dst_whinh200],[acq101].[dst_tirpt401]
Data Load Frequency: Automatic
Load Type: Delta load
Integration Framework: 

Original Project: JBT FI-GL
Developer: Mohammed Majid
Date: 25/08/2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/
--DROP PROCEDURE [dwhcda].[SP_15_GL_hist_transactions_fct];

--EXEC [dwhcda].[SP_15_GL_hist_transactions_fct];

CREATE PROCEDURE [dwhcda].[SP_15_GL_hist_transactions_fct] 
AS
BEGIN

	SET NOCOUNT ON;
	
	IF OBJECT_ID('tempdb..#gl_hist_trns', 'U') IS NOT NULL
    DROP TABLE #gl_hist_trns;

    Select * INTO #gl_hist_trns    
	From [dwhcda].[lnc_fct_GL_hist_transactions] where 1 = 2;

	BEGIN TRANSACTION;

	BEGIN TRY
		
--Actual Ledger History GL Transactions

	Insert into #gl_hist_trns
	([bpid],[ccur],[compnr],[cono],[deleted],[dim1],[dim2],[dim3],[dim4],[dim5],[dim6],[dim7],[dim8],[dim9],[dims],[dimx_sgm1],[dimx_sgm2],[dm10],[dm11],[dm12],[duac],[duac_kw],[fcah_1],[fcah_2],[fcah_3],[fcah_dtwc],[fcah_rfrc],[fcam],[fdah_1],[fdah_2],[fdah_3],[fdah_dtwc],[fdah_rfrc],[fdam],[fqt1],[fqt2],[leac],[ncah_1],[ncah_2],[ncah_3],[ncah_dtwc],[ncah_rfrc],[ncam],[ndah_1],[ndah_2],[ndah_3],[ndah_dtwc],[ndah_rfrc],[ndam],[nqt1],[nqt2],[olap],[prno],[ptyp],[ptyp_kw],[ztimestamp],[zyear],[file_name],[dwh_load_time],
	GL_hist_trans_key)
	SELECT A.[bpid],A.[ccur],A.[compnr],A.[cono],A.[deleted],A.[dim1],A.[dim2],A.[dim3],A.[dim4],A.[dim5],A.[dim6],A.[dim7],A.[dim8],A.[dim9],A.[dims],A.[dimx_sgm1],A.[dimx_sgm2],A.[dm10],A.[dm11],A.[dm12],A.[duac],A.[duac_kw],A.[fcah_1],A.[fcah_2],A.[fcah_3],A.[fcah_dtwc],A.[fcah_rfrc],A.[fcam],A.[fdah_1],A.[fdah_2],A.[fdah_3],A.[fdah_dtwc],A.[fdah_rfrc],A.[fdam],A.[fqt1],A.[fqt2],A.[leac],A.[ncah_1],A.[ncah_2],A.[ncah_3],A.[ncah_dtwc],A.[ncah_rfrc],A.[ncam],A.[ndah_1],A.[ndah_2],A.[ndah_3],A.[ndah_dtwc],A.[ndah_rfrc],A.[ndam],A.[nqt1],A.[nqt2],A.[olap],A.[prno],A.[ptyp],A.[ptyp_kw],A.[ztimestamp],A.[zyear],A.[file_name],A.[dwh_load_time],
	Isnull(A.bpid,'') + '_' + Isnull(A.ccur,'') + '_' + Isnull(A.compnr,'') + '_' + Cast(A.cono As Varchar) + '_' + Isnull(A.dim1,'') + '_' + Isnull(A.dim2,'') + '_' + Isnull(A.dim3,'') + '_' + Isnull(A.dim4,'') + '_' + Isnull(A.dim5,'') + '_' + Isnull(A.dims,'') + '_' + Cast(A.duac As Varchar) + '_' + Isnull(A.leac,'') + '_' + Cast(A.prno As Varchar) + '_' + Cast(A.ptyp As Varchar) + '_' + Cast(A.zyear As Varchar)  As GL_hist_trans_key  
	FROM [acq101].[dst_tfgld205] A
	Where A.[dwh_load_time] > CASE WHEN (( SELECT count(*) AS count
                                      FROM [dwhcda].[lnc_fct_GL_hist_transactions])) = 0 THEN convert(datetime,'1900-01-01 00:00:00')
                                      ELSE ( SELECT max(dwh_load_time) FROM [dwhcda].[lnc_fct_GL_hist_transactions]) END OPTION (LABEL = '[SP_15_GL_hist_transactions_fct_1]');

	MERGE [dwhcda].[lnc_fct_GL_hist_transactions] As A
	USING #gl_hist_trns B 
	ON A.[GL_hist_trans_key] = B.[GL_hist_trans_key]
	WHEN Matched AND B.[ztimestamp] > A.[ztimestamp] THEN UPDATE SET A.[deleted] = B.[deleted],A.[dim6] = B.[dim6],A.[dim7] = B.[dim7],A.[dim8] = B.[dim8],A.[dim9] = B.[dim9],A.[dimx_sgm1] = B.[dimx_sgm1],A.[dimx_sgm2] = B.[dimx_sgm2],A.[dm10] = B.[dm10],A.[dm11] = B.[dm11],A.[dm12] = B.[dm12],A.[duac_kw] = B.[duac_kw],A.[fcah_1] = B.[fcah_1],A.[fcah_2] = B.[fcah_2],A.[fcah_3] = B.[fcah_3],A.[fcah_dtwc] = B.[fcah_dtwc],A.[fcah_rfrc] = B.[fcah_rfrc],A.[fcam] = B.[fcam],A.[fdah_1] = B.[fdah_1],A.[fdah_2] = B.[fdah_2],A.[fdah_3] = B.[fdah_3],A.[fdah_dtwc] = B.[fdah_dtwc],A.[fdah_rfrc] = B.[fdah_rfrc],A.[fdam] = B.[fdam],A.[fqt1] = B.[fqt1],A.[fqt2] = B.[fqt2],A.[ncah_1] = B.[ncah_1],A.[ncah_2] = B.[ncah_2],A.[ncah_3] = B.[ncah_3],A.[ncah_dtwc] = B.[ncah_dtwc],A.[ncah_rfrc] = B.[ncah_rfrc],A.[ncam] = B.[ncam],A.[ndah_1] = B.[ndah_1],A.[ndah_2] = B.[ndah_2],A.[ndah_3] = B.[ndah_3],A.[ndah_dtwc] = B.[ndah_dtwc],A.[ndah_rfrc] = B.[ndah_rfrc],A.[ndam] = B.[ndam],A.[nqt1] = B.[nqt1],A.[nqt2] = B.[nqt2],A.[olap] = B.[olap],A.[ptyp_kw] = B.[ptyp_kw],A.[ztimestamp] = B.[ztimestamp],A.[file_name] = B.[file_name],A.[dwh_load_time] = B.[dwh_load_time]
	WHEN NOT MATCHED BY TARGET THEN 
	INSERT ([bpid],[ccur],[compnr],[cono],[deleted],[dim1],[dim2],[dim3],[dim4],[dim5],[dim6],[dim7],[dim8],[dim9],[dims],[dimx_sgm1],[dimx_sgm2],[dm10],[dm11],[dm12],[duac],[duac_kw],[fcah_1],[fcah_2],[fcah_3],[fcah_dtwc],[fcah_rfrc],[fcam],[fdah_1],[fdah_2],[fdah_3],[fdah_dtwc],[fdah_rfrc],[fdam],[fqt1],[fqt2],[leac],[ncah_1],[ncah_2],[ncah_3],[ncah_dtwc],[ncah_rfrc],[ncam],[ndah_1],[ndah_2],[ndah_3],[ndah_dtwc],[ndah_rfrc],[ndam],[nqt1],[nqt2],[olap],[prno],[ptyp],[ptyp_kw],[ztimestamp],[zyear],[file_name],[dwh_load_time],GL_hist_trans_key)
	VALUES (B.[bpid],B.[ccur],B.[compnr],B.[cono],B.[deleted],B.[dim1],B.[dim2],B.[dim3],B.[dim4],B.[dim5],B.[dim6],B.[dim7],B.[dim8],B.[dim9],B.[dims],B.[dimx_sgm1],B.[dimx_sgm2],B.[dm10],B.[dm11],B.[dm12],B.[duac],B.[duac_kw],B.[fcah_1],B.[fcah_2],B.[fcah_3],B.[fcah_dtwc],B.[fcah_rfrc],B.[fcam],B.[fdah_1],B.[fdah_2],B.[fdah_3],B.[fdah_dtwc],B.[fdah_rfrc],B.[fdam],B.[fqt1],B.[fqt2],B.[leac],B.[ncah_1],B.[ncah_2],B.[ncah_3],B.[ncah_dtwc],B.[ncah_rfrc],B.[ncam],B.[ndah_1],B.[ndah_2],B.[ndah_3],B.[ndah_dtwc],B.[ndah_rfrc],B.[ndam],B.[nqt1],B.[nqt2],B.[olap],B.[prno],B.[ptyp],B.[ptyp_kw],B.[ztimestamp],B.[zyear],B.[file_name],B.[dwh_load_time],B.GL_hist_trans_key) 
	OPTION (LABEL = '[SP_15_GL_hist_transactions_fct_2]');

									  
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


