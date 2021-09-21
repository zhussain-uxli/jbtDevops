CREATE VIEW [replncss].[fct AP Pur Pay Receipts for Ord and Schedule]
AS 
Select 
A.[amld]  as [Order Line Discount Amount],
A.[amod]  as [Order Discount Amount],
A.[ccof]  as [Contract Purchase Office],
A.[cnig]  as [Contract Ignored],
D.[Enum Desc]  as [Contract Ignored Desc],
A.[compnr]  as [Company number],
A.[cono]  as [Contract],
A.[cpon]  as [Contract Position],
A.[csqn]  as [Contract Sequence],
A.[cupp]  as [Purchase Price Unit],
A.[cvpp]  as [Conversion Factor Price to Inventory Unit],
A.[dtrm]  as [Determining],
E.[Enum Desc]  as [Determining Desc],
A.[elgb]  as [Eligible],
F.[Enum Desc]  as [Eligible Desc],
A.[ftdt]  as [Finance Transaction Date],
A.[iamt]  as [Invoiced Amount],
A.[invd]  as [Invoice Date],
A.[invn]  as [Invoice Number],
A.[opsq]  as [Original Payable],
A.[orno]  as [Purchase Order/Schedule],
A.[pamt]  as [Payable Amount in Order Currency],
A.[pmde]  as [Price Matrix],
A.[pmse]  as [Price Matrix Sequence],
A.[pono]  as [Line Position],
A.[porg]  as [Price Origin],
G.[Enum Desc]  as [Price Origin Desc],
A.[pric]  as [Price],
A.[zproc]  as [Processed],
H.[Enum Desc]  as [Processed Desc],
A.[prsg]  as [Price Stage],
A.[psqn]  as [Payable Receipt Sequence],
A.[ptyp]  as [Payable Receipt Type],
I.[Enum Desc]  as [Payable Receipt Type Desc],
A.[qiiv]  as [Invoiced Quantity],
A.[qipr]  as [Payable Quantity in Inventory Unit],
A.[ract]  as [Retro-Active],
J.[Enum Desc]  as [Retro-Active Desc],
A.[rarc]  as [Reason for Amount Change],
K.[Enum Desc] as [Reason for Amount Change Desc],
A.[rsqn]  as [Receipt Sequence],
A.[sqnb]  as [Line Sequence],
A.[stsc]  as [Update Status of Actual Purchase Costs],
L.[Enum Desc]  as [Update Status of Actual Purchase Costs Desc],
A.[stsd]  as [Invoicing Status],
M.[Enum Desc]  as [Invoicing Status Desc],
A.[styp]  as [Purchase Schedule Type],
N.[Enum Desc]  as [Purchase Schedule Type Desc],
A.[uldt]  as [Usage Log Date],
A.[usdt]  as [Usage Date],
A.[dwh_load_time] as [Dwh Load Time],
A.[Pur_Pay_fct_key] as [Pur Pay fct key],
B.[Description] As [Pur Office Description],
B.[Warehouse] as [Pur Office Warehouse],
B.[Site] as [Pur Office Site],
C.[Address Code] as [Com Address Code],
C.[Line of Business] as [Com Line of Business],
C.[Country] As [Com Country]
from [dwhcda].[lnc_fct_AP_Pur_Pay_Rcpt_for_Ord_Sch] A
LEFT OUTER JOIN [replncss].[dim Purchase Office] B on 
A.[compnr] = B.[Company] and isnull(A.[ccof],'') = B.[Purchase Office]	

LEFT JOIN (Select tb1.[Address Code],tb1.[Line of Business],tb1.[Country],tb1.[Company],tb1.[Company Number]
From [replncss].[dim Companies] tb1
JOIN (Select [Company],[Company Number],max([Introduction Date]) As [Introduction Date]
From [replncss].[dim Companies]
Group by [Company],[Company Number]) tb2 ON tb1.[Company] = tb2.[Company] And tb1.[Company Number] = tb2.[Company Number]
And tb1.[Introduction Date] = tb2.[Introduction Date]) C
on     A.[compnr] =C.[Company] And A.[Compnr] = C.[Company Number]
	
LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') D
on A.[cnig] = D.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') E
on A.[dtrm] = E.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') F
on A.[elgb] = F.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdgen.porg' And [Enum Language] = 'en_US') G
on A.[porg] = G.[Enum Value]


LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdgen.porg' And [Enum Language] = 'en_US') H
on A.[zproc] = H.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdpur.ptyp' And [Enum Language] = 'en_US') I
on A.[ptyp] = I.[Enum Value]


LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') J
on A.[ract] = J.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdpur.rach' And [Enum Language] = 'en_US') K
on A.[rarc] = K.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcstsc' And [Enum Language] = 'en_US') L
on A.[stsc] = L.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcstsd' And [Enum Language] = 'en_US') M
on A.[stsd] = M.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdstyp' And [Enum Language] = 'en_US') N
on A.[styp] = N.[Enum Value];
GO
