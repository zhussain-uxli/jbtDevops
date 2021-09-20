/**********************************************************************************************************************
View Name: [replncss].[dim Currencies]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcmcs002]
Target View: [replncss].[dim Currencies]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/
--Drop View [replncss].[dim Currencies];

CREATE VIEW [replncss].[dim Currencies]
AS 
select 
brep	as [BLWI Reporting Curr Key],
brep_kw	as [BLWI Reporting Curr Flag],
ccur	as [Currency],
compnr	as [Company number],
crnd	as [Rounding Factor],
deleted	as [Whether record is deleted],
dsca	as [Currency Desc],
dscb	as [Currency Short Desc],
emuc	as [EMU Currency Key],
emuc_kw	as [EMU Currency Flag],
gtrf	as [Grand Total Rounding Factor],
iccc	as [ISO Currency Code] 
from [dwhcda].[lnc_dim_tcmcs002]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Companies]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tccom000]
Target View: [replncss].[dim Companies]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/
--Drop View [replncss].[dim Companies];

CREATE VIEW [replncss].[dim Companies]
AS 
select 
cadr	as [Address Code],
cbrn	as [Line of Business],
ccty	as [Country],
compnr	as [Company],
indt	as [Introduction Date],
ncmp	as [Company Number] 
from [dwhcda].[lnc_dim_tccom000]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Departments]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcmcs065]
Target View: [replncss].[dim Departments]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
Date:07/09/2021
Joined with Enum view to populate the key descriptions

**********************************************************************************************************************/

--Drop View [replncss].[dim Departments];

CREATE VIEW [replncss].[dim Departments]
AS 
SELECT
comp	as [Financial Company],
compnr	as [Company number],
cwoc	as [Department],
cwoc_eunt	as [Enterprise unit of Dept],
dsca	as [Department Name],
site	as [Site],
typd	as [Department Type Key],
typd_kw	as [Department Orig Type],
[Enum Desc]	as [Department Type] 
from [dwhcda].[lnc_dim_tcmcs065] A
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tctypd' And [Enum Language] = 'en_US') B
on [typd] = [Enum Value]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Countries]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcmcs010]
Target View: [replncss].[dim Countries]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/
--Drop View [replncss].[dim Countries];

CREATE VIEW [replncss].[dim Countries]
AS 
select
ccty	as [Country],
cgp1	as [BLWI Country Group],
cgp2	as [Tax Country Group],
compnr	as [Company],
dsca	as [Country Name],
meec	as [EU Member State Key],
meec_kw	as [EU Member State Flag] 
from [dwhcda].[lnc_dim_tcmcs010]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Business Partners]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tccom100]
Target View: [replncss].[dim Business Partners]
Lookup Tables: [acq101].[dst_tccom130]

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
Dt:18/06/2021
Joined to dst table "dst_tccom130" to get "State/Provinc" & "City Name" fields.

**********************************************************************************************************************/

--Drop View [replncss].[dim Business Partners];

CREATE VIEW [replncss].[dim Business Partners]
AS 
Select 
A.cadr 	  As [Address Code],
A.nama	  As [BP Name],
A.bpid	  As [Business Partner],
A.bprl	  As [Business Partner Role Key],
A.bprl_kw As [Business Partner Role],
A.compnr  As [Company],
A.prst	  As [BP Status],
A.prst_kw As [BP Status Flag] ,
A.ccty 	  As [Country],
A.dsca 	  As [Country Name],
B.cste	  As [State/Province],
B.dsca	  As [City Name]
From [dwhcda].[lnc_dim_tccom100] As A
Left Join (Select Distinct compnr,cadr,cste,dsca
From [acq101].[dst_tccom130] Where deleted = 'False') B
On A.compnr = B.compnr  And A.cadr = B.cadr
Where A.deleted = 'False';
GO


/**********************************************************************************************************************
View Name: [replncss].[dim Invoice-to Business Partners]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tccom112]
Target View: [replncss].[dim Invoice-to Business Partners]
Lookup Tables: [dwhcda].[lnc_dim_tccom100],[acq101].[dst_tccom130]

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
Dt:18/06/2021
Joined to dst table "dst_tccom130" to get "State/Provinc" & "City Name" fields.
**********************************************************************************************************************/

