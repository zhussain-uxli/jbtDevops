/**********************************************************************************************************************
View Name: [replncss].[dim Forecast Budgets]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Finance GL

Source Table:[dwhcda].[lnc_dim_tffbs005]
Target View: [replncss].[dim Forecast Budgets]
Lookup Tables: None
Developer: Pooja Thakur
Date: 13/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop VIEW [replncss].[dim Forecast Budgets];

CREATE VIEW [replncss].[dim Forecast Budgets]
As
SELECT
	[budg] As [Budget],
	[cbud] As [Comparison Budget],
	[cbyr] As [Comparison Budget Year],
	[ccur] As [Currency/Rate],
	[compnr] As [Company],
	[dbud] As [Derived from Budget],
	[dbyr] As [Derived from Budget Year],
	[defi] As [Definitive Budget],
	[disb] As [Distribution],
	[lmdt] As [Last Maintenance Date],
	[pbud] As [Parent Budget],
	[pbyr] As [Parent Budget Year],
	[ratc_1] As [Rate 1],
	[ratc_2] As [Rate 2],
	[ratc_3] As [Rate 3],
	[ratf_1] As [Rate Factor 1],
	[ratf_2] As [Rate Factor 2],
	[ratf_3] As [Rate Factor 3],
	[zyear]  As [Fiscal Year]
FROM [dwhcda].[lnc_dim_tffbs005]
Where deleted = 'False';
GO
	

/**********************************************************************************************************************
View Name: [replncss].[dim Forecast Budget Master]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Finance GL

Source Table:[dwhcda].[lnc_dim_tffbs003]
Target View: [replncss].[dim Forecast Budget Master]
Lookup Tables: None
Developer: Pooja Thakur
Date: 16/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop VIEW [replncss].[dim Forecast Budget Master];

CREATE VIEW [replncss].[dim Forecast Budget Master]
AS
SELECT
	[budg] As [Budget] ,
	[budm] As [Budgeting Method],
	[budm_kw] As [Budgeting Method Desc],
	[compnr] As [Company],
	[zdesc] As [Budget Desc],
	[llac] As [Link with Ledger Account],
	[llac_kw] As [Link with Ledger Account Desc],
	[nbpr] As [Number of Budget Periods],
	[sdbu] As [Flexible Budget],
	[sdbu_kw] As [Flexible Budget Desc]
FROM [dwhcda].[lnc_dim_tffbs003]
Where deleted = 'False';
GO
	
/**********************************************************************************************************************
View Name: [replncss].[dim Chart of Accounts]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Finance GL

Source Table:[dwhcda].[lnc_dim_tfgld008]
Target View: [replncss].[dim Chart of Accounts]
Lookup Tables: None
Developer: Pooja Thakur
Date: 16/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop VIEW [replncss].[dim Chart of Accounts];

CREATE VIEW [replncss].[dim Chart of Accounts]
AS
SELECT
	[alat] As [Allocation Type],
	[alat_kw] As [Allocation Type Orig Desc],
	B.[Enum Desc] As [Allocation Type Desc],
	[atyp] As [Account Type],
	[atyp_kw] As [Account Type Orig Desc],
	C.[Enum Desc] As [Account Type Desc],
	[compnr] As [Company],
	[dbcr] As [Debit/Credit Indicator],
	[dbcr_kw] As [Debit/Credit Indicator Orig Desc],
	D.[Enum Desc] As [Debit/Credit Indicator Desc],
	[etyp] As [Expense Type],
	[etyp_kw] As [Expense Type Orig Desc],
	E.[Enum Desc] As [Expense Type Desc],
	[leac] As [Ledger Account],
	[zdesc] As [Ledger Account Desc],
	[ledc] As [Legal Ledger Account Description],
	[lela] As [Legal Ledger Account]
FROM [dwhcda].[lnc_dim_tfgld008] A
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tfgld.atat' And [Enum Language] = 'en_US') B
on A.[alat] = B.[Enum Value]
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tfgld.atyp' And [Enum Language] = 'en_US') C
on A.[atyp] = C.[Enum Value]
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tfgld.dbcr' And [Enum Language] = 'en_US') D
on A.dbcr = D.[Enum Value]
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcetyp' And [Enum Language] = 'en_US') E
on A.etyp = E.[Enum Value]
Where deleted = 'False';	
GO

/**********************************************************************************************************************
View Name: [replncss].[dim GL Companies]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Finance GL

Source Table:[dwhcda].[lnc_dim_tcemm170]
Target View: [replncss].[dim GL Companies]
Lookup Tables: None
Developer: Pooja Thakur
Date: 16/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop VIEW [replncss].[dim GL Companies];

CREATE VIEW [replncss].[dim GL Companies]
AS
SELECT
	[ccal] As [Calendar Code],
	[comp] As [Company Number],
	[compnr] As [Company],
	[csys] As [Currency System],
	[csys_kw] As [Currency System Orig Desc],
	B.[Enum Desc] As [Currency System Desc],
	[ctya] as	[Currency Type A],
	[ctya_kw] as [Currency Type A Orig Desc],
	C.[Enum Desc] [Currency Type A Desc],
	[ctyb] As	[Currency Type B],
	[ctyb_kw] As	[Currency Type B Orig Desc],
	D.[Enum Desc] As [Currency Type B Desc],
	[ctyc] As	[Currency Type C],
	[ctyc_kw] As	[Currency Type C Orig Desc],
	E.[Enum Desc] As [Currency Type C Desc],
	[ctyp] As [Company Type],
	[ctyp_kw] As [Company Type Orig Desc],
	F.[Enum Desc] As [Company Type Desc],
	[zdesc] As [Company Desc],
	[euro] As [Transition Currency],
	[fcua] As [Local Currency],
	[lcur] As [Logistic Currency],
	[ract] As [Availability Type],
	[tzid] As [Time Zone Code]
FROM [dwhcda].[lnc_dim_tcemm170] A
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcemm.depe' And [Enum Language] = 'en_US') B
on A.[csys] = B.[Enum Value]
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcemm.curt' And [Enum Language] = 'en_US') C
on A.[ctya] = C.[Enum Value]
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcemm.curt' And [Enum Language] = 'en_US') D
on A.[ctyb] = D.[Enum Value]
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcemm.curt' And [Enum Language] = 'en_US') E
on A.[ctyc] = E.[Enum Value]
LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcemm.ctyp' And [Enum Language] = 'en_US') F
on A.[ctyp] = F.[Enum Value]
Where A.[deleted] = 'False';
GO	