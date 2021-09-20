/**********************************************************************************************************************
View Name: [replncss].[fct Sales Revenue]
Description: This view is created based on the Fact Table which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from two fact source tables without any transformation logic.

Data Type: Fact Data
Source Table:[acq101].[lnc_fct_Orders],[acq101].[lnc_fct_Sales_Invoice]
Target View: [replncss].[fct Sales Revenue]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
Dt:10/06/2021
Added New Field "srcp"([Source Company]) from Invoice Fact Table.

Dt:18/06/2021
Added New Field "site"([Site]) from Sales Order Fact (lnc_fct_Orders) Table.

Dt:22/06/2021
Added New Calculated Field "Delivered Value" from Sales Order Fact (lnc_fct_Orders) Table Measure fields based on the formula
"(tdsls401.qidl * tdsls401.oamt) / tdsls401.qoor".
Considering value as null for all date fields where date is "1970-01-01" when the data is shown in reporting layer.

Dt:30/06/2021
Remapping "ddat" field from "Invoice Lines" data to "Delivery Date" o/p field. Re-mapping "[Plan Deliv Date]" to "Null" for Invoice data.

Dt:01/07/2021
Remapping "ddta" field from "Sales Order" data to "Plan Deliv Date" o/p field. Re-mapping "[Plnd Deliv Date]" to "Null" for Sales Order Data.

Dt:18/08/2021
Added "scon_kw -Shipping Constraint (keyword)" field for Sales order lines table as part of report requirement.

Dt:20/08/2021
As per request from Business(Jared), not to consider the "Pro Forma" Invoice transactions and do not represent as actual open invoices to customers.

Dt:23/08/2021
Renamed "[Ship Constraint Desc]" to "[Ship Constraint Orig Desc]" as we are populating "[Ship Constraint Desc]" value by joining with enum dim table.

Dt:23/08/2021
Lookup "[replncss].[dim Enum Descriptions]" View to populate values for "[Ship Constraint Desc]" field.

Dt:08/09/2021
Lookup "[replncss].[dim Enum Descriptions]" View to populate values for "[SO Order Status Desc]" field.

Dt:15/09/2021
As per discussion with Chris & Chad,changed the Logic for [Late Orders Flag],Completed Delivery Flag],[On-Time Flag]
Added New calculated field "[Requested Duration Days]"

Dt:16/09/2021
As per discussion with Chris & Chad,added new field [Items Type] and updated value as "Cost Items" for 8 Items i.e. ('FREIGHT','FREIGHT CHARGE','INSTALL','INSURANCE','INSURANCE CHARGE','PALLET','PALLET CHARGE','TECHNICAL SERVICE') and rest as "Non Cost Items".

Dt:16/09/2021
As per discussion with Chris & Chad,added new field [OTD Plan Deliv Date Flag],[OTD Orig Prom Deliv Date Flag],[OTD Cust Req Deliv Date Flag],
[Delivery Days against Orig Prom],[Late To Init Req Flag],[Late To Orig Deliv Flag]
as part of new DashBoard.

**********************************************************************************************************************/

--Drop View [replncss].[fct Sales Revenue];

