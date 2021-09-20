/**********************************************************************************************************************
Table Name: [dwhcda].[lnc_dim_tirpt040]
Description: This is a dimension table for Work Cells table
Data Type: Dimension Data
Original Project: JBT Production Planning & Scheduling
Developer: Pooja Thakur
Date: 14/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop Table [dwhcda].[lnc_dim_tirpt040];

CREATE TABLE [dwhcda].[lnc_dim_tirpt040]
(
	[bfem] [varchar](9) NULL,
	[bfem_ref_compnr] [varchar](10) NULL,
	[cdf_devc] [varchar](20) NULL,
	[compnr] [varchar](10) NOT NULL,
	[cwoc] [varchar](6) NOT NULL,
	[cwoc_ref_compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[noop] [float] NULL,
	[oprc] [varchar](6) NULL,
	[oprc_ref_compnr] [varchar](10) NULL,
	[pddp] [varchar](6) NULL,
	[pddp_ref_compnr] [varchar](10) NULL,
	[zrows] [int] NULL,
	[rows_kw] [varchar](255) NULL,
	[rpwc] [varchar](6) NULL,
	[sequencenumber] [int] NULL,
	[site] [varchar](9) NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[wcpg] [varchar](6) NULL,
	[wcpg_ref_compnr] [varchar](10) NULL,
	[wctp] [int] NULL,
	[wctp_kw] [varchar](255) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = REPLICATE
)
GO

/**********************************************************************************************************************
Table Name: [dwhcda].[lnc_dim_whinh200]
Description: This is a dimension table for Warehousing Orders
Data Type: Dimension Data
Original Project: JBT Production Planning & Scheduling
Developer: Pooja Thakur
Date: 14/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop Table [dwhcda].[lnc_dim_whinh200];


CREATE TABLE [dwhcda].[lnc_dim_whinh200]
(
	[adat] [datetime] NULL,
	[adin] [varchar](22) NULL,
	[akit] [varchar](15) NULL,
	[akit_ref_compnr] [varchar](10) NULL,
	[asst] [int] NULL,
	[asst_kw] [varchar](255) NULL,
	[bflh] [int] NULL,
	[bflh_kw] [varchar](255) NULL,
	[blor] [int] NULL,
	[blor_kw] [varchar](255) NULL,
	[carr] [varchar](3) NULL,
	[carr_ref_compnr] [varchar](10) NULL,
	[cbin] [int] NULL,
	[cbin_kw] [varchar](255) NULL,
	[cdec] [varchar](3) NULL,
	[cdec_ref_compnr] [varchar](10) NULL,
	[clan] [varchar](3) NULL,
	[clan_ref_compnr] [varchar](10) NULL,
	[clgr] [varchar](3) NULL,
	[clgr_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NOT NULL,
	[cons] [int] NULL,
	[cons_kw] [varchar](255) NULL,
	[crte] [varchar](5) NULL,
	[crte_ref_compnr] [varchar](10) NULL,
	[ctdt] [datetime] NULL,
	[delc] [varchar](6) NULL,
	[delc_ref_compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[depc] [int] NULL,
	[depc_ref_compnr] [varchar](10) NULL,
	[dmst] [int] NULL,
	[dmst_kw] [varchar](255) NULL,
	[fqua] [int] NULL,
	[fqua_kw] [varchar](255) NULL,
	[gnld] [varchar](22) NULL,
	[grid] [varchar](9) NULL,
	[hsta] [int] NULL,
	[hsta_kw] [varchar](255) NULL,
	[huid] [varchar](25) NULL,
	[info] [varchar](255) NULL,
	[invc] [int] NULL,
	[invc_kw] [varchar](255) NULL,
	[iscn] [int] NULL,
	[iscn_kw] [varchar](255) NULL,
	[isit] [int] NULL,
	[isit_kw] [varchar](255) NULL,
	[item] [varchar](47) NULL,
	[item_ref_compnr] [varchar](10) NULL,
	[ittp] [int] NULL,
	[ittp_kw] [varchar](255) NULL,
	[ktor] [int] NULL,
	[ktor_kw] [varchar](255) NULL,
	[lccl] [varchar](12) NULL,
	[lccl_ref_compnr] [varchar](10) NULL,
	[list] [varchar](47) NULL,
	[list_ref_compnr] [varchar](10) NULL,
	[maxd] [int] NULL,
	[maxt] [float] NULL,
	[mind] [int] NULL,
	[mint] [float] NULL,
	[motv] [varchar](6) NULL,
	[motv_ref_compnr] [varchar](10) NULL,
	[odat] [datetime] NULL,
	[oorg] [int] NOT NULL,
	[oorg_kw] [varchar](255) NULL,
	[orno] [varchar](9) NOT NULL,
	[orun] [varchar](3) NULL,
	[orun_ref_compnr] [varchar](10) NULL,
	[oset] [int] NOT NULL,
	[otyp] [varchar](3) NULL,
	[otyp_ref_compnr] [varchar](10) NULL,
	[pddt] [datetime] NULL,
	[plbs] [int] NULL,
	[plbs_kw] [varchar](255) NULL,
	[prdt] [datetime] NULL,
	[ptpa] [varchar](9) NULL,
	[ptpa_ref_compnr] [varchar](10) NULL,
	[qord] [float] NULL,
	[qoro] [float] NULL,
	[quar] [int] NULL,
	[quar_kw] [varchar](255) NULL,
	[rdgd] [int] NULL,
	[rdgd_kw] [varchar](255) NULL,
	[refe] [varchar](255) NULL,
	[refg] [varchar](255) NULL,
	[rodr] [varchar](9) NULL,
	[rrgd] [int] NULL,
	[rrgd_kw] [varchar](255) NULL,
	[rtrn] [int] NULL,
	[rtrn_kw] [varchar](255) NULL,
	[scon] [int] NULL,
	[scon_kw] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[seri] [varchar](8) NULL,
	[serv] [varchar](3) NULL,
	[serv_ref_compnr] [varchar](10) NULL,
	[setn] [int] NULL,
	[sfad] [varchar](9) NULL,
	[sfco] [varchar](9) NULL,
	[sfcp] [int] NULL,
	[sfit] [varchar](47) NULL,
	[sfit_ref_compnr] [varchar](10) NULL,
	[sflo] [varchar](10) NULL,
	[sflt] [varchar](20) NULL,
	[sfrv] [varchar](6) NULL,
	[sfsi] [varchar](9) NULL,
	[sfsi_ref_compnr] [varchar](10) NULL,
	[sfsr] [varchar](30) NULL,
	[sfty] [int] NULL,
	[sfty_kw] [varchar](255) NULL,
	[stad] [varchar](9) NULL,
	[stco] [varchar](9) NULL,
	[stcp] [int] NULL,
	[stit] [varchar](47) NULL,
	[stit_ref_compnr] [varchar](10) NULL,
	[stlo] [varchar](10) NULL,
	[stlt] [varchar](20) NULL,
	[strv] [varchar](6) NULL,
	[stsi] [varchar](9) NULL,
	[stsi_ref_compnr] [varchar](10) NULL,
	[stsr] [varchar](30) NULL,
	[stty] [int] NULL,
	[stty_kw] [varchar](255) NULL,
	[subc] [int] NULL,
	[subc_kw] [varchar](255) NULL,
	[ztimestamp] [datetime] NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[txtb] [int] NULL,
	[txtb_ref_compnr] [varchar](10) NULL,
	[txtk] [int] NULL,
	[txtk_ref_compnr] [varchar](10) NULL,
	[username] [varchar](8) NULL,
	[wdep] [varchar](6) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = REPLICATE
)
GO

/**********************************************************************************************************************
Table Name: [dwhcda].[lnc_dim_tirpt200]
Description: This is a dimension table for Production Models
Data Type: Dimension Data
Original Project: JBT Production Planning & Scheduling
Developer: Pooja Thakur
Date: 14/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop Table [dwhcda].[lnc_dim_tirpt200];

CREATE TABLE [dwhcda].[lnc_dim_tirpt200]
(
	[apby] [varchar](12) NULL,
	[apon] [datetime] NULL,
	[bmsc] [int] NULL,
	[bmsc_kw] [varchar](255) NULL,
	[compnr] [varchar](10) NOT NULL,
	[crby] [varchar](12) NULL,
	[cron] [datetime] NULL,
	[cwoc] [varchar](6) NULL,
	[cwoc_ref_compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[efdt] [datetime] NULL,
	[exby] [varchar](12) NULL,
	[exdt] [datetime] NULL,
	[exon] [datetime] NULL,
	[item] [varchar](47) NOT NULL,
	[item_ref_compnr] [varchar](10) NULL,
	[item_site_ref_compnr] [varchar](10) NULL,
	[loca] [varchar](10) NULL,
	[mirq] [float] NULL,
	[mxrq] [float] NULL,
	[noop] [float] NULL,
	[oplt] [float] NULL,
	[oplu] [int] NULL,
	[oplu_kw] [varchar](255) NULL,
	[opqn] [float] NULL,
	[oprq] [float] NULL,
	[prmd] [varchar](9) NOT NULL,
	[prmt] [int] NULL,
	[prmt_kw] [varchar](255) NULL,
	[prmv] [varchar](6) NOT NULL,
	[psta] [int] NULL,
	[psta_kw] [varchar](255) NULL,
	[pufc] [int] NULL,
	[pufc_kw] [varchar](255) NULL,
	[pufp] [int] NULL,
	[pufp_kw] [varchar](255) NULL,
	[qwar] [varchar](6) NULL,
	[qwar_ref_compnr] [varchar](10) NULL,
	[rate] [float] NULL,
	[rltm] [float] NULL,
	[rltu] [int] NULL,
	[rltu_kw] [varchar](255) NULL,
	[zrows] [int] NULL,
	[rows_kw] [varchar](255) NULL,
	[rpwc] [varchar](6) NULL,
	[rpwc_ref_compnr] [varchar](10) NULL,
	[rttu] [int] NULL,
	[rttu_kw] [varchar](255) NULL,
	[rwar] [varchar](6) NULL,
	[rwar_ref_compnr] [varchar](10) NULL,
	[scrv] [varchar](6) NULL,
	[sequencenumber] [int] NULL,
	[site] [varchar](9) NULL,
	[slqn] [float] NULL,
	[ztimestamp] [datetime] NULL,
	[trqn] [float] NULL,
	[ufc2] [int] NULL,
	[ufc2_kw] [varchar](255) NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = REPLICATE
)
GO