--Drop View [replncss].[dim Invoice-to Business Partners];

CREATE VIEW [replncss].[dim Invoice-to Business Partners] 
AS 
Select 
A.cadr 		As [Address Code],
A.cofc    	As [Department],
A.compnr    As [Company],
A.ccty 		As [Country],
A.dsca 		As [Country Name],
A.itbp 		As [Invoice-to BP],
B.nama 		As [Invoice-to BP Name],
C.cste	  	As [Invoice-to State/Province],
C.dsca	  	As [Invoice-to City Name]
From [dwhcda].[lnc_dim_tccom112] A
Left Outer Join (Select Distinct compnr,bpid,nama 
From [dwhcda].[lnc_dim_tccom100] Where deleted = 'False') B
On 	A.compnr = B.compnr and A.itbp = B.bpid
Left Join (Select Distinct compnr,cadr,cste,dsca
From [acq101].[dst_tccom130] Where deleted = 'False') C
On A.compnr = C.compnr  And A.cadr = C.cadr
Where A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [[replncss].[dim Invoice-from Business Partners]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tccom122]
Target View: [replncss].[dim Invoice-from Business Partners]
Lookup Tables: [dwhcda].[lnc_dim_tccom100]

Original Project: JBT Finance
Developer: Mohammed Majid
Date: 11-08-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[dim Invoice-from Business Partners]

CREATE VIEW [replncss].[dim Invoice-from Business Partners] 
AS 
Select
A.cadr 		As [Address Code],
A.cofc    	As [Department],
A.compnr 	As [Company],
A.[addr_ccty] 	As [Country],
A.[con_dsca] 	As [Country Name],
A.ifbp 		As [Invoice-from BP],
B.nama 		As [Invoice-from BP Name],
A.addr_cste	  	As [Invoice-from State/Province],
A.addr_dsca	  	As [Invoice-from City Name]
From [dwhcda].[lnc_dim_tccom122] A
Left Join (Select Distinct compnr,bpid,nama
From [dwhcda].[lnc_dim_tccom100] Where deleted = 'False') B
on A.compnr = B.compnr and A.ifbp = B.bpid
Where A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Sold-to Business Partners]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tccom110]
Target View: [replncss].[dim Sold-to Business Partners]
Lookup Tables: [dwhcda].[lnc_dim_tccom100],[acq101].[dst_tccom130]

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 13-05-2021
Reviewed By: Atul Raje

Change History:
Dt:18/06/2021
Joined to dst table "dst_tccom130" to get "State/Provinc" & "City Name" fields.
**********************************************************************************************************************/

--Drop View [replncss].[dim Sold-to Business Partners]

CREATE VIEW [replncss].[dim Sold-to Business Partners] 
AS 
Select
A.cadr 		As [Address Code],
A.compnr 	As [Company],
A.[ccty] 	As [Country],
A.[dsca] 	As [Country Name],
A.ofbp 		As [Sold-to BP],
B.nama 		As [Sold-to BP Name],
C.cste	  	As [Sold-to State/Province],
C.dsca	  	As [Sold-to City Name],
C.glat		As [Sold-to Latitude],
C.glon		As [Sold-to Longitude]
From [dwhcda].[lnc_dim_tccom110] A
Left Join (Select Distinct compnr,bpid,nama
From [dwhcda].[lnc_dim_tccom100] Where deleted = 'False') B
on A.compnr = B.compnr and A.ofbp=B.bpid
Left Join (Select Distinct compnr,cadr,cste,dsca,glat,glon
From [acq101].[dst_tccom130] Where deleted = 'False') C
On A.compnr = C.compnr  And A.cadr = C.cadr
Where A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Ship-to Business Partners]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tccom111]
Target View: [replncss].[dim Ship-to Business Partners]
Lookup Tables: [dwhcda].[lnc_dim_tccom100],[acq101].[dst_tccom130]

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 13-05-2021
Reviewed By: Atul Raje

Change History:
Dt:18/06/2021
Joined to dst table "dst_tccom130" to get "State/Provinc" & "City Name" fields.
**********************************************************************************************************************/

--Drop View [replncss].[dim Ship-to Business Partners]

