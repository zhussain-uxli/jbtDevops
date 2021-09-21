CREATE PROC [replncss].[SP_26_fct_AP_Open_Item_Cube] AS
BEGIN
		
	BEGIN TRANSACTION;

	BEGIN TRY

Delete from [replncss].[CDW fct AP Open Item Cube];
Insert into [replncss].[CDW fct AP Open Item Cube]([Amt],[Amt In Inv Curr],[Balance Anticipated],[Balance],[Balance In HC],[Total Balance],
[Tax Amt In HC],[Dwh Load Time],[AP Open Item fct key],
[Category],[Category Type],[Category Type Desc],[Category Description],[Responsible Employee],[Responsible Office],[Category Text],[Payment Terms],[Payment Terms Company],[Payment Period],[Payment Period Type Key],[Payment Period Type],[Shift in Due Dt Tolerance],[Discount Amount Tolerance],[Discount Percentage Tolerance],[Discount Period Tolerance],[Tax Code Desc],[Pay-to Address Code],[Pay-to Country],[Pay-to Country Name],[Pay-to BP Name],[Pay-to State/Province],[Pay-to City Name])
select [Amt],[Amt In Inv Curr],[Balance Anticipated],[Balance],[Balance In HC],[Total Balance],[Tax Amt In HC],[Dwh Load Time],[AP Open Item fct key],
[Category],[Category Type],[Category Type Desc],[Category Description],[Responsible Employee],[Responsible Office],[Category Text],[Payment Terms],[Payment Terms Company],[Payment Period],[Payment Period Type Key],[Payment Period Type],[Shift in Due Dt Tolerance],[Discount Amount Tolerance],[Discount Percentage Tolerance],[Discount Period Tolerance],[Tax Code Desc],[Pay-to Address Code],[Pay-to Country],[Pay-to Country Name],[Pay-to BP Name],[Pay-to State/Province],[Pay-to City Name] FROM [replncss].[fct AP Open Item]
OPTION (LABEL = '[SP_25_fct_AP_Purchase_Order_Line_History_Cube]');

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


