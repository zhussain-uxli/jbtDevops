/**********************************************************************************************************************
View Name: [replncss].[pdw LN PO Item]
Description: This view is created based on the DST Table which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from two DST source tables and joining these two tables to get the selected fields in View.

Data Type: Transaction Data

Source Table:[acq101].[dst_tdpur401]
Target View: [replncss].[pdw LN PO Item]
Lookup Tables: [acq101].[dst_tdpur400]

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 19-07-2021
Reviewed By: Atul Raje

Change History:

Date: 03/09/2021
As per request from Business, added new fields "hdst_kw","clyn_kw","bkyn_kw","ccur"

**********************************************************************************************************************/

--Drop View [replncss].[pdw LN PO Item];

CREATE VIEW [replncss].[pdw LN PO Item]
AS 
SELECT A.orno,A.pono,A.otbp,A.item,A.stsd,A.odat,A.oltp,A.cadr,A.cwar,A.cpay,A.invn,A.pric,A.invd,
	   A.qoor,A.qidl,A.cvat,A.cdec,A.cupp,A.ddta,A.ddtc,A.rdta,A.site,A.clyn,C.[Enum Desc] As clyn_kw,A.bkyn,D.[Enum Desc] As bkyn_kw,
	   B.sorn,B.hdst,B.hdst_kw,B.cotp,B.ccon,B.ccur,B.ratt,B.ratp_1,A.ztimestamp As [timestamp]
From   [acq101].[dst_tdpur401] A
LEFT JOIN (SELECT Distinct compnr,orno,sorn,hdst,cotp,ccon,ccur,ratt,ratp_1,tbl2.[Enum Desc] As hdst_kw 
From [acq101].[dst_tdpur400] tbl1
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdpur.hdst' And [Enum Language] = 'en_US') tbl2
on tbl1.[hdst] = tbl2.[Enum Value]
Where tbl1.deleted = 'False') B
ON A.compnr = B.compnr And A.orno = B.orno
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') C
on A.[clyn] = C.[Enum Value]
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') D
on A.[bkyn] = D.[Enum Value]  
Where A.deleted = 'False';
GO


/**********************************************************************************************************************
View Name: [replncss].[pdw LN PO Receipts]
Description: This view is created based on the DST Table which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Transaction Data

Source Table:[acq101].[dst_tdpur406]
Target View: [replncss].[pdw LN PO Receipts]
Lookup Tables: None

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 19-07-2021
Reviewed By: Atul Raje

Change History:

Date: 03/09/2021
As per request from Business, added new fields "site"

**********************************************************************************************************************/

--Drop View [replncss].[pdw LN PO Receipts];

CREATE VIEW [replncss].[pdw LN PO Receipts]
AS 
SELECT Distinct A.orno,A.pono,A.sqnb,A.ddte,A.qidl,A.qirj,B.site,A.ztimestamp As [timestamp]
FROM   [acq101].[dst_tdpur406] A
LEFT JOIN (SELECT Distinct compnr,orno,site
FROM   [acq101].[dst_tdpur401] Where deleted = 'False') B
ON A.compnr = B.compnr And A.orno = B.orno
Where A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[pdw LN PO Vouchers]
Description: This view is created based on the DST Table Open Items (Purchase Invoices and Payments) which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Transaction Data

Source Table:[acq101].[dst_tfacp200]
Target View: [replncss].[pdw LN PO Vouchers]
Lookup Tables: None

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 19-07-2021
Reviewed By: Atul Raje

Change History:

Date: 03/09/2021
As per request from Business, added new fields "site"

**********************************************************************************************************************/

--Drop View [replncss].[pdw LN PO Vouchers];

CREATE VIEW [replncss].[pdw LN PO Vouchers]
AS 
SELECT Distinct A.ttyp + Convert(Varchar,A.ninv) As ttyp_ninv,A.ifbp,A.isup,A.amti,A.docd,A.orno,A.line,A.ptyp,
A.cpay,A.rate_1,A.cvat,A.txdt,B.Site,A.ztimestamp As [timestamp]
FROM   [acq101].[dst_tfacp200] A
LEFT JOIN (SELECT Distinct compnr,orno,site
FROM   [acq101].[dst_tdpur401] Where deleted = 'False') B
ON A.compnr = B.compnr And A.orno = B.orno
Where A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[pdw LN Items]
Description: This view is created based on the DST Table ITEMS By Site & Items which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Dimension Data

Source Table:[acq101].[dst_tcibd150]
Target View: [replncss].[pdw LN Items]
Lookup Tables: dst_tcibd001

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 19-07-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[pdw LN Items];

