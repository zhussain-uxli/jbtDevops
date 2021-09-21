CREATE VIEW [replncss].[fct AP Open Item]
AS 
Select
	A.[amnt] as [Amt],
	A.[amti] as [Amt In Inv Curr],
	A.[bala] as [Balance Anticipated],
	A.[balc] as [Balance],
	A.[balh_1] as [Balance In HC],
	A.[toba]  as [Total Balance],
	A.[vath_1] as [Tax Amt In HC],
	A.[dwh_load_time] as [Dwh Load Time],
    A.[Open_Item_fct_key] as [AP Open Item fct key],
	B. [Category],
	B. [Category Type],
	B. [Category Type Desc],
	B. [Category Description],
	B. [Responsible Employee],
	B. [Responsible Office],
	B. [Category Text],
	C.[Payment Terms],
	C.[Payment Terms Company],
	C.[Payment Period],
	C.[Payment Period Type Key],
	C.[Payment Period Type],
	C.[Shift in Due Dt Tolerance],
	C.[Discount Amount Tolerance],
	C.[Discount Percentage Tolerance],
	C.[Discount Period Tolerance] ,
	D.[Tax Code Desc],
	E.[Address Code] as [Pay-to Address Code],
	E.[Country] as [Pay-to Country],
	E.[Country Name] as [Pay-to Country Name],
	E.[Pay-to BP Name] as [Pay-to BP Name],
	E.[Pay-to State/Province] As [Pay-to State/Province],
	E.[Pay-to City Name] As [Pay-to City Name]
from [dwhcda].[lnc_fct_AP_Open_Items] A
	
LEFT OUTER JOIN [replncss].[dim Category] B 
on A.[compnr] = B.[Company] and A.[adty] = B.[Category]

LEFT OUTER JOIN [replncss].[dim PaymentTerms] C 
on A.[cpay] = C.[Payment Terms] and A.[compnr] = C.[Company]

LEFT OUTER JOIN [replncss].[dim Tax Codes] D 
on A.[compnr] = D.[Company] and A.[cvat] = D.[Tax Code]
---and A.[ccty] = D.[Country]

LEFT OUTER JOIN [replncss].[dim Pay-to Business Partners] E
on A.[compnr] = E.[Company] and A.[ptbp] = E.[Pay-to BP];
GO