CREATE VIEW [replncss].[dim Ship-to Business Partners] 
AS 
Select
A.cadr 		As [Address Code],
A.compnr 	As [Company],
A.[ccty] 	As [Country],
A.[dsca] 	As [Country Name],
A.stbp 		As [Ship-to BP],
B.nama 		As [Ship-to BP Name],
C.cste	  	As [Ship-to State/Province],
C.dsca	  	As [Ship-to City Name],
C.glat		As [Ship-to Latitude],
C.glon		As [Ship-to Longitude]
From [dwhcda].[lnc_dim_tccom111] A
Left Join (Select Distinct compnr,bpid,nama
From [dwhcda].[lnc_dim_tccom100] Where deleted = 'False') B
on A.compnr = B.compnr and A.stbp=B.bpid
Left Join (Select Distinct compnr,cadr,cste,dsca,glat,glon
From [acq101].[dst_tccom130] Where deleted = 'False') C
On A.compnr = C.compnr  And A.cadr = C.cadr
Where A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [[replncss].[dim Pay-by Business Partners]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tccom114]
Target View: [replncss].[dim Pay-by Business Partners]
Lookup Tables: [dwhcda].[lnc_dim_tccom100]

Original Project: JBT Finance
Developer: Pooja Thakur
Date: 13-08-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[dim Pay-by Business Partners]

CREATE VIEW [replncss].[dim Pay-by Business Partners] 
AS 
Select
A.cadr 		As [Address Code],
A.cofc    	As [Department],
A.compnr 	As [Company],
A.[addr_ccty] 	As [Country],
A.[con_dsca] 	As [Country Name],
A.pfbp 		As [Pay-by BP],
B.nama 		As [Pay-by BP Name],
A.addr_cste	  	As [Pay-by State/Province],
A.addr_dsca	  	As [Pay-by City Name]
From [dwhcda].[lnc_dim_tccom114] A
Left Join (Select Distinct compnr,bpid,nama
From [dwhcda].[lnc_dim_tccom100] Where deleted = 'False') B
on A.compnr = B.compnr and A.pfbp = B.bpid
Where A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [[replncss].[dim Pay-to Business Partners]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tccom124]
Target View: [replncss].[dim Pay-to Business Partners]
Lookup Tables: [dwhcda].[lnc_dim_tccom100]

Original Project: JBT Finance
Developer: Pooja Thakur
Date: 13-08-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[dim Pay-to Business Partners]

CREATE VIEW [replncss].[dim Pay-to Business Partners] 
AS 
Select
A.cadr 		As [Address Code],
A.cofc    	As [Department],
A.compnr 	As [Company],
A.[addr_ccty] 	As [Country],
A.[con_dsca] 	As [Country Name],
A.ptbp 		As [Pay-to BP],
B.nama 		As [Pay-to BP Name],
A.addr_cste	  	As [Pay-to State/Province],
A.addr_dsca	  	As [Pay-to City Name]
From [dwhcda].[lnc_dim_tccom124] A
Left Join (Select Distinct compnr,bpid,nama
From [dwhcda].[lnc_dim_tccom100] Where deleted = 'False') B
on A.compnr = B.compnr and A.ptbp = B.bpid
Where A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [[replncss].[dim Buy-from Business Partners]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tccom120]
Target View: [replncss].[dim Buy-from Business Partners]
Lookup Tables: [dwhcda].[lnc_dim_tccom100]

Original Project: JBT Finance
Developer: Pooja Thakur
Date: 13-08-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[dim Buy-from Business Partners]

CREATE VIEW [replncss].[dim Buy-from Business Partners] 
AS 
Select
A.cadr 		As [Address Code],
A.compnr 	As [Company],
A.[addr_ccty] 	As [Country],
A.[con_dsca] 	As [Country Name],
A.otbp 		As [Buy-from BP],
B.nama 		As [Buy-from BP Name],
A.addr_cste	  	As [Buy-from State/Province],
A.addr_dsca	  	As [Buy-from City Name]
From [dwhcda].[lnc_dim_tccom120] A
Left Join (Select Distinct compnr,bpid,nama
From [dwhcda].[lnc_dim_tccom100] Where deleted = 'False') B
on A.compnr = B.compnr and A.otbp = B.bpid
Where A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [[replncss].[dim Ship-from Business Partners]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tccom121]
Target View: [replncss].[dim Ship-from Business Partners]
Lookup Tables: [dwhcda].[lnc_dim_tccom100]

