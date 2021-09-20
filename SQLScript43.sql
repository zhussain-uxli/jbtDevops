CREATE PROC [replncss].[SP_24_fct_Ap_Purchase_Order_Lines_Cube] AS
BEGIN
		
	BEGIN TRANSACTION;

	BEGIN TRY
Delete from [replncss].[CDW fct Ap Purchase Order Lines Cube]
	
	Insert into [replncss].[CDW fct Ap Purchase Order Lines Cube]
	( [Purchase Acknowledgment],[Warehouse Address],[Tax Country],[Cancellation In Process],[Cancellation In Process Desc],[Canceled],
	[Canceled Desc],[Contract Ignored],[Contract Ignored Desc],[Company Number],[Contract],[Contract Position],[Project],[Product Variant],[Carrier Binding],
	[Carrier Binding Desc],[Reason For Rejection],[Item Cross Reference],[Item Cross Reference Desc],[Change Type],[Receipt Amt],[Confirmed Receipt Date],
	[Order Confirmation Date],[General Ledger],[Inv Date],[Invoice],[Item],[Cc: Total Landed Cost],[Order Amt],[Order Date],[Order Line Type],[Order Line Type Desc],
	[Buy-From BP],[Return Ownership],[Return Ownership Desc],[Line],[Purchase Type],[Received Qty],[Invd Qty],[Rejected Qty],[Ordered Qty],[Receipt Number],
	[Standard Description],[Standard Description Desc],[Ship-From Contact],[Ship-From Site],[Ship-From Warehouse],[Site],[Specification],[Inv Status],[Inv Status Desc],[Subcontracted],[Subcontracted Desc],[Target Price],[Target Price Book],[Target Price Book Line],[Vendor Rating],[Vendor Rating Desc],[Dwh Load time],[PU Order Lines fct key],
	[Tax Classification Desc],[Max W/Tax %],[SCT Allowed],[SCT Allowed Falg],[WIT Allowed],[WIT Allowed Flag],[Delivery Terms Desc],[Carrier/LSP Desc],[Buy-from Business Partner],[Transport Category],[Transport Category Desc],[Payment Terms],[Payment Terms Company],[Payment Period],[Payment Period Type Key],[Payment Period Type],[Shift in Due Dt Tolerance],[Discount Amount Tolerance],[Discount Percentage Tolerance],[Discount Period Tolerance],[Change Reason Desc],[Tax Code Desc],[Warehouse Desc],[Warehouse Address Code],[Financial Company],[Enterprise unit of Wh],[Inventory Mgt Business Partner],[External Site],[External Site Flag],[Blocked for Inbound],[Blocked for Inbound Desc],[Blocked for Outbound],[Blocked for Outbound Desc],[Items Desc],[Item Group],[Product Class],[Product Line],[Item Signal],[Country of Origin],[Product Type],[Inventory Unit],[Serialized],[Default Supply Source],[PoT Passage Desc],[PoT Passage Spec Key],[PoT Passage Spec],[Ship-from Address Code],[Ship-from Country],[Ship-from Country Name],[Ship-from BP Name],[Ship-from State/Province],[Ship-from City Name],[Pur Office Description],[Pur Office Warehouse],[Pur Office Site],[Product Line Levels],[Product Line First Level],
	[Product Line Second Level],[Product Line Third Level],[Ship-from Region],[Ship-from Sub Region],[Sold-to Region],[Sold-to Sub Region])
	select  
	[Purchase Acknowledgment],[Warehouse Address],[Tax Country],[Cancellation In Process],[Cancellation In Process Desc],[Canceled],[Canceled Desc],
	[Contract Ignored],[Contract Ignored Desc],[Company Number],[Contract],[Contract Position],[Project],[Product Variant],[Carrier Binding],[Carrier Binding Desc],
	[Reason For Rejection],[Item Cross Reference],[Item Cross Reference Desc],[Change Type],[Receipt Amt],[Confirmed Receipt Date],[Order Confirmation Date],
	[General Ledger],[Inv Date],[Invoice],[Item],[Cc: Total Landed Cost],[Order Amt],[Order Date],[Order Line Type],[Order Line Type Desc],[Buy-From BP],
	[Return Ownership],[Return Ownership Desc],[Line],[Purchase Type],[Received Qty],[Invd Qty],[Rejected Qty],[Ordered Qty],[Receipt Number],
	[Standard Description],[Standard Description Desc],[Ship-From Contact],[Ship-From Site],[Ship-From Warehouse],[Site],[Specification],[Inv Status],
	[Inv Status Desc],[Subcontracted],[Subcontracted Desc],[Target Price],[Target Price Book],[Target Price Book Line],[Vendor Rating],[Vendor Rating Desc],[Dwh Load time],[PU Order Lines fct key],
	[Tax Classification Desc],[Max W/Tax %],[SCT Allowed],[SCT Allowed Falg],[WIT Allowed],[WIT Allowed Flag],[Delivery Terms Desc],[Carrier/LSP Desc],
	[Buy-from Business Partner],[Transport Category],[Transport Category Desc],[Payment Terms],[Payment Terms Company],[Payment Period],[Payment Period Type Key]
,[Payment Period Type],[Shift in Due Dt Tolerance],[Discount Amount Tolerance],[Discount Percentage Tolerance],[Discount Period Tolerance],[Change Reason Desc],
[Tax Code Desc],[Warehouse Desc],[Warehouse Address Code],[Financial Company],[Enterprise unit of Wh],[Inventory Mgt Business Partner],[External Site],
[External Site Flag],[Blocked for Inbound],[Blocked for Inbound Desc],[Blocked for Outbound],[Blocked for Outbound Desc],[Items Desc],[Item Group],
[Product Class],[Product Line],[Item Signal],[Country of Origin],[Product Type],[Inventory Unit],[Serialized],[Default Supply Source],[PoT Passage Desc],
[PoT Passage Spec Key],[PoT Passage Spec],[Ship-from Address Code],[Ship-from Country],[Ship-from Country Name],[Ship-from BP Name],[Ship-from State/Province],
[Ship-from City Name],[Pur Office Description],[Pur Office Warehouse],[Pur Office Site],[Product Line Levels],[Product Line First Level],
[Product Line Second Level],[Product Line Third Level],[Ship-from Region],[Ship-from Sub Region],[Sold-to Region],[Sold-to Sub Region] 
	from [replncss].[fct Ap Purchase Order Lines] OPTION (LABEL = '[SP_24_fct_Ap_Purchase_Order_Lines_Cube]');

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


