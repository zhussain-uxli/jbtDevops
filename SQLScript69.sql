/**********************************************************************************************************************
Stored Procedure Name: [replncss].[SP_13_fct_Rep_Production_Receipts_Cube]
Description: This stored procedure is used to load the Fact Repetitive Production Warehouse Receipts Cube data. 

Data Type: Fact Data
Source Table / View: [replncss].[fct Rep Production Receipts]
Target Table: [replncss].[fct Rep Production Receipts Cube]
Lookup Tables / Views: [replncss].[dim Carriers/LSP],[replncss].[dim Item Inventory by Warehouse],[replncss].[dim Items],[replncss].[dim Ship-from Business Partners],[replncss].[dim Warehouse],[dwhcda].[lnc_dim_tcmcs061_Ext],[dwhcda].[lnc_dim_country_region],[acq101].[dst_tccom130]

Data Load Frequency: Automatic
Load Type: Delta Load
Integration Framework: 

Original Project: JBT Production Planning & Scheduling
Developer: Mohammed Majid
Date: 11-08-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/
--EXEC [replncss].[SP_13_fct_Rep_Production_Receipts_Cube];

--DROP PROCEDURE [replncss].[SP_13_fct_Rep_Production_Receipts_Cube]

CREATE PROCEDURE [replncss].[SP_13_fct_Rep_Production_Receipts_Cube]
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION;

	BEGIN TRY
	
	Delete [replncss].[fct Rep Production Receipts Cube];
	
	Insert into [replncss].[fct Rep Production Receipts Cube] ([Activity],[Actual Receipt Date],[Customer Item Revision],[Manufacturer],[Complete],[Complete Desc],[Company number],[Confirmed],[Confirmed Desc],[Receiving Warehouse],[Deleted],[Direct Material Supply Execution],[Direct Material Supply Execution Desc],[Destination Location],[Final Receipt],[Final Receipt Desc],[Inventory Date],[Items],[Line Status],[Line Status Desc`],[Order Origin],[Order Origin Desc],[Order Number],[Operation Set],[Order Line],[Packing Slip],[Packing Slip Qty in Receipt Unit],[Packing Slip Qty],[Packing Slip Unit],[Inspection Qty],[Advised Qty],[Approved Qty],[Destroyed Qty],[Received Qty in Receipt Unit],[Received Qty in Inv Unit],[Rejected Qty],[Scrapped Qty],[Receipt Line],[Receipt Number],[Receipt Unit],[Order Sequence],[Ship-from BP],[Shipping Date],[Time of Action],[Transaction Date],[Receipt Line Text],[DWH Load Time],[Carrier/LSP],[Delivery Terms],[Header Status],[Header Status Desc],[Inv Trans Type],[Inv Trans Type Desc],[Order Date],[Ship-from Site],[Ship-from Address],[Ship-to Address],[Office],[Closed],[Closed Desc],[Work Center],[Production Finish Date],[Production Model],[Production Start Date],[Production Schedule],[Ordered Qty],[Schedule Type],[Schedule Type Desc],[Site],
	[Prod Rec Fct Key],
	[Carrier/LSP Desc],[Carrier Alpha Code],[Buy-from Business Partner],[Transport Category],[Transport Category Desc],
	[Last Inventory Transaction Date],[Inventory Allocated],[Inventory Blocked],[Inventory Blocked for Planning],[Consignment Inventory Location Allocated],[Consignment Inventory on Hand],[Cumulative Issue],[Consignment Inventory in Transit],[Inventory Committed],[Consignment on Order],[Inventory Committed in Process],[Consigned Quarantine],[Goods in Transit],[Historical Balance],[Inventory on Hand],[Company Owned Quarantine Inventory],[Inventory in Transit],[Inventory Location Allocated],[Cust Owned Location Allocated],[Cust Owned Blocked],[Cust Owned Blocked for Planning],[Cust Owned on Hand],[Cust Owned in Transit],[Cust Owned on Order],[Cust Owned Quarantine],[Comp Owned Location Allocated],[Comp Owned on Order],[Inventory on Order],
	[Items Desc],[Item Group],[Product Class],[Product Line],[Item Signal],[Country of Origin],[Product Type],[Inventory Unit],[Serialized],[Default Supply Source],
	[Ship-from Address Code],[Ship-from Country],[Ship-from Country Name],[Ship-from BP Name],[Ship-from State/Province],[Ship-from City Name],
	[Warehouse Desc],[Warehouse Address Code],[Financial Company],[Enterprise unit of Wh],[Inventory Mgt Business Partner],[External Site],[External Site Flag],[Ship-from Region],[Ship-from Sub Region],[Ship-from Address Desc],[Ship-to Address Desc],
	[Product Line Levels],[Product Line First Level],[Product Line Second Level],[Product Line Third Level],[Actual Receipt Datetime],
	[Actual Receipt Datetime EST],[Actual Receipt Date EST])
	Select src_tbl.[Activity],src_tbl.[Actual Receipt Date],src_tbl.[Customer Item Revision],src_tbl.[Manufacturer],src_tbl.[Complete],src_tbl.[Complete Desc],src_tbl.[Company number],src_tbl.[Confirmed],src_tbl.[Confirmed Desc],src_tbl.[Receiving Warehouse],src_tbl.[Deleted],src_tbl.[Direct Material Supply Execution],src_tbl.[Direct Material Supply Execution Desc],src_tbl.[Destination Location],src_tbl.[Final Receipt],src_tbl.[Final Receipt Desc],src_tbl.[Inventory Date],src_tbl.[Items],src_tbl.[Line Status],src_tbl.[Line Status Desc`],src_tbl.[Order Origin],src_tbl.[Order Origin Desc],src_tbl.[Order Number],src_tbl.[Operation Set],src_tbl.[Order Line],src_tbl.[Packing Slip],src_tbl.[Packing Slip Qty in Receipt Unit],src_tbl.[Packing Slip Qty],src_tbl.[Packing Slip Unit],src_tbl.[Inspection Qty],src_tbl.[Advised Qty],src_tbl.[Approved Qty],src_tbl.[Destroyed Qty],src_tbl.[Received Qty in Receipt Unit],src_tbl.[Received Qty in Inv Unit],src_tbl.[Rejected Qty],src_tbl.[Scrapped Qty],src_tbl.[Receipt Line],src_tbl.[Receipt Number],src_tbl.[Receipt Unit],src_tbl.[Order Sequence],src_tbl.[Ship-from BP],src_tbl.[Shipping Date],src_tbl.[Time of Action],src_tbl.[Transaction Date],src_tbl.[Receipt Line Text],src_tbl.[DWH Load Time],src_tbl.[Carrier/LSP],src_tbl.[Delivery Terms],src_tbl.[Header Status],src_tbl.[Header Status Desc],src_tbl.[Inv Trans Type],src_tbl.[Inv Trans Type Desc],src_tbl.[Order Date],src_tbl.[Ship-from Site],src_tbl.[Ship-from Address],src_tbl.[Ship-to Address],src_tbl.[Office],src_tbl.[Closed],src_tbl.[Closed Desc],src_tbl.[Work Center],src_tbl.[Production Finish Date],src_tbl.[Production Model],src_tbl.[Production Start Date],src_tbl.[Production Schedule],src_tbl.[Ordered Qty],src_tbl.[Schedule Type],src_tbl.[Schedule Type Desc],src_tbl.[Site],src_tbl.[Prod Rec Fct Key],
	src_tbl.[Carrier/LSP Desc],src_tbl.[Carrier Alpha Code],src_tbl.[Buy-from Business Partner],src_tbl.[Transport Category],src_tbl.[Transport Category Desc],
	src_tbl.[Last Inventory Transaction Date],src_tbl.[Inventory Allocated],src_tbl.[Inventory Blocked],src_tbl.[Inventory Blocked for Planning],src_tbl.[Consignment Inventory Location Allocated],src_tbl.[Consignment Inventory on Hand],src_tbl.[Cumulative Issue],src_tbl.[Consignment Inventory in Transit],src_tbl.[Inventory Committed],src_tbl.[Consignment on Order],src_tbl.[Inventory Committed in Process],src_tbl.[Consigned Quarantine],src_tbl.[Goods in Transit],src_tbl.[Historical Balance],src_tbl.[Inventory on Hand],src_tbl.[Company Owned Quarantine Inventory],src_tbl.[Inventory in Transit],src_tbl.[Inventory Location Allocated],src_tbl.[Cust Owned Location Allocated],src_tbl.[Cust Owned Blocked],src_tbl.[Cust Owned Blocked for Planning],src_tbl.[Cust Owned on Hand],src_tbl.[Cust Owned in Transit],src_tbl.[Cust Owned on Order],src_tbl.[Cust Owned Quarantine],src_tbl.[Comp Owned Location Allocated],src_tbl.[Comp Owned on Order],src_tbl.[Inventory on Order],
	src_tbl.[Items Desc],src_tbl.[Item Group],src_tbl.[Product Class],src_tbl.[Product Line],src_tbl.[Item Signal],src_tbl.[Country of Origin],src_tbl.[Product Type],src_tbl.[Inventory Unit],src_tbl.[Serialized],src_tbl.[Default Supply Source],
	src_tbl.[Ship-from Address Code],src_tbl.[Ship-from Country],src_tbl.[Ship-from Country Name],src_tbl.[Ship-from BP Name],src_tbl.[Ship-from State/Province],src_tbl.[Ship-from City Name],
	src_tbl.[Warehouse Desc],src_tbl.[Warehouse Address Code],src_tbl.[Financial Company],src_tbl.[Enterprise unit of Wh],src_tbl.[Inventory Mgt Business Partner],src_tbl.[External Site],src_tbl.[External Site Flag],
	src_tbl.[Ship-from Region],src_tbl.[Ship-from Sub Region],src_tbl.[Ship-from Address Desc],src_tbl.[Ship-to Address Desc],
	src_tbl.[Product Line Levels],src_tbl.[Product Line First Level],src_tbl.[Product Line Second Level],src_tbl.[Product Line Third Level],
	src_tbl.[Actual Receipt Datetime],src_tbl.[Actual Receipt Datetime EST],src_tbl.[Actual Receipt Date EST]
	
	From (SELECT [Activity],
A.[Actual Receipt Date],
A.[Customer Item Revision],
A.[Manufacturer],
A.[Complete],
A.[Complete Desc],
A.[Company number],
A.[Confirmed],
A.[Confirmed Desc],
A.[Receiving Warehouse],
A.[Deleted],
A.[Direct Material Supply Execution],
A.[Direct Material Supply Execution Desc],
A.[Destination Location],
A.[Final Receipt],
A.[Final Receipt Desc],
A.[Inventory Date],
Trim(A.[Items]) As [Items],
A.[Line Status],
A.[Line Status Desc`],
A.[Order Origin],
A.[Order Origin Desc],
A.[Order Number],
A.[Operation Set],
A.[Order Line],
A.[Packing Slip],
A.[Packing Slip Qty in Receipt Unit],
A.[Packing Slip Qty],
A.[Packing Slip Unit],
A.[Inspection Qty],
A.[Advised Qty],
A.[Approved Qty],
A.[Destroyed Qty],
A.[Received Qty in Receipt Unit],
A.[Received Qty in Inv Unit],
A.[Rejected Qty],
A.[Scrapped Qty],
A.[Receipt Line],
A.[Receipt Number],
A.[Receipt Unit],
A.[Order Sequence],
A.[Ship-from BP],
A.[Shipping Date],
A.[Time of Action],
A.[Transaction Date],
A.[Receipt Line Text],
A.[DWH Load Time],
A.[Carrier/LSP],
A.[Delivery Terms],
A.[Header Status],
A.[Header Status Desc],
A.[Inv Trans Type],
A.[Inv Trans Type Desc],
A.[Order Date],
A.[Ship-from Site],
A.[Ship-from Address],
A.[Ship-to Address],
A.[Office],
A.[Closed],
A.[Closed Desc],
A.[Work Center],
A.[Production Finish Date],
A.[Production Model],
A.[Production Start Date],
A.[Production Schedule],
A.[Ordered Qty],
A.[Schedule Type],
A.[Schedule Type Desc],
A.[Site],
A.[Prod Rec Fct Key],
A.[Actual Receipt Datetime],
Cast(A.[Actual Receipt Datetime] AT TIME ZONE 'UTC' AT TIME ZONE 'Eastern Standard Time' As Datetime) As [Actual Receipt Datetime EST],
Cast(A.[Actual Receipt Datetime] AT TIME ZONE 'UTC' AT TIME ZONE 'Eastern Standard Time' As Date) As [Actual Receipt Date EST],
B.[Carrier/LSP Desc] as [Carrier/LSP Desc],
B.[Carrier Alpha Code] as [Carrier Alpha Code],
B.[Buy-from Business Partner] as [Buy-from Business Partner],
B.[Transport Category] as [Transport Category],
B.[Transport Category Desc] as [Transport Category Desc],
C.[Last Inventory Transaction Date] as [Last Inventory Transaction Date],
C.[Inventory Allocated] as [Inventory Allocated],
C.[Inventory Blocked] as [Inventory Blocked],
C.[Inventory Blocked for Planning] as [Inventory Blocked for Planning],
C.[Consignment Inventory Location Allocated] as [Consignment Inventory Location Allocated],
C.[Consignment Inventory on Hand] as [Consignment Inventory on Hand],
C.[Cumulative Issue] as [Cumulative Issue],
C.[Consignment Inventory in Transit] as [Consignment Inventory in Transit],
C.[Inventory Committed] as [Inventory Committed],
C.[Consignment on Order] as [Consignment on Order],
C.[Inventory Committed in Process] as [Inventory Committed in Process],
C.[Consigned Quarantine] as [Consigned Quarantine],
C.[Goods in Transit] as [Goods in Transit],
C.[Historical Balance] as [Historical Balance],
C.[Inventory on Hand] as [Inventory on Hand],
C.[Company Owned Quarantine Inventory] as [Company Owned Quarantine Inventory],
C.[Inventory in Transit] as [Inventory in Transit],
C.[Inventory Location Allocated] as [Inventory Location Allocated],
C.[Cust Owned Location Allocated] as [Cust Owned Location Allocated],
C.[Cust Owned Blocked] as [Cust Owned Blocked],
C.[Cust Owned Blocked for Planning] as [Cust Owned Blocked for Planning],
C.[Cust Owned on Hand] as [Cust Owned on Hand],
C.[Cust Owned in Transit] as [Cust Owned in Transit],
C.[Cust Owned on Order] as [Cust Owned on Order],
C.[Cust Owned Quarantine] as [Cust Owned Quarantine],
C.[Comp Owned Location Allocated] as [Comp Owned Location Allocated],
C.[Comp Owned on Order] as [Comp Owned on Order],
C.[Inventory on Order] as [Inventory on Order],
D.[Items Desc] as [Items Desc],
D.[Item Group] as [Item Group],
D.[Product Class] as [Product Class],
D.[Product Line] as [Product Line],
D.[Item Signal] as [Item Signal],
D.[Country of Origin] as [Country of Origin],
D.[Product Type] as [Product Type],
D.[Inventory Unit] as [Inventory Unit],
D.[Serialized] as [Serialized],
D.[Default Supply Source] as [Default Supply Source],
E.[Address Code] as [Ship-from Address Code],
E.[Country] as [Ship-from Country],
E.[Country Name] as [Ship-from Country Name],
E.[Ship-from BP Name] as [Ship-from BP Name],
E.[Ship-from State/Province] As [Ship-from State/Province],
E.[Ship-from City Name] As [Ship-from City Name],
F.[Warehouse Desc] as [Warehouse Desc],
F.[Address Code] as [Warehouse Address Code],
F.[Financial Company] as [Financial Company],
F.[Enterprise unit of Wh] as [Enterprise unit of Wh],
F.[Inventory Mgt Business Partner] as [Inventory Mgt Business Partner],
F.[External Site] as [External Site],
F.[External Site Flag] as [External Site Flag],
G.[region] As [Ship-from Region],
G.[sub-region] As [Ship-from Sub Region],
H.[nama] As [Ship-from Address Desc],
I.[nama] As [Ship-to Address Desc],
J.[levels] As [Product Line Levels],
J.[firstlevel] 	As [Product Line First Level],	
J.[secondlevel] As [Product Line Second Level],	
J.[thirdlevel] 	As [Product Line Third Level]

FROM [replncss].[fct Rep Production Receipts] A

LEFT OUTER JOIN [replncss].[dim Carriers/LSP] B
on A.[Carrier/LSP] = B.[Carrier/LSP] And A.[Company number] = B.[Company]

LEFT OUTER JOIN [replncss].[dim Item Inventory by Warehouse] C
on A.[Receiving Warehouse] = C.[Warehouse] And A.[Company number] = C.[Company] and A.[Items] = C.[Item]

LEFT OUTER JOIN [replncss].[dim Items] D
on A.[Items] = D.[Item] And A.[Company number] = D.[Company]

LEFT OUTER JOIN [replncss].[dim Ship-from Business Partners] E
on A.[Ship-from BP] = E.[Ship-from BP] And A.[Company number] = E.[Company]

LEFT OUTER JOIN [replncss].[dim Warehouse] F
on A.[Receiving Warehouse] = F.[Warehouse] And A.[Company number] = F.[Company]

LEFT OUTER JOIN [dwhcda].[lnc_dim_country_region] G
on E.[Country] = G.[alpha-2]

LEFT OUTER JOIN (Select Distinct compnr,cadr,nama From [acq101].[dst_tccom130]) H
on A.[Ship-from Address] = H.[cadr] And A.[Company number] = H.[compnr]

LEFT OUTER JOIN (Select Distinct compnr,cadr,nama From [acq101].[dst_tccom130]) I
on A.[Ship-to Address] = I.[cadr] And A.[Company number] = I.[compnr]

LEFT OUTER JOIN [dwhcda].[lnc_dim_tcmcs061_Ext] J
on D.[Product Line] = J.[cpln] and D.[Company] = J.[compnr]

) src_tbl OPTION (LABEL = '[SP_13_fct_Rep_Production_Receipts_Cube_1]');
	
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


