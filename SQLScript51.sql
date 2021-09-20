/**********************************************************************************************************************
Table Name: [replncss].[CDW fct General Ledger Act Budg Fcst Cube]
This Fact clone cube is created on Fact GL Accounts Budget Forecast View which is exposed to the Tableau for Dashboard Build.

Data Type: Fact Data
Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 09/09/2021
Reviewed By: Atul Raje

Change History:N/A

**********************************************************************************************************************/
--Drop Table [replncss].[CDW fct General Ledger Act Budg Fcst Cube]

CREATE TABLE [replncss].[CDW fct General Ledger Act Budg Fcst Cube]
(
	[Budget Original Amt] [float] NOT NULL,
	[Budget Amt] [float] NOT NULL,
	[Created in Background] [int] NULL,
	[Created in Background Desc] [varchar](255) NULL,
	[Budget Code] [varchar](3) NULL,
	[Business Partner] [varchar](9) NULL,
	[Currency] [varchar](3) NULL,
	[Company Number] [varchar](10) NOT NULL,
	[Company] [int] NULL,
	[Complementary Amt] [float] NOT NULL,
	[DB/CR Indicator] [int] NULL,
	[DB/CR Indicator Desc] [varchar](255) NULL,
	[Dimension 1] [varchar](9) NOT NULL,
	[Dimension 2] [varchar](9) NOT NULL,
	[Dimension 3] [varchar](9) NOT NULL,
	[Dimension 4] [varchar](9) NOT NULL,
	[Dimension 5] [varchar](9) NOT NULL,
	[Dimension 6] [varchar](9) NULL,
	[Dimension 7] [varchar](9) NULL,
	[Dimension 8] [varchar](9) NULL,
	[Dimension 9] [varchar](9) NULL,
	[Dimension 10] [varchar](9) NULL,
	[Dimension 11] [varchar](9) NULL,
	[Dimension 12] [varchar](9) NULL,
	[Dual Accounting Indicator] [int] NULL,
	[Dual Accounting Indicator Desc] [varchar](255) NULL,
	[Open Bal Finalized Trns In HC 1] [float] NOT NULL,
	[Open Bal Finalized Trns In HC 2] [float] NOT NULL,
	[Open Bal Finalized Trns In HC 3] [float] NOT NULL,
	[Open Bal Finalized Trns In DWH Curr] [float] NOT NULL,
	[Open Bal Finalized Trns In Reference Curr] [float] NOT NULL,
	[Finalized Credit Amt in HC 1] [float] NOT NULL,
	[Finalized Credit Amt in HC 2] [float] NOT NULL,
	[Finalized Credit Amt in HC 3] [float] NOT NULL,
	[Finalized Credit Amt in DWH Curr] [float] NOT NULL,
	[Finalized Credit Amt in Reference Curr] [float] NOT NULL,
	[Finalized Credit Amt] [float] NOT NULL,
	[Finalized Debit Amt in HC 1] [float] NOT NULL,
	[Finalized Debit Amt in HC 2] [float] NOT NULL,
	[Finalized Debit Amt in HC 3] [float] NOT NULL,
	[Finalized Debit Amt in DWH Curr] [float] NOT NULL,
	[Finalized Debit Amt in Reference Curr] [float] NOT NULL,
	[Finalized Qty 1] [float] NOT NULL,
	[Finalized Qty 2] [float] NOT NULL,
	[Open Bal Finalized Trns] [float] NOT NULL,
	[Ledger A/C] [varchar](12) NOT NULL,
	[Open Bal Not Final Qty 1] [float] NOT NULL,
	[Open Bal Not Final Qty 2] [float] NOT NULL,
	[Open Bal Not Finalized Trns In HC 1] [float] NOT NULL,
	[Open Bal Not Finalized Trns In HC 2] [float] NOT NULL,
	[Open Bal Not Finalized Trns In HC 3] [float] NOT NULL,
	[Open Bal Not Finalized Trns In DWH Curr] [float] NOT NULL,
	[Open Bal Not Finalized Trns In Reference Curr] [float] NOT NULL,
	[Open Bal Not Finalized Trns] [float] NOT NULL,
	[Not Final Credit Amt in HC 1] [float] NOT NULL,
	[Not Final Credit Amt in HC 2] [float] NOT NULL,
	[Not Final Credit Amt in HC 3] [float] NOT NULL,
	[Not Finalized Credit Amt in DWH Curr] [float] NOT NULL,
	[Not Finalized Credit Amt in Reference Curr] [float] NOT NULL,
	[Not Final Credit Amt] [float] NOT NULL,
	[Not Final Debit Amt in HC 1] [float] NOT NULL,
	[Not Final Debit Amt in HC 2] [float] NOT NULL,
	[Not Final Debit Amt in HC 3] [float] NOT NULL,
	[Not Finalized Debit Amt in DWH Curr] [float] NOT NULL,
	[Not Finalized Debit Amt in Reference Curr] [float] NOT NULL,
	[Not Final Debit Amt] [float] NOT NULL,
	[Not Final Quantity 1] [float] NOT NULL,
	[Not Final Quantity 2] [float] NOT NULL,
	[Send To Olap] [int] NULL,
	[Open Bal Finalized Qty 1] [float] NOT NULL,
	[Open Bal Finalized Qty 2] [float] NOT NULL,
	[Budget Qty 1] [float] NOT NULL,
	[Budget Qty 2] [float] NOT NULL,
	[Statutory Amt] [float] NOT NULL,
	[Fiscal Period] [varchar](2) NULL,
	[Period Type] [int] NULL,
	[Period Type Desc] [varchar](255) NULL,
	[Fiscal Year Period] [varchar](33) NULL,
	[Fiscal Year] [int] NOT NULL,
	[DWH Load Time] [datetime] NOT NULL,
	[Time of Action] [datetime] NOT NULL,
	[GL Rec Fct Key] [varchar](255) NOT NULL,
	[Table Shortcode] [varchar](20) NOT NULL,
	[Table Desc] [varchar](100) NOT NULL,
	[Company Address Code] [varchar](9) NULL,
	[Company Line of Business] [varchar](6) NULL,
	[Company Country] [varchar](3) NULL,
	[BP Address Code] [varchar](9) NULL,
	[BP Country] [varchar](50) NULL,
	[BP Country Name] [varchar](100) NULL,
	[BP Name] [varchar](255) NULL,
	[BP State/Province] [varchar](3) NULL,
	[BP City Name] [varchar](255) NULL,
	[BP Role Key] [int] NULL,
	[BP Role Desc] [varchar](255) NULL,
	[BP Status] [int] NULL,
	[BP Status Desc] [varchar](255) NULL,
	[BLWI Reporting Curr Key] [int] NULL,
	[BLWI Reporting Curr Flag] [varchar](255) NULL,
	[Rounding Factor] [float] NULL,
	[Currency Desc] [varchar](255) NULL,
	[Currency Short Desc] [varchar](255) NULL,
	[EMU Currency Key] [int] NULL,
	[EMU Currency Flag] [varchar](255) NULL,
	[Grand Total Rounding Factor] [float] NULL,
	[ISO Currency Code] [varchar](3) NULL,
	[Department Desc] [varchar](255) NULL,
	[Department Site] [varchar](9) NULL,
	[Department Type Key] [int] NULL,
	[Department Type Desc] [varchar](255) NULL,
	[Allocation Type] [int] NULL,
	[Allocation Type Desc] [varchar](255) NULL,
	[Account Type] [int] NULL,
	[Account Type Desc] [varchar](255) NULL,
	[Debit/Credit Indicator] [int] NULL,
	[Debit/Credit Indicator Desc] [varchar](255) NULL,
	[Expense Type] [int] NULL,
	[Expense Type Desc] [varchar](255) NULL,
	[Ledger Account Desc] [varchar](255) NULL,
	[Legal Ledger Account Description] [varchar](255) NULL,
	[Legal Ledger Account] [varchar](12) NULL,
	[Budgeting Method] [int] NULL,
	[Budgeting Method Desc] [varchar](255) NULL,
	[Budget Desc] [varchar](255) NULL,
	[Link with Ledger Account] [int] NULL,
	[Link with Ledger Account Desc] [varchar](255) NULL,
	[Number of Budget Periods] [int] NULL,
	[Flexible Budget] [int] NULL,
	[Flexible Budget Desc] [varchar](255) NULL,
	[Exchange Rate 1] [float] NULL,
	[Exchange Rate 2] [float] NULL,
	[Exchange Rate 3] [float] NULL,
	[Exchange Rate Factor 1] [int] NULL,
	[Exchange Rate Factor 2] [int] NULL,
	[Exchange Rate Factor 3] [int] NULL,
	[Product Line Levels] [int] NULL,
	[Product Line First Level] [varchar](100) NULL,
	[Product Line Second Level] [varchar](100) NULL,
	[Product Line Third Level] [varchar](100) NULL,
	[Company Region] [varchar](50) NULL,
	[Company Sub Region] [varchar](100) NULL,
	[BP Region] [varchar](50) NULL,
	[BP Sub Region] [varchar](100) NULL
)
WITH
(
	DISTRIBUTION = HASH ([GL Rec Fct Key])
)
GO