CREATE VIEW [replncss].[fct Sales Revenue]
AS 
SELECT A.[Line Disc Amt],A.[SO Blocked],A.[Canceled],A.[Contract],A.[Cust Order],A.[Change Reason],A.[BackOrd UoM],A.[Warehouse],A.[Plnd Deliv Date],A.[Plan Deliv Date],A.[Init Req Date],A.[Cust Req Date],A.[Orig Deliv Date],A.[Delivery Date],A.[SO Order Date],A.[Sales Lines],A.[Plnd Receipt Date],A.[Price],A.[SO Delivered Qty],A.[Original Ordered Qty],A.[Exch Rate Type],A.[Ship Constraint],A.[Supply-from Whs],A.[So Shipment],A.[Line Sequence],A.[Ship-to Whs],A.[Ext Sales Rep],A.[Return Reason],A.[Sales Ord Type],A.[Reference A],A.[Sales Price List],A.[Installments],A.[Cost Serv Cont],A.[Cost FCO],A.[Cost SO Inv],A.[Activity Line],A.[Cost Goodwill],A.[Act Unit Cost],A.[Cost Quote],A.[Actual Line],A.[Cost Warranty],A.[Actual Cum Qty],A.[Actual Del Tme],A.[Total Cost],A.[Ord Disc Amt],A.[Act Purch Amt],A.[Sales Serv Con],A.[Total Disc Amt],A.[Sales FCO],A.[Sales SO Inv],A.[Sales Goodwill],A.[Sales Amt Quote],A.[Total Sales Amt],A.[Sales Warranty],A.[MC Blocked],A.[Tax Classif],A.[Delivery Terms],A.[Discount Code],A.[Carrier],A.[Cost Line Stat],A.[Company number],A.[Contr Converage],A.[Sales Price Unit],A.[Sales Qty Unit],A.[Delivery Code],A.[SO Discount],A.[Delivery Type],A.[Est Unit Cost],A.[Service Est Qty],A.[Service Est Cost Line],A.[Est Sales Price],A.[Items],A.[MC Residual Value],A.[Discount Amt],A.[Other Lines],A.[Service Order],A.[Activity],A.[Material or Maintenance Items],A.[Price Origin],A.[Sales Price],A.[PoTP],A.[Required Qty],A.[Cost Repair War],A.[Sales Repair War],A.[Repair Warranty],A.[Ship Matl To],A.[Line of Business],A.[Payment Terms],A.[Sales Rep],A.[Financial Dept],A.[Invoice-to Addr],A.[Invoice-to BP],A.[Sold-to Address],A.[Sold-to BP],A.[Payment Method],A.[Rate Type],A.[SvcO Cost Sheet],A.[Act Order Amt],A.[SOC Cancel Date],A.[Coverage Type],A.[Currency],A.[Serv Contract],A.[Service Type],A.[Service Office],A.[Est Order Amt],A.[Pricing Method],A.[Plan Start Time],A.[Warranty Type],A.[Act Cost Rate],A.[Labor Type Cost],A.[Labor Rate Code],A.[Task],A.[Service Discount],A.[Est Cost rate],A.[Labor Est Qty],A.[Sales Inv Amt],A.[Sales Inv Date],A.[Labor Type Sales],A.[Service Warranty],A.[Cost Amt War],A.[Actual Qty],A.[Cost Type],A.[Unit],A.[Est Cost Line Id],A.[Other Costs Items],A.[Act Receipt Time],A.[Maint SO],A.[Planned Carrier 1],A.[Item Delivery],A.[MO Delivered Qty],A.[Delivery Whse],A.[MO Line Status],A.[Order Discount],A.[Non SO Plan Deliv Date],A.[Plan Rec Time],A.[Qty],A.[Actual Carrier],A.[Planned Carrier 2],A.[Received Qty],A.[Shipment],A.[Receipt Whse],A.[Ship-to Address],A.[Ship-to BP],A.[Sales Type],A.[Work Order Num],A.[MO Warranty],A.[Desc],A.[Installment Plan],A.[MO Order Date],A.[MO Order Status],A.[Amt Dom Curr],A.[Net Amt],A.[Tax Code],A.[Manual Sales ID],A.[Manual Lines],A.[Financial Comp],A.[Tax Amt Dom],A.[Department],A.[Approved Amt],A.[Approval Action],A.[Approved By],A.[Approval Desci],A.[Approval Date],A.[Approval Percent],A.[Claim],A.[Claimed Amt],A.[Claim Method],A.[Appr Qty Unit],A.[Claim Qty Unit],A.[CC Residual Value],A.[Sales Doc Line],A.[Sales Doc Seq],A.[Approved Qty],A.[Claimed Qty],A.[Reject Action],A.[Rejected By],A.[Rejection Date],A.[Reject Reasons],A.[Return Matl Req],A.[CC Line Status],A.[Tagged To],A.[Wait Supp Claim],A.[CC Cancel Date],A.[Creation Date],A.[Failure Date],A.[Int Sales Rep],A.[Sales Inv Comp],A.[Sales Doc Num],A.[Sales Doc Type],A.[Sales Ref Sys],A.[Created By],A.[Order Number],A.[Order Line Numb],A.[Table Desc],A.[Table Shortcode],A.[Remain Order Qty],A.[Order Value Due],A.[NetLineAmt Dom],A.[Delivery Note],A.[Invoice Number],A.[Produc Relation],A.[Shipment Line],A.[Source Type],A.[Time of Action],A.[Inv Trans Type],A.[INV Delivered Qty],A.[Inv Line Seq],A.[Area],A.[Back Order Qty],A.[Ordered Qty],A.[SO Order Status],A.[SO Order Status Orig Desc],A.[SO Order Status Desc],
A.[Source Company],A.[DWH Load Time],
A.[site],A.[Delivered Value],A.[Ship Constraint Orig Desc],A.[Ship Constraint Desc],
/*
CASE WHEN (A.[Delivery Date] = '1970-01-01' OR A.[Delivery Date] IS NULL)
THEN NULL ELSE DATEDIFF(Day, A.[SO Order Date], A.[Delivery Date]) END AS [Delivery Duration Days],
*/
CASE WHEN (A.[Init Req Date] IS NULL OR A.[Init Req Date] = '1970-01-01' OR A.[Delivery Date] = '1970-01-01' OR A.[Delivery Date] IS NULL)
THEN NULL ELSE DATEDIFF(Day, A.[Init Req Date], A.[Delivery Date]) END AS [Delivery Duration Days],

