/**********************************************************************************************************************
View Name: [replncss].[fct GL Finalized Transactions]
Description: This view is created based on the Fact Table and joining with Dimension views / Tables which is exposed to the Tableau for Dashboard Build.

Data Type: Fact Data
Source Table:[dwhcda].[lnc_fct_GL_finalized_transactions]
Target View: [replncss].[fct GL Finalized Transactions]
Lookup Tables / Views : [replncss].[dim Category],[replncss].[dim Business Partners],[replncss].[dim GL Companies],[replncss].[dim Tax Codes],[replncss].[dim Departments],
[replncss].[dim Chart of Accounts],[replncss].[dim Enum Descriptions]

Original Project: JBT Finance GL
Developer: Pooja Thakur
Date: 09-09-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[fct GL Finalized Transactions];

CREATE VIEW [replncss].[fct GL Finalized Transactions]
AS 
select 
A.[adty] as [GL Category],
H.[Enum Desc] as [Category Desc],
A.[amnt] as [Amount],
A.[amth_1] as [Amt In HC 1],
A.[amth_2] as [Amt In HC 2],
A.[amth_3] as [Amt In HC 3],
A.[bpid] as [Business Partner],
A.[buex] as [Budget Exception],
I.[Enum Desc] as [Budget Exception Desc],
A.[cacc] as [Contra A/c],
A.[catg] as [Trn Category],
J.[Enum Desc] as [Trn Category Desc],
A.[ccty] as [Country For Tax],
A.[ccur] as [Curr/Rate],
A.[cdln] as [Correction Inv Detail Line],
A.[cfrs] as [Cash Flow Reason],
A.[cinv] as [Inv Correction],
A.[clin] as [Correction Line Number],
A.[compnr] as [Company Number],
A.[cont] as [Control A/c],
K.[Enum Desc] as [Control A/c Desc],
A.[corn] as [Standing Order],
A.[crdt] as [Creation Date],
A.[csrn] as [Standing Order Seq No.],
A.[ctyp] as [Trans Type Correction],
A.[cvat] as [Tax Code],
A.[zdate] as [Finalization Date],
A.[dbcr] as [Debit / Credit],
L.[Enum Desc] as [Debit / Credit Desc],
A.[dcdt] as [Document Date],
A.[dele] as [Deleted],
M.[Enum Desc] as [Deleted Desc],
A.[deleted] as [Whether Record Is Deleted],
A.[dim1] as [Dim 1],
A.[dim2] as [Dim 2],
A.[dim3] as [Dim 3],
A.[dim4] as [Dim 4],
A.[dim5] as [Dim 5],
A.[dim6] as [Dim 6],
A.[dim7] as [Dim 7],
A.[dim8] as [Dim 8],
A.[dim9] as [Dim 9],
A.[dm10] as [Dim 10],
A.[dm11] as [Dim 11],
A.[dm12] as [Dim 12],
A.[expd] as [Exclude From Payment Disc],
N.[Enum Desc] as [Exclude From Payment Disc Desc],
A.[fact_1] as [Rate Factor 1],
A.[fact_2] as [Rate Factor 2],
A.[fact_3] as [Rate Factor 3],
A.[fdoc] as [Original Document Number],
RIGHT('00' + CAST(ISNULL([fprd],0) AS VARCHAR),2) As [Fiscal Period],
RIGHT('00'+CAST(ISNULL([fprd],0) AS VARCHAR),2) + '-' + CAST([fyer] As VARCHAR) As [Fiscal Year Period],
A.[ftyp] as [Original Trn Type],
A.[fyer] as [Fiscal Year],
A.[intt] as [Integration Trn],
O.[Enum Desc] as [Integration Trn Desc],
A.[leac] as [Ledger A/c],
A.[obat] as [Batch],
A.[ocmp] as [Original Company],
A.[odoc] as [Document],
A.[olin] as [Line],
A.[osrl] as [Seq Number],
A.[osrn] as [Background Seq No.],
A.[otyp] as [Trn Type],
A.[oyer] as [Batch Year],
A.[qty1] as [Qty 1],
A.[qty2] as [Qty 2],
A.[ratd] as [Rate Date],
A.[rate_1] as [Rate 1],
A.[rate_2] as [Rate 2],
A.[rate_3] as [Rate 3],
A.[recl] as [Reconciliation Data Logged],
P.[Enum Desc] as [Reconciliation Data Logged Desc],
A.[reco] as [Reconciliation Area],
Q.[Enum Desc] as [Reconciliation Area Desc],
A.[recs] as [Reconciliation Subarea],
---A.[rprd] as [Reporting Period],
RIGHT('00' + CAST(ISNULL([rprd],0) AS VARCHAR),2) As [Reporting Period],
RIGHT('00'+CAST(ISNULL([rprd],0) AS VARCHAR),2) + '-' + CAST([ryer] As VARCHAR) As [Reporting Year Period],
A.[rtyp] as [Exchange Rate Type],
A.[ryer] as [Reporting Year],
A.[tcsh] as [Type Of Cash Trn],
R.[Enum Desc] as [Type Of Cash Trn Desc],
A.[tedt] as [Trn Entry Date],
A.[ztime] as [Finalization Time],
A.[ztimestamp] as [Time of Action],
A.[ztran] as [Type Of Trn],
A.[tran_kw] as [Type Of Trn Desc],
A.[vamh_1] as [Tax Amt In HC 1],
A.[vamh_2] as [Tax Amt In HC 2],
A.[vamh_3] as [Tax Amt In HC 3],
A.[vamt] as [Tax Amt In Payment Curr],
A.[vlac] as [Tax Ledger A/C],
---A.[vprd] as [Tax Period],
RIGHT('00' + CAST(ISNULL([vprd],0) AS VARCHAR),2) As [Tax Period],
A.[vtyp] as [Tax Origin],
S.[Enum Desc]  as [Tax Origin Desc],
A.[vyer] as [Tax Year],
RIGHT('00'+CAST(ISNULL([vprd],0) AS VARCHAR),2) + '-' + CAST([vyer] As VARCHAR) As [Tax Year Period],
A.[wtsc] as [Withholding Income Tax Or Social Contribution Applied],
T.[Enum Desc] as [Withholding Income Tax Or Social Contribution Applied Desc],
A.[dwh_load_time] as [Dwh Load Time],
A.[db_cr_amnt] as [Debit/Credit Amount],
A.[GL_finz_trans_key] as [GlFinzTransKey],
B. [Category],
B. [Category Type],
B. [Category Type Desc],
B. [Category Description],
B. [Responsible Employee],
B. [Responsible Office],
B. [Category Text],
C.[Address Code] as [BP Address Code],
C.[Country] as [BP Country],
C.[Country Name] as [BP Country Name],
C.[BP Name] as [BP Name],
C.[State/Province] As [BP State/Province],
C.[City Name] As [BP City Name],
C.[Business Partner Role Key] As [BP Role Key],
C.[Business Partner Role] As [BP Role Desc],
C.[BP Status] As [BP Status],
C.[BP Status Flag] As [BP Status Desc],
D.[Calendar Code],
D.[Currency System],
D.[Currency System Orig Desc],
D.[Currency Type A],
D.[Currency Type A Orig Desc],
D.[Currency Type B],
D.[Currency Type B Orig Desc],
D.[Currency Type C],
D.[Currency Type C Orig Desc],
D.[Company Type],
D.[Company Type Orig Desc],
D.[Company Desc],
D.[Transition Currency],
D.[Local Currency],
D.[Logistic Currency],
D.[Availability Type],
D.[Time Zone Code],
E.[Tax Code Desc],
F.[Department Name] As [Department Desc],
F.[Site] As [Department Site],
F.[Department Type Key] As [Department Type Key],
F.[Department Type] As [Department Type Desc],
G.[Allocation Type],
G.[Allocation Type Desc],
G.[Account Type],
G.[Account Type Desc],
G.[Debit/Credit Indicator],
G.[Debit/Credit Indicator Desc],
G.[Expense Type],
G.[Expense Type Desc],
G.[Ledger Account Desc],
G.[Legal Ledger Account Description],
G.[Legal Ledger Account]

FROM [dwhcda].[lnc_fct_GL_finalized_transactions] A

LEFT JOIN [replncss].[dim Category] B 
on --A.[compnr] = B.[Company] and 
A.[adty] = B.[Category]


LEFT JOIN [replncss].[dim Business Partners] C
on 	--A.[compnr] = C.[Company] And 
A.[bpid] = C.[Business Partner]

LEFT JOIN [replncss].[dim GL Companies] D
on --A.[compnr] = D.[Company] and 
A.[compnr] = D.[Company Number]

LEFT OUTER JOIN [replncss].[dim Tax Codes] E
on --A.[compnr] = E.[Company] and 
A.[cvat] = E.[Tax Code] and A.[ccty] = E.[Country]

LEFT JOIN [replncss].[dim Departments] F
on  --A.[compnr] = F.[Company number] And 
A.[dim1] = F.[Department]

LEFT JOIN [replncss].[dim Chart of Accounts] G
on  --A.[compnr] = G.[Company] And 
A.[leac] = G.[Ledger Account]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tfcmg.adty' And [Enum Language] = 'en_US') H
on A.[adty] = H.[Enum Value]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') I
on A.[buex] = I.[Enum Value]


LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tfgld.catg' And [Enum Language] = 'en_US') J
on A.[catg] = J.[Enum Value]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') K
on A.[cont] = K.[Enum Value]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tfgld.dbcr' And [Enum Language] = 'en_US') L
on A.[dbcr] = L.[Enum Value]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') M
on A.[dele] = M.[Enum Value]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') N
on A.[expd] = N.[Enum Value]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') O
on A.[intt] = O.[Enum Value]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') P
on A.[recl] = P.[Enum Value]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcreco' And [Enum Language] = 'en_US') Q
on A.[reco] = Q.[Enum Value]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tfcmg.tcsh' And [Enum Language] = 'en_US') R
on A.[tcsh] = R.[Enum Value]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tfgld.vtyp' And [Enum Language] = 'en_US') S
on A.[vtyp] = S.[Enum Value]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') T
on A.[wtsc] = T.[Enum Value];
GO


