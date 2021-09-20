/**********************************************************************************************************************
View Name: [replncss].[fct Sales Order Act Delivery Lines]
Description: This view is created based on the Fact Table which is exposed to the Tableau for Dashboard Build.This view is taking data from two one "Fact","Dst" and multiple "Dim" source tables without any transformation logic.

Data Type: Fact Data
Source Table:[acq101].[dst_tdsls406],[acq101].[lnc_fct_Orders]
Target View: [replncss].[fct Sales Order Act Delivery Lines]
Lookup Tables / Views: [replncss].[dim Carriers/LSP],[replncss].[dim Change Reasons],[replncss].[dim Item Inventory by Warehouse],[replncss].[dim Items],[replncss].[dim Lines of Business],[replncss].[dim Sales Office],[replncss].[dim Sales Order Types],[replncss].[dim Ship-to Business Partners],[replncss].[dim Sold-to Business Partners],[replncss].[dim Tax Classification],[replncss].[dim Warehouse],[dwhcda].[lnc_dim_tcmcs061_Ext],
[replncss].[dim Departments],[dwhcda].[lnc_dim_country_region]

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 06/09/2021
Reviewed By: Atul Raje

Change History:

**********************************************************************************************************************/

--Drop View [replncss].[fct Sales Order Act Delivery Lines];

