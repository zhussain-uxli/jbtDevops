CREATE VIEW [replncss].[fct AP Purchase Order Line History]
AS 
Select 
A.[akcd]    as	[Purchase Acknowledgment],
A.[amld]	as [Order Line Disc Amt],
A.[amta]	as [Amt],
A.[appr]	as [Approved],
U.[Enum Desc]	as [Approved Desc],
A.[bpcl]	as [Tax Classification],
A.[ccco]	as [Cost Component],
A.[ccof]	as [Purchase Office],
A.[cfrw]	as [Carrier/Lsp],
---A.[citg]	as [Item Group],
A.[ckor]  as  [Record Type],
Q.[Enum Desc]	as [Record Type Desc],
A.[clot]	as [Lot],
A.[clyn]	as [Canceled],
R.[Enum Desc]	as [Canceled Desc],
A.[compnr]	as [Company Number],
A.[cono]     as	[Contract],
---A.[cpcl]	as [Product Class],
---A.[cpln]	as [Product Line],
A.[cprj]	as [Project],
A.[crbn]	as [Carrier Binding],
S.[Enum Desc]	as [Carrier Binding Desc],
A.[crcd]	as [Change Reason],
A.[crej]	as [Reason For Rejection],
A.[cspa]	as [Element],
A.[ctcd]	as [Change Type],
A.[cuqp]	as [Purchase Unit],
A.[cvat]	as [Tax Code],
A.[cwar]	as [Warehouse],
A.[damt]	as [Receipt Amt],
A.[ddon]	as [Number Of Deliveries Done],
A.[ddta]	as [Planned Receipt Date],
A.[ddtb]	as [Current Planned Receipt Date],
A.[ddtc]	as [Confirmed Receipt Date],
A.[ddtd]	as [Changed Receipt Date],
A.[ddte]	as [Actual Receipt Date],
A.[ddtf]	as [Order Confirmation Date],
A.[fire]	as [Final Receipt],
T.[Enum Desc]	as [Final Receipt Desc],
A.[glco]	as [General Ledger],
A.[hisa]	as [History Action],
V.[Enum Desc]	as [History Action Desc],
A.[iamt]	as [Inv Amt],
A.[invd]	as [Inv Date],
A.[invn]	as [Invoice],
A.[item]	as [Item],
A.[ldat]	as [Planned Load Date],
A.[lsel]	as [Lot Selection],
A.[oamt]	as [Order Amt],
A.[odat]	as [Order Date],
A.[oorn]	as [Original Order],
A.[opon]	as [Original Line],
A.[orno]	as [Purchase Order],
A.[osqn]	as [Original Seq],
A.[otbp]	as [Buy-From BP],
A.[pono]	as [Purchase Order Line],
A.[pric]	as [Price],
-----A.[prtp]	as [Product Type],
A.[ptpe]	as [Purchase Type],
A.[qiap]	as [Approved Qty],
A.[qibo]	as [Backorder Qty],
A.[qibp]	as [Potential Backorder Qty],
A.[qidl]	as [Received Qty],
A.[qiiv]	as [Invd Qty],
A.[qilh]	as [Quantity],
A.[qirj]	as [Rejected Qty],
A.[qish]	as [Shipped Qty],
A.[qoor]	as [Ordered Qty],
A.[retp]	as [Rept Line],
A.[sctp]	as [Sales Schedule Type],
W.[Enum Desc]	as [Sales Schedule Type Desc],
A.[sfad]	as [Ship-From Address],
A.[sfbp]	as [Ship-From BP],
A.[sfcn]	as [Ship-From Contact],
A.[sfsi]	as [Ship-From Site],
A.[sfwh]	as [Ship-From Warehouse],
A.[site]	as [Site],
A.[sorn]	as [Sales Order / Schedule],
A.[spon]	as [Spon Line],
A.[sqnb]	as [SequenceNumber],
A.[sseq]	as [Seq],
A.[stat]	as [Status],
X.[Enum Desc]	as [Status Desc],
A.[stsd]	as [Inv Status],
Y.[Enum Desc]	as [Inv Status Desc],
A.[trdt]	as [Trn Date],
A.[dwh_load_time] as [Dwh Load Time],
A.[PU_Order_Line_His_fct_key] as [PU Order Line His fct key],
B.[Tax Classification Desc] as [Tax Classification Desc] ,
B.[Max W/Tax %] as [Max W/Tax %],
B.[SCT Allowed] as [SCT Allowed],
B.[SCT Allowed Falg] as [SCT Allowed Falg],
B.[WIT Allowed] as [WIT Allowed],
B.[WIT Allowed Flag] as [WIT Allowed Flag],
C.[Description] As [Pur Office Description],
C.[Warehouse] as [Pur Office Warehouse],
C.[Site] as [Pur Office Site],
D.[Delivery Terms Desc] as [Delivery Terms Desc],
E.[Payment Terms] as [Payment Terms],
E.[Payment Terms Company] as [Payment Terms Company],
E.[Payment Period] as [Payment Period],
E. [Payment Period Type Key] as [Payment Period Type Key],
E.[Payment Period Type] as [Payment Period Type],
E. [Shift in Due Dt Tolerance] as [Shift in Due Dt Tolerance],
E.[Discount Amount Tolerance] as [Discount Amount Tolerance],
E. [Discount Percentage Tolerance] as [Discount Percentage Tolerance],
E. [Discount Period Tolerance]  as [Discount Period Tolerance] ,
F.[Change Reason Desc] as [Change Reason Desc],
G.[Tax Code Desc] as [Tax Code Desc],
H.[Warehouse Desc] as [Warehouse Desc],
H.[Address Code] as [Warehouse Address Code],
H.[Financial Company] as [Financial Company],
H.[Enterprise unit of Wh] as [Enterprise unit of Wh],
H.[Inventory Mgt Business Partner] as [Inventory Mgt Business Partner],
H.[External Site] as [WH External Site],
H.[External Site Flag] as [WH External Site Flag],
H.[Blocked for Inbound]		As [Blocked for Hnbound],
H.[Blocked for Inbound Desc]	As [Blocked for Inbound Desc],
H.[Blocked for Outbound]		As [Blocked for Outbound],
H.[Blocked for Outbound Desc]	As [Blocked for Outbound Desc],
I.[Items Desc] as [Items Desc],
I.[Item Group] as [Item Group],
I.[Product Class] as [Product Class],
I.[Product Line] as [Product Line],
I.[Item Signal] as [Item Signal],
I.[Country of Origin] as [Country of Origin],
I.[Product Type] as [Product Type],
I.[Inventory Unit] as [Inventory Unit],
I.[Serialized] as [Serialized],
I.[Default Supply Source] as [Default Supply Source],
J.[Address Code] as [Buy-from Address Code],
J.[Country] as [Buy-from Country],
J.[Country Name] as [Buy-from Country Name],
J.[Buy-from BP Name] as [Buy-from BP Name],
J.[Buy-from State/Province] As [Buy-from State/Province],
J.[Buy-from City Name] As [Buy-from City Name],
K.[PoT Passage Desc],
K.[PoT Passage Spec Key],
K.[PoT Passage Spec],
L.[Address Code] as [Ship-from Address Code],
L.[Country] as [Ship-from Country],
L.[Country Name] as [Ship-from Country Name],
L.[Ship-from BP Name] as [Ship-from BP Name],
L.[Ship-from State/Province] As [Ship-from State/Province],
L.[Ship-from City Name] As [Ship-from City Name],
M.[Address] ,
M.[Sites Description],
M.[Parent Site],
M.[Site Category],
M.[Site Status],
M.[Text],
M.[External Site],
N.[levels] As [Product Line Levels],
N.[firstlevel] 	As [Product Line First Level],	
N.[secondlevel] As [Product Line Second Level],	
N.[thirdlevel] 	As [Product Line Third Level],
O.[region] As [Buy-from Region],
O.[sub-region] As [Buy-from Sub Region],
P.[region] As [Ship-from Region],
P.[sub-region] As [Ship-from Sub Region]
from  [dwhcda].[lnc_fct_AP_Pur_Order_Line_History] A

