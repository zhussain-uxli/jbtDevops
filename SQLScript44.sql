CREATE PROC [replncss].[SP_25_fct_AP_Purchase_Order_Line_History_Cube] AS
BEGIN
		
	BEGIN TRANSACTION;

	BEGIN TRY

Delete from [replncss].[CDW fct AP Purchase Order Line History Cube]
	
Insert into [replncss].[CDW fct AP Purchase Order Line History Cube]
([Purchase Acknowledgment],[Order Line Disc Amt],[Amt],[Approved],[Approved Desc],[Tax Classification],[Cost Component],[Purchase Office],[Carrier/Lsp],[Record Type],[Record Type Desc],[Lot],[Canceled],[Canceled Desc],[Company Number],[Contract],[Project],[Carrier Binding],[Carrier Binding Desc],[Change Reason],[Reason For Rejection],[Element],[Change Type],[Purchase Unit],[Tax Code],[Warehouse],[Receipt Amt],[Number Of Deliveries Done],[Planned Receipt Date],[Current Planned Receipt Date],[Confirmed Receipt Date],[Changed Receipt Date],[Actual Receipt Date],[Order Confirmation Date],[Final Receipt],[Final Receipt Desc],[General Ledger],[History Action],[History Action Desc],[Inv Amt],[Inv Date],[Invoice],[Item],[Planned Load Date],[Lot Selection],[Order Amt],[Order Date],[Original Order],[Original Line],[Purchase Order],[Original Seq],[Buy-From BP],[Purchase Order Line],[Price],[Purchase Type],[Approved Qty],[Backorder Qty],[Potential Backorder Qty],[Received Qty],[Invd Qty],[Quantity],[Rejected Qty],[Shipped Qty],[Ordered Qty],[Rept Line],[Sales Schedule Type],[Sales Schedule Type Desc],[Ship-From Address],[Ship-From BP],[Ship-From Contact],[Ship-From Site],[Ship-From Warehouse],[Site],[Sales Order / Schedule],[Spon Line],[SequenceNumber],[Seq],[Status],[Status Desc],[Inv Status],[Inv Status Desc],[Trn Date],[Dwh Load Time] ,[PU Order Line His fct key],
[Tax Classification Desc],[Max W/Tax %],[SCT Allowed],[SCT Allowed Falg],[WIT Allowed],[WIT Allowed Flag],[Pur Office Description],[Pur Office Warehouse],[Pur Office Site],[Delivery Terms Desc],[Payment Terms],[Payment Terms Company],[Payment Period],[Payment Period Type Key],[Payment Period Type],[Shift in Due Dt Tolerance],[Discount Amount Tolerance],[Discount Percentage Tolerance],[Discount Period Tolerance],[Change Reason Desc],[Tax Code Desc],[Warehouse Desc],[Warehouse Address Code],[Financial Company],[Enterprise unit of Wh],[Inventory Mgt Business Partner],[WH External Site],[WH External Site Flag],[Blocked for Hnbound],[Blocked for Inbound Desc],[Blocked for Outbound],[Blocked for Outbound Desc],[Items Desc],[Item Group],[Product Class],[Product Line],[Item Signal],[Country of Origin],[Product Type],[Inventory Unit],[Serialized],[Default Supply Source],[Buy-from Address Code],[Buy-from Country],[Buy-from Country Name],[Buy-from BP Name],[Buy-from State/Province],[Buy-from City Name],[PoT Passage Desc],[PoT Passage Spec Key],[PoT Passage Spec],[Ship-from Address Code],[Ship-from Country],[Ship-from Country Name],[Ship-from BP Name],[Ship-from State/Province],[Ship-from City Name],[Address],[Sites Description],[Parent Site],[Site Category],[Site Status],[Text],[External Site],[Product Line Levels],[Product Line First Level],[Product Line Second Level],[Product Line Third Level],[Buy-from Region],[Buy-from Sub Region],[Ship-from Region],[Ship-from Sub Region])
select 
[Purchase Acknowledgment],[Order Line Disc Amt],[Amt],[Approved],[Approved Desc],[Tax Classification],[Cost Component],[Purchase Office],[Carrier/Lsp],[Record Type],[Record Type Desc],[Lot],[Canceled],[Canceled Desc],[Company Number],[Contract],[Project],[Carrier Binding],[Carrier Binding Desc],[Change Reason],[Reason For Rejection],[Element],[Change Type],[Purchase Unit],[Tax Code],[Warehouse],[Receipt Amt],[Number Of Deliveries Done],[Planned Receipt Date],[Current Planned Receipt Date],[Confirmed Receipt Date],[Changed Receipt Date],[Actual Receipt Date],[Order Confirmation Date],[Final Receipt],[Final Receipt Desc],[General Ledger],[History Action],[History Action Desc],[Inv Amt],[Inv Date],[Invoice],[Item],[Planned Load Date],[Lot Selection],[Order Amt],[Order Date],[Original Order],[Original Line],[Purchase Order],[Original Seq],[Buy-From BP],[Purchase Order Line],[Price],[Purchase Type],[Approved Qty],[Backorder Qty],[Potential Backorder Qty],[Received Qty],[Invd Qty],[Quantity],[Rejected Qty],[Shipped Qty],[Ordered Qty],[Rept Line],[Sales Schedule Type],[Sales Schedule Type Desc],[Ship-From Address],[Ship-From BP],[Ship-From Contact],[Ship-From Site],[Ship-From Warehouse],[Site],[Sales Order / Schedule],[Spon Line],[SequenceNumber],[Seq],[Status],[Status Desc],[Inv Status],[Inv Status Desc],[Trn Date],[Dwh Load Time] ,[PU Order Line His fct key],
[Tax Classification Desc],[Max W/Tax %],[SCT Allowed],[SCT Allowed Falg],[WIT Allowed],[WIT Allowed Flag],[Pur Office Description],[Pur Office Warehouse],[Pur Office Site],[Delivery Terms Desc],[Payment Terms],[Payment Terms Company],[Payment Period],[Payment Period Type Key],[Payment Period Type],[Shift in Due Dt Tolerance],[Discount Amount Tolerance],[Discount Percentage Tolerance],[Discount Period Tolerance],[Change Reason Desc],[Tax Code Desc],[Warehouse Desc],[Warehouse Address Code],[Financial Company],[Enterprise unit of Wh],[Inventory Mgt Business Partner],[WH External Site],[WH External Site Flag],[Blocked for Hnbound],[Blocked for Inbound Desc],[Blocked for Outbound],[Blocked for Outbound Desc],[Items Desc],[Item Group],[Product Class],[Product Line],[Item Signal],[Country of Origin],[Product Type],[Inventory Unit],[Serialized],[Default Supply Source],[Buy-from Address Code],[Buy-from Country],[Buy-from Country Name],[Buy-from BP Name],[Buy-from State/Province],[Buy-from City Name],[PoT Passage Desc],[PoT Passage Spec Key],[PoT Passage Spec],[Ship-from Address Code],[Ship-from Country],[Ship-from Country Name],[Ship-from BP Name],[Ship-from State/Province],[Ship-from City Name],[Address],[Sites Description],[Parent Site],[Site Category],[Site Status],[Text],[External Site],[Product Line Levels],[Product Line First Level],[Product Line Second Level],[Product Line Third Level],[Buy-from Region],[Buy-from Sub Region],[Ship-from Region],[Ship-from Sub Region] FROM [replncss].[fct AP Purchase Order Line History]
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


