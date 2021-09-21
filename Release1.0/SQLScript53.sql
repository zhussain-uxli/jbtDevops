/**********************************************************************************************************************
View Name: [replncss].[fct General Ledger Act Budg Fcst]
Description: This view is created based on the 3 Fact Tables and joining with Dimension views / Tables which is exposed to the Tableau for Dashboard Build.

Data Type: Fact Data
Source Table:[dwhcda].[lnc_fct_GL_hist_opening_balance],[dwhcda].[lnc_fct_GL_hist_transactions],[dwhcda].[lnc_fct_forecast_budget_amount]
Target View: [replncss].[fct General Ledger Act Budg Fcst]
Lookup Tables / Views : [replncss].[dim Companies],[replncss].[dim Business Partners],[replncss].[dim Currencies],[replncss].[dim Departments],[replncss].[dim Chart of Accounts],[replncss].[dim Forecast Budget Master],[replncss].[dim Forecast Budgets],[dwhcda].[lnc_dim_tcmcs061_Ext],[dwhcda].[lnc_dim_country_region],
[replncss].[dim Enum Descriptions]

Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 08-09-2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[fct General Ledger Act Budg Fcst];

CREATE VIEW [replncss].[fct General Ledger Act Budg Fcst]
AS 
SELECT A.[Budget Original Amt],A.[Budget Amt],A.[Created in Background],A.[Created in Background Desc],A.[Budget Code],A.[Business Partner],A.[Currency],A.[Company Number],A.[Company],A.[Complementary Amt],A.[DB/CR Indicator],A.[DB/CR Indicator Desc],A.[Dimension 1],A.[Dimension 2],A.[Dimension 3],A.[Dimension 4],A.[Dimension 5],A.[Dimension 6],A.[Dimension 7],A.[Dimension 8],A.[Dimension 9],A.[Dimension 10],A.[Dimension 11],A.[Dimension 12],A.[Dual Accounting Indicator],L.[Enum Desc] As [Dual Accounting Indicator Desc],A.[Open Bal Finalized Trns In HC 1],A.[Open Bal Finalized Trns In HC 2],A.[Open Bal Finalized Trns In HC 3],A.[Open Bal Finalized Trns In DWH Curr],A.[Open Bal Finalized Trns In Reference Curr],A.[Finalized Credit Amt in HC 1],A.[Finalized Credit Amt in HC 2],A.[Finalized Credit Amt in HC 3],A.[Finalized Credit Amt in DWH Curr],A.[Finalized Credit Amt in Reference Curr],A.[Finalized Credit Amt],A.[Finalized Debit Amt in HC 1],A.[Finalized Debit Amt in HC 2],A.[Finalized Debit Amt in HC 3],A.[Finalized Debit Amt in DWH Curr],A.[Finalized Debit Amt in Reference Curr],A.[Finalized Qty 1],A.[Finalized Qty 2],A.[Open Bal Finalized Trns],A.[Ledger A/C],A.[Open Bal Not Final Qty 1],A.[Open Bal Not Final Qty 2],A.[Open Bal Not Finalized Trns In HC 1],A.[Open Bal Not Finalized Trns In HC 2],A.[Open Bal Not Finalized Trns In HC 3],A.[Open Bal Not Finalized Trns In DWH Curr],A.[Open Bal Not Finalized Trns In Reference Curr],A.[Open Bal Not Finalized Trns],A.[Not Final Credit Amt in HC 1],A.[Not Final Credit Amt in HC 2],A.[Not Final Credit Amt in HC 3],A.[Not Finalized Credit Amt in DWH Curr],A.[Not Finalized Credit Amt in Reference Curr],A.[Not Final Credit Amt],A.[Not Final Debit Amt in HC 1],A.[Not Final Debit Amt in HC 2],A.[Not Final Debit Amt in HC 3],A.[Not Finalized Debit Amt in DWH Curr],A.[Not Finalized Debit Amt in Reference Curr],A.[Not Final Debit Amt],A.[Not Final Quantity 1],A.[Not Final Quantity 2],A.[Send To Olap],A.[Open Bal Finalized Qty 1],A.[Open Bal Finalized Qty 2],A.[Budget Qty 1],A.[Budget Qty 2],A.[Statutory Amt],A.[Fiscal Period],A.[Period Type],M.[Enum Desc] As [Period Type Desc],A.[Fiscal Year Period],A.[Fiscal Year],A.[DWH Load Time],A.[Time of Action],A.[GL Rec Fct Key],A.[Table Shortcode],A.[Table Desc],
B.[Address Code] As [Company Address Code],B.[Line of Business] As [Company Line of Business],B.[Country] As [Company Country],
C.[Address Code] as [BP Address Code],C.[Country] as [BP Country],C.[Country Name] as [BP Country Name],C.[BP Name] as [BP Name],C.[State/Province] As [BP State/Province],C.[City Name] As [BP City Name],C.[Business Partner Role Key] As [BP Role Key],C.[Business Partner Role] As [BP Role Desc],
C.[BP Status] As [BP Status],C.[BP Status Flag] As [BP Status Desc],
D.[BLWI Reporting Curr Key],D.[BLWI Reporting Curr Flag],D.[Rounding Factor],D.[Currency Desc],D.[Currency Short Desc],D.[EMU Currency Key],
D.[EMU Currency Flag],D.[Grand Total Rounding Factor],D.[ISO Currency Code],
E.[Department Name] As [Department Desc],E.[Site] As [Department Site],E.[Department Type Key] As [Department Type Key],E.[Department Type] As [Department Type Desc],
F.[Allocation Type],F.[Allocation Type Desc],F.[Account Type],F.[Account Type Desc],F.[Debit/Credit Indicator],F.[Debit/Credit Indicator Desc],
F.[Expense Type],F.[Expense Type Desc],F.[Ledger Account Desc],F.[Legal Ledger Account Description],F.[Legal Ledger Account],
G.[Budgeting Method],G.[Budgeting Method Desc],G.[Budget Desc],G.[Link with Ledger Account],G.[Link with Ledger Account Desc],
G.[Number of Budget Periods],G.[Flexible Budget],G.[Flexible Budget Desc],
H.[Rate 1] As [Exchange Rate 1],H.[Rate 2] As [Exchange Rate 2],H.[Rate 3] As [Exchange Rate 3],
H.[Rate Factor 1] As [Exchange Rate Factor 1],H.[Rate Factor 2] As [Exchange Rate Factor 2],H.[Rate Factor 3] As [Exchange Rate Factor 3],
I.[levels] As [Product Line Levels],I.[firstlevel] 	As [Product Line First Level],I.[secondlevel] As [Product Line Second Level],	
I.[thirdlevel] 	As [Product Line Third Level],
J.[region] As [Company Region],J.[sub-region] As [Company Sub Region],K.[region] As [BP Region],K.[sub-region] As [BP Sub Region]
FROM (SELECT  0 As [Budget Original Amt],0 As [Budget Amt],Null As [Created in Background],Null As [Created in Background Desc],
		Null As [Budget Code],/* Start dst_tffbs101 End*/
		[bpid] As [Business Partner],[ccur] As [Currency],[compnr] As [Company Number],[cono] As [Company],
			/* Start dst_tffbs101 */
		0 As [Complementary Amt],Null As [DB/CR Indicator],Null As [DB/CR Indicator Desc],
			/* End dst_tffbs101 End*/
		[dim1] As [Dimension 1],[dim2] As [Dimension 2],[dim3] As [Dimension 3],[dim4] As [Dimension 4],[dim5] As [Dimension 5],
		[dim6] As [Dimension 6],[dim7] As [Dimension 7],[dim8] As [Dimension 8],[dim9] As [Dimension 9],[dm10] As [Dimension 10],
		[dm11] As [Dimension 11],[dm12] As [Dimension 12],[duac] As [Dual Accounting Indicator],[duac_kw] As [Dual Accounting Indicator Desc],
		Isnull([fobh_1],0) As [Open Bal Finalized Trns In HC 1],Isnull([fobh_2],0) As [Open Bal Finalized Trns In HC 2],
		Isnull([fobh_3],0) As [Open Bal Finalized Trns In HC 3],
		Isnull([fobh_dtwc],0) As [Open Bal Finalized Trns In DWH Curr],Isnull([fobh_rfrc],0) As [Open Bal Finalized Trns In Reference Curr],
			/* Start dst_tfgld205 */
		0 As [Finalized Credit Amt in HC 1],0 As [Finalized Credit Amt in HC 2],0 As [Finalized Credit Amt in HC 3],
		0 As [Finalized Credit Amt in DWH Curr],0 As [Finalized Credit Amt in Reference Curr],
		0 As [Finalized Credit Amt],0 As [Finalized Debit Amt in HC 1],0 As [Finalized Debit Amt in HC 2],0 As [Finalized Debit Amt in HC 3],
		0 As [Finalized Debit Amt in DWH Curr],0 As [Finalized Debit Amt in Reference Curr],
		0 As [Finalized Qty 1],0 As [Finalized Qty 2],
			/* End dst_tfgld205 */
		Isnull([ftob],0) As [Open Bal Finalized Trns],
		[leac] As [Ledger A/C],
		Isnull([nob1],0) As [Open Bal Not Final Qty 1],Isnull([nob2],0) As [Open Bal Not Final Qty 2],
		Isnull([nobh_1],0) As [Open Bal Not Finalized Trns In HC 1],Isnull([nobh_2],0) As [Open Bal Not Finalized Trns In HC 2],
		Isnull([nobh_3],0) As [Open Bal Not Finalized Trns In HC 3],Isnull([nobh_dtwc],0) As [Open Bal Not Finalized Trns In DWH Curr],
		Isnull([nobh_rfrc],0) As [Open Bal Not Finalized Trns In Reference Curr],Isnull([ntob],0) As [Open Bal Not Finalized Trns],
			/* Start dst_tfgld205 */
		0 As [Not Final Credit Amt in HC 1],0 As [Not Final Credit Amt in HC 2],
		0 As [Not Final Credit Amt in HC 3],0 As [Not Finalized Credit Amt in DWH Curr],
		0 As [Not Finalized Credit Amt in Reference Curr],0 As [Not Final Credit Amt],
		0 As [Not Final Debit Amt in HC 1],0 As [Not Final Debit Amt in HC 2],
		0 As [Not Final Debit Amt in HC 3],0 As [Not Finalized Debit Amt in DWH Curr],
		0 As [Not Finalized Debit Amt in Reference Curr],0 As [Not Final Debit Amt],
		0 As [Not Final Quantity 1],0 As [Not Final Quantity 2],
			/* End dst_tfgld205 */
		[olap] As [Send To Olap],
		Isnull([qob1],0) As [Open Bal Finalized Qty 1],Isnull([qob2],0) As [Open Bal Finalized Qty 2],
			/* Start dst_tfgld205 */
			/* Start dst_tffbs101 */
		0 As [Budget Qty 1],0 As [Budget Qty 2],0 As [Statutory Amt],
			/* End dst_tffbs101 */
		'01' As [Fiscal Period],Null As [Period Type],Null As [Period Type Desc],
			/* End dst_tfgld205 */
		'01-' + CAST([zyear] As VARCHAR) As [Fiscal Year Period],
		[zyear] As [Fiscal Year],[dwh_load_time] As [DWH Load Time],[ztimestamp] As [Time of Action],
		GL_hist_open_bal_key As [GL Rec Fct Key],'HIST-OB' As [Table Shortcode],'GL Hist Opening Bal' As [Table Desc]