CREATE VIEW [replncss].[fct Sales Order Act Delivery Lines]
AS 
SELECT  sub_qry.[Line Disc Amt],sub_qry.[SO Blocked],sub_qry.[Canceled],sub_qry.[Contract],sub_qry.[Cust Order],sub_qry.[Change Reason],
		sub_qry.[BackOrd UoM],sub_qry.[Warehouse],sub_qry.[Init Req Date],sub_qry.[Cust Req Date],[Orig Deliv Date],
		sub_qry.[Delivery Datetime],sub_qry.[Delivery Date],sub_qry.[SO Order Date],sub_qry.[Plnd Receipt Date],
		sub_qry.[Plan Deliv Date],sub_qry.[Sales Inv Date],sub_qry.[Sales Lines],sub_qry.[Price],
		sub_qry.[SO Delivered Qty],sub_qry.[Original Ordered Qty],sub_qry.[Exch Rate Type],sub_qry.[Supply-from Whs],
		sub_qry.[So Shipment],sub_qry.[Line Sequence],sub_qry.[Ship-to Whs],[Ext Sales Rep],sub_qry.[Return Reason],sub_qry.[Sales Ord Type],
		sub_qry.[Sales Price List],sub_qry.[Installments],sub_qry.[Ord Disc Amt],sub_qry.[Tax Classif],sub_qry.[Delivery Terms],
		sub_qry.[Discount Code],sub_qry.[Carrier],sub_qry.[Company number],sub_qry.[Sales Price Unit],sub_qry.[Sales Qty Unit],
		sub_qry.[Delivery Code],sub_qry.[SO Discount],sub_qry.[Delivery Type],Trim(sub_qry.[Items]) As [Items],sub_qry.[Discount Amt],
		sub_qry.[Price Origin],sub_qry.[PoTP],sub_qry.[Line of Business],sub_qry.[Payment Terms],sub_qry.[Sales Rep],sub_qry.[Financial Dept],
		sub_qry.[Invoice-to Addr],sub_qry.[Invoice-to BP],sub_qry.[Sold-to Address],sub_qry.[Sold-to BP],sub_qry.[Payment Method],
		sub_qry.[Rate Type],sub_qry.[Currency],sub_qry.[Service Office],sub_qry.[Order Discount],
		Case when sub_qry.row_no > 1 then 0 Else sub_qry.[Est Order Amt] End As [Est Order Amt],[Ship-to Address],
		sub_qry.[Ship-to BP],sub_qry.[Sales Type],sub_qry.[Tax Code],sub_qry.[Department],sub_qry.[Order Number],sub_qry.[Order Line Numb],
		sub_qry.[Table Desc],sub_qry.[Table Shortcode],sub_qry.[Time of Action],sub_qry.[SO Act Deliv Line Seq Numb],sub_qry.[SO Invoice Line],
		Case when sub_qry.row_no > 1 then 0 Else sub_qry.[Remain Order Qty] End As [Remain Order Qty],
		Case when sub_qry.row_no > 1 then 0 Else sub_qry.[Order Value Due] End As [Order Value Due],
		Case When (Case when sub_qry.row_no > 1 then 0 Else sub_qry.[Remain Order Qty] End) = 0 THEN 1 ELSE 0 END AS [Completed Delivery Flag],
		sub_qry.[Back Order Qty],Case when sub_qry.row_no > 1 then 0 Else sub_qry.[Ordered Qty] End As [Ordered Qty],
		sub_qry.[DWH Load Time],sub_qry.[site],sub_qry.[Delivered Value],
		T.[hdst] As [SO Order Status],U.[Enum Desc] AS [SO Order Status Desc],sub_qry.[Ship Constraint],V.[Enum Desc] As [Ship Constraint Desc],
		B.[Carrier/LSP Desc],B.[Deleted Record],B.[Carrier Alpha Code],B.[Buy-from Business Partner],B.[Transport Category],
		B.[Transport Category Desc],C.[Change Reason Desc],D.[Last Inventory Transaction Date],D.[Inventory Allocated],
		D.[Inventory Blocked],D.[Inventory Blocked for Planning],D.[Consignment Inventory Location Allocated],D.[Consignment Inventory on Hand],
		D.[Cumulative Issue],D.[Consignment Inventory in Transit],D.[Inventory Committed],D.[Consignment on Order],
		D.[Inventory Committed in Process],D.[Consigned Quarantine],D.[Goods in Transit],D.[Historical Balance],
		Case when sub_qry.row_no > 1 then 0 Else D.[Inventory on Hand] End [Inventory on Hand],
		D.[Company Owned Quarantine Inventory],D.[Inventory in Transit],D.[Inventory Location Allocated],D.[Cust Owned Location Allocated],
		D.[Cust Owned Blocked],D.[Cust Owned Blocked for Planning],D.[Cust Owned on Hand],D.[Cust Owned in Transit],
		D.[Cust Owned on Order],D.[Cust Owned Quarantine],D.[Comp Owned Location Allocated],D.[Comp Owned on Order],D.[Inventory on Order],
		E.[Items Desc],E.[Item Group],E.[Product Class],E.[Product Line],E.[Item Signal],E.[Country of Origin],E.[Product Type],
		E.[Inventory Unit],E.[Serialized],E.[Default Supply Source],F.[Line of Business Desc],G.[Sales Office Desc],
		H.[Sales Order Type Desc],I.[Address Code] As [Ship-to Address Code],I.[Country] As [Ship-to Country],I.[Country Name] As [Ship-to Country Name],I.[Ship-to BP Name],I.[Ship-to State/Province],I.[Ship-to City Name],I.[Ship-to Latitude],I.[Ship-to Longitude],
		J.[Address Code] As [Sold-to Address Code],J.[Country] As [Sold-to Country],J.[Country Name] As [Sold-to Country Name],
		J.[Sold-to BP Name],J.[Sold-to State/Province],J.[Sold-to City Name],J.[Sold-to Latitude],J.[Sold-to Longitude],K.[Tax Classification Desc], K.[Max W/Tax %],K.[SCT Allowed],K.[SCT Allowed Falg],K.[WIT Allowed],K.[WIT Allowed Flag],L.[Warehouse Desc],
		L.[Address Code] As [Warehouse Address Code],L.[Financial Company],L.[Enterprise unit of Wh],L.[Inventory Mgt Business Partner],
		L.[External Site],L.[External Site Flag],L.[Blocked for Inbound],L.[Blocked for Inbound Desc],L.[Blocked for Outbound],
		L.[Blocked for Outbound Desc],M.[levels] As [Product Line Levels],M.[firstlevel] As [Product Line First Level],
		M.[secondlevel] As [Product Line Second Level],M.[thirdlevel] As [Product Line Third Level],N.[Department Name] As [Department Desc],
		N.[Site] As [Department Site],N.[Department Type Key],N.[Department Type],O.[region] As [Ship-to Region],O.[sub-region] As [Ship-to Sub Region],P.[region] As [Sold-to Region],P.[sub-region] As [Sold-to Sub Region],Q.[Default Supply Source By Site],
		Q.[Default Supply Source By Site Desc],R.[nama] As [Ship-to Address Desc],S.[nama] As [Sold-to Address Desc],
		sub_qry.[SO Act Delivery Key],sub_qry.row_no