CASE WHEN A.[Plan Deliv Date] IS NULL OR A.[Plan Deliv Date] = '1970-01-01' OR A.[Delivery Date] IS NULL OR A.[Delivery Date] = '1970-01-01'
THEN NULL ELSE DATEDIFF(Day, A.[Plan Deliv Date], A.[Delivery Date]) END AS [Delivery Days against Plan],

CASE WHEN A.[Orig Deliv Date] IS NULL OR A.[Orig Deliv Date] = '1970-01-01' OR A.[Delivery Date] IS NULL OR A.[Delivery Date] = '1970-01-01'
THEN NULL ELSE DATEDIFF(Day, A.[Orig Deliv Date], A.[Delivery Date]) END AS [Delivery Days against Orig Prom],

CASE WHEN A.[Cust Req Date] IS NULL OR A.[Cust Req Date] = '1970-01-01' OR A.[Delivery Date] IS NULL OR A.[Delivery Date] = '1970-01-01'
THEN NULL ELSE DATEDIFF(Day, A.[Cust Req Date], A.[Delivery Date]) END AS [Delivery Days against Cust Req],

CASE WHEN (A.[Init Req Date] IS NULL OR A.[Init Req Date] = '1970-01-01' OR A.[Delivery Date] IS NULL OR A.[Delivery Date] = '1970-01-01') THEN NULL WHEN DATEDIFF(Day, A.[Init Req Date], A.[Delivery Date])<=0 THEN 0 ELSE 1 END AS [Late To Init Req Flag],

CASE WHEN (A.[Plan Deliv Date] IS NULL OR A.[Plan Deliv Date] = '1970-01-01' OR A.[Delivery Date] IS NULL OR A.[Delivery Date] = '1970-01-01') THEN NULL WHEN DATEDIFF(Day, A.[Plan Deliv Date], A.[Delivery Date])<=0 THEN 0 ELSE 1 END AS [Late To Plan Flag],

CASE WHEN (A.[Orig Deliv Date] IS NULL OR A.[Orig Deliv Date] = '1970-01-01' OR A.[Delivery Date] IS NULL OR A.[Delivery Date] = '1970-01-01') THEN NULL WHEN DATEDIFF(Day, A.[Orig Deliv Date], A.[Delivery Date])<=0 THEN 0 ELSE 1 END AS [Late To Orig Deliv Flag],

CASE WHEN (A.[Cust Req Date] IS NULL OR A.[Cust Req Date] = '1970-01-01' OR A.[Delivery Date] IS NULL OR A.[Delivery Date] = '1970-01-01') THEN NULL
WHEN DATEDIFF(Day, A.[Cust Req Date], A.[Delivery Date])<=0 THEN 0 ELSE 1 END AS [Late To Cust Req Flag],

