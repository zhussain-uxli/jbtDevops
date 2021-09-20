/**********************************************************************************************************************
Stored Procedure Name: [replncss].[SP_7A_fct_Sales_Order_Act_Delivery_Lines_Cube]
Description: This stored procedure is used to load the data from Fact Sales Orders Actual Delivery Lines And Fact Sales Orders Revenue cube data. 

Data Type: Fact Data
Source Table / View: [replncss].[fct Sales Order Act Delivery Lines],[replncss].[fct Sales Revenue Cube]
Target Table: [replncss].[CDW fct Sales Order Act Delivery Lines Cube]
Lookup Tables: None

Data Load Frequency: Automatic
Load Type: Delta Load
Integration Framework: 

Original Project: JBT
Developer: Mohammed Majid
Date: 18-05-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/
--EXEC [replncss].[SP_7A_fct_Sales_Order_Act_Delivery_Lines_Cube];

--DROP PROCEDURE [replncss].[SP_7A_fct_Sales_Order_Act_Delivery_Lines_Cube]

CREATE PROCEDURE [replncss].[SP_7A_fct_Sales_Order_Act_Delivery_Lines_Cube]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;

	BEGIN TRY
	
	Delete [replncss].[CDW fct Sales Order Act Delivery Lines Cube];
	
	Insert into [replncss].[CDW fct Sales Order Act Delivery Lines Cube] 
	([Line Disc Amt],[SO Blocked],[Canceled],[Contract],[Cust Order],[Change Reason],[BackOrd UoM],[Warehouse],[Init Req Date],[Cust Req Date],
	[Orig Deliv Date],[Delivery Datetime],[Delivery Date],[SO Order Date],[Plnd Receipt Date],[Plan Deliv Date],[Sales Inv Date],[Sales Lines],
	[Price],[SO Delivered Qty],[Original Ordered Qty],[Exch Rate Type],[Supply-from Whs],[So Shipment],[Line Sequence],[Ship-to Whs],
	[Ext Sales Rep],[Return Reason],[Sales Ord Type],[Sales Price List],[Installments],[Ord Disc Amt],[Tax Classif],[Delivery Terms],
	[Discount Code],[Carrier],[Company number],[Sales Price Unit],[Sales Qty Unit],[Delivery Code],[SO Discount],[Delivery Type],[Items],
	[Discount Amt],[Price Origin],[PoTP],[Line of Business],[Payment Terms],[Sales Rep],[Financial Dept],[Invoice-to Addr],[Invoice-to BP],
	[Sold-to Address],[Sold-to BP],[Payment Method],[Rate Type],[Currency],[Service Office],[Order Discount],[Est Order Amt],[Ship-to Address],
	[Ship-to BP],[Sales Type],[Tax Code],[Department],[Order Number],[Order Line Numb],[Table Desc],[Table Shortcode],[Time of Action],
	[SO Act Deliv Line Seq Numb],[SO Invoice Line],[Remain Order Qty],[Order Value Due],[Completed Delivery Flag],[Back Order Qty],[Ordered Qty],
	[DWH Load Time],[site],[Delivered Value],[SO Order Status],[SO Order Status Desc],[Ship Constraint],[Ship Constraint Desc],[Carrier/LSP Desc],
	[Deleted Record],[Carrier Alpha Code],[Buy-from Business Partner],[Transport Category],[Transport Category Desc],[Change Reason Desc],
	[Last Inventory Transaction Date],[Inventory Allocated],[Inventory Blocked],[Inventory Blocked for Planning],
	[Consignment Inventory Location Allocated],[Consignment Inventory on Hand],[Cumulative Issue],[Consignment Inventory in Transit],
	[Inventory Committed],[Consignment on Order],[Inventory Committed in Process],[Consigned Quarantine],[Goods in Transit],[Historical Balance],
	[Inventory on Hand],[Company Owned Quarantine Inventory],[Inventory in Transit],[Inventory Location Allocated],[Cust Owned Location Allocated],
	[Cust Owned Blocked],[Cust Owned Blocked for Planning],[Cust Owned on Hand],[Cust Owned in Transit],[Cust Owned on Order],
	[Cust Owned Quarantine],[Comp Owned Location Allocated],[Comp Owned on Order],[Inventory on Order],[Items Desc],[Item Group],[Product Class],
	[Product Line],[Item Signal],[Country of Origin],[Product Type],[Inventory Unit],[Serialized],[Default Supply Source],[Line of Business Desc],
	[Sales Office Desc],[Sales Order Type Desc],[Ship-to Address Code],[Ship-to Country],[Ship-to Country Name],[Ship-to BP Name],
	[Ship-to State/Province],[Ship-to City Name],[Ship-to Latitude],[Ship-to Longitude],[Sold-to Address Code],[Sold-to Country],
	[Sold-to Country Name],[Sold-to BP Name],[Sold-to State/Province],[Sold-to City Name],[Sold-to Latitude],[Sold-to Longitude],
	[Tax Classification Desc],[Max W/Tax %],[SCT Allowed],[SCT Allowed Falg],[WIT Allowed],[WIT Allowed Flag],[Warehouse Desc],
	[Warehouse Address Code],[Financial Company],[Enterprise unit of Wh],[Inventory Mgt Business Partner],[External Site],[External Site Flag],
	[Blocked for Inbound],[Blocked for Inbound Desc],[Blocked for Outbound],[Blocked for Outbound Desc],[Product Line Levels],
	[Product Line First Level],[Product Line Second Level],[Product Line Third Level],[Department Desc],[Department Site],[Department Type Key],
	[Department Type],[Ship-to Region],[Ship-to Sub Region],[Sold-to Region],[Sold-to Sub Region],[Default Supply Source By Site],
	[Default Supply Source By Site Desc],[Ship-to Address Desc],[Sold-to Address Desc],[SO Act Delivery Key],[row_no])
	(SELECT
	[Line Disc Amt],[SO Blocked],[Canceled],[Contract],[Cust Order],[Change Reason],[BackOrd UoM],[Warehouse],[Init Req Date],[Cust Req Date],
	[Orig Deliv Date],[Delivery Datetime],[Delivery Date],[SO Order Date],[Plnd Receipt Date],[Plan Deliv Date],[Sales Inv Date],[Sales Lines],
	[Price],[SO Delivered Qty],[Original Ordered Qty],[Exch Rate Type],[Supply-from Whs],[So Shipment],[Line Sequence],[Ship-to Whs],
	[Ext Sales Rep],[Return Reason],[Sales Ord Type],[Sales Price List],[Installments],[Ord Disc Amt],[Tax Classif],[Delivery Terms],
	[Discount Code],[Carrier],[Company number],[Sales Price Unit],[Sales Qty Unit],[Delivery Code],[SO Discount],[Delivery Type],[Items],
	[Discount Amt],[Price Origin],[PoTP],[Line of Business],[Payment Terms],[Sales Rep],[Financial Dept],[Invoice-to Addr],[Invoice-to BP],
	[Sold-to Address],[Sold-to BP],[Payment Method],[Rate Type],[Currency],[Service Office],[Order Discount],[Est Order Amt],[Ship-to Address],
	[Ship-to BP],[Sales Type],[Tax Code],[Department],[Order Number],[Order Line Numb],[Table Desc],[Table Shortcode],[Time of Action],
	[SO Act Deliv Line Seq Numb],[SO Invoice Line],[Remain Order Qty],[Order Value Due],[Completed Delivery Flag],[Back Order Qty],[Ordered Qty],
	[DWH Load Time],[site],[Delivered Value],[SO Order Status],[SO Order Status Desc],[Ship Constraint],[Ship Constraint Desc],[Carrier/LSP Desc],
	[Deleted Record],[Carrier Alpha Code],[Buy-from Business Partner],[Transport Category],[Transport Category Desc],[Change Reason Desc],
	[Last Inventory Transaction Date],[Inventory Allocated],[Inventory Blocked],[Inventory Blocked for Planning],
	[Consignment Inventory Location Allocated],[Consignment Inventory on Hand],[Cumulative Issue],[Consignment Inventory in Transit],
	[Inventory Committed],[Consignment on Order],[Inventory Committed in Process],[Consigned Quarantine],[Goods in Transit],[Historical Balance],
	[Inventory on Hand],[Company Owned Quarantine Inventory],[Inventory in Transit],[Inventory Location Allocated],[Cust Owned Location Allocated],
	[Cust Owned Blocked],[Cust Owned Blocked for Planning],[Cust Owned on Hand],[Cust Owned in Transit],[Cust Owned on Order],
	[Cust Owned Quarantine],[Comp Owned Location Allocated],[Comp Owned on Order],[Inventory on Order],[Items Desc],[Item Group],[Product Class],
	[Product Line],[Item Signal],[Country of Origin],[Product Type],[Inventory Unit],[Serialized],[Default Supply Source],[Line of Business Desc],
	[Sales Office Desc],[Sales Order Type Desc],[Ship-to Address Code],[Ship-to Country],[Ship-to Country Name],[Ship-to BP Name],
	[Ship-to State/Province],[Ship-to City Name],[Ship-to Latitude],[Ship-to Longitude],[Sold-to Address Code],[Sold-to Country],
	[Sold-to Country Name],[Sold-to BP Name],[Sold-to State/Province],[Sold-to City Name],[Sold-to Latitude],[Sold-to Longitude],
	[Tax Classification Desc],[Max W/Tax %],[SCT Allowed],[SCT Allowed Falg],[WIT Allowed],[WIT Allowed Flag],[Warehouse Desc],
	[Warehouse Address Code],[Financial Company],[Enterprise unit of Wh],[Inventory Mgt Business Partner],[External Site],[External Site Flag],
	[Blocked for Inbound],[Blocked for Inbound Desc],[Blocked for Outbound],[Blocked for Outbound Desc],[Product Line Levels],
	[Product Line First Level],[Product Line Second Level],[Product Line Third Level],[Department Desc],[Department Site],[Department Type Key],
	[Department Type],[Ship-to Region],[Ship-to Sub Region],[Sold-to Region],[Sold-to Sub Region],[Default Supply Source By Site],
	[Default Supply Source By Site Desc],[Ship-to Address Desc],[Sold-to Address Desc],[SO Act Delivery Key],[row_no]
FROM [replncss].[fct Sales Order Act Delivery Lines]

UNION ALL

SELECT  A.[Line Disc Amt],A.[SO Blocked],A.[Canceled],A.[Contract],A.[Cust Order],A.[Change Reason],A.[BackOrd UoM],A.[Warehouse],A.[Init Req Date],
		A.[Cust Req Date],A.[Orig Deliv Date],A.[Delivery Date] As [Delivery Datetime],A.[Delivery Date],A.[SO Order Date],A.[Plnd Receipt Date],
		A.[Plan Deliv Date],A.[Sales Inv Date],A.[Sales Lines],A.[Price],A.[SO Delivered Qty],A.[Original Ordered Qty],A.[Exch Rate Type],
		A.[Supply-from Whs],A.[So Shipment],A.[Line Sequence],A.[Ship-to Whs],A.[Ext Sales Rep],A.[Return Reason],A.[Sales Ord Type],
		A.[Sales Price List],A.[Installments],A.[Ord Disc Amt],A.[Tax Classif],A.[Delivery Terms],A.[Discount Code],A.[Carrier],A.[Company number],
		A.[Sales Price Unit],A.[Sales Qty Unit],A.[Delivery Code],A.[SO Discount],A.[Delivery Type],A.[Items],A.[Discount Amt],A.[Price Origin],
		A.[PoTP],A.[Line of Business],A.[Payment Terms],A.[Sales Rep],A.[Financial Dept],A.[Invoice-to Addr],A.[Invoice-to BP],A.[Sold-to Address],
		A.[Sold-to BP],A.[Payment Method],A.[Rate Type],A.[Currency],A.[Service Office],A.[Order Discount],A.[Est Order Amt],A.[Ship-to Address],
		A.[Ship-to BP],A.[Sales Type],A.[Tax Code],A.[Department],A.[Order Number],A.[Order Line Numb],A.[Table Desc],A.[Table Shortcode],
		A.[Time of Action],1 As [SO Act Deliv Line Seq Numb],A.[Line Sequence] As [SO Invoice Line],A.[Remain Order Qty],A.[Order Value Due],
		A.[Completed Delivery Flag],A.[Back Order Qty],A.[Ordered Qty],A.[DWH Load Time],A.[site],A.[Delivered Value],A.[SO Order Status],
		A.[SO Order Status Desc],A.[Ship Constraint],A.[Ship Constraint Desc],A.[Carrier/LSP Desc],A.[Deleted Record],A.[Carrier Alpha Code],
		A.[Buy-from Business Partner],A.[Transport Category],A.[Transport Category Desc],A.[Change Reason Desc],A.[Last Inventory Transaction Date],
		A.[Inventory Allocated],A.[Inventory Blocked],A.[Inventory Blocked for Planning],A.[Consignment Inventory Location Allocated],
		A.[Consignment Inventory on Hand],A.[Cumulative Issue],A.[Consignment Inventory in Transit],A.[Inventory Committed],A.[Consignment on Order],
		A.[Inventory Committed in Process],A.[Consigned Quarantine],A.[Goods in Transit],A.[Historical Balance],A.[Inventory on Hand],
		A.[Company Owned Quarantine Inventory],A.[Inventory in Transit],A.[Inventory Location Allocated],A.[Cust Owned Location Allocated],
		A.[Cust Owned Blocked],A.[Cust Owned Blocked for Planning],A.[Cust Owned on Hand],A.[Cust Owned in Transit],A.[Cust Owned on Order],
		A.[Cust Owned Quarantine],A.[Comp Owned Location Allocated],A.[Comp Owned on Order],A.[Inventory on Order],A.[Items Desc],A.[Item Group],
		A.[Product Class],A.[Product Line],A.[Item Signal],A.[Country of Origin],A.[Product Type],A.[Inventory Unit],A.[Serialized],
		A.[Default Supply Source],A.[Line of Business Desc],A.[Sales Office Desc],A.[Sales Order Type Desc],A.[Ship-to Address Code],
		A.[Ship-to Country],A.[Ship-to Country Name],A.[Ship-to BP Name],A.[Ship-to State/Province],A.[Ship-to City Name],A.[Ship-to Latitude],
		A.[Ship-to Longitude],A.[Sold-to Address Code],A.[Sold-to Country],A.[Sold-to Country Name],A.[Sold-to BP Name],A.[Sold-to State/Province],
		A.[Sold-to City Name],A.[Sold-to Latitude],A.[Sold-to Longitude],A.[Tax Classification Desc], A.[Max W/Tax %],A.[SCT Allowed],
		A.[SCT Allowed Falg],A.[WIT Allowed],A.[WIT Allowed Flag],A.[Warehouse Desc],A.[Warehouse Address Code],A.[Financial Company],
		A.[Enterprise unit of Wh],A.[Inventory Mgt Business Partner],A.[External Site],A.[External Site Flag],A.[Blocked for Inbound],
		A.[Blocked for Inbound Desc],A.[Blocked for Outbound],A.[Blocked for Outbound  Desc] As [Blocked for Outbound Desc],A.[Product Line Levels],
		A.[Product Line First Level],A.[Product Line Second Level],A.[Product Line Third Level],A.[Department Desc],A.[Department Site],
		A.[Department Type Key],A.[Department Type],A.[Ship-to Region],A.[Ship-to Sub Region],A.[Sold-to Region],A.[Sold-to Sub Region],
		A.[Default Supply Source By Site],A.[Default Supply Source By Site Desc],A.[Ship-to Address Desc],A.[Sold-to Address Desc],
		A.[Company number] + '_' + A.[Order Number] + '_' + Convert(Varchar,A.[Sales Lines]) + '_' + Convert(Varchar,A.[Line Sequence]) As [SO Act Delivery Key],
		1 As row_no
FROM [replncss].[fct Sales Revenue Cube] A
WHERE A.[Table Shortcode] = 'SO' 
AND NOT EXISTS (SELECT 1
FROM [replncss].[fct Sales Order Act Delivery Lines] B
WHERE A.[Company number] = B.[Company number] And A.[Order Number] = B.[Order Number] And A.[Sales Lines] = B.[Sales Lines] 
And A.[Line Sequence] = B.[Line Sequence])
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