FROM (
SELECT 	IsNull(amld,0) As [Line Disc Amt], bkyn As [SO Blocked], clyn As [Canceled], cono As [Contract], corn As [Cust Order], 
		crcd As [Change Reason],cubs As [BackOrd UoM], cwar As [Warehouse],dldt As [Delivery Datetime],
		Case When Convert(Date,ddtb) = '1970-01-01' Then Null Else Convert(Date,FORMAT(ddtb,'yyyy-MM-dd')) End As [Init Req Date], 
		Case When Convert(Date,ddtc) = '1970-01-01' Then Null Else Convert(Date,FORMAT(ddtc,'yyyy-MM-dd')) End As [Cust Req Date], 
		Case When Convert(Date,ddtd) = '1970-01-01' Then Null Else Convert(Date,FORMAT(ddtd,'yyyy-MM-dd')) End As [Orig Deliv Date], 
		Case When Convert(Date,dldt) = '1970-01-01' Then Null Else Convert(Date,FORMAT(dldt,'yyyy-MM-dd')) End As [Delivery Date], 
		Case When Convert(Date,odat) = '1970-01-01' Then Null Else Convert(Date,FORMAT(odat,'yyyy-MM-dd')) End As [SO Order Date],
		Case When Convert(Date,prdt) = '1970-01-01' Then Null Else Convert(Date,FORMAT(prdt,'yyyy-MM-dd')) End As [Plnd Receipt Date], 
		Case When Convert(Date,ddta) = '1970-01-01' Then Null Else Convert(Date,FORMAT(ddta,'yyyy-MM-dd')) End As [Plan Deliv Date], 
		Case When Convert(Date,invd) = '1970-01-01' Then Null Else Convert(Date,FORMAT(invd,'yyyy-MM-dd')) End As [Sales Inv Date],
		pono As [Sales Lines],IsNull(pric,0) As [Price], IsNull(qidl,0) As [SO Delivered Qty], IsNull(qoor,0) As [Original Ordered Qty], 
		ratt As [Exch Rate Type],sfwh As [Supply-from Whs], shpm As [So Shipment], sqnb As [Line Sequence], 
		stwh As [Ship-to Whs], osrp As [Ext Sales Rep], retr As [Return Reason], sotp As [Sales Ord Type], cpls As [Sales Price List], 
		futo As [Installments], IsNull(amod,0) As [Ord Disc Amt], bpcl As [Tax Classif], cdec As [Delivery Terms],cdis_1 As [Discount Code], 
		cfrw As [Carrier],compnr As [Company number], cups As [Sales Price Unit], cuqs As [Sales Qty Unit],delc As [Delivery Code], 
		IsNull(disc_1,0) As [SO Discount], dltp As [Delivery Type], item As [Items], IsNull(ldam_1,0) As [Discount Amt], porg As [Price Origin],
		ptpa As [PoTP], cbrn As [Line of Business], cpay As [Payment Terms], crep As [Sales Rep], fdpt As [Financial Dept],
		itad As [Invoice-to Addr], itbp As [Invoice-to BP], ofad As [Sold-to Address], ofbp As [Sold-to BP],paym As [Payment Method], 
		rtyp As [Rate Type], ccur As [Currency], cwoc As [Service Office], IsNull(oamt,0) As [Est Order Amt],odis As [Order Discount],
		stad As [Ship-to Address], stbp As [Ship-to BP], styp As [Sales Type], cvat As [Tax Code], cofc As [Department],orno As [Order Number],
		[lineno] As [Order Line Numb], Table_ID As [Table Desc], Table_Flag As [Table Shortcode],IsNull(remoqty,0) As [Remain Order Qty],
		IsNull(ordvaldue,0) As [Order Value Due], ztimestamp As [Time of Action],dsqn As [SO Act Deliv Line Seq Numb],
		invl As [SO Invoice Line],IsNull(qbbo,0) As [Back Order Qty],(IsNull(qoor,0) - IsNull(qbbo,0)) As [Ordered Qty],
		dwh_load_time As [DWH Load Time],[site] As [site],Isnull(damt,0) As [Delivered Value],scon As [Ship Constraint],
		scon_kw As [Ship Constraint Orig Desc],SO_Act_Deliv_Key As [SO Act Delivery Key],row_no
FROM (		
SELECT	A.amld,A.dldt,A.pono,A.pric,A.qidl,A.damt,A.shpm,A.sqnb,A.amod,A.cdec,A.cdis_1,A.cfrw,A.compnr,A.cups,A.disc_1,
		A.dltp,A.ldam_1,A.orno,A.porg,A.ptpa,A.stad,A.stbp,A.invd,A.ztimestamp,A.dsqn,A.invl,
		Convert(Varchar,A.pono) + '_' + Convert(Varchar,A.sqnb) As [lineno],'SO_Act_Delv_Lines' As Table_ID,
		'SOADL' as Table_Flag,A.deleted,A.dwh_load_time,
		B.bkyn,B.clyn,B.cono,B.crcd,B.cubs,B.cwar,B.ddta,B.ddtb,B.ddtc,B.ddtd,B.odat,B.qoor,B.ratt,B.scon,B.sfwh,
		B.stwh,B.bpcl,B.cuqs,B.item,B.cpay,B.oamt,B.styp,B.cvat,B.delc,B.ofbp,B.cwoc,B.corn,B.prdt,B.qbbo,B.site,
		B.scon_kw,B.cbrn,B.cofc,B.crep,B.fdpt,B.itad,B.itbp,B.ofad,B.osrp,B.paym,B.retr,B.rtyp,B.sotp,B.ccur,
		B.cpls,B.ddat,B.futo,B.hdst,B.odis,B.hdst_kw,B.ordvaldue,B.remoqty,
		A.compnr + '_' + A.orno + '_' + Convert(Varchar,A.pono) + '_' + Convert(Varchar,A.sqnb) + '_' + Convert(Varchar,A.dsqn) + '_' + Convert(Varchar,A.invl) As [SO_Act_Deliv_Key],row_number() Over (Partition by A.compnr,A.orno,A.pono,A.sqnb Order by A.sqnb) As row_no
FROM 	[acq101].[dst_tdsls406] A
LEFT JOIN (SELECT compnr,orno,pono,sqnb,bkyn,clyn,cono,crcd,cubs,cwar,ddta,ddtb,ddtc,ddtd,odat,qoor,ratt,scon,sfwh,stwh,bpcl,cuqs,
			item,cpay,oamt,styp,cvat,delc,ofbp,cwoc,corn,prdt,qbbo,site,scon_kw,cbrn,cofc,crep,fdpt,itad,itbp,
			ofad,osrp,paym,retr,rtyp,sotp,ccur,cpls,ddat,futo,hdst,odis,hdst_kw,ordvaldue,remoqty
FROM [dwhcda].[lnc_fct_Orders] Where [deleted] = 'False' And Table_Flag = 'SO') B
ON A.[compnr] = B.[compnr] And A.[orno] = B.[orno] And A.[pono] = B.[pono] And A.[sqnb] = B.[sqnb]
WHERE A.[deleted] = 'False'	And Isnull(A.[qidl],0) > 0		
	) qry
)sub_qry