Original Project: JBT Finance
Developer: Mohammed Majid
Date: 11-08-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[dim Ship-from Business Partners]

CREATE VIEW [replncss].[dim Ship-from Business Partners] 
AS 
Select
A.cadr 		As [Address Code],
A.compnr 	As [Company],
A.[addr_ccty] 	As [Country],
A.[con_dsca] 	As [Country Name],
A.sfbp 		As [Ship-from BP],
B.nama 		As [Ship-from BP Name],
A.addr_cste	  	As [Ship-from State/Province],
A.addr_dsca	  	As [Ship-from City Name]
From [dwhcda].[lnc_dim_tccom121] A
Left Join (Select Distinct compnr,bpid,nama
From [dwhcda].[lnc_dim_tccom100] Where deleted = 'False') B
on A.compnr = B.compnr and A.sfbp = B.bpid
Where A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim PaymentTerms]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcmcs013]
Target View: [replncss].[dim PaymentTerms]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim PaymentTerms]

CREATE VIEW [replncss].[dim PaymentTerms]
AS 
select
dsca    as [Payment Terms Company],
compnr   as [Company],
cpay  	 as [Payment Terms],
pper     as [Payment Period],
ptyp     as [Payment Period Type Key],
ptyp_kw  as  [Payment Period Type],
tlsd     as  [Shift in Due Dt Tolerance],
tola     as  [Discount Amount Tolerance],
told     as  [Discount Percentage Tolerance],
tolp     as  [Discount Period Tolerance] 
from [dwhcda].[lnc_dim_tcmcs013]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Items]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcibd001]
Target View: [replncss].[dim Items]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 13-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Items]

CREATE VIEW [replncss].[dim Items]
AS 
select
dsca	as [Items Desc],
citg	as [Item Group],
compnr	as [Company],
cpcl	as [Product Class],
cpln	as [Product Line],
csig	as [Item Signal],
ctyo	as [Country of Origin],
ctyp	as [Product Type],
cuni	as [Inventory Unit],
item	as [Item],
seri	as [Serialized],
srce	as [Default Supply Source] 
from [dwhcda].[lnc_dim_tcibd001]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Tax Classification]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tctax016]
Target View: [replncss].[dim Tax Classification]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 13-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Tax Classification]

CREATE VIEW [replncss].[dim Tax Classification]
AS 
select 
[bpcl] as [Tax Classification],
[compnr] as [Company],
[dsca] as [Tax Classification Desc],
[pvat] as [Max W/Tax %],
[scta] as [SCT Allowed],
[scta_kw] as [SCT Allowed Falg],
[whta] as [WIT Allowed],
[whta_kw] as [WIT Allowed Flag] 
from [dwhcda].[lnc_dim_tctax016]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Lines of Business]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcmcs031]
Target View: [replncss].[dim Lines of Business]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 13-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Lines of Business]

CREATE VIEW [replncss].[dim Lines of Business]
AS 
select
[cbrn] as [Line of Business],
[compnr] as [Company],
[dsca] as [Line of Business Desc] 
from [dwhcda].[lnc_dim_tcmcs031]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Carriers/LSP]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcmcs080]
Target View: [replncss].[dim Carriers/LSP]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 13-05-2021
Reviewed By: Atul Raje

Change History:
Date:07/09/2021
Joined with Enum view to populate the key descriptions
**********************************************************************************************************************/

--Drop View [replncss].[dim Carriers/LSP]

CREATE VIEW [replncss].[dim Carriers/LSP]
AS 
SELECT
dsca   as  [Carrier/LSP Desc],
cfrw    as  [Carrier/LSP],
compnr  as [Company],
deleted  as [Deleted Record],
scac    as  [Carrier Alpha Code],
suno    as  [Buy-from Business Partner],
trmd    as  [Transport Category],
trmd_kw as  [Transport Category Orig Desc], 
[Enum Desc] as [Transport Category Desc] 
from [dwhcda].[lnc_dim_tcmcs080] A
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tccom.trmd' And [Enum Language] = 'en_US') B
On [trmd] = [Enum Value]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Sales Office]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tdsls012]
Target View: [replncss].[dim Sales Office]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 13-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Sales Office]

