/**********************************************************************************************************************
Stored Procedure Name: [replncss].[SP_19_fct_GL_Finalized_Transactions_Cube]
Description: This stored procedure is used to load the data from Fact Actual Finalized Transactions View. 

Data Type: Fact Data
Source Table / View: [replncss].[fct GL Finalized Transactions]
Target Table: [replncss].[CDW fct GL Finalized Transactions Cube]
Lookup Tables: None

Data Load Frequency: Automatic
Load Type: Delta Load
Integration Framework: 

Original Project: JBT
Developer: Pooja Thakur
Date: 13/09/2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/
--EXEC [replncss].[SP_19_fct_GL_Finalized_Transactions_Cube];

--DROP PROCEDURE [replncss].[SP_19_fct_GL_Finalized_Transactions_Cube]

CREATE PROC [replncss].[SP_19_fct_GL_Finalized_Transactions_Cube] 
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION;

	BEGIN TRY

Delete from [replncss].[CDW fct GL Finalized Transactions Cube];

Insert into [replncss].[CDW fct GL Finalized Transactions Cube]
([GL Category],[Category Desc],[Amount],[Amt In HC 1],[Amt In HC 2],[Amt In HC 3],[Business Partner],[Budget Exception],[Budget Exception Desc],[Contra A/c],[Trn Category],[Trn Category Desc],[Country For Tax],[Curr/Rate],[Correction Inv Detail Line],[Cash Flow Reason],[Inv Correction],[Correction Line Number],[Company Number],[Control A/c],[Control A/c Desc],[Standing Order],[Creation Date],[Standing Order Seq No.],[Trans Type Correction],[Tax Code],[Finalization Date],[Debit / Credit],[Debit / Credit Desc],[Document Date],[Deleted],[Deleted Desc],[Whether Record Is Deleted],[Dim 1],[Dim 2],[Dim 3],[Dim 4],[Dim 5],[Dim 6],[Dim 7],[Dim 8],[Dim 9],[Dim 10],[Dim 11],[Dim 12],[Exclude From Payment Disc],[Exclude From Payment Disc Desc],[Rate Factor 1],[Rate Factor 2],[Rate Factor 3],[Original Document Number],[Fiscal Period],[Fiscal Year Period],[Original Trn Type],[Fiscal Year],
[Integration Trn],[Integration Trn Desc],[Ledger A/c],[Batch],[Original Company],[Document],[Line],[Seq Number],[Background Seq No.],[Trn Type],[Batch Year],[Qty 1],[Qty 2],[Rate Date],[Rate 1],[Rate 2],[Rate 3],[Reconciliation Data Logged],[Reconciliation Data Logged Desc],[Reconciliation Area],[Reconciliation Area Desc],[Reconciliation Subarea],[Reporting Period],[Reporting Year Period],[Exchange Rate Type],[Reporting Year],[Type Of Cash Trn],[Type Of Cash Trn Desc],[Trn Entry Date],[Finalization Time],[Time of Action],[Type Of Trn],[Type Of Trn Desc],[Tax Amt In HC 1],[Tax Amt In HC 2],[Tax Amt In HC 3],[Tax Amt In Payment Curr],[Tax Ledger A/C],[Tax Period],[Tax Origin],[Tax Origin Desc],[Tax Year],[Tax Year Period],[Withholding Income Tax Or Social Contribution Applied],[Withholding Income Tax Or Social Contribution Applied Desc],[Dwh Load Time],[Debit/Credit Amount],[GlFinzTransKey],[Category],[Category Type],[Category Type Desc],[Category Description],[Responsible Employee],[Responsible Office],[Category Text],[BP Address Code],[BP Country],[BP Country Name],[BP Name],[BP State/Province],[BP City Name],[BP Role Key],[BP Role Desc],[BP Status],[BP Status Desc],[Calendar Code],[Currency System],[Currency System Orig Desc],[Currency Type A],[Currency Type A Orig Desc],[Currency Type B],[Currency Type B Orig Desc],[Currency Type C],[Currency Type C Orig Desc],[Company Type],[Company Type Orig Desc],[Company Desc],[Transition Currency],[Local Currency],[Logistic Currency],[Availability Type],[Time Zone Code],[Tax Code Desc],[Department Desc],[Department Site],[Department Type Key],[Department Type Desc],[Allocation Type],[Allocation Type Desc],[Account Type],[Account Type Desc],[Debit/Credit Indicator],[Debit/Credit Indicator Desc],[Expense Type],[Expense Type Desc],[Ledger Account Desc],[Legal Ledger Account Description],[Legal Ledger Account] )   
select 
[GL Category],[Category Desc],[Amount],[Amt In HC 1],[Amt In HC 2],[Amt In HC 3],[Business Partner],[Budget Exception],[Budget Exception Desc],[Contra A/c],[Trn Category],[Trn Category Desc],[Country For Tax],[Curr/Rate],[Correction Inv Detail Line],[Cash Flow Reason],[Inv Correction],[Correction Line Number],[Company Number],[Control A/c],[Control A/c Desc],[Standing Order],[Creation Date],[Standing Order Seq No.],[Trans Type Correction],[Tax Code],[Finalization Date],[Debit / Credit],[Debit / Credit Desc],[Document Date],[Deleted],[Deleted Desc],[Whether Record Is Deleted],[Dim 1],[Dim 2],[Dim 3],[Dim 4],[Dim 5],[Dim 6],[Dim 7],[Dim 8],[Dim 9],[Dim 10],[Dim 11],[Dim 12],[Exclude From Payment Disc],[Exclude From Payment Disc Desc],[Rate Factor 1],[Rate Factor 2],[Rate Factor 3],[Original Document Number],[Fiscal Period],[Fiscal Year Period],[Original Trn Type],[Fiscal Year],
[Integration Trn],[Integration Trn Desc],[Ledger A/c],[Batch],[Original Company],[Document],[Line],[Seq Number],[Background Seq No.],[Trn Type],[Batch Year],[Qty 1],[Qty 2],[Rate Date],[Rate 1],[Rate 2],[Rate 3],[Reconciliation Data Logged],[Reconciliation Data Logged Desc],[Reconciliation Area],[Reconciliation Area Desc],[Reconciliation Subarea],[Reporting Period],[Reporting Year Period],[Exchange Rate Type],[Reporting Year],[Type Of Cash Trn],[Type Of Cash Trn Desc],[Trn Entry Date],[Finalization Time],[Time of Action],[Type Of Trn],[Type Of Trn Desc],[Tax Amt In HC 1],[Tax Amt In HC 2],[Tax Amt In HC 3],[Tax Amt In Payment Curr],[Tax Ledger A/C],[Tax Period],[Tax Origin],[Tax Origin Desc],[Tax Year],[Tax Year Period],[Withholding Income Tax Or Social Contribution Applied],[Withholding Income Tax Or Social Contribution Applied Desc],[Dwh Load Time],[Debit/Credit Amount],[GlFinzTransKey],[Category],[Category Type],[Category Type Desc],[Category Description],[Responsible Employee],[Responsible Office],[Category Text],[BP Address Code],[BP Country],[BP Country Name],[BP Name],[BP State/Province],[BP City Name],[BP Role Key],[BP Role Desc],[BP Status],[BP Status Desc],[Calendar Code],[Currency System],[Currency System Orig Desc],[Currency Type A],[Currency Type A Orig Desc],[Currency Type B],[Currency Type B Orig Desc],[Currency Type C],[Currency Type C Orig Desc],[Company Type],[Company Type Orig Desc],[Company Desc],[Transition Currency],[Local Currency],[Logistic Currency],[Availability Type],[Time Zone Code],[Tax Code Desc],[Department Desc],[Department Site],[Department Type Key],[Department Type Desc],[Allocation Type],[Allocation Type Desc],[Account Type],[Account Type Desc],[Debit/Credit Indicator],[Debit/Credit Indicator Desc],[Expense Type],[Expense Type Desc],[Ledger Account Desc],[Legal Ledger Account Description],[Legal Ledger Account]  
FROM [replncss].[fct GL Finalized Transactions]
OPTION (LABEL = '[SP_19_fct_GL_Finalized_Transactions_Cube]');

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


