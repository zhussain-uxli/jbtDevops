/**********************************************************************************************************************
View Name: [replncss].[dim Purchase Order Bill of Material]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Finance Account Payable & Purchasing

Source Table:[dwhcda].[lnc_dim_tdpur403]
Target View: [replncss].[dim Purchase Order Bill of Material]
Lookup Tables: None
Developer: Pooja Thakur
Date: 13/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop Table [replncss].[dim Purchase Order Bill of Material];

CREATE VIEW [replncss].[dim Purchase Order Bill of Material]
As 
SELECT 
	[compnr] As [Company],
	[orno] As [Purchase Order],
	[ponb] As [Bom Line],
	[pono] As [Line],
	[qibm] As [Qty],
	[sitm] As [Item],
	[sqnb] As [Sequence]
FROM [dwhcda].[lnc_dim_tdpur403]
Where deleted = 'False';
GO
	
/**********************************************************************************************************************
View Name: [replncss].[dim Purchase Order Types]
Description: This view is created based on the Dim Table which is exposed to the Tableau for Dashboard Build.This is a simple 1-1 view by taking data from dimension tables without any transformation logic.

Data Type: Dimension Data
Original Project: JBT Finance Account Payable & Purchasing

Source Table:[dwhcda].[lnc_dim_tdpur094]
Target View: [replncss].[dim Purchase Order Types]
Lookup Tables: None
Developer: Pooja Thakur
Date: 13/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop VIEW [replncss].[dim Purchase Order Types];

CREATE VIEW [replncss].[dim Purchase Order Types]
As 
SELECT 
	[cbor] As [Combine Open Backorders],
	[cfnm] As [Customer Furnished Materials],
	[cnsp] As [Consignment Payment],
	[cnsr] As [Consignment Replenish],
	[compnr] As [Company],
	[coun] As [Collect Order],
	[drct] As [Direct Delivery],
	[dsca] As [Description],
	[efdt] As [Effective Date],
	[etpc] As [Exclude from Target Price Calculation],
	[exdt] As [Expiry Date],
	[ngpc] As [Contract Group],
	[ngpo] As [Purchase Order Group],
	[ngpq] As [RFQ Group],
	[pmsk] As [Obsolete],
	[potp] As [Purchase Order Type],
	[reto] As [Return Order],
	[sepc] As [Contract Series],
	[sepo] As [Purchase Order Series],
	[sepq] As [RFQ Series],
	[slcp] As [Ship Lines Complete],
	[subc] As [Subcontracting Order],
	[sund] As [Cost Order],
	[wrhp] As [Warehousing Order Type] 
FROM [dwhcda].[lnc_dim_tdpur094]
Where deleted = 'False';
GO