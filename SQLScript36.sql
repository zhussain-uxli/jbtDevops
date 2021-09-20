CREATE VIEW [replncss].[fct Ap Purchase Order Lines]
AS 
Select 
A.[akcd]   as  [Purchase Acknowledgment],
A.[cadr]   as  [Warehouse Address],
A.[ccty]   as  [Tax Country],
A.[clip]   as  [Cancellation In Process],
R.[Enum Desc]  as  [Cancellation In Process Desc],
A.[clyn]   as  [Canceled],
Q.[Enum Desc]    as  [Canceled Desc],
A.[cnig]   as  [Contract Ignored],
S.[Enum Desc]   as  [Contract Ignored Desc],
A.[compnr]   as  [Company Number],
A.[cono]   as  [Contract],
A.[cpon]   as  [Contract Position],
A.[cprj]   as  [Project],
A.[cpva]   as  [Product Variant],
A.[crbn]   as  [Carrier Binding],
T.[Enum Desc]  as  [Carrier Binding Desc],
A.[crej]   as  [Reason For Rejection],
A.[crrf]   as  [Item Cross Reference],
U.[Enum Desc]   as  [Item Cross Reference Desc],
A.[ctcd]   as  [Change Type],
A.[damt]   as  [Receipt Amt],
A.[ddtc]   as  [Confirmed Receipt Date],
A.[ddtf]   as  [Order Confirmation Date],
A.[glco]   as  [General Ledger],
A.[invd]   as  [Inv Date],
A.[invn]   as  [Invoice],
A.[item]   as  [Item],
A.[lcam_trnc]   as  [Cc: Total Landed Cost],
A.[oamt]   as  [Order Amt],
A.[odat]   as  [Order Date],
A.[oltp]   as  [Order Line Type],
V.[Enum Desc]   as  [Order Line Type Desc],
A.[otbp]   as  [Buy-From BP],
A.[owns]   as  [Return Ownership],
W.[Enum Desc]   as  [Return Ownership Desc],
A.[pono]   as  [Line],
A.[ptpe]   as  [Purchase Type],
A.[qidl]   as  [Received Qty],
A.[qiiv]   as  [Invd Qty],
A.[qirj]   as  [Rejected Qty],
A.[qoor]   as  [Ordered Qty],
A.[rcno]   as  [Receipt Number],
A.[sdsc]   as  [Standard Description],
X.[Enum Desc]   as  [Standard Description Desc],
A.[sfcn]   as  [Ship-From Contact],
A.[sfsi]   as  [Ship-From Site],
A.[sfwh]   as  [Ship-From Warehouse],
A.[site]   as  [Site],
A.[spcn]   as  [Specification],
A.[stsd]   as  [Inv Status],
Y.[Enum Desc]   as  [Inv Status Desc],
A.[subc]   as  [Subcontracted],
Z.[Enum Desc]   as  [Subcontracted Desc],
A.[tapr]   as  [Target Price],
A.[tpbk]   as  [Target Price Book],
A.[tpbl]   as  [Target Price Book Line],
A.[vryn]   as  [Vendor Rating],
A.[dwh_load_time] as [Dwh Load time],
A.[PU_Order_Lines_fct_key] as [PU Order Lines fct key],
BA.[Enum Desc]   as  [Vendor Rating Desc],
B.[Tax Classification Desc] as [Tax Classification Desc] ,
B.[Max W/Tax %] as [Max W/Tax %],
B.[SCT Allowed] as [SCT Allowed],
B.[SCT Allowed Falg] as [SCT Allowed Falg],
B.[WIT Allowed] as [WIT Allowed],
B.[WIT Allowed Flag] as [WIT Allowed Flag],
C.[Delivery Terms Desc] as [Delivery Terms Desc],
D.[Carrier/LSP Desc] as [Carrier/LSP Desc],
D.[Buy-from Business Partner] as [Buy-from Business Partner],
D.[Transport Category] as [Transport Category],
D.[Transport Category Desc] as [Transport Category Desc],
F.[Payment Terms] as [Payment Terms],
F.[Payment Terms Company] as [Payment Terms Company],
F.[Payment Period] as [Payment Period],
F. [Payment Period Type Key] as [Payment Period Type Key],
F.[Payment Period Type] as [Payment Period Type],
F. [Shift in Due Dt Tolerance] as [Shift in Due Dt Tolerance],
F.[Discount Amount Tolerance] as [Discount Amount Tolerance],
F. [Discount Percentage Tolerance] as [Discount Percentage Tolerance],
F. [Discount Period Tolerance]  as [Discount Period Tolerance] ,
G.[Change Reason Desc] as [Change Reason Desc],
H.[Tax Code Desc] as [Tax Code Desc],
I.[Warehouse Desc] as [Warehouse Desc],
I.[Address Code] as [Warehouse Address Code],
I.[Financial Company] as [Financial Company],
I.[Enterprise unit of Wh] as [Enterprise unit of Wh],
I.[Inventory Mgt Business Partner] as [Inventory Mgt Business Partner],
I.[External Site] as [External Site],
I.[External Site Flag] as [External Site Flag],
I.[Blocked for Inbound]		As [Blocked for Inbound],
I.[Blocked for Inbound Desc]	As [Blocked for Inbound Desc],
I.[Blocked for Outbound]		As [Blocked for Outbound],
I.[Blocked for Outbound Desc]	As [Blocked for Outbound Desc],
J.[Items Desc] as [Items Desc],
J.[Item Group] as [Item Group],
J.[Product Class] as [Product Class],
J.[Product Line] as [Product Line],
J.[Item Signal] as [Item Signal],
J.[Country of Origin] as [Country of Origin],
J.[Product Type] as [Product Type],
J.[Inventory Unit] as [Inventory Unit],
J.[Serialized] as [Serialized],
J.[Default Supply Source] as [Default Supply Source],
K.[PoT Passage Desc],
K.[PoT Passage Spec Key],
K.[PoT Passage Spec],
L.[Address Code] as [Ship-from Address Code],
L.[Country] as [Ship-from Country],
L.[Country Name] as [Ship-from Country Name],
L.[Ship-from BP Name] as [Ship-from BP Name],
L.[Ship-from State/Province] As [Ship-from State/Province],
L.[Ship-from City Name] As [Ship-from City Name],
M.[Description] As [Pur Office Description],
M.[Warehouse] as [Pur Office Warehouse],
M.[Site] as [Pur Office Site],
N.[levels] As [Product Line Levels],
N.[firstlevel] 	As [Product Line First Level],	
N.[secondlevel] As [Product Line Second Level],	
N.[thirdlevel] 	As [Product Line Third Level],
O.[region] As [Ship-from Region],
O.[sub-region] As [Ship-from Sub Region],
P.[region] As [Sold-to Region],
P.[sub-region] As [Sold-to Sub Region]
	from [dwhcda].[lnc_fct_AP_Pur_Order_Lines] A
	
