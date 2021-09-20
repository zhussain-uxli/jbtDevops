/**********************************************************************************************************************
View Name: [replncss].[dim AR Dimensions]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Finance Account Receivable
Source Table:[dwhcda].[lnc_dim_tfgld010]
Target View: [replncss].[dim AR Dimensions]
Lookup Tables: None
Developer: Pooja Thakur
Date: 13/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop view [replncss].[dim AR Dimensions];

CREATE VIEW [replncss].[dim AR Dimensions]
As
SELECT
	[bfdt] As [Blocking Effective From],
	[bloc] As [Status],
	[budt] As [Blocking Effective To],
	[compnr] As [Company],
	[emno] As [Person Responsible],
	[pdix] As [Parent Dim],
	[qan1] As [Unit 1],
	[qan2] As [Unit 2],
	[uni1] As [Display Unit 1],
	[uni2] As [Display Unit 2]
FROM [dwhcda].[lnc_dim_tfgld010]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[dim Currency Rates]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Sales

Source Table:[dwhcda].[lnc_dim_tcmcs008]
Target View: [replncss].[dim Currency Rates]
Lookup Tables: None
Developer: Pooja Thakur
Date: 16/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop VIEW [replncss].[dim Currency Rates];

CREATE VIEW [replncss].[dim Currency Rates]
As
SELECT
	apdt As [Approval date],
	compnr As [Company],
	ccur As [Currency],
	bcur As [Currency Base],
	rate As [Currency Rate],
	rapr As [Currency Rate Approved],
	stdt As [Effective Date],
	endt As [End Date],
	rtyp As [Exchange Rate Type],
	excb As [Express in Base Currency],
	ratf As [Rate Factor]
FROM [dwhcda].[lnc_dim_tcmcs008]
Where deleted = 'False';
GO