/*
CASE WHEN A.[Remain Order Qty]=0 THEN 1 ELSE 0 END AS [Completed Delivery Flag],
*/
CASE WHEN (A.[Remain Order Qty] = 0 OR Upper(A.[SO Order Status Desc]) = 'CLOSED') THEN 1 ELSE 0 END AS [Completed Delivery Flag],
CASE WHEN A.[Remain Order Qty]>0 THEN 1 ELSE 0 END AS [On-Going Delivery Flag],
/*
CASE WHEN (A.[Plan Deliv Date] IS NULL OR A.[Plan Deliv Date] = '1970-01-01') THEN NULL
WHEN (A.[Plan Deliv Date] < Convert(Date,GETDATE()) AND A.[Remain Order Qty] > 0) THEN 1
ELSE 0 END AS [Late Orders Flag],
*/
CASE WHEN (A.[Plan Deliv Date] IS NULL OR A.[Plan Deliv Date] = '1970-01-01') THEN 1
WHEN (A.[Plan Deliv Date] < Convert(Date,GETDATE()) AND A.[Remain Order Qty] > 0) THEN 1
ELSE 0 END AS [Late Orders Flag],

--Below calculation is based on "Initial Requested Delivery Date", not renaming the field "[On-Time Flag]" as it will effect the existing reports
CASE WHEN (A.[Init Req Date] IS NULL OR A.[Init Req Date] = '1970-01-01' OR A.[Delivery Date] IS NULL OR A.[Delivery Date] = '1970-01-01')
THEN NULL WHEN (A.[Remain Order Qty] = 0 And A.[Delivery Date] <= A.[Init Req Date]) 
THEN 1 ELSE 0 END AS [On-Time Flag],

CASE WHEN (A.[Plan Deliv Date] IS NULL OR A.[Plan Deliv Date] = '1970-01-01' OR A.[Delivery Date] IS NULL OR A.[Delivery Date] = '1970-01-01')
THEN NULL WHEN (A.[Remain Order Qty] = 0 And A.[Delivery Date] <= A.[Plan Deliv Date]) 
THEN 1 ELSE 0 END AS [OTD Plan Deliv Date Flag],

CASE WHEN (A.[Orig Deliv Date] IS NULL OR A.[Orig Deliv Date] = '1970-01-01' OR A.[Delivery Date] IS NULL OR A.[Delivery Date] = '1970-01-01')
THEN NULL WHEN (A.[Remain Order Qty] = 0 And A.[Delivery Date] <= A.[Orig Deliv Date]) 
THEN 1 ELSE 0 END AS [OTD Orig Prom Deliv Date Flag],

CASE WHEN (A.[Cust Req Date] IS NULL OR A.[Cust Req Date] = '1970-01-01' OR A.[Delivery Date] IS NULL OR A.[Delivery Date] = '1970-01-01')
THEN NULL WHEN (A.[Remain Order Qty] = 0 And A.[Delivery Date] <= A.[Cust Req Date]) 
THEN 1 ELSE 0 END AS [OTD Cust Req Deliv Date Flag],

CASE WHEN (A.[Init Req Date] = '1970-01-01' OR A.[Init Req Date] IS NULL OR A.[Plan Deliv Date] IS NULL OR A.[Plan Deliv Date] = '1970-01-01')
THEN NULL ELSE DATEDIFF(Day, A.[Init Req Date], A.[Plan Deliv Date]) END AS [Requested Duration Days],