LEFT OUTER JOIN [replncss].[dim Tax Classification] B on 
	A.[compnr] = B.[Company] and A.[bpcl] = B.[Tax Classification]
	
LEFT OUTER JOIN [replncss].[dim Delivery Terms] C on 
	A.[compnr] = C.[Company]and A.[cdec] = C.[Delivery Terms]
	
LEFT OUTER JOIN [replncss].[dim Carriers/LSP] D on 
	A.[compnr] = D.[Company] and A.[cfrw] = D.[Carrier/LSP]
LEFT JOIN (Select tb1.[Address Code],tb1.[Line of Business],tb1.[Country],tb1.[Company],tb1.[Company Number]
From [replncss].[dim Companies] tb1
JOIN (Select [Company],[Company Number],max([Introduction Date]) As [Introduction Date]
From [replncss].[dim Companies]
Group by [Company],[Company Number]) tb2 ON tb1.[Company] = tb2.[Company] And tb1.[Company Number] = tb2.[Company Number]
And tb1.[Introduction Date] = tb2.[Introduction Date]) E
on     A.[compnr] = E.[Company] And A.[compnr] = E.[Company Number]

LEFT OUTER JOIN [replncss].[dim PaymentTerms] F 
on A.[cpay] = F.[Payment Terms] and A.[compnr] = F.[Company]

LEFT OUTER JOIN [replncss].[dim Change Reasons] G 
on A.[compnr] = G.[Company] and A.[crcd] = G.[Change Reason]

LEFT OUTER JOIN [replncss].[dim Tax Codes] H on 
A.[compnr] = H.[Company] and A.[cvat] = H.[Tax Code] and A.[ccty] = H.[Country]

LEFT OUTER JOIN [replncss].[dim Warehouse] I on 
A.[compnr] = I.[Company] and A.[cwar] = I.[Warehouse]

LEFT OUTER JOIN [replncss].[dim Items] J on 
A.[compnr] = J.[Company] and A.[item] = J.[Item]

LEFT OUTER JOIN [replncss].[dim Point of Title Passage] K on 
A.[compnr] = K.[Company] and A.[ptpa] = K.[Point of Title Passage]

LEFT OUTER JOIN [replncss].[dim Ship-from Business Partners] L on 
A.[compnr] = L.[Company] and A.[sfbp] = L.[Ship-from BP]

LEFT OUTER JOIN [replncss].[dim Purchase Office] M on 
A.[compnr] = M.[Company] and A.[ccof] = M.[Purchase Office]

LEFT OUTER JOIN [dwhcda].[lnc_dim_tcmcs061_Ext] N
on J.[Product Line] = N.[cpln] and J.[Company] = N.[compnr]

LEFT OUTER JOIN [dwhcda].[lnc_dim_country_region] O
on L.[Country] = O.[alpha-2]

LEFT OUTER JOIN [dwhcda].[lnc_dim_country_region] P
on L.[Country] = P.[alpha-2]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') R
on A.[clip] = R.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') Q
on A.[clyn] = Q.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') S
on A.[cnig] = S.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') T
on A.[crbn] = T.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tccrrf' And [Enum Language] = 'en_US') U
on A.[crrf] = U.[Enum Value]

 
 LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdgen.oltp' And [Enum Language] = 'en_US') V
on A.[oltp] = V.[Enum Value]

 LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcowns' And [Enum Language] = 'en_US') W
on A.[owns] = W.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') X
on A.[sdsc] = X.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcstsd' And [Enum Language] = 'en_US') Y
on A.[stsd] = Y.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') Z
on A.[subc] = Z.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') Ba
on A.[vryn] = BA.[Enum Value];
GO