FROM  [dwhcda].[lnc_fct_GL_hist_opening_balance]   
Where [deleted] = 'False'

UNION ALL

SELECT  0 As [Budget Original Amt],0 As [Budget Amt],Null As [Created in Background],Null As [Created in Background Desc],
		Null As [Budget Code],/* Start dst_tffbs101 End*/
		[bpid] As [Business Partner],Null As [Currency],[compnr] As [Company Number],[cono] As [Company],
			/* Start dst_tffbs101 */
		0 As [Complementary Amt],Null As [DB/CR Indicator],Null As [DB/CR Indicator Desc],
			/* End dst_tffbs101 End*/
		[dim1] As [Dimension 1],[dim2] As [Dimension 2],[dim3] As [Dimension 3],[dim4] As [Dimension 4],[dim5] As [Dimension 5],
		[dim6] As [Dimension 6],[dim7] As [Dimension 7],[dim8] As [Dimension 8],[dim9] As [Dimension 9],[dm10] As [Dimension 10],
		[dm11] As [Dimension 11],[dm12] As [Dimension 12],[duac] As [Dual Accounting Indicator],[duac_kw] As [Dual Accounting Indicator Desc],
			/* Start dst_tfgld206 */
		0 As [Open Bal Finalized Trns In HC 1],0 As [Open Bal Finalized Trns In HC 2],0 As [Open Bal Finalized Trns In HC 3],
		0 As [Open Bal Finalized Trns In DWH Curr],0 As [Open Bal Finalized Trns In Reference Curr],
			/* End dst_tfgld206 */
		Isnull([fcah_1],0) As [Finalized Credit Amt in HC 1],
		Isnull([fcah_2],0) As [Finalized Credit Amt in HC 2],Isnull([fcah_3],0) As [Finalized Credit Amt in HC 3],
		Isnull([fcah_dtwc],0)	As [Finalized Credit Amt in DWH Curr],Isnull([fcah_rfrc],0) As [Finalized Credit Amt in Reference Curr],
		Isnull([fcam],0) As [Finalized Credit Amt],Isnull([fdah_1],0) As [Finalized Debit Amt in HC 1],Isnull([fdah_2],0) As [Finalized Debit Amt in HC 2],Isnull([fdah_3],0) As [Finalized Debit Amt in HC 3],Isnull([fdah_dtwc],0) As [Finalized Debit Amt in DWH Curr],Isnull([fdah_rfrc],0) As [Finalized Debit Amt in Reference Curr],
		Isnull([fqt1],0) As [Finalized Qty 1],Isnull([fqt2],0) As [Finalized Qty 2],
			/* Start dst_tfgld206 */
		0 As [Open Bal Finalized Trns],
			/* End dst_tfgld206 */
		[leac] As [Ledger A/C],
			/* Start dst_tfgld206 */
		0 As [Open Bal Not Final Qty 1],0 As [Open Bal Not Final Qty 2],0 As [Open Bal Not Finalized Trns In HC 1],
		0 As [Open Bal Not Finalized Trns In HC 2],0 As [Open Bal Not Finalized Trns In HC 3],0 As [Open Bal Not Finalized Trns In DWH Curr],
		0 As [Open Bal Not Finalized Trns In Reference Curr],0 As [Open Bal Not Finalized Trns],
			/* End dst_tfgld206 */
		Isnull([ncah_1],0) As [Not Final Credit Amt in HC 1],Isnull([ncah_2],0) As [Not Final Credit Amt in HC 2],
		Isnull([ncah_3],0) As [Not Final Credit Amt in HC 3],Isnull([ncah_dtwc],0) As [Not Finalized Credit Amt in DWH Curr],
		Isnull([ncah_rfrc],0) As [Not Finalized Credit Amt in Reference Curr],Isnull([ncam],0) As [Not Final Credit Amt],
		Isnull([ndah_1],0) As [Not Final Debit Amt in HC 1],Isnull([ndah_2],0) As [Not Final Debit Amt in HC 2],
		Isnull([ndah_3],0) As [Not Final Debit Amt in HC 3],Isnull([ndah_dtwc],0) As [Not Finalized Debit Amt in DWH Curr],
		Isnull([ndah_rfrc],0) As [Not Finalized Debit Amt in Reference Curr],Isnull([ndam],0) As [Not Final Debit Amt],
		Isnull([nqt1],0) As [Not Final Quantity 1],Isnull([nqt2],0) As [Not Final Quantity 2],
		[olap] As [Send To Olap],
			/* Start dst_tfgld206 */
		0 As [Open Bal Finalized Qty 1],0 As [Open Bal Finalized Qty 2],
			/* End dst_tfgld206 */
			/* Start dst_tffbs101 */
		0 As [Budget Qty 1],0 As [Budget Qty 2],0 As [Statutory Amt],
			/* End dst_tffbs101 */
		RIGHT('00' + CAST(ISNULL([prno],0) AS VARCHAR),2) As [Fiscal Period],[ptyp] As [Period Type],[ptyp_kw] As [Period Type Desc],
		RIGHT('00'+CAST(ISNULL([prno],0) AS VARCHAR),2) + '-' + CAST([zyear] As VARCHAR) As [Fiscal Year Period],[zyear] As [Fiscal Year],
		[dwh_load_time] As [DWH Load Time],[ztimestamp] As [Time of Action],
		GL_hist_trans_key As [GL Rec Fct Key],'HIST-TRN' As [Table Shortcode],'GL Hist Trans' As [Table Desc]
