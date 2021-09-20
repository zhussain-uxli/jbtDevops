/**********************************************************************************************************************
Stored Procedure Name: [replncss].[SP_18_fct_General_Ledger_Act_Budg_Fcst_Cube]
Description: This stored procedure is used to load the data from Fact General Ledger Actual Budget Forecast View. 

Data Type: Fact Data
Source Table / View: [replncss].[fct General Ledger Act Budg Fcst]
Target Table: [replncss].[CDW fct General Ledger Act Budg Fcst Cube]
Lookup Tables: None

Data Load Frequency: Automatic
Load Type: Delta Load
Integration Framework: 

Original Project: JBT
Developer: Mohammed Majid
Date: 09-09-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/
--EXEC [replncss].[SP_18_fct_General_Ledger_Act_Budg_Fcst_Cube];

--DROP PROCEDURE [replncss].[SP_18_fct_General_Ledger_Act_Budg_Fcst_Cube]

CREATE PROCEDURE [replncss].[SP_18_fct_General_Ledger_Act_Budg_Fcst_Cube]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;

	BEGIN TRY
	
	Delete [replncss].[CDW fct General Ledger Act Budg Fcst Cube];
	
	Insert into [replncss].[CDW fct General Ledger Act Budg Fcst Cube] 
	([Budget Original Amt],[Budget Amt],[Created in Background],[Created in Background Desc],[Budget Code],
		[Business Partner],[Currency],[Company Number],[Company],[Complementary Amt],[DB/CR Indicator],
		[DB/CR Indicator Desc],[Dimension 1],[Dimension 2],[Dimension 3],[Dimension 4],[Dimension 5],[Dimension 6],
		[Dimension 7],[Dimension 8],[Dimension 9],[Dimension 10],[Dimension 11],[Dimension 12],
		[Dual Accounting Indicator],[Dual Accounting Indicator Desc],[Open Bal Finalized Trns In HC 1],
		[Open Bal Finalized Trns In HC 2],[Open Bal Finalized Trns In HC 3],[Open Bal Finalized Trns In DWH Curr],
		[Open Bal Finalized Trns In Reference Curr],[Finalized Credit Amt in HC 1],[Finalized Credit Amt in HC 2],
		[Finalized Credit Amt in HC 3],[Finalized Credit Amt in DWH Curr],[Finalized Credit Amt in Reference Curr],
		[Finalized Credit Amt],[Finalized Debit Amt in HC 1],[Finalized Debit Amt in HC 2],
		[Finalized Debit Amt in HC 3],[Finalized Debit Amt in DWH Curr],[Finalized Debit Amt in Reference Curr],
		[Finalized Qty 1],[Finalized Qty 2],[Open Bal Finalized Trns],[Ledger A/C],[Open Bal Not Final Qty 1],
		[Open Bal Not Final Qty 2],[Open Bal Not Finalized Trns In HC 1],[Open Bal Not Finalized Trns In HC 2],
		[Open Bal Not Finalized Trns In HC 3],[Open Bal Not Finalized Trns In DWH Curr],
		[Open Bal Not Finalized Trns In Reference Curr],[Open Bal Not Finalized Trns],[Not Final Credit Amt in HC 1],
		[Not Final Credit Amt in HC 2],[Not Final Credit Amt in HC 3],[Not Finalized Credit Amt in DWH Curr],
		[Not Finalized Credit Amt in Reference Curr],[Not Final Credit Amt],[Not Final Debit Amt in HC 1],
		[Not Final Debit Amt in HC 2],[Not Final Debit Amt in HC 3],[Not Finalized Debit Amt in DWH Curr],
		[Not Finalized Debit Amt in Reference Curr],[Not Final Debit Amt],[Not Final Quantity 1],
		[Not Final Quantity 2],[Send To Olap],[Open Bal Finalized Qty 1],[Open Bal Finalized Qty 2],
		[Budget Qty 1],[Budget Qty 2],[Statutory Amt],[Fiscal Period],[Period Type],[Period Type Desc],
		[Fiscal Year Period],[Fiscal Year],[DWH Load Time],[Time of Action],[GL Rec Fct Key],[Table Shortcode],
		[Table Desc],[Company Address Code],[Company Line of Business],[Company Country],[BP Address Code],
		[BP Country],[BP Country Name],[BP Name],[BP State/Province],[BP City Name],[BP Role Key],[BP Role Desc],
		[BP Status],[BP Status Desc],[BLWI Reporting Curr Key],[BLWI Reporting Curr Flag],[Rounding Factor],
		[Currency Desc],[Currency Short Desc],[EMU Currency Key],[EMU Currency Flag],[Grand Total Rounding Factor],
		[ISO Currency Code],[Department Desc],[Department Site],[Department Type Key],[Department Type Desc],
		[Allocation Type],[Allocation Type Desc],[Account Type],[Account Type Desc],[Debit/Credit Indicator],
		[Debit/Credit Indicator Desc],[Expense Type],[Expense Type Desc],[Ledger Account Desc],
		[Legal Ledger Account Description],[Legal Ledger Account],[Budgeting Method],[Budgeting Method Desc],
		[Budget Desc],[Link with Ledger Account],[Link with Ledger Account Desc],[Number of Budget Periods],
		[Flexible Budget],[Flexible Budget Desc],[Exchange Rate 1],[Exchange Rate 2],[Exchange Rate 3],
		[Exchange Rate Factor 1],[Exchange Rate Factor 2],[Exchange Rate Factor 3],[Product Line Levels],
		[Product Line First Level],[Product Line Second Level],[Product Line Third Level],[Company Region],
		[Company Sub Region],[BP Region],[BP Sub Region])
	(SELECT	[Budget Original Amt],[Budget Amt],[Created in Background],[Created in Background Desc],[Budget Code],
		[Business Partner],[Currency],[Company Number],[Company],[Complementary Amt],[DB/CR Indicator],
		[DB/CR Indicator Desc],[Dimension 1],[Dimension 2],[Dimension 3],[Dimension 4],[Dimension 5],[Dimension 6],
		[Dimension 7],[Dimension 8],[Dimension 9],[Dimension 10],[Dimension 11],[Dimension 12],
		[Dual Accounting Indicator],[Dual Accounting Indicator Desc],[Open Bal Finalized Trns In HC 1],
		[Open Bal Finalized Trns In HC 2],[Open Bal Finalized Trns In HC 3],[Open Bal Finalized Trns In DWH Curr],
		[Open Bal Finalized Trns In Reference Curr],[Finalized Credit Amt in HC 1],[Finalized Credit Amt in HC 2],
		[Finalized Credit Amt in HC 3],[Finalized Credit Amt in DWH Curr],[Finalized Credit Amt in Reference Curr],
		[Finalized Credit Amt],[Finalized Debit Amt in HC 1],[Finalized Debit Amt in HC 2],
		[Finalized Debit Amt in HC 3],[Finalized Debit Amt in DWH Curr],[Finalized Debit Amt in Reference Curr],
		[Finalized Qty 1],[Finalized Qty 2],[Open Bal Finalized Trns],[Ledger A/C],[Open Bal Not Final Qty 1],
		[Open Bal Not Final Qty 2],[Open Bal Not Finalized Trns In HC 1],[Open Bal Not Finalized Trns In HC 2],
		[Open Bal Not Finalized Trns In HC 3],[Open Bal Not Finalized Trns In DWH Curr],
		[Open Bal Not Finalized Trns In Reference Curr],[Open Bal Not Finalized Trns],[Not Final Credit Amt in HC 1],
		[Not Final Credit Amt in HC 2],[Not Final Credit Amt in HC 3],[Not Finalized Credit Amt in DWH Curr],
		[Not Finalized Credit Amt in Reference Curr],[Not Final Credit Amt],[Not Final Debit Amt in HC 1],
		[Not Final Debit Amt in HC 2],[Not Final Debit Amt in HC 3],[Not Finalized Debit Amt in DWH Curr],
		[Not Finalized Debit Amt in Reference Curr],[Not Final Debit Amt],[Not Final Quantity 1],
		[Not Final Quantity 2],[Send To Olap],[Open Bal Finalized Qty 1],[Open Bal Finalized Qty 2],
		[Budget Qty 1],[Budget Qty 2],[Statutory Amt],[Fiscal Period],[Period Type],[Period Type Desc],
		[Fiscal Year Period],[Fiscal Year],[DWH Load Time],[Time of Action],[GL Rec Fct Key],[Table Shortcode],
		[Table Desc],[Company Address Code],[Company Line of Business],[Company Country],[BP Address Code],
		[BP Country],[BP Country Name],[BP Name],[BP State/Province],[BP City Name],[BP Role Key],[BP Role Desc],
		[BP Status],[BP Status Desc],[BLWI Reporting Curr Key],[BLWI Reporting Curr Flag],[Rounding Factor],
		[Currency Desc],[Currency Short Desc],[EMU Currency Key],[EMU Currency Flag],[Grand Total Rounding Factor],
		[ISO Currency Code],[Department Desc],[Department Site],[Department Type Key],[Department Type Desc],
		[Allocation Type],[Allocation Type Desc],[Account Type],[Account Type Desc],[Debit/Credit Indicator],
		[Debit/Credit Indicator Desc],[Expense Type],[Expense Type Desc],[Ledger Account Desc],
		[Legal Ledger Account Description],[Legal Ledger Account],[Budgeting Method],[Budgeting Method Desc],
		[Budget Desc],[Link with Ledger Account],[Link with Ledger Account Desc],[Number of Budget Periods],
		[Flexible Budget],[Flexible Budget Desc],[Exchange Rate 1],[Exchange Rate 2],[Exchange Rate 3],
		[Exchange Rate Factor 1],[Exchange Rate Factor 2],[Exchange Rate Factor 3],[Product Line Levels],
		[Product Line First Level],[Product Line Second Level],[Product Line Third Level],[Company Region],
		[Company Sub Region],[BP Region],[BP Sub Region]   
FROM [replncss].[fct General Ledger Act Budg Fcst]
) OPTION (LABEL = 'SP_7A_fct_Sales_Order_Act_Delivery_Lines_Cube');
	
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


