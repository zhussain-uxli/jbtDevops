/**********************************************************************************************************************
View Name: [replncss].[fct Rep Production Receipts]
Description: This view is created based on the Fact Table which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from fact source table without any transformation logic.

Data Type: Fact Data
Source Table:lnc_fct_Rep_Production_Receipts
Target View: [replncss].[fct Rep Production Receipts]
Lookup Tables: None

Original Project: JBT Production Planning & Scheduling
Developer: Mohammed Majid
Date: 10-08-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[fct Rep Production Receipts];

CREATE VIEW [replncss].[fct Rep Production Receipts]
AS 
SELECT [acti] As [Activity],Case When Convert(Date,[ardt]) = '1970-01-01' Then Null Else Convert(Date,[ardt]) End As [Actual Receipt Date],[circ] As [Customer Item Revision],[cmnf] As [Manufacturer],[cmpl] As [Complete],[cmpl_kw]  As [Complete Desc],[compnr] As [Company number],[conf] As [Confirmed],[conf_kw] As [Confirmed Desc],[cwar] As [Receiving Warehouse],[deleted] As [Deleted],[dmse] As [Direct Material Supply Execution],[dmse_kw] As [Direct Material Supply Execution Desc],[dslo] As [Destination Location],[fire] As [Final Receipt],[fire_kw] As [Final Receipt Desc],Case When Convert(Date,[idat]) = '1970-01-01' Then Null Else Convert(Date,[idat]) End As [Inventory Date],[item] As [Items],[lsta] As [Line Status],[lsta_kw] As [Line Status Desc`],[oorg] As [Order Origin],[oorg_kw] As [Order Origin Desc],[orno] As [Order Number],[oset] As [Operation Set],[pono] As [Order Line],[psno] As [Packing Slip],[psqr] As [Packing Slip Qty in Receipt Unit],[psqu] As [Packing Slip Qty],[psun] As [Packing Slip Unit],[qadi] As [Inspection Qty],[qadv] As [Advised Qty],[qapr] As [Approved Qty],[qdes] As [Destroyed Qty],[qrcr] As [Received Qty in Receipt Unit],[qrec] As [Received Qty in Inv Unit],[qrej] As [Rejected Qty],[qrsc] As [Scrapped Qty],[rcln] As [Receipt Line],[rcno] As [Receipt Number],[rcun] As [Receipt Unit],[seqn] As [Order Sequence],[sfbp] As [Ship-from BP],Case When Convert(Date,[shdt]) = '1970-01-01' Then Null Else Convert(Date,[shdt]) End As [Shipping Date],[ztimestamp] As [Time of Action],Case When Convert(Date,[trdt]) = '1970-01-01' Then Null Else Convert(Date,[trdt]) End As [Transaction Date],[txtn] As [Receipt Line Text],[dwh_load_time] As [DWH Load Time],[carr] As [Carrier/LSP],[cdec] As [Delivery Terms],[hsta] As [Header Status],[hsta_kw] As [Header Status Desc],[ittp] As [Inv Trans Type],[ittp_kw] As [Inv Trans Type Desc],Case When Convert(Date,[odat]) = '1970-01-01' Then Null Else Convert(Date,[odat]) End As [Order Date],[sfsi] As [Ship-from Site],[sfad] As [Ship-from Address],[stad] As [Ship-to Address],[wdep] As [Office],[clsd] As [Closed],[clsd_kw] As [Closed Desc],[cwoc] As [Work Center],Case When Convert(Date,[prfd]) = '1970-01-01' Then Null Else Convert(Date,[prfd]) End As [Production Finish Date],[prmd] As [Production Model],Case When Convert(Date,[prsd]) = '1970-01-01' Then Null Else Convert(Date,[prsd]) End As [Production Start Date],[prsh] As [Production Schedule],[qrdr] As [Ordered Qty],[sdtp] As [Schedule Type],[sdtp_kw] As [Schedule Type Desc],[site] As [Site],[prod_rec_fct_key] As [Prod Rec Fct Key],Case When Convert(Date,[ardt]) = '1970-01-01' Then Null Else [ardt] End As [Actual Receipt Datetime]   
FROM [dwhcda].[lnc_fct_Rep_Production_Receipts]   
Where [deleted] = 'False';
GO
  