FROM [dwhcda].[lnc_fct_GL_hist_transactions]   
Where [deleted] = 'False'

UNION ALL

SELECT  Isnull([amnt],0) As [Budget Original Amt],Isnull([db_cr_amnt],0) As [Budget Amt],
		[back] As [Created in Background],[back_kw] As [Created in Background Desc],[budg] As [Budget Code],
		Null As [Business Partner],Null As [Currency],
		[compnr] As [Company Number],Null As [Company],Isnull([coam],0) As [Complementary Amt],
		[dbcr] As [DB/CR Indicator],[dbcr_kw] As [DB/CR Indicator Desc],
		[dim1] As [Dimension 1],[dim2] As [Dimension 2],[dim3] As [Dimension 3],[dim4] As [Dimension 4],[dim5] As [Dimension 5],
		[dim6] As [Dimension 6],[dim7] As [Dimension 7],[dim8] As [Dimension 8],[dim9] As [Dimension 9],[dm10] As [Dimension 10],
		[dm11] As [Dimension 11],[dm12] As [Dimension 12],
			/* Start dst_tfgld206 */
		Null As [Dual Accounting Indicator],Null As [Dual Accounting Indicator Desc],
		0 As [Open Bal Finalized Trns In HC 1],0 As [Open Bal Finalized Trns In HC 2],0 As [Open Bal Finalized Trns In HC 3],
		0 As [Open Bal Finalized Trns In DWH Curr],0 As [Open Bal Finalized Trns In Reference Curr],
			/* End dst_tfgld206 */
			/* Start dst_tfgld205 */
		0 As [Finalized Credit Amt in HC 1],0 As [Finalized Credit Amt in HC 2],0 As [Finalized Credit Amt in HC 3],
		0 As [Finalized Credit Amt in DWH Curr],0 As [Finalized Credit Amt in Reference Curr],
		0 As [Finalized Credit Amt],0 As [Finalized Debit Amt in HC 1],0 As [Finalized Debit Amt in HC 2],0 As [Finalized Debit Amt in HC 3],
		0 As [Finalized Debit Amt in DWH Curr],0 As [Finalized Debit Amt in Reference Curr],
		0 As [Finalized Qty 1],0 As [Finalized Qty 2],
			/* End dst_tfgld205 */
			/* Start dst_tfgld206 */
		0 As [Open Bal Finalized Trns],
			/* End dst_tfgld206 */
		[leac] As [Ledger A/C],
			/* Start dst_tfgld206 */
		0 As [Open Bal Not Final Qty 1],0 As [Open Bal Not Final Qty 2],0 As [Open Bal Not Finalized Trns In HC 1],
		0 As [Open Bal Not Finalized Trns In HC 2],0 As [Open Bal Not Finalized Trns In HC 3],0 As [Open Bal Not Finalized Trns In DWH Curr],
		0 As [Open Bal Not Finalized Trns In Reference Curr],0 As [Open Bal Not Finalized Trns],
			/* End dst_tfgld206 */
			/* Start dst_tfgld205 */
		0 As [Not Final Credit Amt in HC 1],0 As [Not Final Credit Amt in HC 2],
		0 As [Not Final Credit Amt in HC 3],0 As [Not Finalized Credit Amt in DWH Curr],
		0 As [Not Finalized Credit Amt in Reference Curr],0 As [Not Final Credit Amt],
		0 As [Not Final Debit Amt in HC 1],0 As [Not Final Debit Amt in HC 2],
		0 As [Not Final Debit Amt in HC 3],0 As [Not Finalized Debit Amt in DWH Curr],
		0 As [Not Finalized Debit Amt in Reference Curr],0 As [Not Final Debit Amt],
		0 As [Not Final Quantity 1],0 As [Not Final Quantity 2],
			/* End dst_tfgld205 */
		[olap] As [Send To Olap],
			/* Start dst_tfgld206 */
		0 As [Open Bal Finalized Qty 1],0 As [Open Bal Finalized Qty 2],
			/* End dst_tfgld206 */
		Isnull([qan1],0) As [Budget Qty 1],Isnull([qan2],0) As [Budget Qty 2],Isnull([stam],0) As [Statutory Amt],
		RIGHT('00' + CAST(ISNULL([peri],0) AS VARCHAR),2) As [Fiscal Period],
			/* Start dst_tfgld205 */
		Null As [Period Type],Null As [Period Type Desc],
			/* End dst_tfgld205 */
		RIGHT('00'+CAST(ISNULL([peri],0) AS VARCHAR),2) + '-' + CAST([zyear] As VARCHAR) As [Fiscal Year Period],
		[zyear] As [Fiscal Year],[dwh_load_time] As [DWH Load Time],[ztimestamp] As [Time of Action],
		frct_budg_amt_key As [GL Rec Fct Key],'FCST-BA' As [Table Shortcode],'Forcast Budg Amt' As [Table Desc]
