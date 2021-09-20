/**********************************************************************************************************************
View Name: [replncss].[dim Work Cells Table]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Production Planning & Scheduling

Source Table:[dwhcda].[lnc_dim_tirpt040]
Target View: [replncss].[dim Work Cells Table]
Lookup Tables: None
Developer: Pooja Thakur
Date: 16/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop VIEW [replncss].[dim Work Cells Table];

CREATE VIEW [replncss].[dim Work Cells Table]
AS
SELECT
	[bfem] 		As [Employee for Hours],
	[cdf_devc] 	As [Default Label Device],
	[compnr] 	As [Company],
	[cwoc] 		As [Work Cell],
	[noop] 		As [Available Labor Resources],
	[oprc] 		As [Operation Rate Code],
	[pddp] 		As [Production Department],
	[zrows] 	As [Report on Work Stations],
	[rpwc] 		As [Repair Cell],
	[site] 		As [Site],
	[wcpg]		As [Work Cell Plan Group],
	[wctp] 		As [Work Cell Type]
FROM [dwhcda].[lnc_dim_tirpt040]
Where deleted = 'False';
GO	
	
/**********************************************************************************************************************
View Name: [replncss].[dim Warehousing Orders]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Production Planning & Scheduling

Source Table:[dwhcda].[lnc_dim_whinh200]
Target View: [replncss].[dim Warehousing Orders]
Lookup Tables: None
Developer: Pooja Thakur
Date: 16/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop VIEW [replncss].[dim Warehousing Orders];

CREATE VIEW [replncss].[dim Warehousing Orders]
AS
SELECT
	[adat] As [Assembly Date],
	[adin] As [Additional Information],
	[akit] As [Assembly Kit],
	[asst] As [Assembly Status],
	[bflh] As [Backflush Order],
	[blor] As [Blanket Order],
	[carr] As [Carrier/LSP],
	[cbin] As [Carrier/LSP Binding],
	[cdec] As [Delivery Terms],
	[clan] As [Language],
	[clgr] As [List Group],
	[compnr] As [Company],
	[cons] As [Consignment],
	[crte] As [Route],
	[ctdt] As [Contract Date],
	[delc] As [Delivery Code],
	[depc] As [Office Company],
	[dmst] As [Direct Material Supply Transfer],
	[fqua] As [From Quarantine],
	[gnld] As [General Ledger],
	[grid] As [Order Group],
	[hsta] As [Header Status],
	[huid] As [Handling Unit],
	[info] As [Information],
	[invc] As [Obsolete 1],
	[iscn] As [Obsolete 2],
	[isit] As [Assign Item Surcharges for Item Transfer],
	[item] As [Item],
	[ittp] As [Inventory Transaction Type],
	[ktor] As [Order for Kit],
	[lccl] As [Landed Costs Classification],
	[list] As [Kit Definition],
	[maxd] As [Maximum Time Tolerance in Days],
	[maxt] As [Maximum Quantity Tolerance],
	[mind] As [Minimum Time Tolerance in Days],
	[mint] As [Minimum Quantity Tolerance],
	[motv] As [Motive of Transport],
	[odat] As [Order Date],
	[oorg] As [Order Origin],
	[orno] As [Order],
	[orun] As [Order Unit],
	[oset] As [Set],
	[otyp] As [Warehousing Order Type],
	[pddt] As [Planned Delivery Date],
	[plbs] As [Planning by Supplier],
	[prdt] As [Planned Receipt Date],
	[ptpa] As [Point of Title Passage],
	[qord] As [Ordered Quantity in Inventory Unit],
	[qoro] As [Ordered Quantity in Order Unit],
	[quar] As [To Quarantine],
	[rdgd] As [Return Quarantine Inventory Payable to Supplier],
	[refe] As [Reference],
	[refg] As [Grouping Reference],
	[rodr] As [Related Multisite Order],
	[rrgd] As [Return Rejected Goods],
	[rtrn] As [Return Order],
	[scon] As [Shipping Constraint],
	[seri] As [Series],
	[serv] As [Freight Service Level],
	[setn] As [Shipping Set],
	[sfad] As [Ship-from Address],
	[sfco] As [Ship-from Code],
	[sfcp] As [Ship-from Company],
	[sfit] As [From Item],
	[sflo] As [Ship-from Location],
	[sflt] As [From Lot],
	[sfrv] As [From Revision],
	[sfsi] As [Ship-from Site],
	[sfsr] As [From Serial Number],
	[sfty] As [Ship-from Type],
	[stad] As [Ship-to Address],
	[stco] As [Ship-to Code],
	[stcp] As [Ship-to Company ],
	[stit] As [Into Item],
	[stlo] As [Ship-to Location],
	[stlt] As [Into Lot],
	[strv] As [Into Revision],
	[stsi] As [Ship-to Site],
	[stsr] As [Into Serial Number],
	[stty] As [Ship-to Type],
	[subc] As [Subcontracting],
	[txta] As [Header Text],
	[txtb] As [Footer Text],
	[txtk] As [Kit Text],
	[wdep] As [Office]
FROM [dwhcda].[lnc_dim_whinh200]
Where deleted = 'False';
GO

/**********************************************************************************************************************
View Name: [replncss].[lnc_dim_tirpt200]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Production Planning & Scheduling

Source Table:[dwhcda].[lnc_dim_tirpt200]
Target View: [replncss].[dim Production Models]
Lookup Tables: None
Developer: Pooja Thakur
Date: 16/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop VIEW [replncss].[lnc_dim_tirpt200];

CREATE View [replncss].[dim Production Models]
as 
select 
	[apby] as [Approved By],
	[apon] as [Approved On],
	[bmsc] as [Source],
	[compnr] as [Company Number],
	[crby] as [Created By],
	[cron]  as [Created On],
	[cwoc] as [Work Cell],
	[efdt] as [Effective Date],
	[exby] as [Expired By],
	[exdt] as [Expiry Date],
	[exon] as [Expired On],
	[item] as [Item],
	[loca] as [Location],
	[mirq] as [Minimum Run],
	[mxrq] as [Maximum Run],
	[noop] as [# Labor Resources],
	[oplt] as [Order Plan Lead Time],
	[oplu] as [Order Plan Lead Time Unit] ,
	[opqn] as [Order Plan Quantity] ,
	[oprq] as [Optimal Run],
	[prmd] as [Production Model],
	[prmt] as [Production Model Type],
	[prmv] as [Production Model Revision],
	[psta] as [Production Model Status] ,
	[pufc] as [Use for Costing],
	[pufp] as [Use for Planning],
	[qwar] as [Quarantine Warehouse],
	[rate] as [Rate],
	[rltm] as [Repair Lead Time],
	[rltu] as [Repair Lead Time Unit],
	[zrows] as [Report on Work Stations],
	[rpwc] as [Repair Cell],
	[rttu] as [Rate Time Unit],
	[rwar] as [Receiving Warehouse],
	[scrv] as [Source Revision],
	[site] as [Site],
	[slqn] as [Schedule Line Quantity],
	[trqn] as [Transfer Quantity],
	[ufc2] as [Use for Costing by Site]
	from [dwhcda].[lnc_dim_tirpt200]
	Where deleted = 'False';
GO