CREATE VIEW [replncss].[dim Sales Office]
AS 
select
cofc      as   [Sales Office],
compnr    as [Company],
dsca      as  [Sales Office Desc],
site      as  [Site] 
from [dwhcda].[lnc_dim_tdsls012]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Purchase Office]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Finance Model

Source Table:[dwhcda].[lnc_dim_tdpur012]
Target View: [replncss].[dim Purchase Office]
Lookup Tables: None
Developer: Pooja Thakur
Date: 16/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop VIEW [replncss].[dim Purchase Office];

CREATE VIEW [replncss].[dim Purchase Office]
AS
SELECT
	[compnr] AS	[Company],
	[cofc] 	AS	[Purchase Office],
	[dsca] 	AS	[Description],
	[site] 	AS	[Site],
	[cwar] 	AS	[Warehouse],
	[ngpo] 	AS	[Purchase Order Group]
FROM [dwhcda].[lnc_dim_tdpur012]
Where deleted = 'False';
GO


/**********************************************************************************************************************
View Name: [replncss].[dim Warehouse]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcmcs003]
Target View: [replncss].[dim Warehouse]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 13-05-2021
Reviewed By: Atul Raje

Change History:
Dt:02/08/2021
Warehouse dim table (lnc_dim_tcmcs003) is joined with Warehouses dim table (lnc_dim_whwmd200) to get the Blocked for Inbound and Outbound fields.

Date:07/09/2021
Joined with Enum view to populate the key descriptions
**********************************************************************************************************************/

--Drop View [replncss].[dim Warehouse]

CREATE VIEW [replncss].[dim Warehouse]
AS 
Select
A.dsca      As [Warehouse Desc],
A.cadr      As [Address Code],
A.comp      As [Financial Company],
A.compnr    As [Company],
A.cwar      As [Warehouse],
A.cwar_eunt As [Enterprise unit of Wh],
A.imbp      As [Inventory Mgt Business Partner],
A.xsit      As [External Site],
A.xsit_kw   As [External Site Orig Flag],
C.[Enum Desc]   As [External Site Flag],
B.binb		As [Blocked for Inbound],
B.binb_kw	As [Blocked for Inbound Orig Desc],
D.[Enum Desc]	As [Blocked for Inbound Desc],
B.bout		As [Blocked for Outbound],
B.bout_kw	As [Blocked for Outbound Orig Desc],
E.[Enum Desc]	As [Blocked for Outbound Desc]
FROM [dwhcda].[lnc_dim_tcmcs003] A
LEFT JOIN (Select Distinct binb,binb_kw,bout,bout_kw,compnr,cwar 
From [dwhcda].[lnc_dim_whwmd200] Where deleted = 'False') B
ON A.compnr = B.compnr AND A.cwar = B.cwar
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcynna' And [Enum Language] = 'en_US') C
on [xsit] = C.[Enum Value]
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'whwmd.byni' And [Enum Language] = 'en_US') D
on [binb] = D.[Enum Value]
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'whwmd.byni' And [Enum Language] = 'en_US') E
on [bout] = E.[Enum Value]
Where A.deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Employees – General]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tccom001]
Target View: [replncss].[dim Employees – General]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Employees – General];

CREATE VIEW [replncss].[dim Employees – General]
AS 
SELECT 
nama	as [Employee Name],
namb	as [Given Name],
namd	as [Last Name],
compnr	as [Company],
emno	as [Employee],
loco	as [Logon Code] 
from [dwhcda].[lnc_dim_tccom001]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Point of Title Passage]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcmcs042]
Target View: [replncss].[dim Point of Title Passage]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Point of Title Passage]

CREATE VIEW [replncss].[dim Point of Title Passage]
AS 
select 
compnr	as [Company],
ptpa	as [Point of Title Passage],
dsca	as [PoT Passage Desc],
spec	as [PoT Passage Spec Key],
spec_kw	as [PoT Passage Spec] 
from [dwhcda].[lnc_dim_tcmcs042]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Reasons]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcmcs005]
Target View: [replncss].[dim Reasons]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Reasons]

