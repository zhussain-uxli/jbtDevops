CREATE PROC [replncss].[SP_27_fct_AP_Pur_Pay_Recpt_for_Orders_and_Sch_Cube] AS
BEGIN
	SET NOCOUNT ON;	

	BEGIN TRANSACTION;

	BEGIN TRY
Delete from [replncss].[CDW fct AP Pur Pay Recpt for Orders and Sch Cube]
insert into [replncss].[CDW fct AP Pur Pay Recpt for Orders and Sch Cube]([Order Line Discount Amount],[Order Discount Amount],[Contract Purchase Office],[Contract Ignored],[Contract Ignored Desc],[Company number],[Contract],[Contract Position],[Contract Sequence],[Purchase Price Unit],[Conversion Factor Price to Inventory Unit],[Determining],[Determining Desc],[Eligible],[Eligible Desc],[Finance Transaction Date],[Invoiced Amount],[Invoice Date],[Invoice Number],[Original Payable],[Purchase Order/Schedule],[Payable Amount in Order Currency],[Price Matrix],[Price Matrix Sequence],[Line Position],[Price Origin],[Price Origin Desc],[Price],[Processed],[Processed Desc],[Price Stage],[Payable Receipt Sequence],[Payable Receipt Type],[Payable Receipt Type Desc],[Invoiced Quantity],[Payable Quantity in Inventory Unit],[Retro-Active],[Retro-Active Desc],[Reason for Amount Change],[Reason for Amount Change Desc],[Receipt Sequence],[Line Sequence],[Update Status of Actual Purchase Costs],[Update Status of Actual Purchase Costs Desc],[Invoicing Status],[Invoicing Status Desc],[Purchase Schedule Type],[Purchase Schedule Type Desc],[Usage Log Date],[Usage Date],[Dwh Load Time],[Pur Pay fct key],[Pur Office Description],[Pur Office Warehouse],[Pur Office Site],[Com Address Code],[Com Line of Business],[Com Country]  )
select [Order Line Discount Amount],[Order Discount Amount],[Contract Purchase Office],[Contract Ignored],[Contract Ignored Desc],[Company number],[Contract],[Contract Position],[Contract Sequence],[Purchase Price Unit],[Conversion Factor Price to Inventory Unit],[Determining],[Determining Desc],[Eligible],[Eligible Desc],[Finance Transaction Date],[Invoiced Amount],[Invoice Date],[Invoice Number],[Original Payable],[Purchase Order/Schedule],[Payable Amount in Order Currency],[Price Matrix],[Price Matrix Sequence],[Line Position],[Price Origin],[Price Origin Desc],[Price],[Processed],[Processed Desc],[Price Stage],[Payable Receipt Sequence],[Payable Receipt Type],[Payable Receipt Type Desc],[Invoiced Quantity],[Payable Quantity in Inventory Unit],[Retro-Active],[Retro-Active Desc],[Reason for Amount Change],[Reason for Amount Change Desc],[Receipt Sequence],[Line Sequence],[Update Status of Actual Purchase Costs],[Update Status of Actual Purchase Costs Desc],[Invoicing Status],[Invoicing Status Desc],[Purchase Schedule Type],[Purchase Schedule Type Desc],[Usage Log Date],[Usage Date],[Dwh Load Time],[Pur Pay fct key],[Pur Office Description],[Pur Office Warehouse],[Pur Office Site],[Com Address Code],[Com Line of Business],[Com Country]   
FROM [replncss].[fct AP Pur Pay Receipts for Ord and Schedule]
OPTION (LABEL = '[SP_27_fct_AP_Pur_Pay_Recpt_for_Orders_and_Sch_Cube]');
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