LEFT OUTER JOIN [replncss].[dim Tax Classification] B on 
	A.[compnr] = B.[Company] and A.[bpcl] = B.[Tax Classification]
	
LEFT OUTER JOIN [replncss].[dim Purchase Office] C on 
A.[compnr] = C.[Company] and A.[ccof] = C.[Purchase Office]	

LEFT OUTER JOIN [replncss].[dim Delivery Terms] D on 
	A.[compnr] = D.[Company]and A.[cdec] = D.[Delivery Terms]
	
LEFT OUTER JOIN [replncss].[dim PaymentTerms] E
on A.[cpay] = E.[Payment Terms] and A.[compnr] = E.[Company]	

LEFT OUTER JOIN [replncss].[dim Change Reasons] F
on A.[compnr] = F.[Company] and A.[crcd] = F.[Change Reason]

LEFT OUTER JOIN [replncss].[dim Tax Codes] G on 
A.[compnr] = G.[Company] and A.[cvat] = G.[Tax Code] and A.[ccty] = G.[Country]

LEFT OUTER JOIN [replncss].[dim Warehouse] H on 
A.[compnr] = H.[Company] and A.[cwar] = H.[Warehouse]
	
LEFT OUTER JOIN [replncss].[dim Items] I on 
A.[compnr] = I.[Company] and A.[item] = I.[Item]	

LEFT OUTER JOIN [replncss].[dim Buy-from Business Partners] J on 
A.[compnr] = J.[Company] and A.[otbp] = J.[Buy-from BP]

LEFT OUTER JOIN [replncss].[dim Point of Title Passage] K on 
A.[compnr] = K.[Company] and A.[ptpa] = K.[Point of Title Passage]

LEFT OUTER JOIN [replncss].[dim Ship-from Business Partners] L on 
A.[compnr] = L.[Company] and A.[sfbp] = L.[Ship-from BP]

LEFT OUTER JOIN [replncss].[dim Sites] M on 
A.[compnr] = M.[Company] and A.[site] = M.[Site]

LEFT OUTER JOIN [dwhcda].[lnc_dim_tcmcs061_Ext] N
on I.[Product Line] = N.[cpln] and I.[Company] = N.[compnr]

LEFT OUTER JOIN [dwhcda].[lnc_dim_country_region] O
on J.[Country] = O.[alpha-2]

LEFT OUTER JOIN [dwhcda].[lnc_dim_country_region] P
on L.[Country] = P.[alpha-2]


LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdsls.ckor' And [Enum Language] = 'en_US') Q
on A.[ckor] = Q.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') R
on A.[clyn] = R.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') S
on A.[crbn] = S.[Enum Value]


LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') T
on A.[fire] = T.[Enum Value]


LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcyesno' And [Enum Language] = 'en_US') U
on A.[appr] = U.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcactn' And [Enum Language] = 'en_US') V
on A.[hisa] = V.[Enum Value]


LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdsls.reltype' And [Enum Language] = 'en_US') W
on A.[sctp] = W.[Enum Value]


LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdpur.stat' And [Enum Language] = 'en_US') X
on A.[stat] = X.[Enum Value]

LEFT OUTER JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language]
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tcstsd' And [Enum Language] = 'en_US') Y
on A.[stsd] = Y.[Enum Value];
GO