CREATE VIEW [replncss].[dim Reasons]
AS 
select 
compnr	as [Company],
cdis    as [Reason],
dsca	as [Reason Desc],
etrt	as [Excess Transportation Reason Key],
etrt_kw	as [Excess Transportation Reason],
rstp	as [Reason Type Key],
rstp_kw	as [Reason Type] 
from [dwhcda].[lnc_dim_tcmcs005]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Sales Order Types]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tdsls094]
Target View: [replncss].[dim Sales Order Types]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 13-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Sales Order Types]

CREATE VIEW [replncss].[dim Sales Order Types]
AS 
select
dsca	as [Sales Order Type Desc],
compnr	as [Company],
sotp	as [Sales Order Type] 
from [dwhcda].[lnc_dim_tdsls094]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Change Reasons]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tdsls097]
Target View: [replncss].[dim Change Reasons]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 13-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Change Reasons]

CREATE VIEW [replncss].[dim Change Reasons]
AS 
select 
compnr	as [Company],
crcd	as [Change Reason],
dsca	as [Change Reason Desc] 
from [dwhcda].[lnc_dim_tdsls097]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Sales Type]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcmcs202]
Target View: [replncss].[dim Sales Type]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Sales Type]

CREATE VIEW [replncss].[dim Sales Type] 
AS 
Select
[cfrs]		as [Cash Flow Reason],
[compnr]	as [Company],
[zdesc]	    as [Sales Type Desc],
[styp]	    as [Sales Type],
[z5tp]		as [Z5 Type],
[z5tp_kw]		as [Z5 Type Orig Desc],
B.[Enum Desc]	as [Z5 Type Desc]
from [dwhcda].[lnc_dim_tcmcs202] A
LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcmcs.z5tp' And [Enum Language] = 'en_US') B
on A.[z5tp] = B.[Enum Value]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Tax Codes]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcmcs036]
Target View: [replncss].[dim Tax Codes]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Tax Codes]

CREATE VIEW [replncss].[dim Tax Codes]
AS 
select 
ccty	as [Country],
compnr	as [Company],
cvat	as  [Tax Code],
dsca	as [Tax Code Desc] 
from [dwhcda].[lnc_dim_tcmcs036]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Delivery Terms]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcmcs041]
Target View: [replncss].[dim Delivery Terms]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/
--Drop View [replncss].[dim Delivery Terms];

CREATE VIEW [replncss].[dim Delivery Terms]
AS 
select 
dsca	as [Delivery Terms Desc],
cdec	as [Delivery Terms],
compnr	as [Company] 
from [dwhcda].[lnc_dim_tcmcs041]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Payment Method]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tfcmg003]
Target View: [replncss].[dim Payment Method]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 10-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Payment Method]

CREATE VIEW [replncss].[dim Payment Method]
AS 
select
compnr	as [Company],
[zdesc]	as [Payment Method Desc],
paym	as [Payment/Receipt Method] 
from [dwhcda].[lnc_dim_tfcmg003]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Category]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Sales

Source Table:[dwhcda].[lnc_dim_tdpct001]
Target View: [replncss].[dim Category]
Lookup Tables: None
Developer: Pooja Thakur
Date: 16/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop VIEW [replncss].[dim Category];

CREATE VIEW [replncss].[dim Category]
AS
SELECT
	[catc] As [Category],
	[compnr] As [Company],
	[ctyp] As [Category Type],
	[ctyp_kw] As [Category Type Desc],
	[dsca] As [Category Description],
	[remp] As [Responsible Employee],
	[rofc] As [Responsible Office],
	[txta] As [Category Text]
FROM [dwhcda].[lnc_dim_tdpct001]
Where deleted = 'False';		
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Category Structure]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Sales

Source Table:[dwhcda].[lnc_dim_tdpct002]
Target View: [replncss].[dim Category Structure]
Lookup Tables: None
Developer: Pooja Thakur
Date: 16/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop VIEW [replncss].[dim Category Structure];

CREATE VIEW [replncss].[dim Category Structure]
AS
SELECT
	[catc] As [Category],
	[city] As [Category/Item Flag],
	[cmnf] As [Manufacturer],
	[compnr] As [Company],
	[item] As [Item],
	[otbp] As [Buy-from Business Partner],
	[pono] As [Position],
	[scat] As [Category Structure],
	[txta] As [Text]
FROM [dwhcda].[lnc_dim_tdpct002]
Where deleted = 'False';	
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Item Inventory by Warehouse]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_whwmd215]
Target View: [replncss].[dim Item Inventory by Warehouse]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 13-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Item Inventory by Warehouse]

