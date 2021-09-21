/**********************************************************************************************************************
Stored Procedure Name: [replncss].[SP_7_fct_Sales_Revenue_Cube]
Description: This stored procedure is used to load the Fact Sales Revenue Cube data. 

Since few column calculations are based on the current date and all the data is to be refreshed,so delete and insert operation is performed in this Stored Procedure.

Data Type: Fact Data
Source Table / View: [replncss].[fct Sales Revenue]
Target Table: [replncss].[fct Sales Revenue Cube]
Lookup Tables / Views: [replncss].[dim Carriers/LSP],[replncss].[dim Change Reasons],[replncss].[dim Item Inventory by Warehouse],[replncss].[dim Items],[replncss].[dim Lines of Business],[replncss].[dim Sales Office],[replncss].[dim Sales Order Types],[replncss].[dim Ship-to Business Partners],[replncss].[dim Sold-to Business Partners],[replncss].[dim Tax Classification],[replncss].[dim Warehouse],[dwhcda].[lnc_dim_tcmcs061_Ext],
[replncss].[dim Departments],[dwhcda].[lnc_dim_country_region]

Data Load Frequency: Automatic
Load Type: Delta Load
Integration Framework: 

Original Project: JBT
Developer: Mohammed Majid
Date: 18-05-2021
Reviewed By: Atul Raje

Change History:
Dt:10/06/2021
Considered ([Source Company]) field as joining criteria in place of [Company Number] field for "Invoice Lines" data.

Dt: 18/06/2021
Added New fields ([Default Supply Source By Site],[Default Supply Source By Site Desc],[Ship-to State/Province],[Ship-to City Name],[Sold-to State/Province],[Sold-to City Name]) which are required for Reporting.

Dt:22/06/2021
Added New Calculated Field "Delivered Value" from Sales Order Fact (lnc_fct_Orders) Table Measure fields.

Dt:29/06/2021
Added New Calculated Field ([SO Invoiced Flag],[Pending Qty for Delivery],[Shipped but not Invoiced])to populate Shipped but not invoiced value.

Dt:19/07/2021
Added new filed "[Reporting Date]". For Invoice Lines "[Delivery Date]" is mapped & for Sales Order "[Plan Deliv Date]" is mapped to populate data into [Reporting Date] field.

Dt:02/08/2021
Added new fields from Warehouse dim View as per Business requirement (i.e.Blocked for Inbound and Outbound fields).

Dt:05/08/2021
Added New fields (Ship-to Address Desc,Sold-to Address Desc), data in these fields is populated from Address dst table (dst_tccom130) which are required for Reporting.

Made the changes to [items] field by trimming the spaces which we are getting from source.

Dt:10/08/2021
Lookup with Sales Header table (dst_tdsls400) to get the updated [SO Order Status],[SO Order Status Desc] in final cubes.

Dt:17/08/2021
Added New fields (Latitude,Longitde,Territory) for both Ship-to and Sold-to Business partners datafrom corresponding views which are required for Reporting.

Dt:17/08/2021
Added New fields (Latitude,Longitde,Territory) for both Ship-to and Sold-to Business partners datafrom corresponding views which are required for Reporting.

Dt:18/08/2021
Added "[Ship Constraint Desc]" field for Sales order lines table as part of report requirement.

Dt:15/09/2021
Added "[Requested Duration Days]" field in Sales Revenue cube as part of report requirement.

Dt:16/09/2021
As per discussion with Chris & Chad,added new field [Items Type] and the logic is applied in source view.

Dt:16/09/2021
As per discussion with Chris & Chad,added new field [OTD Plan Deliv Date Flag],[OTD Orig Prom Deliv Date Flag],[OTD Cust Req Deliv Date Flag],
[Delivery Days against Orig Prom],[Late To Init Req Flag],[Late To Orig Deliv Flag]
as part of new DashBoard.

**********************************************************************************************************************/
--EXEC [replncss].[SP_7_fct_Sales_Revenue_Cube];

--DROP PROCEDURE [replncss].[SP_7_fct_Sales_Revenue_Cube]

