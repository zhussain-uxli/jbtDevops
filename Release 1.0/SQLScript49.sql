/**********************************************************************************************************************
Table Name: [dwhcda].[lnc_dim_tffbs005]
Description: This is a dimension table for GL Forecast Budgets
Data Type: Dimension Data
Original Project: JBT Finance GL
Developer: Pooja Thakur
Date: 12/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop Table [dwhcda].[lnc_dim_tffbs005];

CREATE TABLE [dwhcda].[lnc_dim_tffbs005]
(
	[budg] [varchar](3) NOT NULL,
	[budg_ref_compnr] [varchar](10) NULL,
	[cbud] [varchar](3) NULL,
	[cbud_ref_compnr] [varchar](10) NULL,
	[cbyr] [int] NULL,
	[cbyr_cbud_ref_compnr] [varchar](10) NULL,
	[ccur] [varchar](3) NULL,
	[ccur_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NOT NULL,
	[dbud] [varchar](3) NULL,
	[dbud_ref_compnr] [varchar](10) NULL,
	[dbyr] [int] NULL,
	[dbyr_dbud_ref_compnr] [varchar](10) NULL,
	[defi] [int] NULL,
	[defi_kw] [varchar](255) NULL,
	[deleted] [varchar](10) NULL,
	[disb] [varchar](3) NULL,
	[disb_ref_compnr] [varchar](10) NULL,
	[lmdt] [datetime] NULL,
	[pbud] [varchar](3) NULL,
	[pbud_ref_compnr] [varchar](10) NULL,
	[pbyr] [int] NULL,
	[pbyr_pbud_ref_compnr] [varchar](10) NULL,
	[ratc_1] [float] NULL,
	[ratc_2] [float] NULL,
	[ratc_3] [float] NULL,
	[ratf_1] [int] NULL,
	[ratf_2] [int] NULL,
	[ratf_3] [int] NULL,
	[sequencenumber] [int] NULL,
	[text] [int] NULL,
	[text_ref_compnr] [varchar](10) NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[zyear] [int] NOT NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NOT NULL
)
WITH
(
    DISTRIBUTION = REPLICATE
)
GO


/**********************************************************************************************************************
Table Name: [dwhcda].[lnc_dim_tffbs003]
Description: This is a dimension table for GL Forecast Budget Master
Data Type: Dimension Data
Original Project: JBT Finance GL
Developer: Pooja Thakur
Date: 12/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop Table [dwhcda].[lnc_dim_tffbs003];


CREATE TABLE [dwhcda].[lnc_dim_tffbs003]
(
	[ad10] [int] NULL,
	[ad10_kw] [varchar](255) NULL,
	[ad11] [int] NULL,
	[ad11_kw] [varchar](255) NULL,
	[ad12] [int] NULL,
	[ad12_kw] [varchar](255) NULL,
	[adt1] [int] NULL,
	[adt1_kw] [varchar](255) NULL,
	[adt2] [int] NULL,
	[adt2_kw] [varchar](255) NULL,
	[adt3] [int] NULL,
	[adt3_kw] [varchar](255) NULL,
	[adt4] [int] NULL,
	[adt4_kw] [varchar](255) NULL,
	[adt5] [int] NULL,
	[adt5_kw] [varchar](255) NULL,
	[adt6] [int] NULL,
	[adt6_kw] [varchar](255) NULL,
	[adt7] [int] NULL,
	[adt7_kw] [varchar](255) NULL,
	[adt8] [int] NULL,
	[adt8_kw] [varchar](255) NULL,
	[adt9] [int] NULL,
	[adt9_kw] [varchar](255) NULL,
	[aqu1] [int] NULL,
	[aqu1_kw] [varchar](255) NULL,
	[aqu2] [int] NULL,
	[aqu2_kw] [varchar](255) NULL,
	[budg] [varchar](3) NOT NULL,
	[budm] [int] NULL,
	[budm_kw] [varchar](255) NULL,
	[compnr] [varchar](10) NOT NULL,
	[deleted] [varchar](10) NULL,
	[zdesc] [varchar](255) NULL,
	[llac] [int] NULL,
	[llac_kw] [varchar](255) NULL,
	[nbpr] [int] NULL,
	[sdbu] [int] NULL,
	[sdbu_kw] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[text] [int] NULL,
	[text_ref_compnr] [varchar](10) NULL,
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
Table Name: [dwhcda].[lnc_dim_tfgld008]
Description: This is a dimension table for GL Chart of Accounts
Data Type: Dimension Data
Original Project: JBT Finance GL
Developer: Pooja Thakur
Date: 12/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop Table [dwhcda].[lnc_dim_tfgld008];


CREATE TABLE [dwhcda].[lnc_dim_tfgld008]
(
	[acmp] [varchar](8) NULL,
	[acmp_ref_compnr] [varchar](10) NULL,
	[alat] [int] NULL,
	[alat_kw] [varchar](255) NULL,
	[atyp] [int] NULL,
	[atyp_kw] [varchar](255) NULL,
	[bfdt] [varchar](10) NULL,
	[blbp] [int] NULL,
	[blbp_kw] [varchar](255) NULL,
	[bloc] [int] NULL,
	[bloc_kw] [varchar](255) NULL,
	[budt] [varchar](10) NULL,
	[cdca] [varchar](12) NULL,
	[cdca_ref_compnr] [varchar](10) NULL,
	[cfic] [varchar](6) NULL,
	[cfic_ref_compnr] [varchar](10) NULL,
	[cfrs] [varchar](6) NULL,
	[cfrs_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NOT NULL,
	[ctar] [int] NULL,
	[ctar_kw] [varchar](255) NULL,
	[ctlm] [int] NULL,
	[ctlm_kw] [varchar](255) NULL,
	[cvat] [varchar](9) NULL,
	[cvat_ref_compnr] [varchar](10) NULL,
	[dbcr] [int] NULL,
	[dbcr_kw] [varchar](255) NULL,
	[dblm] [int] NULL,
	[dblm_kw] [varchar](255) NULL,
	[deleted] [varchar](10) NULL,
	[zdesc] [varchar](255) NULL,
	[dga1] [varchar](12) NULL,
	[dga1_ref_compnr] [varchar](10) NULL,
	[dga2] [varchar](12) NULL,
	[dga2_ref_compnr] [varchar](10) NULL,
	[dim1] [int] NULL,
	[dim1_kw] [varchar](255) NULL,
	[dim2] [int] NULL,
	[dim2_kw] [varchar](255) NULL,
	[dim3] [int] NULL,
	[dim3_kw] [varchar](255) NULL,
	[dim4] [int] NULL,
	[dim4_kw] [varchar](255) NULL,
	[dim5] [int] NULL,
	[dim5_kw] [varchar](255) NULL,
	[dim6] [int] NULL,
	[dim6_kw] [varchar](255) NULL,
	[dim7] [int] NULL,
	[dim7_kw] [varchar](255) NULL,
	[dim8] [int] NULL,
	[dim8_kw] [varchar](255) NULL,
	[dim9] [int] NULL,
	[dim9_kw] [varchar](255) NULL,
	[dla1] [varchar](12) NULL,
	[dla1_ref_compnr] [varchar](10) NULL,
	[dla2] [varchar](12) NULL,
	[dla2_ref_compnr] [varchar](10) NULL,
	[dm10] [int] NULL,
	[dm10_kw] [varchar](255) NULL,
	[dm11] [int] NULL,
	[dm11_kw] [varchar](255) NULL,
	[dm12] [int] NULL,
	[dm12_kw] [varchar](255) NULL,
	[dmsq] [int] NULL,
	[duac] [int] NULL,
	[duac_kw] [varchar](255) NULL,
	[etyp] [int] NULL,
	[etyp_kw] [varchar](255) NULL,
	[icom] [int] NULL,
	[icom_kw] [varchar](255) NULL,
	[icur] [int] NULL,
	[icur_kw] [varchar](255) NULL,
	[ifas] [int] NULL,
	[ifas_kw] [varchar](255) NULL,
	[injb] [int] NULL,
	[injb_kw] [varchar](255) NULL,
	[inta] [int] NULL,
	[inta_kw] [varchar](255) NULL,
	[iprj] [int] NULL,
	[iprj_kw] [varchar](255) NULL,
	[leac] [varchar](12) NOT NULL,
	[ledc] [varchar](255) NULL,
	[lela] [varchar](12) NULL,
	[loco] [int] NULL,
	[mach] [int] NULL,
	[mach_kw] [varchar](255) NULL,
	[pcac] [varchar](12) NULL,
	[pcac_ref_compnr] [varchar](10) NULL,
	[perc] [float] NULL,
	[plac] [varchar](12) NULL,
	[plac_ref_compnr] [varchar](10) NULL,
	[pseq] [int] NULL,
	[sear] [varchar](9) NULL,
	[sear_ref_compnr] [varchar](10) NULL,
	[sequencenumber] [int] NULL,
	[skey] [varchar](255) NULL,
	[subl] [int] NULL,
	[tagp] [varchar](9) NULL,
	[tagp_ref_compnr] [varchar](10) NULL,
	[text] [int] NULL,
	[text_ref_compnr] [varchar](10) NULL,
	[ztimestamp] [datetime] NULL,
	[uni1] [varchar](3) NULL,
	[uni1_ref_compnr] [varchar](10) NULL,
	[uni2] [varchar](3) NULL,
	[uni2_ref_compnr] [varchar](10) NULL,
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
Table Name: [dwhcda].[lnc_dim_tcemm170]
Description: This is a dimension table for GL Currencies
Data Type: Dimension Data
Original Project: JBT Finance GL
Developer: Pooja Thakur
Date: 12/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop Table [dwhcda].[lnc_dim_tcemm170];


CREATE TABLE [dwhcda].[lnc_dim_tcemm170]
(
	[ccal] [varchar](9) NULL,
	[ccal_ref_compnr] [varchar](10) NULL,
	[clcu] [varchar](3) NULL,
	[clcu_ref_compnr] [varchar](10) NULL,
	[comp] [int] NOT NULL,
	[compnr] [varchar](10) NOT NULL,
	[csys] [int] NULL,
	[csys_kw] [varchar](255) NULL,
	[ctya] [int] NULL,
	[ctya_kw] [varchar](255) NULL,
	[ctyb] [int] NULL,
	[ctyb_kw] [varchar](255) NULL,
	[ctyc] [int] NULL,
	[ctyc_kw] [varchar](255) NULL,
	[ctyp] [int] NULL,
	[ctyp_kw] [varchar](255) NULL,
	[dcur_comp] [varchar](3) NULL,
	[deleted] [varchar](10) NULL,
	[zdesc] [varchar](255) NULL,
	[erub] [varchar](3) NULL,
	[erub_ref_compnr] [varchar](10) NULL,
	[eruc] [varchar](3) NULL,
	[eruc_ref_compnr] [varchar](10) NULL,
	[euro] [varchar](3) NULL,
	[euro_ref_compnr] [varchar](10) NULL,
	[exeu] [varchar](3) NULL,
	[exex] [varchar](3) NULL,
	[expu] [varchar](3) NULL,
	[exsa] [varchar](3) NULL,
	[fcua] [varchar](3) NULL,
	[fcua_ref_compnr] [varchar](10) NULL,
	[fcub] [varchar](3) NULL,
	[fcub_ref_compnr] [varchar](10) NULL,
	[fcuc] [varchar](3) NULL,
	[fcuc_ref_compnr] [varchar](10) NULL,
	[lcur] [varchar](3) NULL,
	[lcur_ref_compnr] [varchar](10) NULL,
	[ract] [varchar](6) NULL,
	[ract_ref_compnr] [varchar](10) NULL,
	[rdub] [int] NULL,
	[rdub_kw] [varchar](255) NULL,
	[rduc] [int] NULL,
	[rduc_kw] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[taxo_rcmp] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[tmub] [int] NULL,
	[tmub_kw] [varchar](255) NULL,
	[tmuc] [int] NULL,
	[tmuc_kw] [varchar](255) NULL,
	[tzid] [varchar](3) NULL,
	[tzid_ref_compnr] [varchar](10) NULL,
	[umfc] [int] NULL,
	[umfc_kw] [varchar](255) NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NOT NULL
)
WITH
(
    DISTRIBUTION = REPLICATE
)
GO