CASE WHEN Upper(Trim(A.[Items])) IN ('FREIGHT','FREIGHT CHARGE','INSTALL','INSURANCE','INSURANCE CHARGE','PALLET','PALLET CHARGE','TECHNICAL SERVICE') THEN 'Cost Items' ELSE 'Non Cost Items' END AS [Items Type]
FROM (
Select IsNull(amld,0) As [Line Disc Amt], bkyn As [SO Blocked], clyn As [Canceled], cono As [Contract], corn As [Cust Order], crcd As [Change Reason], cubs As [BackOrd UoM], cwar As [Warehouse], Cast(Null As Date) As [Plnd Deliv Date], Case When Convert(Date,ddtb) = '1970-01-01' Then Null Else Convert(Date,FORMAT(ddtb,'yyyy-MM-dd')) End As [Init Req Date], Case When Convert(Date,ddtc) = '1970-01-01' Then Null Else Convert(Date,FORMAT(ddtc,'yyyy-MM-dd')) End As [Cust Req Date], Case When Convert(Date,ddtd) = '1970-01-01' Then Null Else Convert(Date,FORMAT(ddtd,'yyyy-MM-dd')) End As [Orig Deliv Date], Case When Convert(Date,dldt) = '1970-01-01' Then Null Else Convert(Date,FORMAT(dldt,'yyyy-MM-dd')) End As [Delivery Date], Case When Convert(Date,odat) = '1970-01-01' Then Null Else Convert(Date,FORMAT(odat,'yyyy-MM-dd')) End As [SO Order Date], pono As [Sales Lines], Case When Convert(Date,prdt) = '1970-01-01' Then Null Else Convert(Date,FORMAT(prdt,'yyyy-MM-dd')) End As [Plnd Receipt Date], IsNull(pric,0) As [Price], IsNull(qidl,0) As [SO Delivered Qty], IsNull(qoor,0) As [Original Ordered Qty], ratt As [Exch Rate Type], scon As [Ship Constraint], sfwh As [Supply-from Whs], shpm As [So Shipment], sqnb As [Line Sequence], stwh As [Ship-to Whs], osrp As [Ext Sales Rep], retr As [Return Reason], sotp As [Sales Ord Type],  Null As [Reference A], cpls As [Sales Price List], Case When Convert(Date,ddta) = '1970-01-01' Then Null Else Convert(Date,FORMAT(ddta,'yyyy-MM-dd')) End As [Plan Deliv Date], futo As [Installments], IsNull(acco_1,0) As [Cost Serv Cont], IsNull(acfc_1,0) As [Cost FCO], IsNull(acin_1,0) As [Cost SO Inv], acln As [Activity Line], IsNull(acoc_1,0) As [Cost Goodwill], IsNull(acpr_1,0) As [Act Unit Cost], IsNull(acqu_1,0) As [Cost Quote], actl As [Actual Line], IsNull(acwa_1,0) As [Cost Warranty], IsNull(adqt,0) As [Actual Cum Qty], adtm As [Actual Del Tme], IsNull(amnt_1,0) As [Total Cost], IsNull(amod,0) As [Ord Disc Amt], IsNull(apam_1,0) As [Act Purch Amt], IsNull(asco,0) As [Sales Serv Con], IsNull(asdi,0) As [Total Disc Amt], IsNull(asfc,0) As [Sales FCO], IsNull(asin,0) As [Sales SO Inv], IsNull(asoc,0) As [Sales Goodwill], IsNull(asqu,0) As [Sales Amt Quote], IsNull(asto,0) As [Total Sales Amt], IsNull(aswa,0) As [Sales Warranty], blyn As [MC Blocked], bpcl As [Tax Classif], cdec As [Delivery Terms], cdis_1 As [Discount Code], cfrw As [Carrier], clst As [Cost Line Stat], AA.compnr As [Company number], ctyn As [Contr Converage], cups As [Sales Price Unit], cuqs As [Sales Qty Unit], delc As [Delivery Code], IsNull(disc_1,0) As [SO Discount], dltp As [Delivery Type], IsNull(ecpr_1,0) As [Est Unit Cost], IsNull(eqan,0) As [Service Est Qty], IsNull(escl,0) As [Service Est Cost Line], IsNull(espr,0) As [Est Sales Price], item As [Items], IsNull(ival_1,0) As [MC Residual Value], IsNull(ldam_1,0) As [Discount Amt], lino As [Other Lines], AA.orno As [Service Order], pcac As [Activity], pitm As [Material or Maintenance Items], porg As [Price Origin], IsNull(pris,0) As [Sales Price], ptpa As [PoTP], IsNull(qtdl,0) As [Required Qty], IsNull(rwca_1,0) As [Cost Repair War], IsNull(rwsa,0) As [Sales Repair War], rwty As [Repair Warranty], smto As [Ship Matl To], cbrn As [Line of Business], cpay As [Payment Terms], crep As [Sales Rep], fdpt As [Financial Dept], itad As [Invoice-to Addr], itbp As [Invoice-to BP], ofad As [Sold-to Address], ofbp As [Sold-to BP], paym As [Payment Method], rtyp As [Rate Type], cosh As [SvcO Cost Sheet], IsNull(amnt,0) As [Act Order Amt], cadt As [SOC Cancel Date], cctp As [Coverage Type], ccur As [Currency], csco As [Serv Contract], cstp As [Service Type], cwoc As [Service Office], IsNull(oamt,0) As [Est Order Amt], pmtd As [Pricing Method], pstm As [Plan Start Time], wrtp As [Warranty Type], IsNull(acwr_1,0) As [Act Cost Rate], chlt As [Labor Type Cost], clrt As [Labor Rate Code], ctsk As [Task], IsNull(disc,0) As [Service Discount], IsNull(ecwr_1,0) As [Est Cost rate], IsNull(eqtm,0) As [Labor Est Qty], IsNull(inam,0) As [Sales Inv Amt], Case When Convert(Date,invd) = '1970-01-01' Then Null Else Convert(Date,FORMAT(invd,'yyyy-MM-dd')) End As [Sales Inv Date], shlt As [Labor Type Sales], wtyn As [Service Warranty], IsNull(acwa_2,0) As [Cost Amt War], IsNull(aqan,0) As [Actual Qty], cotp As [Cost Type], cuni As [Unit], elgd As [Est Cost Line Id], tltp As [Other Costs Items], artm As [Act Receipt Time], cmso As [Maint SO], dcfw As [Planned Carrier 1], dlyn As [Item Delivery], IsNull(dqty,0) As [MO Delivered Qty], dwrh As [Delivery Whse], lsta As [MO Line Status], odis As [Order Discount], pdtm As [Non SO Plan Deliv Date], prtm As [Plan Rec Time], IsNull(quan,0) As [Qty], racw As [Actual Carrier], rcfw As [Planned Carrier 2], IsNull(rqty,0) As [Received Qty], rshm As [Shipment], rwrh As [Receipt Whse], stad As [Ship-to Address], stbp As [Ship-to BP], styp As [Sales Type], wono As [Work Order Num], wrty As [MO Warranty], zdesc As [Desc], inpl As [Installment Plan], ordt As [MO Order Date], osta As [MO Order Status], IsNull(amth_1,0) As [Amt Dom Curr], IsNull(amti,0) As [Net Amt], cvat As [Tax Code], msid As [Manual Sales ID], msln As [Manual Lines], sfcp As [Financial Comp], IsNull(txah_1,0) As [Tax Amt Dom], cofc As [Department], IsNull(acam,0) As [Approved Amt], apac As [Approval Action], apby As [Approved By], apdc As [Approval Desci], apdt As [Approval Date], aper As [Approval Percent], ccno As [Claim], IsNull(clam,0) As [Claimed Amt], clmt As [Claim Method], cuaq As [Appr Qty Unit], cucq As [Claim Qty Unit], IsNull(ival,0) As [CC Residual Value], odln As [Sales Doc Line], odsn As [Sales Doc Seq], IsNull(qaac,0) As [Approved Qty], IsNull(qccl,0) As [Claimed Qty], rjac As [Reject Action], rjby As [Rejected By], rjdt As [Rejection Date], rjre As [Reject Reasons], rmrq As [Return Matl Req], stat As [CC Line Status], tgto As [Tagged To], wscl As [Wait Supp Claim], cndt As [CC Cancel Date], crtm As [Creation Date], fldt As [Failure Date], irep As [Int Sales Rep], ocmp As [Sales Inv Comp], odno As [Sales Doc Num], odty As [Sales Doc Type], oosy As [Sales Ref Sys], zuser As [Created By], Orderno As [Order Number], [lineno] As [Order Line Numb], Table_ID As [Table Desc], Table_Flag As [Table Shortcode], IsNull(remoqty,0) As [Remain Order Qty], IsNull(ordvaldue,0) As [Order Value Due], 0 As [NetLineAmt Dom], Null As [Delivery Note], Null As [Invoice Number], Null As [Produc Relation], Null As [Shipment Line], Null As [Source Type], ztimestamp As [Time of Action], Null As [Inv Trans Type], 0 As [INV Delivered Qty], Null As [Inv Line Seq], Null As [Area],IsNull(qbbo,0) As [Back Order Qty],(IsNull(qoor,0) - IsNull(qbbo,0)) As [Ordered Qty],
/*
(Select Replace(String_agg(Stuff(lower(value),1,1,Upper(SUBSTRING(value,1,1))),' '),' ','-') as INITCAP from STRING_SPLIT((Substring(LTRIM(RTRIM(hdst_kw)),CHARINDEX('.',LTRIM(RTRIM(hdst_kw)),(CHARINDEX('.',LTRIM(RTRIM(hdst_kw)))+1))+ 1,Len(hdst_kw))), '.'))
AS [SO Order Status Desc],
*/
B.hdst As [SO Order Status],B.hdst_kw As [SO Order Status Orig Desc],C.[Enum Desc] AS [SO Order Status Desc],
dwh_load_time As [DWH Load Time],Null As [Source Company],[site] As [site],
Case When Isnull(qoor,0) = 0 then 0 else (Isnull(qidl,0) * Isnull(oamt,0)) / Isnull(qoor,0) End As [Delivered Value],
/*
Case When (IsNull(qoor,0) - IsNull(qbbo,0)) = 0 then 0 
Else (Isnull(qidl,0) * Isnull(oamt,0)) / (IsNull(qoor,0) - IsNull(qbbo,0)) End As [Delivered Value]
*/
scon_kw As [Ship Constraint Orig Desc],D.[Enum Desc] As [Ship Constraint Desc]
From [dwhcda].[lnc_fct_Orders] AA

LEFT OUTER JOIN (Select Distinct compnr,orno,hdst,hdst_kw
From acq101.dst_tdsls400 Where [deleted] = 'False') B
on AA.[orderno] = B.[orno] And AA.[compnr] = B.[compnr]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdsls.hdst' And [Enum Language] = 'en_US') C
on B.[hdst] = C.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdscon' And [Enum Language] = 'en_US') D
on AA.[scon] = D.[Enum Value] 

Where AA.[deleted] = 'False'

UNION ALL
Select 0 As [Line Disc Amt], Null As [SO Blocked], Null As [Canceled], Null As [Contract], Null As [Cust Order], Null As [Change Reason], Null As [BackOrd UoM], Null As [Warehouse], Cast(Null As Date) As [Plnd Deliv Date], Null As [Init Req Date], Null As [Cust Req Date], Null As [Orig Deliv Date], Case When Convert(Date,ddat) = '1970-01-01' Then Null Else Convert(Date,FORMAT(ddat,'yyyy-MM-dd')) End As [Delivery Date], Case When Convert(Date,odat) = '1970-01-01' Then Null Else Convert(Date,FORMAT(odat,'yyyy-MM-dd')) End As [SO Order Date], pono As [Sales Lines], Null As [Plnd Receipt Date], 0 As [Price], 0 As [SO Delivered Qty], 0 As [Original Ordered Qty], Null As [Exch Rate Type], Null As [Ship Constraint], Null As [Supply-from Whs], shpm As [So Shipment], Null As [Line Sequence], Null As [Ship-to Whs], Null As [Ext Sales Rep], Null As [Return Reason], sotp As [Sales Ord Type],  Null As [Reference A], Null As [Sales Price List], Null As [Plan Deliv Date], Null As [Installments], 0 As [Cost Serv Cont], 0 As [Cost FCO], 0 As [Cost SO Inv], Null As [Activity Line], 0 As [Cost Goodwill], 0 As [Act Unit Cost], 0 As [Cost Quote], Null As [Actual Line], 0 As [Cost Warranty], 0 As [Actual Cum Qty], Null As [Actual Del Tme], 0 As [Total Cost], 0 As [Ord Disc Amt], 0 As [Act Purch Amt], 0 As [Sales Serv Con], 0 As [Total Disc Amt], 0 As [Sales FCO], 0 As [Sales SO Inv], 0 As [Sales Goodwill], 0 As [Sales Amt Quote], 0 As [Total Sales Amt], 0 As [Sales Warranty], Null As [MC Blocked], Null As [Tax Classif], cdec As [Delivery Terms], Null As [Discount Code], Null As [Carrier], Null As [Cost Line Stat], compnr As [Company number], Null As [Contr Converage], Null As [Sales Price Unit], Null As [Sales Qty Unit], Null As [Delivery Code], 0 As [SO Discount], Null As [Delivery Type], 0 As [Est Unit Cost], 0 As [Service Est Qty], 0 As [Service Est Cost Line], 0 As [Est Sales Price], item As [Items], 0 As [MC Residual Value], 0 As [Discount Amt], Null As [Other Lines], orno As [Service Order], Null As [Activity], Null As [Material or Maintenance Items], Null As [Price Origin], 0 As [Sales Price], ptpa As [PoTP], 0 As [Required Qty], 0 As [Cost Repair War], 0 As [Sales Repair War], Null As [Repair Warranty], Null As [Ship Matl To], cbrn As [Line of Business], cpay As [Payment Terms], crep As [Sales Rep], fdpt As [Financial Dept], Null As [Invoice-to Addr], itbp As [Invoice-to BP], Null As [Sold-to Address], ofbp As [Sold-to BP], paym As [Payment Method], Null As [Rate Type], Null As [SvcO Cost Sheet], 0 As [Act Order Amt], Null As [SOC Cancel Date], Null As [Coverage Type], Null As [Currency], Null As [Serv Contract], Null As [Service Type], Null As [Service Office], 0 As [Est Order Amt], Null As [Pricing Method], Null As [Plan Start Time], Null As [Warranty Type], 0 As [Act Cost Rate], Null As [Labor Type Cost], Null As [Labor Rate Code], Null As [Task], 0 As [Service Discount], 0 As [Est Cost rate], 0 As [Labor Est Qty], 0 As [Sales Inv Amt], Null As [Sales Inv Date], Null As [Labor Type Sales], Null As [Service Warranty], 0 As [Cost Amt War], 0 As [Actual Qty], Null As [Cost Type], Null As [Unit], Null As [Est Cost Line Id], Null As [Other Costs Items], Null As [Act Receipt Time], Null As [Maint SO], Null As [Planned Carrier 1], Null As [Item Delivery], 0 As [MO Delivered Qty], Null As [Delivery Whse], Null As [MO Line Status], Null As [Order Discount], Null As [Non SO Plan Deliv Date], Null As [Plan Rec Time], 0 As [Qty], Null As [Actual Carrier], Null As [Planned Carrier 2], 0 As [Received Qty], Null As [Shipment], Null As [Receipt Whse], stad As [Ship-to Address], stbp As [Ship-to BP], Null As [Sales Type], Null As [Work Order Num], Null As [MO Warranty], Null As [Desc], Null As [Installment Plan], Null As [MO Order Date], Null As [MO Order Status], 0 As [Amt Dom Curr], 0 As [Net Amt], cvat As [Tax Code], Null As [Manual Sales ID], Null As [Manual Lines], sfcp As [Financial Comp], 0 As [Tax Amt Dom], cofc As [Department], 0 As [Approved Amt], Null As [Approval Action], Null As [Approved By], Null As [Approval Desci], Null As [Approval Date], Null As [Approval Percent], Null As [Claim], 0 As [Claimed Amt], Null As [Claim Method], Null As [Appr Qty Unit], Null As [Claim Qty Unit], 0 As [CC Residual Value], Null As [Sales Doc Line], Null As [Sales Doc Seq], 0 As [Approved Qty], 0 As [Claimed Qty], Null As [Reject Action], Null As [Rejected By], Null As [Rejection Date], Null As [Reject Reasons], Null As [Return Matl Req], Null As [CC Line Status], Null As [Tagged To], Null As [Wait Supp Claim], Null As [CC Cancel Date], Null As [Creation Date], Null As [Failure Date], Null As [Int Sales Rep], Null As [Sales Inv Comp], Null As [Sales Doc Num], Null As [Sales Doc Type], Null As [Sales Ref Sys], Null As [Created By], Orderno As [Order Number], Convert(Varchar,[lineno]) As [Order Line Numb], [Table_ID] As [Table Desc], [Table_Flag] As [Table Shortcode], 0 As [Remain Order Qty], 0 As [Order Value Due], IsNull(amth_1,0) As [NetLineAmt Dom], deln As [Delivery Note], idoc As [Invoice Number], prel_kw As [Produc Relation], shln As [Shipment Line], srtp As [Source Type], ztimestamp As [Time of Action], ztran As [Inv Trans Type], Isnull(dqua,0) As [INV Delivered Qty], line As [Inv Line Seq], creg As [Area],
0 As [Back Order Qty],0 As [Ordered Qty],Null As [SO Order Status],Null As [SO Order Status Orig Desc],Null As [SO Order Status Desc], 
dwh_load_time As [DWH Load Time],srcp As [Source Company],'' As [site],0 As [Delivered Value],Null As [Ship Constraint Orig Desc],
Null As [Ship Constraint Desc]
 From [dwhcda].[lnc_fct_Sales_Invoice] 
 Where [deleted] = 'False' And ztran NOT IN ('PRO')
 ) A;
 GO