CREATE PROCEDURE [replncss].[SP_7_fct_Sales_Revenue_Cube]
AS
BEGIN
	SET NOCOUNT ON;
	
	IF OBJECT_ID('[replncss].[temp_fct_Sales_Revenue_cube]', 'U') IS NOT NULL
	DROP TABLE [replncss].[temp_fct_Sales_Revenue_cube];
	
	Select *
	Into [replncss].[temp_fct_Sales_Revenue_cube]
	From [replncss].[fct Sales Revenue] Where 1=2;

	Alter Table [replncss].[temp_fct_Sales_Revenue_cube] Add [SO Aval In Invoice Table Flag] [char](1) NULL;
	Alter Table [replncss].[temp_fct_Sales_Revenue_cube] Add [NetLineAmt Dom Prop] [float] NULL;
	Alter Table [replncss].[temp_fct_Sales_Revenue_cube] Add [INV Delivered Qty Prop] [float] NULL;
	Alter Table [replncss].[temp_fct_Sales_Revenue_cube] Add [SO Invoiced Flag] [char](1) NULL;
	Alter Table [replncss].[temp_fct_Sales_Revenue_cube] Add [Pending Qty for Delivery] [float] NULL;
	Alter Table [replncss].[temp_fct_Sales_Revenue_cube] Add [Shipped but not Invoiced] [float] NULL;

			
	BEGIN TRANSACTION;

	BEGIN TRY

	Insert into [replncss].[temp_fct_Sales_Revenue_cube]
	([Line Disc Amt],[SO Blocked],[Canceled],[Contract],[Cust Order],[Change Reason],[BackOrd UoM],[Warehouse],[Plnd Deliv Date],[Init Req Date],[Cust Req Date],[Orig Deliv Date],[Delivery Date],[SO Order Date],[Sales Lines],[Plnd Receipt Date],[Price],[SO Delivered Qty],[Original Ordered Qty],[Exch Rate Type],[Ship Constraint],[Supply-from Whs],[So Shipment],[Line Sequence],[Ship-to Whs],[Ext Sales Rep],[Return Reason],[Sales Ord Type],[Reference A],[Sales Price List],[Plan Deliv Date],[Installments],[Cost Serv Cont],[Cost FCO],[Cost SO Inv],[Activity Line],[Cost Goodwill],[Act Unit Cost],[Cost Quote],[Actual Line],[Cost Warranty],[Actual Cum Qty],[Actual Del Tme],[Total Cost],[Ord Disc Amt],[Act Purch Amt],[Sales Serv Con],[Total Disc Amt],[Sales FCO],[Sales SO Inv],[Sales Goodwill],[Sales Amt Quote],[Total Sales Amt],[Sales Warranty],[MC Blocked],[Tax Classif],[Delivery Terms],[Discount Code],[Carrier],[Cost Line Stat],[Company number],[Contr Converage],[Sales Price Unit],[Sales Qty Unit],[Delivery Code],[SO Discount],[Delivery Type],[Est Unit Cost],[Service Est Qty],[Service Est Cost Line],[Est Sales Price],[Items],[MC Residual Value],[Discount Amt],[Other Lines],[Service Order],[Activity],[Material or Maintenance Items],[Price Origin],[Sales Price],[PoTP],[Required Qty],[Cost Repair War],[Sales Repair War],[Repair Warranty],[Ship Matl To],[Line of Business],[Payment Terms],[Sales Rep],[Financial Dept],[Invoice-to Addr],[Invoice-to BP],[Sold-to Address],[Sold-to BP],[Payment Method],[Rate Type],[SvcO Cost Sheet],[Act Order Amt],[SOC Cancel Date],[Coverage Type],[Currency],[Serv Contract],[Service Type],[Service Office],[Est Order Amt],[Pricing Method],[Plan Start Time],[Warranty Type],[Act Cost Rate],[Labor Type Cost],[Labor Rate Code],[Task],[Service Discount],[Est Cost rate],[Labor Est Qty],[Sales Inv Amt],[Sales Inv Date],[Labor Type Sales],[Service Warranty],[Cost Amt War],[Actual Qty],[Cost Type],[Unit],[Est Cost Line Id],[Other Costs Items],[Act Receipt Time],[Maint SO],[Planned Carrier 1],[Item Delivery],[MO Delivered Qty],[Delivery Whse],[MO Line Status],[Order Discount],[Non SO Plan Deliv Date],[Plan Rec Time],[Qty],[Actual Carrier],[Planned Carrier 2],[Received Qty],[Shipment],[Receipt Whse],[Ship-to Address],[Ship-to BP],[Sales Type],[Work Order Num],[MO Warranty],[Desc],[Installment Plan],[MO Order Date],[MO Order Status],[Amt Dom Curr],[Net Amt],[Tax Code],[Manual Sales ID],[Manual Lines],[Financial Comp],[Tax Amt Dom],[Department],[Approved Amt],[Approval Action],[Approved By],[Approval Desci],[Approval Date],[Approval Percent],[Claim],[Claimed Amt],[Claim Method],[Appr Qty Unit],[Claim Qty Unit],[CC Residual Value],[Sales Doc Line],[Sales Doc Seq],[Approved Qty],[Claimed Qty],[Reject Action],[Rejected By],[Rejection Date],[Reject Reasons],[Return Matl Req],[CC Line Status],[Tagged To],[Wait Supp Claim],[CC Cancel Date],[Creation Date],[Failure Date],[Int Sales Rep],[Sales Inv Comp],[Sales Doc Num],[Sales Doc Type],[Sales Ref Sys],[Created By],[Order Number],[Order Line Numb],[Table Desc],[Table Shortcode],[Remain Order Qty],[Order Value Due],[NetLineAmt Dom],[Delivery Note],[Invoice Number],[Produc Relation],[Shipment Line],[Source Type],[Time of Action],[Inv Trans Type],[INV Delivered Qty],[Inv Line Seq],[Area],[Back Order Qty],[Ordered Qty],[SO Order Status],[SO Order Status Desc],[Source Company],[DWH Load Time],[site],[Delivered Value],[Ship Constraint Orig Desc],
	[Ship Constraint Desc],[Delivery Duration Days],[Delivery Days against Plan],[Delivery Days against Cust Req],[Late To Plan Flag],
	[Late To Cust Req Flag],[Completed Delivery Flag],[On-Going Delivery Flag],[Late Orders Flag],[On-Time Flag],[SO Aval In Invoice Table Flag],
	[NetLineAmt Dom Prop],[INV Delivered Qty Prop],[SO Invoiced Flag],[Pending Qty for Delivery],[Shipped but not Invoiced],
	[Requested Duration Days],[Items Type],[OTD Plan Deliv Date Flag],[OTD Orig Prom Deliv Date Flag],[OTD Cust Req Deliv Date Flag],
	[Delivery Days against Orig Prom],[Late To Init Req Flag],[Late To Orig Deliv Flag])
    Select [Line Disc Amt],[SO Blocked],[Canceled],[Contract],[Cust Order],[Change Reason],[BackOrd UoM],[Warehouse],[Plnd Deliv Date],[Init Req Date],[Cust Req Date],[Orig Deliv Date],[Delivery Date],[SO Order Date],[Sales Lines],[Plnd Receipt Date],[Price],[SO Delivered Qty],[Original Ordered Qty],[Exch Rate Type],[Ship Constraint],[Supply-from Whs],[So Shipment],[Line Sequence],[Ship-to Whs],[Ext Sales Rep],[Return Reason],[Sales Ord Type],[Reference A],[Sales Price List],[Plan Deliv Date],[Installments],[Cost Serv Cont],[Cost FCO],[Cost SO Inv],[Activity Line],[Cost Goodwill],[Act Unit Cost],[Cost Quote],[Actual Line],[Cost Warranty],[Actual Cum Qty],[Actual Del Tme],[Total Cost],[Ord Disc Amt],[Act Purch Amt],[Sales Serv Con],[Total Disc Amt],[Sales FCO],[Sales SO Inv],[Sales Goodwill],[Sales Amt Quote],[Total Sales Amt],[Sales Warranty],[MC Blocked],[Tax Classif],[Delivery Terms],[Discount Code],[Carrier],[Cost Line Stat],[Company number],[Contr Converage],[Sales Price Unit],[Sales Qty Unit],[Delivery Code],[SO Discount],[Delivery Type],[Est Unit Cost],[Service Est Qty],[Service Est Cost Line],[Est Sales Price],[Items],[MC Residual Value],[Discount Amt],[Other Lines],[Service Order],[Activity],[Material or Maintenance Items],[Price Origin],[Sales Price],[PoTP],[Required Qty],[Cost Repair War],[Sales Repair War],[Repair Warranty],[Ship Matl To],[Line of Business],[Payment Terms],[Sales Rep],[Financial Dept],[Invoice-to Addr],[Invoice-to BP],[Sold-to Address],[Sold-to BP],[Payment Method],[Rate Type],[SvcO Cost Sheet],[Act Order Amt],[SOC Cancel Date],[Coverage Type],[Currency],[Serv Contract],[Service Type],[Service Office],[Est Order Amt],[Pricing Method],[Plan Start Time],[Warranty Type],[Act Cost Rate],[Labor Type Cost],[Labor Rate Code],[Task],[Service Discount],[Est Cost rate],[Labor Est Qty],[Sales Inv Amt],[Sales Inv Date],[Labor Type Sales],[Service Warranty],[Cost Amt War],[Actual Qty],[Cost Type],[Unit],[Est Cost Line Id],[Other Costs Items],[Act Receipt Time],[Maint SO],[Planned Carrier 1],[Item Delivery],[MO Delivered Qty],[Delivery Whse],[MO Line Status],[Order Discount],[Non SO Plan Deliv Date],[Plan Rec Time],[Qty],[Actual Carrier],[Planned Carrier 2],[Received Qty],[Shipment],[Receipt Whse],[Ship-to Address],[Ship-to BP],[Sales Type],[Work Order Num],[MO Warranty],[Desc],[Installment Plan],[MO Order Date],[MO Order Status],[Amt Dom Curr],[Net Amt],[Tax Code],[Manual Sales ID],[Manual Lines],[Financial Comp],[Tax Amt Dom],[Department],[Approved Amt],[Approval Action],[Approved By],[Approval Desci],[Approval Date],[Approval Percent],[Claim],[Claimed Amt],[Claim Method],[Appr Qty Unit],[Claim Qty Unit],[CC Residual Value],[Sales Doc Line],[Sales Doc Seq],[Approved Qty],[Claimed Qty],[Reject Action],[Rejected By],[Rejection Date],[Reject Reasons],[Return Matl Req],[CC Line Status],[Tagged To],[Wait Supp Claim],[CC Cancel Date],[Creation Date],[Failure Date],[Int Sales Rep],[Sales Inv Comp],[Sales Doc Num],[Sales Doc Type],[Sales Ref Sys],[Created By],[Order Number],[Order Line Numb],[Table Desc],[Table Shortcode],[Remain Order Qty],[Order Value Due],[NetLineAmt Dom],[Delivery Note],[Invoice Number],[Produc Relation],[Shipment Line],[Source Type],[Time of Action],[Inv Trans Type],[INV Delivered Qty],[Inv Line Seq],[Area],[Back Order Qty],[Ordered Qty],[SO Order Status],[SO Order Status Desc],[Source Company],[DWH Load Time],[site],[Delivered Value],
	[Ship Constraint Orig Desc],[Ship Constraint Desc],[Delivery Duration Days],[Delivery Days against Plan],[Delivery Days against Cust Req],
	[Late To Plan Flag],[Late To Cust Req Flag],[Completed Delivery Flag],[On-Going Delivery Flag],[Late Orders Flag],[On-Time Flag],
	'N' As [SO Aval In Invoice Table Flag],0 As [NetLineAmt Dom Prop],0 As [INV Delivered Qty Prop],'N' As [SO Invoiced Flag],
	0 As [Pending Qty for Delivery],0 As [Shipped but not Invoiced],[Requested Duration Days],[Items Type],[OTD Plan Deliv Date Flag],
	[OTD Orig Prom Deliv Date Flag],[OTD Cust Req Deliv Date Flag],[Delivery Days against Orig Prom],[Late To Init Req Flag],
	[Late To Orig Deliv Flag]
	From [replncss].[fct Sales Revenue]
	Where  [table shortcode]  NOT IN ('SO');

	Insert into [replncss].[temp_fct_Sales_Revenue_cube]
	([Line Disc Amt],[SO Blocked],[Canceled],[Contract],[Cust Order],[Change Reason],[BackOrd UoM],[Warehouse],[Plnd Deliv Date],[Init Req Date],[Cust Req Date],[Orig Deliv Date],[Delivery Date],[SO Order Date],[Sales Lines],[Plnd Receipt Date],[Price],[SO Delivered Qty],[Original Ordered Qty],[Exch Rate Type],[Ship Constraint],[Supply-from Whs],[So Shipment],[Line Sequence],[Ship-to Whs],[Ext Sales Rep],[Return Reason],[Sales Ord Type],[Reference A],[Sales Price List],[Plan Deliv Date],[Installments],[Cost Serv Cont],[Cost FCO],[Cost SO Inv],[Activity Line],[Cost Goodwill],[Act Unit Cost],[Cost Quote],[Actual Line],[Cost Warranty],[Actual Cum Qty],[Actual Del Tme],[Total Cost],[Ord Disc Amt],[Act Purch Amt],[Sales Serv Con],[Total Disc Amt],[Sales FCO],[Sales SO Inv],[Sales Goodwill],[Sales Amt Quote],[Total Sales Amt],[Sales Warranty],[MC Blocked],[Tax Classif],[Delivery Terms],[Discount Code],[Carrier],[Cost Line Stat],[Company number],[Contr Converage],[Sales Price Unit],[Sales Qty Unit],[Delivery Code],[SO Discount],[Delivery Type],[Est Unit Cost],[Service Est Qty],[Service Est Cost Line],[Est Sales Price],[Items],[MC Residual Value],[Discount Amt],[Other Lines],[Service Order],[Activity],[Material or Maintenance Items],[Price Origin],[Sales Price],[PoTP],[Required Qty],[Cost Repair War],[Sales Repair War],[Repair Warranty],[Ship Matl To],[Line of Business],[Payment Terms],[Sales Rep],[Financial Dept],[Invoice-to Addr],[Invoice-to BP],[Sold-to Address],[Sold-to BP],[Payment Method],[Rate Type],[SvcO Cost Sheet],[Act Order Amt],[SOC Cancel Date],[Coverage Type],[Currency],[Serv Contract],[Service Type],[Service Office],[Est Order Amt],[Pricing Method],[Plan Start Time],[Warranty Type],[Act Cost Rate],[Labor Type Cost],[Labor Rate Code],[Task],[Service Discount],[Est Cost rate],[Labor Est Qty],[Sales Inv Amt],[Sales Inv Date],[Labor Type Sales],[Service Warranty],[Cost Amt War],[Actual Qty],[Cost Type],[Unit],[Est Cost Line Id],[Other Costs Items],[Act Receipt Time],[Maint SO],[Planned Carrier 1],[Item Delivery],[MO Delivered Qty],[Delivery Whse],[MO Line Status],[Order Discount],[Non SO Plan Deliv Date],[Plan Rec Time],[Qty],[Actual Carrier],[Planned Carrier 2],[Received Qty],[Shipment],[Receipt Whse],[Ship-to Address],[Ship-to BP],[Sales Type],[Work Order Num],[MO Warranty],[Desc],[Installment Plan],[MO Order Date],[MO Order Status],[Amt Dom Curr],[Net Amt],[Tax Code],[Manual Sales ID],[Manual Lines],[Financial Comp],[Tax Amt Dom],[Department],[Approved Amt],[Approval Action],[Approved By],[Approval Desci],[Approval Date],[Approval Percent],[Claim],[Claimed Amt],[Claim Method],[Appr Qty Unit],[Claim Qty Unit],[CC Residual Value],[Sales Doc Line],[Sales Doc Seq],[Approved Qty],[Claimed Qty],[Reject Action],[Rejected By],[Rejection Date],[Reject Reasons],[Return Matl Req],[CC Line Status],[Tagged To],[Wait Supp Claim],[CC Cancel Date],[Creation Date],[Failure Date],[Int Sales Rep],[Sales Inv Comp],[Sales Doc Num],[Sales Doc Type],[Sales Ref Sys],[Created By],[Order Number],[Order Line Numb],[Table Desc],[Table Shortcode],[Remain Order Qty],[Order Value Due],[NetLineAmt Dom],[Delivery Note],[Invoice Number],[Produc Relation],[Shipment Line],[Source Type],[Time of Action],[Inv Trans Type],[INV Delivered Qty],[Inv Line Seq],[Area],[Back Order Qty],[Ordered Qty],[SO Order Status],[SO Order Status Desc],[Source Company],[DWH Load Time],[site],[Delivered Value],[Ship Constraint Orig Desc],
	[Ship Constraint Desc],[Delivery Duration Days],[Delivery Days against Plan],[Delivery Days against Cust Req],[Late To Plan Flag],[Late To Cust Req Flag],[Completed Delivery Flag],[On-Going Delivery Flag],[Late Orders Flag],[On-Time Flag],[SO Aval In Invoice Table Flag],[NetLineAmt Dom Prop],[INV Delivered Qty Prop],[SO Invoiced Flag],[Pending Qty for Delivery],[Shipped but not Invoiced],[Requested Duration Days],[Items Type],
	[OTD Plan Deliv Date Flag],[OTD Orig Prom Deliv Date Flag],[OTD Cust Req Deliv Date Flag],
	[Delivery Days against Orig Prom],[Late To Init Req Flag],[Late To Orig Deliv Flag])
	Select [Line Disc Amt],[SO Blocked],[Canceled],[Contract],[Cust Order],[Change Reason],[BackOrd UoM],[Warehouse],[Plnd Deliv Date],[Init Req Date],[Cust Req Date],[Orig Deliv Date],[Delivery Date],[SO Order Date],[Sales Lines],[Plnd Receipt Date],[Price],[SO Delivered Qty],[Original Ordered Qty],[Exch Rate Type],[Ship Constraint],[Supply-from Whs],[So Shipment],[Line Sequence],[Ship-to Whs],[Ext Sales Rep],[Return Reason],[Sales Ord Type],[Reference A],[Sales Price List],[Plan Deliv Date],[Installments],[Cost Serv Cont],[Cost FCO],[Cost SO Inv],[Activity Line],[Cost Goodwill],[Act Unit Cost],[Cost Quote],[Actual Line],[Cost Warranty],[Actual Cum Qty],[Actual Del Tme],[Total Cost],[Ord Disc Amt],[Act Purch Amt],[Sales Serv Con],[Total Disc Amt],[Sales FCO],[Sales SO Inv],[Sales Goodwill],[Sales Amt Quote],[Total Sales Amt],[Sales Warranty],[MC Blocked],[Tax Classif],[Delivery Terms],[Discount Code],[Carrier],[Cost Line Stat],[Company number],[Contr Converage],[Sales Price Unit],[Sales Qty Unit],[Delivery Code],[SO Discount],[Delivery Type],[Est Unit Cost],[Service Est Qty],[Service Est Cost Line],[Est Sales Price],[Items],[MC Residual Value],[Discount Amt],[Other Lines],[Service Order],[Activity],[Material or Maintenance Items],[Price Origin],[Sales Price],[PoTP],[Required Qty],[Cost Repair War],[Sales Repair War],[Repair Warranty],[Ship Matl To],[Line of Business],[Payment Terms],[Sales Rep],[Financial Dept],[Invoice-to Addr],[Invoice-to BP],[Sold-to Address],[Sold-to BP],[Payment Method],[Rate Type],[SvcO Cost Sheet],[Act Order Amt],[SOC Cancel Date],[Coverage Type],[Currency],[Serv Contract],[Service Type],[Service Office],[Est Order Amt],[Pricing Method],[Plan Start Time],[Warranty Type],[Act Cost Rate],[Labor Type Cost],[Labor Rate Code],[Task],[Service Discount],[Est Cost rate],[Labor Est Qty],[Sales Inv Amt],[Sales Inv Date],[Labor Type Sales],[Service Warranty],[Cost Amt War],[Actual Qty],[Cost Type],[Unit],[Est Cost Line Id],[Other Costs Items],[Act Receipt Time],[Maint SO],[Planned Carrier 1],[Item Delivery],[MO Delivered Qty],[Delivery Whse],[MO Line Status],[Order Discount],[Non SO Plan Deliv Date],[Plan Rec Time],[Qty],[Actual Carrier],[Planned Carrier 2],[Received Qty],[Shipment],[Receipt Whse],[Ship-to Address],[Ship-to BP],[Sales Type],[Work Order Num],[MO Warranty],[Desc],[Installment Plan],[MO Order Date],[MO Order Status],[Amt Dom Curr],[Net Amt],[Tax Code],[Manual Sales ID],[Manual Lines],[Financial Comp],[Tax Amt Dom],[Department],[Approved Amt],[Approval Action],[Approved By],[Approval Desci],[Approval Date],[Approval Percent],[Claim],[Claimed Amt],[Claim Method],[Appr Qty Unit],[Claim Qty Unit],[CC Residual Value],[Sales Doc Line],[Sales Doc Seq],[Approved Qty],[Claimed Qty],[Reject Action],[Rejected By],[Rejection Date],[Reject Reasons],[Return Matl Req],[CC Line Status],[Tagged To],[Wait Supp Claim],[CC Cancel Date],[Creation Date],[Failure Date],[Int Sales Rep],[Sales Inv Comp],[Sales Doc Num],[Sales Doc Type],[Sales Ref Sys],[Created By],[Order Number],[Order Line Numb],[Table Desc],[Table Shortcode],[Remain Order Qty],[Order Value Due],[NetLineAmt Dom],[Delivery Note],[Invoice Number],[Produc Relation],[Shipment Line],[Source Type],[Time of Action],[Inv Trans Type],[INV Delivered Qty],[Inv Line Seq],[Area],[Back Order Qty],[Ordered Qty],[SO Order Status],[SO Order Status Desc],[Source Company],[DWH Load Time],[site],[Delivered Value],
	[Ship Constraint Orig Desc],[Ship Constraint Desc],[Delivery Duration Days],[Delivery Days against Plan],[Delivery Days against Cust Req],[Late To Plan Flag],[Late To Cust Req Flag],[Completed Delivery Flag],[On-Going Delivery Flag],[Late Orders Flag],[On-Time Flag],
	[SO Aval In Invoice Table Flag],[NetLineAmt Dom Prop],[INV Delivered Qty Prop],
	Case When [SO Aval In Invoice Table Flag] = 'Y' And (Cast([SO Delivered Qty] As Decimal(38,3)) - Cast([INV Delivered Qty Prop] As Decimal(38,3))) = 0 Then 'F'
		When [SO Aval In Invoice Table Flag] = 'Y' And (Cast([SO Delivered Qty] As Decimal(38,3)) - Cast([INV Delivered Qty Prop] As Decimal(38,3))) > 0 Then 'P'
		Else 'N' End As [SO Invoiced Flag],
		(Cast([SO Delivered Qty] As Decimal(38,3)) - Cast([INV Delivered Qty Prop] As Decimal(38,3))) As [Pending Qty for Delivery],
		Case When (Cast([Delivered Value] as Decimal(38,3)) - Cast([NetLineAmt Dom Prop] As Decimal(38,3))) > 0 Then (Cast([Delivered Value] as Decimal(38,3)) - Cast([NetLineAmt Dom Prop] As Decimal(38,3))) Else 0 End As [Shipped but not Invoiced],[Requested Duration Days],
		[Items Type],[OTD Plan Deliv Date Flag],[OTD Orig Prom Deliv Date Flag],[OTD Cust Req Deliv Date Flag],
		[Delivery Days against Orig Prom],[Late To Init Req Flag],[Late To Orig Deliv Flag]
	From (
    Select A.[Line Disc Amt],A.[SO Blocked],A.[Canceled],A.[Contract],A.[Cust Order],A.[Change Reason],A.[BackOrd UoM],A.[Warehouse],A.[Plnd Deliv Date],A.[Init Req Date],A.[Cust Req Date],A.[Orig Deliv Date],A.[Delivery Date],A.[SO Order Date],A.[Sales Lines],A.[Plnd Receipt Date],A.[Price],A.[SO Delivered Qty],A.[Original Ordered Qty],A.[Exch Rate Type],A.[Ship Constraint],A.[Supply-from Whs],A.[So Shipment],A.[Line Sequence],A.[Ship-to Whs],A.[Ext Sales Rep],A.[Return Reason],A.[Sales Ord Type],A.[Reference A],A.[Sales Price List],A.[Plan Deliv Date],A.[Installments],
	A.[Cost Serv Cont],A.[Cost FCO],A.[Cost SO Inv],A.[Activity Line],A.[Cost Goodwill],A.[Act Unit Cost],A.[Cost Quote],A.[Actual Line],
	A.[Cost Warranty],A.[Actual Cum Qty],A.[Actual Del Tme],A.[Total Cost],A.[Ord Disc Amt],A.[Act Purch Amt],A.[Sales Serv Con],A.[Total Disc Amt],
	A.[Sales FCO],A.[Sales SO Inv],A.[Sales Goodwill],A.[Sales Amt Quote],A.[Total Sales Amt],A.[Sales Warranty],A.[MC Blocked],A.[Tax Classif],
	A.[Delivery Terms],A.[Discount Code],A.[Carrier],A.[Cost Line Stat],A.[Company number],A.[Contr Converage],A.[Sales Price Unit],
	A.[Sales Qty Unit],A.[Delivery Code],A.[SO Discount],A.[Delivery Type],A.[Est Unit Cost],A.[Service Est Qty],A.[Service Est Cost Line],
	A.[Est Sales Price],A.[Items],A.[MC Residual Value],A.[Discount Amt],A.[Other Lines],A.[Service Order],A.[Activity],
	A.[Material or Maintenance Items],A.[Price Origin],A.[Sales Price],A.[PoTP],A.[Required Qty],A.[Cost Repair War],A.[Sales Repair War],
	A.[Repair Warranty],A.[Ship Matl To],A.[Line of Business],A.[Payment Terms],A.[Sales Rep],A.[Financial Dept],A.[Invoice-to Addr],
	A.[Invoice-to BP],A.[Sold-to Address],A.[Sold-to BP],A.[Payment Method],A.[Rate Type],A.[SvcO Cost Sheet],A.[Act Order Amt],A.[SOC Cancel Date],
	A.[Coverage Type],A.[Currency],A.[Serv Contract],A.[Service Type],A.[Service Office],A.[Est Order Amt],A.[Pricing Method],A.[Plan Start Time],
	A.[Warranty Type],A.[Act Cost Rate],A.[Labor Type Cost],A.[Labor Rate Code],A.[Task],A.[Service Discount],A.[Est Cost rate],A.[Labor Est Qty],
	A.[Sales Inv Amt],A.[Sales Inv Date],A.[Labor Type Sales],A.[Service Warranty],A.[Cost Amt War],A.[Actual Qty],A.[Cost Type],A.[Unit],
	A.[Est Cost Line Id],A.[Other Costs Items],A.[Act Receipt Time],A.[Maint SO],A.[Planned Carrier 1],A.[Item Delivery],A.[MO Delivered Qty],
	A.[Delivery Whse],A.[MO Line Status],A.[Order Discount],A.[Non SO Plan Deliv Date],A.[Plan Rec Time],A.[Qty],A.[Actual Carrier],
	A.[Planned Carrier 2],A.[Received Qty],A.[Shipment],A.[Receipt Whse],A.[Ship-to Address],A.[Ship-to BP],A.[Sales Type],A.[Work Order Num],
	A.[MO Warranty],A.[Desc],A.[Installment Plan],A.[MO Order Date],A.[MO Order Status],A.[Amt Dom Curr],A.[Net Amt],A.[Tax Code],
	A.[Manual Sales ID],A.[Manual Lines],A.[Financial Comp],A.[Tax Amt Dom],A.[Department],A.[Approved Amt],A.[Approval Action],A.[Approved By],
	A.[Approval Desci],A.[Approval Date],A.[Approval Percent],A.[Claim],A.[Claimed Amt],A.[Claim Method],A.[Appr Qty Unit],A.[Claim Qty Unit],
	A.[CC Residual Value],A.[Sales Doc Line],A.[Sales Doc Seq],A.[Approved Qty],A.[Claimed Qty],A.[Reject Action],A.[Rejected By],A.[Rejection Date],A.[Reject Reasons],A.[Return Matl Req],A.[CC Line Status],A.[Tagged To],A.[Wait Supp Claim],A.[CC Cancel Date],A.[Creation Date],
	A.[Failure Date],A.[Int Sales Rep],A.[Sales Inv Comp],A.[Sales Doc Num],A.[Sales Doc Type],A.[Sales Ref Sys],A.[Created By],A.[Order Number],
	A.[Order Line Numb],A.[Table Desc],A.[Table Shortcode],A.[Remain Order Qty],A.[Order Value Due],A.[NetLineAmt Dom],A.[Delivery Note],
	A.[Invoice Number],A.[Produc Relation],A.[Shipment Line],A.[Source Type],A.[Time of Action],A.[Inv Trans Type],A.[INV Delivered Qty],
	A.[Inv Line Seq],A.[Area],A.[Back Order Qty],A.[Ordered Qty],A.[SO Order Status],A.[SO Order Status Desc],A.[Source Company],A.[DWH Load Time],
	A.[site],A.[Delivered Value],A.[Ship Constraint Orig Desc],
	A.[Ship Constraint Desc],A.[Delivery Duration Days],A.[Delivery Days against Plan],A.[Delivery Days against Cust Req],A.[Late To Plan Flag],
	A.[Late To Cust Req Flag],A.[Completed Delivery Flag],A.[On-Going Delivery Flag],A.[Late Orders Flag],A.[On-Time Flag],
	Isnull(B.[Inv Flag],'N') As [SO Aval In Invoice Table Flag],
	Case When Isnull(C.[Original Ordered Qty],0) = 0 Then 0 Else (Isnull(B.[NetLineAmt Dom],0) * Isnull(A.[Ordered Qty],0)) / C.[Original Ordered Qty] End As [NetLineAmt Dom Prop],
	Case When Isnull(C.[Original Ordered Qty],0) = 0 Then 0 Else (Isnull(B.[INV Delivered Qty],0) * Isnull(A.[Ordered Qty],0)) / C.[Original Ordered Qty] End As [INV Delivered Qty Prop],A.[Requested Duration Days],A.[Items Type],A.[OTD Plan Deliv Date Flag],A.[OTD Orig Prom Deliv Date Flag],
	A.[OTD Cust Req Deliv Date Flag],A.[Delivery Days against Orig Prom],A.[Late To Init Req Flag],A.[Late To Orig Deliv Flag]
	From [replncss].[fct Sales Revenue] A
	Left Join (Select [Order Number],[Sales Lines],Sum([NetLineAmt Dom]) As [NetLineAmt Dom],
	Sum([INV Delivered Qty]) As [INV Delivered Qty],'Y' As [Inv Flag]
	From   [replncss].[fct Sales Revenue]
	Where  [table shortcode] = 'IL'
	Group by [Order Number],[Sales Lines]) B
	On A.[Order Number] = B.[Order Number] And A.[Sales Lines] = B.[Sales Lines]
	Left Join (Select [Order Number],[Sales Lines],[Order Line Numb],[Original Ordered Qty]
	From   [replncss].[fct Sales Revenue]
	Where  [table shortcode] = 'SO' And [Line Sequence] = 0) C
	On A.[Order Number] = C.[Order Number] And A.[Sales Lines] = C.[Sales Lines]
	Where  A.[table shortcode]  IN ('SO')
	) A;
	
	
	Delete [replncss].[fct Sales Revenue Cube];
	
	Insert into [replncss].[fct Sales Revenue Cube] ([Line Disc Amt],[SO Blocked],[Canceled],[Contract],[Cust Order],[Change Reason],[BackOrd UoM],
	[Warehouse],[Plnd Deliv Date],[Init Req Date],[Cust Req Date],[Orig Deliv Date],[Delivery Date],[SO Order Date],[Sales Lines],
	[Plnd Receipt Date],[Price],[SO Delivered Qty],[Ordered Qty],[Exch Rate Type],[Ship Constraint],[Supply-from Whs],[So Shipment],[Line Sequence],
	[Ship-to Whs],[Ext Sales Rep],[Return Reason],[Sales Ord Type],[Reference A],[Sales Price List],[Plan Deliv Date],[Installments],
	[Cost Serv Cont],[Cost FCO],[Cost SO Inv],[Activity Line],[Cost Goodwill],[Act Unit Cost],[Cost Quote],[Actual Line],[Cost Warranty],
	[Actual Cum Qty],[Actual Del Tme],[Total Cost],[Ord Disc Amt],[Act Purch Amt],[Sales Serv Con],[Total Disc Amt],[Sales FCO],[Sales SO Inv],
	[Sales Goodwill],[Sales Amt Quote],[Total Sales Amt],[Sales Warranty],[MC Blocked],[Tax Classif],[Delivery Terms],[Discount Code],[Carrier],
	[Cost Line Stat],[Company number],[Contr Converage],[Sales Price Unit],[Sales Qty Unit],[Delivery Code],[SO Discount],[Delivery Type],
	[Est Unit Cost],[Service Est Qty],[Service Est Cost Line],[Est Sales Price],[Items],[MC Residual Value],[Discount Amt],[Other Lines],
	[Service Order],[Activity],[Material or Maintenance Items],[Price Origin],[Sales Price],[PoTP],[Required Qty],[Cost Repair War],
	[Sales Repair War],[Repair Warranty],[Ship Matl To],[Line of Business],[Payment Terms],[Sales Rep],[Financial Dept],[Invoice-to Addr],
	[Invoice-to BP],[Sold-to Address],[Sold-to BP],[Payment Method],[Rate Type],[SvcO Cost Sheet],[Act Order Amt],[SOC Cancel Date],[Coverage Type],
	[Currency],[Serv Contract],[Service Type],[Service Office],[Est Order Amt],[Pricing Method],[Plan Start Time],[Warranty Type],[Act Cost Rate],
	[Labor Type Cost],[Labor Rate Code],[Task],[Service Discount],[Est Cost rate],[Labor Est Qty],[Sales Inv Amt],[Sales Inv Date],
	[Labor Type Sales],[Service Warranty],[Cost Amt War],[Actual Qty],[Cost Type],[Unit],[Est Cost Line Id],[Other Costs Items],[Act Receipt Time],
	[Maint SO],[Planned Carrier 1],[Item Delivery],[MO Delivered Qty],[Delivery Whse],[MO Line Status],[Order Discount],[Non SO Plan Deliv Date],
	[Plan Rec Time],[Qty],[Actual Carrier],[Planned Carrier 2],[Received Qty],[Shipment],[Receipt Whse],[Ship-to Address],[Ship-to BP],[Sales Type],
	[Work Order Num],[MO Warranty],[Desc],[Installment Plan],[MO Order Date],[MO Order Status],[Amt Dom Curr],[Net Amt],[Tax Code],
	[Manual Sales ID],[Manual Lines],[Financial Comp],[Tax Amt Dom],[Department],[Approved Amt],[Approval Action],[Approved By],[Approval Desci],
	[Approval Date],[Approval Percent],[Claim],[Claimed Amt],[Claim Method],[Appr Qty Unit],[Claim Qty Unit],[CC Residual Value],[Sales Doc Line],
	[Sales Doc Seq],[Approved Qty],[Claimed Qty],[Reject Action],[Rejected By],[Rejection Date],[Reject Reasons],[Return Matl Req],[CC Line Status],
	[Tagged To],[Wait Supp Claim],[CC Cancel Date],[Creation Date],[Failure Date],[Int Sales Rep],[Sales Inv Comp],[Sales Doc Num],[Sales Doc Type],
	[Sales Ref Sys],[Created by],[Order Number],[Order Line Numb],[Table Desc],[Table Shortcode],[Remain Order Qty],[Order Value Due],
	[NetLineAmt Dom],[Delivery Note],[Invoice Number],[Produc Relation],[Shipment Line],[Source Type],[Time of Action],[Inv Trans Type],
	[INV Delivered Qty],[Inv Line Seq],[Area],[Carrier/LSP Desc],[Deleted Record],[Carrier Alpha Code],[Buy-from Business Partner],
	[Transport Category],[Transport Category Desc],[Change Reason Desc],[Last Inventory Transaction Date],[Inventory Allocated],[Inventory Blocked],
	[Inventory Blocked for Planning],[Consignment Inventory Location Allocated],[Consignment Inventory on Hand],[Cumulative Issue],
	[Consignment Inventory in Transit],[Inventory Committed],[Consignment on Order],[Inventory Committed in Process],[Consigned Quarantine],
	[Goods in Transit],[Historical Balance],[Inventory on Hand],[Company Owned Quarantine Inventory],[Inventory in Transit],
	[Inventory Location Allocated],[Cust Owned Location Allocated],[Cust Owned Blocked],[Cust Owned Blocked for Planning],[Cust Owned on Hand],
	[Cust Owned in Transit],[Cust Owned on Order],[Cust Owned Quarantine],[Comp Owned Location Allocated],[Comp Owned on Order],
	[Inventory on Order],[Items Desc],[Item Group],[Product Class],[Product Line],[Item Signal],[Country of Origin],[Product Type],[Inventory Unit],
	[Serialized],[Default Supply Source],[Line of Business Desc],[Sales Office Desc],[Site],[Sales Order Type Desc],[Ship-to Address Code],
	[Ship-to Country],[Ship-to Country Name],[Ship-to BP Name],[Sold-to Address Code],[Sold-to Country],[Sold-to Country Name],[Sold-to BP Name],
	[Tax Classification Desc],[Max W/Tax %],[SCT Allowed],[SCT Allowed Falg],[WIT Allowed],[WIT Allowed Flag],[Warehouse Desc],
	[Warehouse Address Code],[Financial Company],[Enterprise unit of Wh],[Inventory Mgt Business Partner],[External Site],[External Site Flag],
	[Delivery Duration Days],[Delivery Days against Plan],[Delivery Days against Cust Req],[Late To Plan Flag],[Late To Cust Req Flag],
	[Completed Delivery Flag],[On-Going Delivery Flag],[Late Orders Flag],[Product Line Levels],[Product Line First Level],
	[Product Line Second Level],[Product Line Third Level],[Department Desc],[Department Site],[Department Type Key],[Department Type],
	[Ship-to Region],[Ship-to Sub Region],[Sold-to Region],[Sold-to Sub Region],[Back Order Qty],[Original Ordered Qty],[SO Order Status],
	[SO Order Status Desc],[On-Time Flag],
	[Ship-to State/Province],[Ship-to City Name],[Sold-to State/Province],[Sold-to City Name],[Default Supply Source By Site],
	[Default Supply Source By Site Desc],[Delivered Value],[SO Aval In Invoice Table Flag],[NetLineAmt Dom Prop],[INV Delivered Qty Prop],
	[SO Invoiced Flag],[Pending Qty for Delivery],[Shipped but not Invoiced],[DWH Load Time],[Reporting Date],
	[Blocked for Inbound],[Blocked for Inbound Desc],[Blocked for Outbound],[Blocked for Outbound  Desc],
	[Ship-to Address Desc],[Sold-to Address Desc],[Ship-to Latitude],[Ship-to Longitude],[Sold-to Latitude],[Sold-to Longitude],
	[Ship Constraint Desc],[Requested Duration Days],[Items Type],[OTD Plan Deliv Date Flag],[OTD Orig Prom Deliv Date Flag],
	[OTD Cust Req Deliv Date Flag],[Delivery Days against Orig Prom],[Late To Init Req Flag],[Late To Orig Deliv Flag])
	Select src_tbl.[Line Disc Amt],src_tbl.[SO Blocked],src_tbl.[Canceled],src_tbl.[Contract],src_tbl.[Cust Order],src_tbl.[Change Reason],
	src_tbl.[BackOrd UoM],src_tbl.[Warehouse],src_tbl.[Plnd Deliv Date],src_tbl.[Init Req Date],src_tbl.[Cust Req Date],src_tbl.[Orig Deliv Date],src_tbl.[Delivery Date],src_tbl.[SO Order Date],src_tbl.[Sales Lines],src_tbl.[Plnd Receipt Date],src_tbl.[Price],src_tbl.[SO Delivered Qty],src_tbl.[Ordered Qty],src_tbl.[Exch Rate Type],src_tbl.[Ship Constraint],src_tbl.[Supply-from Whs],src_tbl.[So Shipment],src_tbl.[Line Sequence],src_tbl.[Ship-to Whs],src_tbl.[Ext Sales Rep],src_tbl.[Return Reason],src_tbl.[Sales Ord Type],src_tbl.[Reference A],src_tbl.[Sales Price List],src_tbl.[Plan Deliv Date],src_tbl.[Installments],src_tbl.[Cost Serv Cont],src_tbl.[Cost FCO],src_tbl.[Cost SO Inv],src_tbl.[Activity Line],src_tbl.[Cost Goodwill],src_tbl.[Act Unit Cost],src_tbl.[Cost Quote],src_tbl.[Actual Line],src_tbl.[Cost Warranty],src_tbl.[Actual Cum Qty],src_tbl.[Actual Del Tme],src_tbl.[Total Cost],src_tbl.[Ord Disc Amt],src_tbl.[Act Purch Amt],src_tbl.[Sales Serv Con],src_tbl.[Total Disc Amt],src_tbl.[Sales FCO],src_tbl.[Sales SO Inv],src_tbl.[Sales Goodwill],src_tbl.[Sales Amt Quote],src_tbl.[Total Sales Amt],src_tbl.[Sales Warranty],src_tbl.[MC Blocked],src_tbl.[Tax Classif],src_tbl.[Delivery Terms],src_tbl.[Discount Code],src_tbl.[Carrier],src_tbl.[Cost Line Stat],
	src_tbl.[Company number],src_tbl.[Contr Converage],src_tbl.[Sales Price Unit],src_tbl.[Sales Qty Unit],src_tbl.[Delivery Code],
	src_tbl.[SO Discount],src_tbl.[Delivery Type],src_tbl.[Est Unit Cost],src_tbl.[Service Est Qty],src_tbl.[Service Est Cost Line],
	src_tbl.[Est Sales Price],src_tbl.[Items],src_tbl.[MC Residual Value],src_tbl.[Discount Amt],src_tbl.[Other Lines],src_tbl.[Service Order],src_tbl.[Activity],src_tbl.[Material or Maintenance Items],src_tbl.[Price Origin],src_tbl.[Sales Price],src_tbl.[PoTP],src_tbl.[Required Qty],src_tbl.[Cost Repair War],src_tbl.[Sales Repair War],src_tbl.[Repair Warranty],src_tbl.[Ship Matl To],src_tbl.[Line of Business],
	src_tbl.[Payment Terms],src_tbl.[Sales Rep],src_tbl.[Financial Dept],src_tbl.[Invoice-to Addr],src_tbl.[Invoice-to BP],src_tbl.[Sold-to Address],src_tbl.[Sold-to BP],src_tbl.[Payment Method],src_tbl.[Rate Type],src_tbl.[SvcO Cost Sheet],src_tbl.[Act Order Amt],src_tbl.[SOC Cancel Date],src_tbl.[Coverage Type],src_tbl.[Currency],src_tbl.[Serv Contract],src_tbl.[Service Type],src_tbl.[Service Office],src_tbl.[Est Order Amt],src_tbl.[Pricing Method],src_tbl.[Plan Start Time],src_tbl.[Warranty Type],src_tbl.[Act Cost Rate],src_tbl.[Labor Type Cost],
	src_tbl.[Labor Rate Code],src_tbl.[Task],src_tbl.[Service Discount],src_tbl.[Est Cost rate],src_tbl.[Labor Est Qty],src_tbl.[Sales Inv Amt],src_tbl.[Sales Inv Date],src_tbl.[Labor Type Sales],src_tbl.[Service Warranty],src_tbl.[Cost Amt War],src_tbl.[Actual Qty],src_tbl.[Cost Type],src_tbl.[Unit],src_tbl.[Est Cost Line Id],src_tbl.[Other Costs Items],src_tbl.[Act Receipt Time],src_tbl.[Maint SO],src_tbl.[Planned Carrier 1],src_tbl.[Item Delivery],src_tbl.[MO Delivered Qty],src_tbl.[Delivery Whse],src_tbl.[MO Line Status],src_tbl.[Order Discount],
	src_tbl.[Non SO Plan Deliv Date],src_tbl.[Plan Rec Time],src_tbl.[Qty],src_tbl.[Actual Carrier],src_tbl.[Planned Carrier 2],
	src_tbl.[Received Qty],src_tbl.[Shipment],src_tbl.[Receipt Whse],src_tbl.[Ship-to Address],src_tbl.[Ship-to BP],src_tbl.[Sales Type],
	src_tbl.[Work Order Num],src_tbl.[MO Warranty],src_tbl.[Desc],src_tbl.[Installment Plan],src_tbl.[MO Order Date],src_tbl.[MO Order Status],src_tbl.[Amt Dom Curr],src_tbl.[Net Amt],src_tbl.[Tax Code],src_tbl.[Manual Sales ID],src_tbl.[Manual Lines],src_tbl.[Financial Comp],
	src_tbl.[Tax Amt Dom],src_tbl.[Department],src_tbl.[Approved Amt],src_tbl.[Approval Action],src_tbl.[Approved By],src_tbl.[Approval Desci],src_tbl.[Approval Date],src_tbl.[Approval Percent],src_tbl.[Claim],src_tbl.[Claimed Amt],src_tbl.[Claim Method],src_tbl.[Appr Qty Unit],
	src_tbl.[Claim Qty Unit],src_tbl.[CC Residual Value],src_tbl.[Sales Doc Line],src_tbl.[Sales Doc Seq],src_tbl.[Approved Qty],
	src_tbl.[Claimed Qty],src_tbl.[Reject Action],src_tbl.[Rejected By],src_tbl.[Rejection Date],src_tbl.[Reject Reasons],src_tbl.[Return Matl Req],src_tbl.[CC Line Status],src_tbl.[Tagged To],src_tbl.[Wait Supp Claim],src_tbl.[CC Cancel Date],src_tbl.[Creation Date],src_tbl.[Failure Date],src_tbl.[Int Sales Rep],src_tbl.[Sales Inv Comp],src_tbl.[Sales Doc Num],src_tbl.[Sales Doc Type],src_tbl.[Sales Ref Sys],src_tbl.[Created by],src_tbl.[Order Number],src_tbl.[Order Line Numb],src_tbl.[Table Desc],src_tbl.[Table Shortcode],src_tbl.[Remain Order Qty],
	src_tbl.[Order Value Due],src_tbl.[NetLineAmt Dom],src_tbl.[Delivery Note],src_tbl.[Invoice Number],src_tbl.[Produc Relation],
	src_tbl.[Shipment Line],src_tbl.[Source Type],src_tbl.[Time of Action],src_tbl.[Inv Trans Type],src_tbl.[INV Delivered Qty],
	src_tbl.[Inv Line Seq],src_tbl.[Area],src_tbl.[Carrier/LSP Desc],src_tbl.[Deleted Record],src_tbl.[Carrier Alpha Code],
	src_tbl.[Buy-from Business Partner],src_tbl.[Transport Category],src_tbl.[Transport Category Desc],src_tbl.[Change Reason Desc],
	src_tbl.[Last Inventory Transaction Date],src_tbl.[Inventory Allocated],src_tbl.[Inventory Blocked],src_tbl.[Inventory Blocked for Planning],src_tbl.[Consignment Inventory Location Allocated],src_tbl.[Consignment Inventory on Hand],src_tbl.[Cumulative Issue],
	src_tbl.[Consignment Inventory in Transit],src_tbl.[Inventory Committed],src_tbl.[Consignment on Order],src_tbl.[Inventory Committed in Process],src_tbl.[Consigned Quarantine],src_tbl.[Goods in Transit],src_tbl.[Historical Balance],src_tbl.[Inventory on Hand],
	src_tbl.[Company Owned Quarantine Inventory],src_tbl.[Inventory in Transit],src_tbl.[Inventory Location Allocated],
	src_tbl.[Cust Owned Location Allocated],src_tbl.[Cust Owned Blocked],src_tbl.[Cust Owned Blocked for Planning],src_tbl.[Cust Owned on Hand],src_tbl.[Cust Owned in Transit],src_tbl.[Cust Owned on Order],src_tbl.[Cust Owned Quarantine],src_tbl.[Comp Owned Location Allocated],
	src_tbl.[Comp Owned on Order],src_tbl.[Inventory on Order],src_tbl.[Items Desc],src_tbl.[Item Group],src_tbl.[Product Class],
	src_tbl.[Product Line],src_tbl.[Item Signal],src_tbl.[Country of Origin],src_tbl.[Product Type],src_tbl.[Inventory Unit],src_tbl.[Serialized],src_tbl.[Default Supply Source],src_tbl.[Line of Business Desc],src_tbl.[Sales Office Desc],src_tbl.[Site],src_tbl.[Sales Order Type Desc],src_tbl.[Ship-to Address Code],src_tbl.[Ship-to Country],src_tbl.[Ship-to Country Name],src_tbl.[Ship-to BP Name],src_tbl.[Sold-to Address Code],src_tbl.[Sold-to Country],src_tbl.[Sold-to Country Name],src_tbl.[Sold-to BP Name],src_tbl.[Tax Classification Desc],src_tbl.[Max W/Tax %],src_tbl.[SCT Allowed],src_tbl.[SCT Allowed Falg],src_tbl.[WIT Allowed],src_tbl.[WIT Allowed Flag],src_tbl.[Warehouse Desc],
	src_tbl.[Warehouse Address Code],src_tbl.[Financial Company],src_tbl.[Enterprise unit of Wh],src_tbl.[Inventory Mgt Business Partner],
	src_tbl.[External Site],src_tbl.[External Site Flag],src_tbl.[Delivery Duration Days],src_tbl.[Delivery Days against Plan],
	src_tbl.[Delivery Days against Cust Req],src_tbl.[Late To Plan Flag],src_tbl.[Late To Cust Req Flag],src_tbl.[Completed Delivery Flag],
	src_tbl.[On-Going Delivery Flag],src_tbl.[Late Orders Flag],src_tbl.[Product Line Levels],src_tbl.[Product Line First Level],
	src_tbl.[Product Line Second Level],src_tbl.[Product Line Third Level],src_tbl.[Department Desc],src_tbl.[Department Site],
	src_tbl.[Department Type Key],src_tbl.[Department Type],src_tbl.[Ship-to Region],src_tbl.[Ship-to Sub Region],src_tbl.[Sold-to Region],
	src_tbl.[Sold-to Sub Region],src_tbl.[Back Order Qty],src_tbl.[Original Ordered Qty],src_tbl.[SO Order Status],src_tbl.[SO Order Status Desc],src_tbl.[On-Time Flag],
	src_tbl.[Ship-to State/Province],src_tbl.[Ship-to City Name],src_tbl.[Sold-to State/Province],src_tbl.[Sold-to City Name],
	src_tbl.[Default Supply Source By Site],src_tbl.[Default Supply Source By Site Desc],src_tbl.[Delivered Value],
	src_tbl.[SO Aval In Invoice Table Flag],src_tbl.[NetLineAmt Dom Prop],src_tbl.[INV Delivered Qty Prop],src_tbl.[SO Invoiced Flag],
	src_tbl.[Pending Qty for Delivery],src_tbl.[Shipped but not Invoiced],src_tbl.[DWH Load Time],
	Case When src_tbl.[Table Shortcode] = 'IL' Then src_tbl.[Delivery Date] Else src_tbl.[Plan Deliv Date] End As [Reporting Date],
	src_tbl.[Blocked for Inbound],src_tbl.[Blocked for Inbound Desc],src_tbl.[Blocked for Outbound],src_tbl.[Blocked for Outbound Desc],
	src_tbl.[Ship-to Address Desc],src_tbl.[Sold-to Address Desc],
	src_tbl.[Ship-to Latitude],src_tbl.[Ship-to Longitude],src_tbl.[Sold-to Latitude],src_tbl.[Sold-to Longitude],src_tbl.[Ship Constraint Desc],
	src_tbl.[Requested Duration Days],src_tbl.[Items Type],src_tbl.[OTD Plan Deliv Date Flag],src_tbl.[OTD Orig Prom Deliv Date Flag],
	src_tbl.[OTD Cust Req Deliv Date Flag],src_tbl.[Delivery Days against Orig Prom],src_tbl.[Late To Init Req Flag],
	src_tbl.[Late To Orig Deliv Flag]
	From (SELECT A.[Line Disc Amt] AS [Line Disc Amt],
A.[SO Blocked] AS [SO Blocked],
A.[Canceled] AS [Canceled],
A.[Contract] AS [Contract],
A.[Cust Order] AS [Cust Order],
A.[Change Reason] AS [Change Reason],
A.[BackOrd UoM] AS [BackOrd UoM],
A.[Warehouse] AS [Warehouse],
A.[Plnd Deliv Date] AS [Plnd Deliv Date],
A.[Init Req Date] AS [Init Req Date],
A.[Cust Req Date] AS [Cust Req Date],
A.[Orig Deliv Date] AS [Orig Deliv Date],
A.[Delivery Date] AS [Delivery Date],
A.[SO Order Date] AS [SO Order Date],
A.[Sales Lines] AS [Sales Lines],
A.[Plnd Receipt Date] AS [Plnd Receipt Date],
A.[Price] AS [Price],
A.[SO Delivered Qty] AS [SO Delivered Qty],
A.[Original Ordered Qty] As [Original Ordered Qty],
A.[Exch Rate Type] AS [Exch Rate Type],
A.[Ship Constraint] AS [Ship Constraint],
A.[Supply-from Whs] AS [Supply-from Whs],
A.[So Shipment] AS [So Shipment],
A.[Line Sequence] AS [Line Sequence],
A.[Ship-to Whs] AS [Ship-to Whs],
A.[Ext Sales Rep] AS [Ext Sales Rep],
A.[Return Reason] AS [Return Reason],
A.[Sales Ord Type] AS [Sales Ord Type],
A.[Reference A] AS [Reference A],
A.[Sales Price List] AS [Sales Price List],
A.[Plan Deliv Date] AS [Plan Deliv Date],
A.[Installments] AS [Installments],
A.[Cost Serv Cont] AS [Cost Serv Cont],
A.[Cost FCO] AS [Cost FCO],
A.[Cost SO Inv] AS [Cost SO Inv],
A.[Activity Line] AS [Activity Line],
A.[Cost Goodwill] AS [Cost Goodwill],
A.[Act Unit Cost] AS [Act Unit Cost],
A.[Cost Quote] AS [Cost Quote],
A.[Actual Line] AS [Actual Line],
A.[Cost Warranty] AS [Cost Warranty],
A.[Actual Cum Qty] AS [Actual Cum Qty],
A.[Actual Del Tme] AS [Actual Del Tme],
A.[Total Cost] AS [Total Cost],
A.[Ord Disc Amt] AS [Ord Disc Amt],
A.[Act Purch Amt] AS [Act Purch Amt],
A.[Sales Serv Con] AS [Sales Serv Con],
A.[Total Disc Amt] AS [Total Disc Amt],
A.[Sales FCO] AS [Sales FCO],
A.[Sales SO Inv] AS [Sales SO Inv],
A.[Sales Goodwill] AS [Sales Goodwill],
A.[Sales Amt Quote] AS [Sales Amt Quote],
A.[Total Sales Amt] AS [Total Sales Amt],
A.[Sales Warranty] AS [Sales Warranty],
A.[MC Blocked] AS [MC Blocked],
A.[Tax Classif] AS [Tax Classif],
A.[Delivery Terms] AS [Delivery Terms],
A.[Discount Code] AS [Discount Code],
A.[Carrier] AS [Carrier],
A.[Cost Line Stat] AS [Cost Line Stat],
A.[Company number] AS [Company number],
A.[Contr Converage] AS [Contr Converage],
A.[Sales Price Unit] AS [Sales Price Unit],
A.[Sales Qty Unit] AS [Sales Qty Unit],
A.[Delivery Code] AS [Delivery Code],
A.[SO Discount] AS [SO Discount],
A.[Delivery Type] AS [Delivery Type],
A.[Est Unit Cost] AS [Est Unit Cost],
A.[Service Est Qty] AS [Service Est Qty],
A.[Service Est Cost Line] AS [Service Est Cost Line],
A.[Est Sales Price] AS [Est Sales Price],
Trim(A.[Items]) AS [Items],
A.[MC Residual Value] AS [MC Residual Value],
A.[Discount Amt] AS [Discount Amt],
A.[Other Lines] AS [Other Lines],
A.[Service Order] AS [Service Order],
A.[Activity] AS [Activity],
A.[Material or Maintenance Items] AS [Material or Maintenance Items],
A.[Price Origin] AS [Price Origin],
A.[Sales Price] AS [Sales Price],
A.[PoTP] AS [PoTP],
A.[Required Qty] AS [Required Qty],
A.[Cost Repair War] AS [Cost Repair War],
A.[Sales Repair War] AS [Sales Repair War],
A.[Repair Warranty] AS [Repair Warranty],
A.[Ship Matl To] AS [Ship Matl To],
A.[Line of Business] AS [Line of Business],
A.[Payment Terms] AS [Payment Terms],
A.[Sales Rep] AS [Sales Rep],
A.[Financial Dept] AS [Financial Dept],
A.[Invoice-to Addr] AS [Invoice-to Addr],
A.[Invoice-to BP] AS [Invoice-to BP],
A.[Sold-to Address] AS [Sold-to Address],
A.[Sold-to BP] AS [Sold-to BP],
A.[Payment Method] AS [Payment Method],
A.[Rate Type] AS [Rate Type],
A.[SvcO Cost Sheet] AS [SvcO Cost Sheet],
A.[Act Order Amt] AS [Act Order Amt],
A.[SOC Cancel Date] AS [SOC Cancel Date],
A.[Coverage Type] AS [Coverage Type],
A.[Currency] AS [Currency],
A.[Serv Contract] AS [Serv Contract],
A.[Service Type] AS [Service Type],
A.[Service Office] AS [Service Office],
A.[Est Order Amt] AS [Est Order Amt],
A.[Pricing Method] AS [Pricing Method],
A.[Plan Start Time] AS [Plan Start Time],
A.[Warranty Type] AS [Warranty Type],
A.[Act Cost Rate] AS [Act Cost Rate],
A.[Labor Type Cost] AS [Labor Type Cost],
A.[Labor Rate Code] AS [Labor Rate Code],
A.[Task] AS [Task],
A.[Service Discount] AS [Service Discount],
A.[Est Cost rate] AS [Est Cost rate],
A.[Labor Est Qty] AS [Labor Est Qty],
A.[Sales Inv Amt] AS [Sales Inv Amt],
A.[Sales Inv Date] AS [Sales Inv Date],
A.[Labor Type Sales] AS [Labor Type Sales],
A.[Service Warranty] AS [Service Warranty],
A.[Cost Amt War] AS [Cost Amt War],
A.[Actual Qty] AS [Actual Qty],
A.[Cost Type] AS [Cost Type],
A.[Unit] AS [Unit],
A.[Est Cost Line Id] AS [Est Cost Line Id],
A.[Other Costs Items] AS [Other Costs Items],
A.[Act Receipt Time] AS [Act Receipt Time],
A.[Maint SO] AS [Maint SO],
A.[Planned Carrier 1] AS [Planned Carrier 1],
A.[Item Delivery] AS [Item Delivery],
A.[MO Delivered Qty] AS [MO Delivered Qty],
A.[Delivery Whse] AS [Delivery Whse],
A.[MO Line Status] AS [MO Line Status],
A.[Order Discount] AS [Order Discount],
A.[Non SO Plan Deliv Date] AS [Non SO Plan Deliv Date],
A.[Plan Rec Time] AS [Plan Rec Time],
A.[Qty] AS [Qty],
A.[Actual Carrier] AS [Actual Carrier],
A.[Planned Carrier 2] AS [Planned Carrier 2],
A.[Received Qty] AS [Received Qty],
A.[Shipment] AS [Shipment],
A.[Receipt Whse] AS [Receipt Whse],
A.[Ship-to Address] AS [Ship-to Address],
A.[Ship-to BP] AS [Ship-to BP],
A.[Sales Type] AS [Sales Type],
A.[Work Order Num] AS [Work Order Num],
A.[MO Warranty] AS [MO Warranty],
A.[Desc] AS [Desc],
A.[Installment Plan] AS [Installment Plan],
A.[MO Order Date] AS [MO Order Date],
A.[MO Order Status] AS [MO Order Status],
A.[Amt Dom Curr] AS [Amt Dom Curr],
A.[Net Amt] AS [Net Amt],
A.[Tax Code] AS [Tax Code],
A.[Manual Sales ID] AS [Manual Sales ID],
A.[Manual Lines] AS [Manual Lines],
A.[Financial Comp] AS [Financial Comp],
A.[Tax Amt Dom] AS [Tax Amt Dom],
A.[Department] AS [Department],
A.[Approved Amt] AS [Approved Amt],
A.[Approval Action] AS [Approval Action],
A.[Approved By] AS [Approved By],
A.[Approval Desci] AS [Approval Desci],
A.[Approval Date] AS [Approval Date],
A.[Approval Percent] AS [Approval Percent],
A.[Claim] AS [Claim],
A.[Claimed Amt] AS [Claimed Amt],
A.[Claim Method] AS [Claim Method],
A.[Appr Qty Unit] AS [Appr Qty Unit],
A.[Claim Qty Unit] AS [Claim Qty Unit],
A.[CC Residual Value] AS [CC Residual Value],
A.[Sales Doc Line] AS [Sales Doc Line],
A.[Sales Doc Seq] AS [Sales Doc Seq],
A.[Approved Qty] AS [Approved Qty],
A.[Claimed Qty] AS [Claimed Qty],
A.[Reject Action] AS [Reject Action],
A.[Rejected By] AS [Rejected By],
A.[Rejection Date] AS [Rejection Date],
A.[Reject Reasons] AS [Reject Reasons],
A.[Return Matl Req] AS [Return Matl Req],
A.[CC Line Status] AS [CC Line Status],
A.[Tagged To] AS [Tagged To],
A.[Wait Supp Claim] AS [Wait Supp Claim],
A.[CC Cancel Date] AS [CC Cancel Date],
A.[Creation Date] AS [Creation Date],
A.[Failure Date] AS [Failure Date],
A.[Int Sales Rep] AS [Int Sales Rep],
A.[Sales Inv Comp] AS [Sales Inv Comp],
A.[Sales Doc Num] AS [Sales Doc Num],
A.[Sales Doc Type] AS [Sales Doc Type],
A.[Sales Ref Sys] AS [Sales Ref Sys],
A.[Created by] AS [Created by],
A.[Order Number] AS [Order Number],
A.[Order Line Numb] AS [Order Line Numb],
A.[Table Desc] AS [Table Desc],
A.[Table Shortcode] AS [Table Shortcode],
A.[Remain Order Qty] AS [Remain Order Qty],
A.[Order Value Due] AS [Order Value Due],
A.[NetLineAmt Dom] AS [NetLineAmt Dom],
A.[Delivery Note] AS [Delivery Note],
A.[Invoice Number] AS [Invoice Number],
A.[Produc Relation] AS [Produc Relation],
A.[Shipment Line] AS [Shipment Line],
A.[Source Type] AS [Source Type],
A.[Time of Action] AS [Time of Action],
A.[Inv Trans Type] AS [Inv Trans Type],
A.[INV Delivered Qty] AS [INV Delivered Qty],
A.[Inv Line Seq] AS [Inv Line Seq],
A.[Area] AS [Area],
A.[Back Order Qty] As [Back Order Qty],
A.[Ordered Qty] AS [Ordered Qty],
A.[DWH Load Time] As [DWH Load Time],
A.[Delivery Duration Days] AS [Delivery Duration Days],
A.[Delivery Days against Plan] AS [Delivery Days against Plan],
A.[Delivery Days against Cust Req] AS [Delivery Days against Cust Req],
A.[Late To Plan Flag] AS [Late To Plan Flag],
A.[Late To Cust Req Flag] AS [Late To Cust Req Flag],
A.[Completed Delivery Flag] AS [Completed Delivery Flag],
A.[On-Going Delivery Flag] AS [On-Going Delivery Flag],
A.[Late Orders Flag] AS [Late Orders Flag],
A.[On-Time Flag] As [On-Time Flag],
A.[Site] AS [Site],
A.[Delivered Value],
A.[SO Aval In Invoice Table Flag],
A.[NetLineAmt Dom Prop],
A.[INV Delivered Qty Prop],
A.[SO Invoiced Flag],
A.[Pending Qty for Delivery],
A.[Shipped but not Invoiced],
B.[Carrier/LSP Desc] as [Carrier/LSP Desc],
B.[Deleted Record] as [Deleted Record],
B.[Carrier Alpha Code] as [Carrier Alpha Code],
B.[Buy-from Business Partner] as [Buy-from Business Partner],
B.[Transport Category] as [Transport Category],
B.[Transport Category Desc] as [Transport Category Desc],
C.[Change Reason Desc] as [Change Reason Desc],
D.[Last Inventory Transaction Date] as [Last Inventory Transaction Date],
D.[Inventory Allocated] as [Inventory Allocated],
D.[Inventory Blocked] as [Inventory Blocked],
D.[Inventory Blocked for Planning] as [Inventory Blocked for Planning],
D.[Consignment Inventory Location Allocated] as [Consignment Inventory Location Allocated],
D.[Consignment Inventory on Hand] as [Consignment Inventory on Hand],
D.[Cumulative Issue] as [Cumulative Issue],
D.[Consignment Inventory in Transit] as [Consignment Inventory in Transit],
D.[Inventory Committed] as [Inventory Committed],
D.[Consignment on Order] as [Consignment on Order],
D.[Inventory Committed in Process] as [Inventory Committed in Process],
D.[Consigned Quarantine] as [Consigned Quarantine],
D.[Goods in Transit] as [Goods in Transit],
D.[Historical Balance] as [Historical Balance],
D.[Inventory on Hand] as [Inventory on Hand],
D.[Company Owned Quarantine Inventory] as [Company Owned Quarantine Inventory],
D.[Inventory in Transit] as [Inventory in Transit],
D.[Inventory Location Allocated] as [Inventory Location Allocated],
D.[Cust Owned Location Allocated] as [Cust Owned Location Allocated],
D.[Cust Owned Blocked] as [Cust Owned Blocked],
D.[Cust Owned Blocked for Planning] as [Cust Owned Blocked for Planning],
D.[Cust Owned on Hand] as [Cust Owned on Hand],
D.[Cust Owned in Transit] as [Cust Owned in Transit],
D.[Cust Owned on Order] as [Cust Owned on Order],
D.[Cust Owned Quarantine] as [Cust Owned Quarantine],
D.[Comp Owned Location Allocated] as [Comp Owned Location Allocated],
D.[Comp Owned on Order] as [Comp Owned on Order],
D.[Inventory on Order] as [Inventory on Order],
E.[Items Desc] as [Items Desc],
E.[Item Group] as [Item Group],
E.[Product Class] as [Product Class],
E.[Product Line] as [Product Line],
E.[Item Signal] as [Item Signal],
E.[Country of Origin] as [Country of Origin],
E.[Product Type] as [Product Type],
E.[Inventory Unit] as [Inventory Unit],
E.[Serialized] as [Serialized],
E.[Default Supply Source] as [Default Supply Source],
F.[Line of Business Desc] as [Line of Business Desc],
G.[Sales Office Desc] as [Sales Office Desc],
H.[Sales Order Type Desc] as [Sales Order Type Desc],
I.[Address Code] as [Ship-to Address Code],
I.[Country] as [Ship-to Country],
I.[Country Name] as [Ship-to Country Name],
I.[Ship-to BP Name] as [Ship-to BP Name],
I.[Ship-to State/Province] As [Ship-to State/Province],
I.[Ship-to City Name] As [Ship-to City Name],
I.[Ship-to Latitude] As [Ship-to Latitude],
I.[Ship-to Longitude] As [Ship-to Longitude],
J.[Address Code] as [Sold-to Address Code],
J.[Country] as [Sold-to Country],
J.[Country Name] as [Sold-to Country Name],
J.[Sold-to BP Name] as [Sold-to BP Name],
J.[Sold-to State/Province] As [Sold-to State/Province],
J.[Sold-to City Name] As [Sold-to City Name],
J.[Sold-to Latitude] As [Sold-to Latitude],
J.[Sold-to Longitude] As [Sold-to Longitude],
K.[Tax Classification Desc] as [Tax Classification Desc],
K.[Max W/Tax %] as [Max W/Tax %],
K.[SCT Allowed] as [SCT Allowed],
K.[SCT Allowed Falg] as [SCT Allowed Falg],
K.[WIT Allowed] as [WIT Allowed],
K.[WIT Allowed Flag] as [WIT Allowed Flag],
L.[Warehouse Desc] as [Warehouse Desc],
L.[Address Code] as [Warehouse Address Code],
L.[Financial Company] as [Financial Company],
L.[Enterprise unit of Wh] as [Enterprise unit of Wh],
L.[Inventory Mgt Business Partner] as [Inventory Mgt Business Partner],
L.[External Site] as [External Site],
L.[External Site Flag] as [External Site Flag],
L.[Blocked for Inbound]		As [Blocked for Inbound],
L.[Blocked for Inbound Desc]	As [Blocked for Inbound Desc],
L.[Blocked for Outbound]		As [Blocked for Outbound],
L.[Blocked for Outbound Desc]	As [Blocked for Outbound Desc],
M.[levels] As [Product Line Levels],
M.[firstlevel] 	As [Product Line First Level],	
M.[secondlevel] As [Product Line Second Level],	
M.[thirdlevel] 	As [Product Line Third Level],
N.[Department Name] As [Department Desc],
N.[Site] As [Department Site],
N.[Department Type Key] As [Department Type Key],
N.[Department Type] As [Department Type],
O.[region] As [Ship-to Region],
O.[sub-region] As [Ship-to Sub Region],
P.[region] As [Sold-to Region],
P.[sub-region] As [Sold-to Sub Region],
Q.[Default Supply Source By Site] As [Default Supply Source By Site],
Q.[Default Supply Source By Site Desc] As [Default Supply Source By Site Desc],
R.[nama] As [Ship-to Address Desc],
S.[nama] As [Sold-to Address Desc],
A.[SO Order Status] AS [SO Order Status],
A.[SO Order Status Desc] AS [SO Order Status Desc],
A.[Ship Constraint Desc] As [Ship Constraint Desc],
A.[Requested Duration Days] As [Requested Duration Days],
A.[Items Type] As [Items Type],
A.[OTD Plan Deliv Date Flag] As [OTD Plan Deliv Date Flag],
A.[OTD Orig Prom Deliv Date Flag] As [OTD Orig Prom Deliv Date Flag],
A.[OTD Cust Req Deliv Date Flag] As [OTD Cust Req Deliv Date Flag],
A.[Delivery Days against Orig Prom] As [Delivery Days against Orig Prom],
A.[Late To Init Req Flag] As [Late To Init Req Flag],
A.[Late To Orig Deliv Flag] As [Late To Orig Deliv Flag]
--FROM [replncss].[fct Sales Revenue] A
FROM [replncss].[temp_fct_Sales_Revenue_cube] A

LEFT OUTER JOIN [replncss].[dim Carriers/LSP] B
on A.[Carrier] = B.[Carrier/LSP] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = B.[Company]

LEFT OUTER JOIN [replncss].[dim Change Reasons] C
on A.[Change Reason] = C.[Change Reason] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = C.[Company]

LEFT OUTER JOIN [replncss].[dim Item Inventory by Warehouse] D
on A.[Warehouse] = D.[Warehouse] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = D.[Company] and A.[Items] = D.[Item]

LEFT OUTER JOIN [replncss].[dim Items] E
on A.[Items] = E.[Item] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = E.[Company]

LEFT OUTER JOIN [replncss].[dim Lines of Business] F
on A.[Line of Business] = F.[Line of Business] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = F.[Company]

LEFT OUTER JOIN [replncss].[dim Sales Office] G
on A.[Department] = G.[Sales Office] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = G.[Company]

LEFT OUTER JOIN [replncss].[dim Sales Order Types] H
on A.[Sales Ord Type] = H.[Sales Order Type] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = H.[Company]

LEFT OUTER JOIN [replncss].[dim Ship-to Business Partners] I
on A.[Ship-to BP] = I.[Ship-to BP] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = I.[Company]

LEFT OUTER JOIN [replncss].[dim Sold-to Business Partners] J
on A.[Sold-to BP] = J.[Sold-to BP] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = J.[Company]

LEFT OUTER JOIN [replncss].[dim Tax Classification] K
on A.[Tax Classif] = K.[Tax Classification] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = K.[Company]

LEFT OUTER JOIN [replncss].[dim Warehouse] L
on A.[Warehouse] = L.[Warehouse] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = L.[Company]

LEFT OUTER JOIN [dwhcda].[lnc_dim_tcmcs061_Ext] M
on E.[Product Line] = M.[cpln] and E.[Company] = M.[compnr]

LEFT OUTER JOIN [replncss].[dim Departments] N
on A.[Department] = N.[Department] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = N.[Company number]

LEFT OUTER JOIN [dwhcda].[lnc_dim_country_region] O
on I.[Country] = O.[alpha-2]

LEFT OUTER JOIN [dwhcda].[lnc_dim_country_region] P
on J.[Country] = P.[alpha-2]

LEFT OUTER JOIN [replncss].[dim Item By Site] Q
on A.[Items] = Q.[Item] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = Q.[Company] 
And A.[Site] = Q.[Site]

LEFT OUTER JOIN (Select Distinct compnr,cadr,nama From [acq101].[dst_tccom130]) R
on A.[Ship-to Address] = R.[cadr] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = R.[compnr]

LEFT OUTER JOIN (Select Distinct compnr,cadr,nama From [acq101].[dst_tccom130]) S
on A.[Sold-to Address] = S.[cadr] And Case When A.[Table Shortcode] = 'IL' Then A.[Source Company] Else A.[Company number] End = S.[compnr]  

/*
LEFT OUTER JOIN (Select Distinct compnr,orno,hdst As [SO Order Status],hdst_kw,
(Select Replace(String_agg(Stuff(lower(value),1,1,Upper(SUBSTRING(value,1,1))),' '),' ','-') as INITCAP from STRING_SPLIT((Substring(LTRIM(RTRIM(hdst_kw)),CHARINDEX('.',LTRIM(RTRIM(hdst_kw)),(CHARINDEX('.',LTRIM(RTRIM(hdst_kw)))+1))+ 1,Len(hdst_kw))), '.'))
AS [SO Order Status Desc] From acq101.dst_tdsls400) T
on A.[Order Number] = T.[orno] And A.[Company number] = T.[compnr] And A.[Table Shortcode] = 'SO' 
*/

/*
LEFT OUTER JOIN (Select Distinct compnr,orno,hdst As [SO Order Status],hdst_kw
From acq101.dst_tdsls400) T
on A.[Order Number] = T.[orno] And A.[Company number] = T.[compnr] And A.[Table Shortcode] = 'SO' 

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdsls.hdst' And [Enum Language] = 'en_US') U
on T.[SO Order Status] = U.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdscon' And [Enum Language] = 'en_US') V
on A.[Ship Constraint] = V.[Enum Value] 
*/

WHERE A.[Order Line Numb] IS NOT NULL
) src_tbl OPTION (LABEL = '[SP_7_fct_Sales_Revenue_Cube_1]');
	
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