CREATE VIEW [replncss].[pdw LN Items]
AS 
SELECT A.item,B.ppss,A.dscc,A.cwun,A.ctyp,
	   B.dsca,B.cuni,B.kitm,A.site,A.ztimestamp As [timestamp]
FROM   [acq101].[dst_tcibd150] A
LEFT JOIN (SELECT Distinct compnr,item,dsca,cuni,kitm,ppss 
From [acq101].[dst_tcibd001] Where deleted = 'False') B
ON A.compnr = B.compnr And A.item = B.item
Where A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[pwd LN Item Whse]
Description: This view is created based on the DST Table Item Inventory by Warehouse which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Dimension Data

Source Table:[acq101].[dst_whwmd215]
Target View: [replncss].[pwd LN Item Whse]
Lookup Tables: None

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 19-07-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[pwd LN Item Whse];

CREATE VIEW [replncss].[pwd LN Item Whse]
AS 
SELECT Distinct A.item,A.cwar,A.qall,A.qhnd,A.qord,A.ztimestamp As [timestamp]
FROM   [acq101].[dst_whwmd215] A
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[pwd Vendor]
Description: This view is created based on the DST Table Invoice-from Business partners which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Dimension Data

Source Table:[acq101].[dst_tccom122]
Target View: [replncss].[pwd Vendor]
Lookup Tables: None

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 19-07-2021
Reviewed By: Atul Raje

Change History:

Date: 03/09/2021
Changes done by lookup with LN_Enum table to get Key Descriptions.
**********************************************************************************************************************/

--Drop View [replncss].[pwd Vendor];

CREATE VIEW [replncss].[pwd Vendor]
AS 
SELECT Distinct A.ifbp,A.cbtp,A.bpst,B.[Enum Desc] As bpst_kw,A.ccur,A.ptbp,A.cpay,A.paym,A.clan,A.ccnt,A.telp,A.ztimestamp As [timestamp]
FROM   [acq101].[dst_tccom122] A
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tccom.bpst' And [Enum Language] = 'en_US') B
on A.[bpst] = B.[Enum Value]
Where A.[deleted] = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[pdw Vendor Address]
Description: This view is created based on the DST Table Vendor Address which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Dimension Data

Source Table:[acq101].[dst_tccom130]
Target View: [replncss].[pdw Vendor Address]
Lookup Tables: None

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 20-07-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[pdw Vendor Address];

CREATE VIEW [replncss].[pdw Vendor Address]
AS 
SELECT Distinct A.ifbp,B.nama,C.ln01,C.ln02,C.ln03,C.ln04,A.addr_dsca,A.addr_cste,C.pstc,A.con_dsca,A.ztimestamp As [timestamp]
FROM [dwhcda].[lnc_dim_tccom122] A
LEFT JOIN (SELECT Distinct compnr,bpid,nama 
From [acq101].[dst_tccom100] Where deleted = 'False') B
On 	A.compnr = B.compnr and A.ifbp = B.bpid
LEFT JOIN (SELECT Distinct compnr,cadr,ln01,ln02,ln03,ln04,pstc
FROM [acq101].[dst_tccom130] Where deleted = 'False') C
On A.compnr = C.compnr  And A.cadr = C.cadr
Where A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[pdw Terms]
Description: This view is created based on the DST Table Payment Terms which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Dimension Data

Source Table:[acq101].[dst_tcmcs013]
Target View: [replncss].[pdw Terms]
Lookup Tables: None

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 20-07-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[pdw Terms];

CREATE VIEW [replncss].[pdw Terms]
AS 
SELECT Distinct A.cpay,A.dsca,A.ztimestamp As [timestamp]
FROM   [acq101].[dst_tcmcs013] A
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[pdw Delivery Terms]
Description: This view is created based on the DST Table Delivery Terms which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Dimension Data

Source Table:[acq101].[dst_tcmcs041]
Target View: [replncss].[pdw Delivery Terms]
Lookup Tables: None

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 20-07-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[pdw Delivery Terms];

CREATE VIEW [replncss].[pdw Delivery Terms]
AS 
SELECT Distinct A.cdec,A.dsca,A.ztimestamp As [timestamp]
FROM   [acq101].[dst_tcmcs041] A
Where deleted = 'False';
GO

/**********************************************************************************************************************
--check required
View Name: [replncss].[pdw Shipping Code]
Description: This view is created based on the DST Table Production Warehouse Orders which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Transaction Data

Source Table:[acq101].[dst_timfc001]
Target View: [replncss].[pdw Shipping Code]
Lookup Tables: None

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 20-07-2021
Reviewed By: Atul Raje

Change History:

Date: 03/09/2021
Changes done by lookup with LN_Enum table to get Key Descriptions.

**********************************************************************************************************************/