LEFT JOIN [replncss].[dim Carriers/LSP] B
on sub_qry.[Carrier] = B.[Carrier/LSP] And sub_qry.[Company number] = B.[Company]

LEFT JOIN [replncss].[dim Change Reasons] C
on sub_qry.[Change Reason] = C.[Change Reason] And sub_qry.[Company number] = C.[Company]

LEFT JOIN [replncss].[dim Item Inventory by Warehouse] D
on sub_qry.[Warehouse] = D.[Warehouse] And sub_qry.[Company number] = D.[Company] and sub_qry.[Items] = D.[Item]

LEFT JOIN [replncss].[dim Items] E
on sub_qry.[Items] = E.[Item] And sub_qry.[Company number] = E.[Company]

LEFT JOIN [replncss].[dim Lines of Business] F
on sub_qry.[Line of Business] = F.[Line of Business] And sub_qry.[Company number] = F.[Company]

LEFT JOIN [replncss].[dim Sales Office] G
on sub_qry.[Department] = G.[Sales Office] And sub_qry.[Company number] = G.[Company]

LEFT JOIN [replncss].[dim Sales Order Types] H
on sub_qry.[Sales Ord Type] = H.[Sales Order Type] And sub_qry.[Company number] = H.[Company]

LEFT JOIN [replncss].[dim Ship-to Business Partners] I
on sub_qry.[Ship-to BP] = I.[Ship-to BP] And sub_qry.[Company number] = I.[Company]

