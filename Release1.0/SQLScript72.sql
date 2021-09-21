/**********************************************************************************************************************
Table Name: [dwhcda].[lnc_dim_tfgld010]
Description: This is a dimension table for Account Receivable Dimensions
Data Type: Dimension Data
Original Project: JBT Finance Account Receivable
Developer: Pooja Thakur
Date: 12/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--Drop Table [dwhcda].[lnc_dim_tfgld010];

CREATE TABLE [dwhcda].[lnc_dim_tfgld010]
(
	[atyp] [int] NULL,
	[atyp_kw] [varchar](255) NULL,
	[bfdt] [varchar](10) NULL,
	[bloc] [int] NULL,
	[bloc_kw] [varchar](255) NULL,
	[budt] [varchar](10) NULL,
	[compnr] [varchar](10) NOT NULL,
	[deleted] [varchar](10) NULL,
	[zdesc] [varchar](255) NULL,
	[dimx] [varchar](9) NOT NULL,
	[dtyp] [int] NOT NULL,
	[dtyp_pdix_ref_compnr] [varchar](10) NULL,
	[dtyp_ref_compnr] [varchar](10) NULL,
	[emno] [varchar](9) NULL,
	[emno_ref_compnr] [varchar](10) NULL,
	[pdix] [varchar](9) NULL,
	[pseq] [int] NULL,
	[qan1] [varchar](3) NULL,
	[qan1_ref_compnr] [varchar](10) NULL,
	[qan2] [varchar](3) NULL,
	[qan2_ref_compnr] [varchar](10) NULL,
	[sequencenumber] [int] NULL,
	[skey] [varchar](255) NULL,
	[subl] [int] NULL,
	[text] [int] NULL,
	[text_ref_compnr] [varchar](10) NULL,
	[ztimestamp] [datetime] NULL,
	[uni1] [int] NULL,
	[uni1_kw] [varchar](255) NULL,
	[uni2] [int] NULL,
	[uni2_kw] [varchar](255) NULL,
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
Table Name: [dwhcda].[lnc_dim_tcmcs008]
Description: This is a dimension table for Account Receivable Currency Rates

Data Type: Dimension Data

Original Project: JBT Finance Account Receivable
Developer: Mohammed Majid
Date: 19/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [dwhcda].[lnc_dim_tcmcs008];

CREATE TABLE [dwhcda].[lnc_dim_tcmcs008] (
	apdt [datetime] NULL,
	bcur [varchar](3) NOT NULL,
	bcur_ref_compnr [varchar](10) NULL,
	ccur [varchar](3) NOT NULL,
	ccur_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	deleted [varchar](10) NULL,
	endt [datetime] NULL,
	excb [int] NULL,
	excb_kw [varchar](255) NULL,
	rapr [int] NULL,
	rapr_kw [varchar](255) NULL,
	rate [float] NULL,
	ratf [int] NULL,
	rtyp [varchar](3) NOT NULL,
	rtyp_ref_compnr [varchar](10) NULL,
	sequencenumber [int] NULL,
	stdt [datetime] NOT NULL,
	ztimestamp [datetime] NULL,
	username [varchar](8) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
    DISTRIBUTION = REPLICATE
)
GO