FROM [dwhcda].[lnc_fct_forecast_budget_amount]   
Where [deleted] = 'False'
) A
LEFT JOIN (Select tb1.[Address Code],tb1.[Line of Business],tb1.[Country],tb1.[Company],tb1.[Company Number] 
From [replncss].[dim Companies] tb1
JOIN (Select [Company],[Company Number],max([Introduction Date]) As [Introduction Date]
From [replncss].[dim Companies]
Group by [Company],[Company Number]) tb2 ON tb1.[Company] = tb2.[Company] And tb1.[Company Number] = tb2.[Company Number] 
And tb1.[Introduction Date] = tb2.[Introduction Date]) B
on 	---A.[Company number] = B.[Company] And 
A.[Company] = B.[Company Number] 

LEFT JOIN [replncss].[dim Business Partners] C
on 	--A.[Company number] = C.[Company] And 
A.[Business Partner] = C.[Business Partner]

LEFT JOIN [replncss].[dim Currencies] D
on 	--A.[Company number] = D.[Company number] And 
A.[Currency] = D.[Currency]

LEFT JOIN [replncss].[dim Departments] E
on  --A.[Company number] = E.[Company number] And 
A.[Dimension 1] = E.[Department]

LEFT JOIN [replncss].[dim Chart of Accounts] F
on  --A.[Company number] = F.[Company] And 
A.[Ledger A/C] = F.[Ledger Account]

LEFT JOIN [replncss].[dim Forecast Budget Master] G
on  --A.[Company number] = G.[Company] And 
A.[Budget Code] = G.[Budget]

LEFT JOIN [replncss].[dim Forecast Budgets] H
on  --A.[Company number] = H.[Company] And 
A.[Budget Code] = H.[Budget] And A.[Fiscal Year] = H.[Fiscal Year]

LEFT JOIN [dwhcda].[lnc_dim_tcmcs061_Ext] I
on --A.[Company number] = I.[compnr] And 
A.[Dimension 2] = I.[cpln]

LEFT JOIN [dwhcda].[lnc_dim_country_region] J
on B.[Country] = J.[alpha-2]

LEFT JOIN [dwhcda].[lnc_dim_country_region] K
on C.[Country] = K.[alpha-2]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tfgld.duac' And [Enum Language] = 'en_US') L
on A.[Dual Accounting Indicator] = L.[Enum Value]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tfgld.ptyp' And [Enum Language] = 'en_US') M
on A.[Period Type] = M.[Enum Value]

GO
 
