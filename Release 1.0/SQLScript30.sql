/**********************************************************************************************************************
Table Name: [dwhcda].[lnc_dim_tdpur403]
Description: This is a dimension table for Accounts Payable Purchase Order Bill of Material
Data Type: Dimension Data
Original Project: JBT Finance Account Payable & Purchasing
Developer: Pooja Thakur
Date: 12/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop Table [dwhcda].[lnc_dim_tdpur403];

CREATE TABLE [dwhcda].[lnc_dim_tdpur403]
(
	[compnr] [varchar](10) NOT NULL,
	[deleted] [varchar](10) NULL,
	[orno] [varchar](9) NOT NULL,
	[orno_pono_sqnb_ref_compnr] [varchar](10) NULL,
	[orno_ref_compnr] [varchar](10) NULL,
	[ponb] [int] NOT NULL,
	[pono] [int] NOT NULL,
	[qibm] [float] NULL,
	[sequencenumber] [int] NULL,
	[sitm] [varchar](47) NULL,
	[sitm_ref_compnr] [varchar](10) NULL,
	[sqnb] [int] NOT NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NOT NULL
)
WITH
(
    DISTRIBUTION = REPLICATE
)
GO

/**********************************************************************************************************************
Table Name: [dwhcda].[lnc_dim_tdpur094]
Description: This is a dimension table for Accounts Payable Purchase Order Types
Data Type: Dimension Data
Original Project: JBT Finance Account Payable & Purchasing
Developer: Pooja Thakur
Date: 12/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop Table [dwhcda].[lnc_dim_tdpur094];

CREATE TABLE [dwhcda].[lnc_dim_tdpur094]
(
	[cbor] [int] NULL,
	[cbor_kw] [varchar](255) NULL,
	[cfnm] [int] NULL,
	[cfnm_kw] [varchar](255) NULL,
	[cnsp] [int] NULL,
	[cnsp_kw] [varchar](255) NULL,
	[cnsr] [int] NULL,
	[cnsr_kw] [varchar](255) NULL,
	[compnr] [varchar](10) NOT NULL,
	[coun] [int] NULL,
	[coun_kw] [varchar](255) NULL,
	[deleted] [varchar](10) NULL,
	[drct] [int] NULL,
	[drct_kw] [varchar](255) NULL,
	[dsca] [varchar](255) NULL,
	[efdt] [datetime] NULL,
	[etpc] [int] NULL,
	[etpc_kw] [varchar](255) NULL,
	[exdt] [datetime] NULL,
	[ngpc] [varchar](3) NULL,
	[ngpc_ref_compnr] [varchar](10) NULL,
	[ngpc_sepc_ref_compnr] [varchar](10) NULL,
	[ngpo] [varchar](3) NULL,
	[ngpo_ref_compnr] [varchar](10) NULL,
	[ngpo_sepo_ref_compnr] [varchar](10) NULL,
	[ngpq] [varchar](3) NULL,
	[ngpq_ref_compnr] [varchar](10) NULL,
	[ngpq_sepq_ref_compnr] [varchar](10) NULL,
	[pmsk] [varchar](20) NULL,
	[potp] [varchar](3) NOT NULL,
	[zproc] [varchar](6) NULL,
	[reto] [int] NULL,
	[reto_kw] [varchar](255) NULL,
	[sepc] [varchar](8) NULL,
	[sepo] [varchar](8) NULL,
	[sepq] [varchar](8) NULL,
	[sequencenumber] [int] NULL,
	[slcp] [int] NULL,
	[slcp_kw] [varchar](255) NULL,
	[subc] [int] NULL,
	[subc_kw] [varchar](255) NULL,
	[sund] [int] NULL,
	[sund_kw] [varchar](255) NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[wrhp] [varchar](3) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NOT NULL
)
WITH
(
    DISTRIBUTION = REPLICATE
)
GO