CREATE VIEW [replncss].[dim Item Inventory by Warehouse]
AS 
Select
[compnr] as [Company],
[cwar] as [Warehouse],
[item] as [Item],
[ltdt] as [Last Inventory Transaction Date],
[qall]  as [Inventory Allocated],
[qblk]  as [Inventory Blocked],
[qbpl]  as [Inventory Blocked for Planning],
[qcal]  as [Consignment Inventory Location Allocated],
[qchd]  as [Consignment Inventory on Hand],
[qcis]  as [Cumulative Issue],
[qcit]  as [Consignment Inventory in Transit],
[qcom]  as [Inventory Committed],
[qcor]  as [Consignment on Order],
[qcpr]  as [Inventory Committed in Process],
[qcrj]  as [Consigned Quarantine],
[qgit]  as [Goods in Transit],
[qhib]  as [Historical Balance],
[qhnd]  as [Inventory on Hand],
[qhrj]  as [Company Owned Quarantine Inventory],
[qint]  as [Inventory in Transit],
[qlal]  as [Inventory Location Allocated],
[qnal]  as [Cust Owned Location Allocated],
[qnbl]  as [Cust Owned Blocked],
[qnbp]  as [Cust Owned Blocked for Planning],
[qnhd]  as [Cust Owned on Hand],
[qnit]  as [Cust Owned in Transit],
[qnor]  as [Cust Owned on Order],
[qnrj]  as [Cust Owned Quarantine],
[qoal]  as [Comp Owned Location Allocated],
[qoor]  as [Comp Owned on Order],
[qord]  as [Inventory on Order]
From [dwhcda].[lnc_dim_whwmd215]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Sites]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Finance Model

Source Table:[dwhcda].[lnc_dim_tcemm050]
Target View: [replncss].[dim Sites]
Lookup Tables: None
Developer: Pooja Thakur
Date: 16/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop VIEW [replncss].[dim Sites];

CREATE VIEW [replncss].[dim Sites]
AS
SELECT
	[cadr] As [Address],
	[compnr] As [Company],
	[zdesc] As [Sites Description],
	[psit] As [Parent Site],
	[scat] As [Site Category],
	[site] As [Site],
	[stat] As [Site Status],
	[txta] As [Text],
	[xsit] As [External Site]
FROM [dwhcda].[lnc_dim_tcemm050]
Where deleted = 'False'
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Item By Site]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_tcibd150]
Target View: [replncss].[dim Item By Site]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 17-06-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

CREATE VIEW [replncss].[dim Item By Site]
AS 
SELECT
[compnr] as [Company],
[item] as [Item],
[site] as [Site],
[srce] as [Default Supply Source By Site],
[srce_kw] as [Default Supply Source By Site Org Desc],
[Enum Desc] as [Default Supply Source By Site Desc]
FROM [dwhcda].[lnc_dim_tcibd150] A
LEFT JOIN (SELECT Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcsrce' And [Enum Language] = 'en_US') B
on A.[srce] = B.[Enum Value] 
Where A.[deleted] = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Warehouses]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_whwmd200]
Target View: [replncss].[dim Warehouses]
Lookup Tables: None

Original Project: JBT Sales
Developer: Pooja Thakur
Date: 02-08-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[dim Warehouses]

CREATE VIEW [replncss].[dim Warehouses]
AS 
Select
binb		As [Blocked for Inbound],
binb_kw		As [Blocked for Inbound Desc],
bout		As [Blocked for Outbound],
bout_kw		As [Blocked for Outbound Desc],
compnr      As [Company],
cwar        As [Warehouse]
From [dwhcda].[lnc_dim_whwmd200]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Enum Descriptions]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Source Table:[dwhcda].[lnc_dim_enum]
Target View: [replncss].[dim Enum Descriptions]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 20/08/2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[dim Enum Descriptions];

CREATE VIEW [replncss].[dim Enum Descriptions]
AS 
Select 
const 			As [Enum Value],
description 	As [Enum Desc],
zdomain 		As [Enum Domain],
keyword 		As [Enum Keyword],
zlanguage 		As [Enum Language]
FROM [dwhcda].[lnc_dim_enum]
Where deleted = 'False';
GO

