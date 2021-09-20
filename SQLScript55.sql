/**********************************************************************************************************************
Stored Procedure Name: [dwhcda].[SP_14_GL_hist_opening_balance_fct]
Description: This stored procedure is used to load the data from DST table (Actual Ledger History GL Opening Balances) to Fact Actual Ledger History GL Opening Balances Table.

Delta mechanish is handeled by extracting only latest data from Source table based on max "dwh_load_time" from Target table.

Based on the key columns for each record in the target table, if there already exist a record for the same key then Overwrite the record else Insert the record.

Data Type: Fact Table
Source Table: [acq101].[dst_tfgld206]
Target Table: [dwhcda].[lnc_fct_GL_hist_opening_balance]

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
--DROP PROCEDURE [dwhcda].[SP_14_GL_hist_opening_balance_fct];

--EXEC [dwhcda].[SP_14_GL_hist_opening_balance_fct];

CREATE PROCEDURE [dwhcda].[SP_14_GL_hist_opening_balance_fct] 
AS
BEGIN

	SET NOCOUNT ON;
	
	IF OBJECT_ID('tempdb..#gl_hist_open_bal', 'U') IS NOT NULL
    DROP TABLE #gl_hist_open_bal;

    Select * INTO #gl_hist_open_bal    
	From [dwhcda].[lnc_fct_GL_hist_opening_balance] where 1 = 2;

	BEGIN TRANSACTION;

	BEGIN TRY
		
--Actual Ledger History GL Opening Balances

	Insert into #gl_hist_open_bal
	([bpid],[ccur],[compnr],[cono],[deleted],[dim1],[dim2],[dim3],[dim4],[dim5],[dim6],[dim7],[dim8],[dim9],[dims],[dimx_sgm1],[dimx_sgm2],[dm10],[dm11],[dm12],[duac],[duac_kw],[fobh_1],[fobh_2],[fobh_3],[fobh_dtwc],[fobh_rfrc],[ftob],[leac],[nob1],[nob2],[nobh_1],[nobh_2],[nobh_3],[nobh_dtwc],[nobh_rfrc],[ntob],[olap],[qob1],[qob2],[ztimestamp],[zyear],[file_name],[dwh_load_time],
	GL_hist_open_bal_key)
	SELECT A.[bpid],A.[ccur],A.[compnr],A.[cono],A.[deleted],A.[dim1],A.[dim2],A.[dim3],A.[dim4],A.[dim5],A.[dim6],A.[dim7],A.[dim8],A.[dim9],A.[dims],A.[dimx_sgm1],A.[dimx_sgm2],A.[dm10],A.[dm11],A.[dm12],A.[duac],A.[duac_kw],A.[fobh_1],A.[fobh_2],A.[fobh_3],A.[fobh_dtwc],A.[fobh_rfrc],A.[ftob],A.[leac],A.[nob1],A.[nob2],A.[nobh_1],A.[nobh_2],A.[nobh_3],A.[nobh_dtwc],A.[nobh_rfrc],A.[ntob],A.[olap],A.[qob1],A.[qob2],A.[ztimestamp],A.[zyear],A.[file_name],A.[dwh_load_time],
	Isnull(A.bpid,'') + '_' + Isnull(A.ccur,'') + '_' + Isnull(A.compnr,'') + '_' + Cast(A.cono As Varchar) + '_' + Isnull(A.dim1,'') + '_' + Isnull(A.dim2,'') + '_' + Isnull(A.dim3,'') + '_' + Isnull(A.dim4,'') + '_' + Isnull(A.dim5,'') + '_' + Isnull(A.dims,'') + '_' + Cast(A.duac As Varchar) + '_' + Isnull(A.leac,'') + '_' + Cast(A.zyear As Varchar)  As GL_hist_open_bal_key  
	FROM [acq101].[dst_tfgld206] A
	Where A.[dwh_load_time] > CASE WHEN (( SELECT count(*) AS count
                                      FROM [dwhcda].[lnc_fct_GL_hist_opening_balance])) = 0 THEN convert(datetime,'1900-01-01 00:00:00')
                                      ELSE ( SELECT max(dwh_load_time) FROM [dwhcda].[lnc_fct_GL_hist_opening_balance]) END OPTION (LABEL = '[SP_14_GL_hist_opening_balance_fct_1]');

	MERGE [dwhcda].[lnc_fct_GL_hist_opening_balance] As A
	USING #gl_hist_open_bal B 
	ON A.[GL_hist_open_bal_key] = B.[GL_hist_open_bal_key]
	WHEN Matched AND B.[ztimestamp] > A.[ztimestamp] THEN UPDATE SET A.[deleted] = B.[deleted],A.[dim6] = B.[dim6],A.[dim7] = B.[dim7],A.[dim8] = B.[dim8],A.[dim9] = B.[dim9],A.[dimx_sgm1] = B.[dimx_sgm1],A.[dimx_sgm2] = B.[dimx_sgm2],A.[dm10] = B.[dm10],A.[dm11] = B.[dm11],A.[dm12] = B.[dm12],A.[duac_kw] = B.[duac_kw],A.[fobh_1] = B.[fobh_1],A.[fobh_2] = B.[fobh_2],A.[fobh_3] = B.[fobh_3],A.[fobh_dtwc] = B.[fobh_dtwc],A.[fobh_rfrc] = B.[fobh_rfrc],A.[ftob] = B.[ftob],A.[nob1] = B.[nob1],A.[nob2] = B.[nob2],A.[nobh_1] = B.[nobh_1],A.[nobh_2] = B.[nobh_2],A.[nobh_3] = B.[nobh_3],A.[nobh_dtwc] = B.[nobh_dtwc],A.[nobh_rfrc] = B.[nobh_rfrc],A.[ntob] = B.[ntob],A.[olap] = B.[olap],A.[qob1] = B.[qob1],A.[qob2] = B.[qob2],A.[ztimestamp] = B.[ztimestamp],A.[file_name] = B.[file_name],A.[dwh_load_time] = B.[dwh_load_time]
	WHEN NOT MATCHED BY TARGET THEN 
	INSERT ([bpid],[ccur],[compnr],[cono],[deleted],[dim1],[dim2],[dim3],[dim4],[dim5],[dim6],[dim7],[dim8],[dim9],[dims],[dimx_sgm1],[dimx_sgm2],[dm10],[dm11],[dm12],[duac],[duac_kw],[fobh_1],[fobh_2],[fobh_3],[fobh_dtwc],[fobh_rfrc],[ftob],[leac],[nob1],[nob2],[nobh_1],[nobh_2],[nobh_3],[nobh_dtwc],[nobh_rfrc],[ntob],[olap],[qob1],[qob2],[ztimestamp],[zyear],[file_name],[dwh_load_time],GL_hist_open_bal_key)
	VALUES (B.[bpid],B.[ccur],B.[compnr],B.[cono],B.[deleted],B.[dim1],B.[dim2],B.[dim3],B.[dim4],B.[dim5],B.[dim6],B.[dim7],B.[dim8],B.[dim9],B.[dims],B.[dimx_sgm1],B.[dimx_sgm2],B.[dm10],B.[dm11],B.[dm12],B.[duac],B.[duac_kw],B.[fobh_1],B.[fobh_2],B.[fobh_3],B.[fobh_dtwc],B.[fobh_rfrc],B.[ftob],B.[leac],B.[nob1],B.[nob2],B.[nobh_1],B.[nobh_2],B.[nobh_3],B.[nobh_dtwc],B.[nobh_rfrc],B.[ntob],B.[olap],B.[qob1],B.[qob2],B.[ztimestamp],B.[zyear],B.[file_name],B.[dwh_load_time],B.GL_hist_open_bal_key) 
	OPTION (LABEL = '[SP_14_GL_hist_opening_balance_fct_2]');

									  
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