--Drop View [replncss].[pdw Shipping Code];

CREATE VIEW [replncss].[pdw Shipping Code]
AS 
SELECT Distinct A.sfco,A.sfty,B.[Enum Desc] As sfty_kw,A.ztimestamp As [timestamp]
FROM   [acq101].[dst_timfc001] A
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tctyps' And [Enum Language] = 'en_US') B
on A.[sfty] = B.[Enum Value]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[pdw Reason]
Description: This view is created based on the DST Table Reasons which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Dimension Data

Source Table:[acq101].[dst_tcmcs005]
Target View: [replncss].[pdw Reason]
Lookup Tables: None

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 20-07-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[pdw Reason];

CREATE VIEW [replncss].[pdw Reason]
AS 
SELECT Distinct A.cdis,A.dsca,A.drpi,A.ztimestamp As [timestamp]
FROM   [acq101].[dst_tcmcs005] A
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[pdw Tax Code]
Description: This view is created based on the DST Table Tax Codes which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Dimension Data

Source Table:[acq101].[dst_tcmcs036]
Target View: [replncss].[pdw Tax Code]
Lookup Tables: None

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 22-07-2021
Reviewed By: Atul Raje

Change History:

Date: 03/09/2021
Changes done by lookup with LN_Enum table to get Key Descriptions.

**********************************************************************************************************************/

--Drop View [replncss].[pdw Tax Code];

CREATE VIEW [replncss].[pdw Tax Code]
AS 
SELECT Distinct A.tvat,B.[Enum Desc] As tvat_kw,A.cvat,A.dsca,A.ztimestamp As [timestamp]
FROM   [acq101].[dst_tcmcs036] A
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tctvat' And [Enum Language] = 'en_US') B
on A.[tvat] = B.[Enum Value]
Where A.[deleted] = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[pdw Unit of Measures]
Description: This view is created based on the DST Table which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Dimension Data

Source Table:[acq101].[dst_]
Target View: [replncss].[pdw Unit of Measures]
Lookup Tables: None

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 22-07-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[pdw Unit of Measures];

CREATE VIEW [replncss].[pdw Unit of Measures]
AS 
SELECT [appr],B.[Enum Desc] As [appr_kw],[basu],[citg],[compnr],[conv],[item],[rpow],[unit],[ztimestamp] As [timestamp]
FROM   [acq101].[dst_tcibd003] A
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') B
on A.[appr] = B.[Enum Value]
Where  A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[pwd LN Item Whse by Site]
Description: This view is created based on the DST Table Item - Warehousing by Site which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Dimension Data

Source Table:[acq101].[dst_whwmd404]
Target View: [replncss].[pwd LN Item Whse by Site]
Lookup Tables: None

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 03-09-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[pwd LN Item Whse by Site];

CREATE VIEW [replncss].[pwd LN Item Whse by Site]
AS
SELECT [abcc],[cfmd],[compnr],[ddlt],[dils],[dpth],[ffsi],[hght],[item],[ivgr],[nopr],[npsl],[pkdf],[ptxt],[qcma],[qcmi],[rgtm],[risk],[scst],
	[seak],[site],[slmp],[txta],[usab],[wdth],[ztimestamp] As [timestamp]  
FROM [acq101].[dst_whwmd404] A
Where A.deleted = 'False';
GO
  
/**********************************************************************************************************************
View Name: [replncss].pwd LN Inv by Whse Item EU]
Description: This view is created based on the DST Table Inventory by Warehouse, Item and Effectivity Unit which is exposed to the Tableau for Dashboard Build.This is a simple view by taking data from DST source tables to get the selected fields in View.

Data Type: Dimension Data

Source Table:[acq101].[dst_whwmd216]
Target View: [replncss].[pwd LN Inv by Whse Item EU]
Lookup Tables: None

Original Project: JBT Finance Procurement
Developer: Mohammed Majid
Date: 03-09-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[pwd LN Inv by Whse Item EU];

CREATE VIEW [replncss].[pwd LN Inv by Whse Item EU]
AS
SELECT [compnr],[cwar],[effn],[item],[qall],[qblk],[qbpl],[qcom],[qcpr],[qhnd],[qlal],[qnbl],[qnbp],[qord],[ztimestamp] As [timestamp]   
FROM [acq101].[dst_whwmd216] A
Where A.deleted = 'False';
GO