/**********************************************************************************************************************
Table Name: [replncss].[CDW fct GL Finalized Transactions Cube]
This Fact clone cube is created on Fact GL Actual Finalized Transactions View which is exposed to the Tableau for Dashboard Build.

Data Type: Fact Data
Original Project: JBT Finance GL
Developer: Pooja Thakur
Date: 13/09/2021
Reviewed By: Atul Raje

Change History:N/A

**********************************************************************************************************************/
--Drop Table [replncss].[CDW fct GL Finalized Transactions Cube]

CREATE TABLE [replncss].[CDW fct GL Finalized Transactions Cube]
(
	[GL Category] [int] NULL,
	[Category Desc] [varchar](255) NULL,
	[Amount] [float] NULL,
	[Amt In HC 1] [float] NULL,
	[Amt In HC 2] [float] NULL,
	[Amt In HC 3] [float] NULL,
	[Business Partner] [varchar](9) NULL,
	[Budget Exception] [int] NULL,
	[Budget Exception Desc] [varchar](255) NULL,
	[Contra A/c] [varchar](12) NULL,
	[Trn Category] [int] NULL,
	[Trn Category Desc] [varchar](255) NULL,
	[Country For Tax] [varchar](3) NULL,
	[Curr/Rate] [varchar](3) NULL,
	[Correction Inv Detail Line] [int] NULL,
	[Cash Flow Reason] [varchar](6) NULL,
	[Inv Correction] [int] NULL,
	[Correction Line Number] [int] NULL,
	[Company Number] [varchar](10) NOT NULL,
	[Control A/c] [int] NULL,
	[Control A/c Desc] [varchar](255) NULL,
	[Standing Order] [int] NULL,
	[Creation Date] [datetime] NULL,
	[Standing Order Seq No.] [int] NULL,
	[Trans Type Correction] [varchar](3) NULL,
	[Tax Code] [varchar](9) NULL,
	[Finalization Date] [varchar](10) NULL,
	[Debit / Credit] [int] NULL,
	[Debit / Credit Desc] [varchar](255) NULL,
	[Document Date] [varchar](10) NULL,
	[Deleted] [int] NULL,
	[Deleted Desc] [varchar](255) NULL,
	[Whether Record Is Deleted] [varchar](10) NULL,
	[Dim 1] [varchar](9) NULL,
	[Dim 2] [varchar](9) NULL,
	[Dim 3] [varchar](9) NULL,
	[Dim 4] [varchar](9) NULL,
	[Dim 5] [varchar](9) NULL,
	[Dim 6] [varchar](9) NULL,
	[Dim 7] [varchar](9) NULL,
	[Dim 8] [varchar](9) NULL,
	[Dim 9] [varchar](9) NULL,
	[Dim 10] [varchar](9) NULL,
	[Dim 11] [varchar](9) NULL,
	[Dim 12] [varchar](9) NULL,
	[Exclude From Payment Disc] [int] NULL,
	[Exclude From Payment Disc Desc] [varchar](255) NULL,
	[Rate Factor 1] [int] NULL,
	[Rate Factor 2] [int] NULL,
	[Rate Factor 3] [int] NULL,
	[Original Document Number] [int] NULL,
	[Fiscal Period] [varchar](2) NULL,
	[Fiscal Year Period] [varchar](33) NULL,
	[Original Trn Type] [varchar](3) NULL,
	[Fiscal Year] [int] NULL,
	[Integration Trn] [int] NULL,
	[Integration Trn Desc] [varchar](255) NULL,
	[Ledger A/c] [varchar](12) NULL,
	[Batch] [int] NULL,
	[Original Company] [int] NULL,
	[Document] [int] NOT NULL,
	[Line] [int] NOT NULL,
	[Seq Number] [int] NOT NULL,
	[Background Seq No.] [int] NOT NULL,
	[Trn Type] [varchar](3) NOT NULL,
	[Batch Year] [int] NULL,
	[Qty 1] [float] NULL,
	[Qty 2] [float] NULL,
	[Rate Date] [datetime] NULL,
	[Rate 1] [float] NULL,
	[Rate 2] [float] NULL,
	[Rate 3] [float] NULL,
	[Reconciliation Data Logged] [int] NULL,
	[Reconciliation Data Logged Desc] [varchar](255) NULL,
	[Reconciliation Area] [int] NULL,
	[Reconciliation Area Desc] [varchar](255) NULL,
	[Reconciliation Subarea] [int] NULL,
	[Reporting Period] [varchar](2) NULL,
	[Reporting Year Period] [varchar](33) NULL,
	[Exchange Rate Type] [varchar](3) NULL,
	[Reporting Year] [int] NULL,
	[Type Of Cash Trn] [int] NULL,
	[Type Of Cash Trn Desc] [varchar](255) NULL,
	[Trn Entry Date] [varchar](10) NULL,
	[Finalization Time] [int] NULL,
	[Time of Action] [datetime] NULL,
	[Type Of Trn] [int] NULL,
	[Type Of Trn Desc] [varchar](255) NULL,
	[Tax Amt In HC 1] [float] NULL,
	[Tax Amt In HC 2] [float] NULL,
	[Tax Amt In HC 3] [float] NULL,
	[Tax Amt In Payment Curr] [float] NULL,
	[Tax Ledger A/C] [varchar](12) NULL,
	[Tax Period] [varchar](2) NULL,
	[Tax Origin] [int] NULL,
	[Tax Origin Desc] [varchar](255) NULL,
	[Tax Year] [int] NULL,
	[Tax Year Period] [varchar](33) NULL,
	[Withholding Income Tax Or Social Contribution Applied] [int] NULL,
	[Withholding Income Tax Or Social Contribution Applied Desc] [varchar](255) NULL,
	[Dwh Load Time] [datetime] NOT NULL,
	[Debit/Credit Amount] [float] NULL,
	[GlFinzTransKey] [varchar](70) NOT NULL,
	[Category] [varchar](6) NULL,
	[Category Type] [int] NULL,
	[Category Type Desc] [varchar](255) NULL,
	[Category Description] [varchar](255) NULL,
	[Responsible Employee] [varchar](9) NULL,
	[Responsible Office] [varchar](6) NULL,
	[Category Text] [int] NULL,
	[BP Address Code] [varchar](9) NULL,
	[BP Country] [varchar](50) NULL,
	[BP Country Name] [varchar](100) NULL,
	[BP Name] [varchar](255) NULL,
	[BP State/Province] [varchar](3) NULL,
	[BP City Name] [varchar](255) NULL,
	[BP Role Key] [int] NULL,
	[BP Role Desc] [varchar](255) NULL,
	[BP Status] [int] NULL,
	[BP Status Desc] [varchar](255) NULL,
	[Calendar Code] [varchar](9) NULL,
	[Currency System] [int] NULL,
	[Currency System Orig Desc] [varchar](255) NULL,
	[Currency Type A] [int] NULL,
	[Currency Type A Orig Desc] [varchar](255) NULL,
	[Currency Type B] [int] NULL,
	[Currency Type B Orig Desc] [varchar](255) NULL,
	[Currency Type C] [int] NULL,
	[Currency Type C Orig Desc] [varchar](255) NULL,
	[Company Type] [int] NULL,
	[Company Type Orig Desc] [varchar](255) NULL,
	[Company Desc] [varchar](255) NULL,
	[Transition Currency] [varchar](3) NULL,
	[Local Currency] [varchar](3) NULL,
	[Logistic Currency] [varchar](3) NULL,
	[Availability Type] [varchar](6) NULL,
	[Time Zone Code] [varchar](3) NULL,
	[Tax Code Desc] [varchar](255) NULL,
	[Department Desc] [varchar](255) NULL,
	[Department Site] [varchar](9) NULL,
	[Department Type Key] [int] NULL,
	[Department Type Desc] [varchar](255) NULL,
	[Allocation Type] [int] NULL,
	[Allocation Type Desc] [varchar](255) NULL,
	[Account Type] [int] NULL,
	[Account Type Desc] [varchar](255) NULL,
	[Debit/Credit Indicator] [int] NULL,
	[Debit/Credit Indicator Desc] [varchar](255) NULL,
	[Expense Type] [int] NULL,
	[Expense Type Desc] [varchar](255) NULL,
	[Ledger Account Desc] [varchar](255) NULL,
	[Legal Ledger Account Description] [varchar](255) NULL,
	[Legal Ledger Account] [varchar](12) NULL
)
WITH
(
	DISTRIBUTION = HASH ( [GlFinzTransKey] )
)
GO