LEFT JOIN [replncss].[dim Sold-to Business Partners] J
on sub_qry.[Sold-to BP] = J.[Sold-to BP] And sub_qry.[Company number] = J.[Company]

LEFT JOIN [replncss].[dim Tax Classification] K
on sub_qry.[Tax Classif] = K.[Tax Classification] And sub_qry.[Company number] = K.[Company]

LEFT JOIN [replncss].[dim Warehouse] L
on sub_qry.[Warehouse] = L.[Warehouse] And sub_qry.[Company number] = L.[Company]

LEFT JOIN [dwhcda].[lnc_dim_tcmcs061_Ext] M
on E.[Product Line] = M.[cpln] and E.[Company] = M.[compnr]

LEFT JOIN [replncss].[dim Departments] N
on sub_qry.[Department] = N.[Department] And sub_qry.[Company number] = N.[Company number]

LEFT JOIN [dwhcda].[lnc_dim_country_region] O
on I.[Country] = O.[alpha-2]

LEFT JOIN [dwhcda].[lnc_dim_country_region] P
on J.[Country] = P.[alpha-2]

LEFT JOIN [replncss].[dim Item By Site] Q
on sub_qry.[Items] = Q.[Item] And sub_qry.[Company number] = Q.[Company] 
And sub_qry.[Site] = Q.[Site]

LEFT JOIN (Select Distinct compnr,cadr,nama From [acq101].[dst_tccom130]) R
on sub_qry.[Ship-to Address] = R.[cadr] And sub_qry.[Company number] = R.[compnr]

LEFT JOIN (Select Distinct compnr,cadr,nama From [acq101].[dst_tccom130]) S
on sub_qry.[Sold-to Address] = S.[cadr] And sub_qry.[Company number] = S.[compnr]  

LEFT OUTER JOIN (Select Distinct compnr,orno,hdst,hdst_kw
From acq101.dst_tdsls400) T
on sub_qry.[Order Number] = T.[orno] And sub_qry.[Company number] = T.[compnr]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdsls.hdst' And [Enum Language] = 'en_US') U
on T.[hdst] = U.[Enum Value]

LEFT JOIN (Select Distinct [Enum Value],[Enum Desc],[Enum Domain],[Enum Keyword],[Enum Language] 
From [replncss].[dim Enum Descriptions] Where [Enum Domain] = 'tdscon' And [Enum Language] = 'en_US') V
on sub_qry.[Ship Constraint] = V.[Enum Value];
