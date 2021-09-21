/**********************************************************************************************************************
Stored Procedure Name: [dwhcda].[SP_16_forecast_budget_amount_fct]
Description: This stored procedure is used to load the data from DST table (Forecast Budget Amounts) to Fact Forecast Budget Amounts Table.

Delta mechanish is handeled by extracting only latest data from Source table based on max "dwh_load_time" from Target table.

Based on the key columns for each record in the target table, if there already exist a record for the same key then Overwrite the record else Insert the record.

Data Type: Fact Table
Source Table: [acq101].[dst_tffbs101]
Target Table: [dwhcda].[lnc_fct_forecast_budget_amount]

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
--DROP PROCEDURE [dwhcda].[SP_16_forecast_budget_amount_fct];

--EXEC [dwhcda].[SP_16_forecast_budget_amount_fct];

CREATE PROCEDURE [dwhcda].[SP_16_forecast_budget_amount_fct] 
AS
BEGIN

	SET NOCOUNT ON;
	
	IF OBJECT_ID('tempdb..#forcast_budg_amt', 'U') IS NOT NULL
    DROP TABLE #forcast_budg_amt;

    Select * INTO #forcast_budg_amt    
	From [dwhcda].[lnc_fct_forecast_budget_amount] where 1 = 2;

	BEGIN TRANSACTION;

	BEGIN TRY
		
--Forecast Budget Amounts

	Insert into #forcast_budg_amt
	([amnt],[back],[back_kw],[budg],[coam],[compnr],[dbcr],[dbcr_kw],[deleted],[dim1],[dim2],[dim3],[dim4],[dim5],[dim6],[dim7],[dim8],[dim9],[dm10],[dm11],[dm12],[dt10],[dt11],[dt12],[dty1],[dty2],[dty3],[dty4],[dty5],[dty6],[dty7],[dty8],[dty9],[leac],[olap],[peri],[qan1],[qan2],[stam],[ztimestamp],[zyear],[file_name],[dwh_load_time],[db_cr_amnt],frct_budg_amt_key)
	SELECT A.[amnt],A.[back],A.[back_kw],A.[budg],A.[coam],A.[compnr],A.[dbcr],A.[dbcr_kw],A.[deleted],A.[dim1],A.[dim2],A.[dim3],A.[dim4],A.[dim5],A.[dim6],A.[dim7],A.[dim8],A.[dim9],A.[dm10],A.[dm11],A.[dm12],A.[dt10],A.[dt11],A.[dt12],A.[dty1],A.[dty2],A.[dty3],A.[dty4],A.[dty5],A.[dty6],A.[dty7],A.[dty8],A.[dty9],A.[leac],A.[olap],A.[peri],A.[qan1],A.[qan2],A.[stam],A.[ztimestamp],A.[zyear],A.[file_name],A.[dwh_load_time],
	Case When Upper(A.dbcr_kw) = Upper('tfgld.dbcr.debit') Then Isnull(A.amnt,0)
		 When Upper(A.dbcr_kw) = Upper('tfgld.dbcr.credit') Then (Isnull(A.amnt,0) * -1) Else Isnull(A.amnt,0) End As db_cr_amnt,
	Isnull(A.budg,'') + '_' + Isnull(A.compnr,'') + '_' + Isnull(A.dim1,'') + '_' + Isnull(A.dim2,'') + '_' + Isnull(A.dim3,'') + '_' + Isnull(A.dim4,'') + '_' + Isnull(A.dim5,'') + '_' + Isnull(A.dim6,'') + '_' + Isnull(A.dim7,'') + '_' + Isnull(A.dim8,'') + '_' + Isnull(A.dim9,'') + '_' + Isnull(A.dm10,'') + '_' + Isnull(A.dm11,'') + '_' + Isnull(A.dm12,'') + '_' + Isnull(A.leac,'') + '_' + Cast(A.peri As Varchar) + '_' + Cast(A.zyear As Varchar) As frct_budg_amt_key  
	FROM [acq101].[dst_tffbs101] A
	Where A.[dwh_load_time] > CASE WHEN (( SELECT count(*) AS count
                                      FROM [dwhcda].[lnc_fct_forecast_budget_amount])) = 0 THEN convert(datetime,'1900-01-01 00:00:00')
                                      ELSE ( SELECT max(dwh_load_time) FROM [dwhcda].[lnc_fct_forecast_budget_amount]) END OPTION (LABEL = '[SP_16_forecast_budget_amount_fct_1]');

	MERGE [dwhcda].[lnc_fct_forecast_budget_amount] As A
	USING #forcast_budg_amt B 
	ON A.[frct_budg_amt_key] = B.[frct_budg_amt_key]
	WHEN Matched AND B.[ztimestamp] > A.[ztimestamp] THEN UPDATE SET A.[amnt] = B.[amnt],A.[back] = B.[back],A.[back_kw] = B.[back_kw],A.[coam] = B.[coam],A.[dbcr] = B.[dbcr],A.[dbcr_kw] = B.[dbcr_kw],A.[deleted] = B.[deleted],A.[dt10] = B.[dt10],A.[dt11] = B.[dt11],A.[dt12] = B.[dt12],A.[dty1] = B.[dty1],A.[dty2] = B.[dty2],A.[dty3] = B.[dty3],A.[dty4] = B.[dty4],A.[dty5] = B.[dty5],A.[dty6] = B.[dty6],A.[dty7] = B.[dty7],A.[dty8] = B.[dty8],A.[dty9] = B.[dty9],A.[olap] = B.[olap],A.[qan1] = B.[qan1],A.[qan2] = B.[qan2],A.[stam] = B.[stam],A.[ztimestamp] = B.[ztimestamp],A.[file_name] = B.[file_name],A.[dwh_load_time] = B.[dwh_load_time],A.[db_cr_amnt] = B.[db_cr_amnt]
	WHEN NOT MATCHED BY TARGET THEN 
	INSERT ([amnt],[back],[back_kw],[budg],[coam],[compnr],[dbcr],[dbcr_kw],[deleted],[dim1],[dim2],[dim3],[dim4],[dim5],[dim6],[dim7],[dim8],[dim9],[dm10],[dm11],[dm12],[dt10],[dt11],[dt12],[dty1],[dty2],[dty3],[dty4],[dty5],[dty6],[dty7],[dty8],[dty9],[leac],[olap],[peri],[qan1],[qan2],[stam],[ztimestamp],[zyear],[file_name],[dwh_load_time],[db_cr_amnt],frct_budg_amt_key)
	VALUES (B.[amnt],B.[back],B.[back_kw],B.[budg],B.[coam],B.[compnr],B.[dbcr],B.[dbcr_kw],B.[deleted],B.[dim1],B.[dim2],B.[dim3],B.[dim4],B.[dim5],B.[dim6],B.[dim7],B.[dim8],B.[dim9],B.[dm10],B.[dm11],B.[dm12],B.[dt10],B.[dt11],B.[dt12],B.[dty1],B.[dty2],B.[dty3],B.[dty4],B.[dty5],B.[dty6],B.[dty7],B.[dty8],B.[dty9],B.[leac],B.[olap],B.[peri],B.[qan1],B.[qan2],B.[stam],B.[ztimestamp],B.[zyear],B.[file_name],B.[dwh_load_time],
	B.[db_cr_amnt],B.frct_budg_amt_key) 
	OPTION (LABEL = '[SP_16_forecast_budget_amount_fct_2]');

									  
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


