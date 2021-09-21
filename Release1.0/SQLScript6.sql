/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs002]
Description: Currencies Table
Data Type: Dimension Data
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs002];

CREATE TABLE [acq101].[dst_tcmcs002]
(
	[brep] [int] NULL,
	[brep_kw] [varchar](255) NULL,
	[ccur] [varchar](3) NULL,
	[compnr] [varchar](10) NULL,
	[crnd] [float] NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[dscb] [varchar](255) NULL,
	[emuc] [int] NULL,
	[emuc_kw] [varchar](255) NULL,
	[gtrf] [float] NULL,
	[iccc] [varchar](3) NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [ccur] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom000]
Description: Companies Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tccom000];

CREATE TABLE [acq101].[dst_tccom000]
(
	[acfg] [int] NULL,
	[acfg_kw] [varchar](255) NULL,
	[alhp] [int] NULL,
	[alhp_kw] [varchar](255) NULL,
	[altm] [int] NULL,
	[altm_kw] [varchar](255) NULL,
	[arcc] [int] NULL,
	[arcc_kw] [varchar](255) NULL,
	[asci] [int] NULL,
	[asci_kw] [varchar](255) NULL,
	[asec] [int] NULL,
	[asec_kw] [varchar](255) NULL,
	[bape] [int] NULL,
	[bape_kw] [varchar](255) NULL,
	[bcmi] [int] NULL,
	[bcmi_kw] [varchar](255) NULL,
	[beid] [varchar](255) NULL,
	[bgci] [int] NULL,
	[bgci_kw] [varchar](255) NULL,
	[bulg] [int] NULL,
	[bulg_kw] [varchar](255) NULL,
	[cadr] [varchar](9) NULL,
	[cadr_ref_compnr] [varchar](10) NULL,
	[capp] [int] NULL,
	[capp_kw] [varchar](255) NULL,
	[cbrk] [int] NULL,
	[cbrk_kw] [varchar](255) NULL,
	[cbrn] [varchar](6) NULL,
	[cbtp] [varchar](3) NULL,
	[ccty] [varchar](3) NULL,
	[ccty_ref_compnr] [varchar](10) NULL,
	[cfri] [int] NULL,
	[cfri_kw] [varchar](255) NULL,
	[cinv] [int] NULL,
	[cinv_kw] [varchar](255) NULL,
	[clan] [varchar](3) NULL,
	[clan_ref_compnr] [varchar](10) NULL,
	[cmai] [varchar](7) NULL,
	[compnr] [varchar](10) NULL,
	[cpli] [int] NULL,
	[cpli_kw] [varchar](255) NULL,
	[crid] [varchar](255) NULL,
	[csli] [int] NULL,
	[csli_kw] [varchar](255) NULL,
	[darc] [int] NULL,
	[dasr] [int] NULL,
	[dasr_kw] [varchar](255) NULL,
	[deleted] [varchar](10) NULL,
	[deln] [int] NULL,
	[deln_kw] [varchar](255) NULL,
	[dsca] [varchar](255) NULL,
	[dsri] [int] NULL,
	[dsri_kw] [varchar](255) NULL,
	[duns] [int] NULL,
	[ecmi] [int] NULL,
	[ecmi_kw] [varchar](255) NULL,
	[erac] [int] NULL,
	[erac_kw] [varchar](255) NULL,
	[eupl] [int] NULL,
	[eupl_kw] [varchar](255) NULL,
	[eusl] [int] NULL,
	[eusl_kw] [varchar](255) NULL,
	[eust] [int] NULL,
	[eust_kw] [varchar](255) NULL,
	[ffpl] [int] NULL,
	[ffpl_kw] [varchar](255) NULL,
	[fidn] [varchar](20) NULL,
	[fini] [int] NULL,
	[fini_kw] [varchar](255) NULL,
	[fovn] [varchar](35) NULL,
	[frmi] [int] NULL,
	[frmi_kw] [varchar](255) NULL,
	[grpl] [int] NULL,
	[grpl_kw] [varchar](255) NULL,
	[gtci] [int] NULL,
	[gtci_kw] [varchar](255) NULL,
	[gtro] [int] NULL,
	[gtro_kw] [varchar](255) NULL,
	[hcst] [int] NULL,
	[hcst_kw] [varchar](255) NULL,
	[ilwh] [int] NULL,
	[ilwh_kw] [varchar](255) NULL,
	[indt] [datetime] NULL,
	[inf1] [varchar](255) NULL,
	[inf2] [varchar](255) NULL,
	[inf3] [varchar](255) NULL,
	[inf4] [varchar](255) NULL,
	[itpd] [int] NULL,
	[itpd_kw] [varchar](255) NULL,
	[itri] [int] NULL,
	[itri_kw] [varchar](255) NULL,
	[jspm] [int] NULL,
	[jspm_kw] [varchar](255) NULL,
	[lago] [int] NULL,
	[lago_kw] [varchar](255) NULL,
	[larg] [int] NULL,
	[larg_kw] [varchar](255) NULL,
	[lbra] [int] NULL,
	[lbra_kw] [varchar](255) NULL,
	[lche] [int] NULL,
	[lche_kw] [varchar](255) NULL,
	[lchl] [int] NULL,
	[lchl_kw] [varchar](255) NULL,
	[lchn] [int] NULL,
	[lchn_kw] [varchar](255) NULL,
	[lcsi] [int] NULL,
	[lcsi_kw] [varchar](255) NULL,
	[lcze] [int] NULL,
	[lcze_kw] [varchar](255) NULL,
	[ldeu] [int] NULL,
	[ldeu_kw] [varchar](255) NULL,
	[lesp] [int] NULL,
	[lesp_kw] [varchar](255) NULL,
	[lgid] [varchar](255) NULL,
	[lhun] [int] NULL,
	[lhun_kw] [varchar](255) NULL,
	[lisr] [int] NULL,
	[lisr_kw] [varchar](255) NULL,
	[lmex] [int] NULL,
	[lmex_kw] [varchar](255) NULL,
	[lmys] [int] NULL,
	[lmys_kw] [varchar](255) NULL,
	[lnor] [int] NULL,
	[lnor_kw] [varchar](255) NULL,
	[lnwi] [int] NULL,
	[lnwi_kw] [varchar](255) NULL,
	[lper] [int] NULL,
	[lper_kw] [varchar](255) NULL,
	[lpol] [int] NULL,
	[lpol_kw] [varchar](255) NULL,
	[lpor] [int] NULL,
	[lpor_kw] [varchar](255) NULL,
	[lrom] [int] NULL,
	[lrom_kw] [varchar](255) NULL,
	[lrus] [int] NULL,
	[lrus_kw] [varchar](255) NULL,
	[lsvk] [int] NULL,
	[lsvk_kw] [varchar](255) NULL,
	[ltha] [int] NULL,
	[ltha_kw] [varchar](255) NULL,
	[ltur] [int] NULL,
	[ltur_kw] [varchar](255) NULL,
	[mejs] [int] NULL,
	[mejs_kw] [varchar](255) NULL,
	[mfsi] [int] NULL,
	[mfsi_kw] [varchar](255) NULL,
	[mnfc] [int] NULL,
	[mnfc_kw] [varchar](255) NULL,
	[mpni] [int] NULL,
	[mpni_kw] [varchar](255) NULL,
	[mprs] [int] NULL,
	[mprs_kw] [varchar](255) NULL,
	[mstc] [int] NULL,
	[mstc_kw] [varchar](255) NULL,
	[nama] [varchar](255) NULL,
	[ncmp] [int] NULL,
	[odmu] [int] NULL,
	[odmu_kw] [varchar](255) NULL,
	[opsi] [int] NULL,
	[opsi_kw] [varchar](255) NULL,
	[owne] [int] NULL,
	[owne_kw] [varchar](255) NULL,
	[owni] [int] NULL,
	[owni_kw] [varchar](255) NULL,
	[pcfi] [int] NULL,
	[pcfi_kw] [varchar](255) NULL,
	[pcmd] [int] NULL,
	[pcmd_kw] [varchar](255) NULL,
	[pcsi] [int] NULL,
	[pcsi_kw] [varchar](255) NULL,
	[plai] [int] NULL,
	[plai_kw] [varchar](255) NULL,
	[ppeg] [int] NULL,
	[ppeg_kw] [varchar](255) NULL,
	[prci] [int] NULL,
	[prci_kw] [varchar](255) NULL,
	[prji] [int] NULL,
	[prji_kw] [varchar](255) NULL,
	[psch] [int] NULL,
	[psch_kw] [varchar](255) NULL,
	[ptri] [int] NULL,
	[ptri_kw] [varchar](255) NULL,
	[qumi] [int] NULL,
	[qumi_kw] [varchar](255) NULL,
	[rdes] [int] NULL,
	[rdes_kw] [varchar](255) NULL,
	[repr] [varchar](9) NULL,
	[rpti] [int] NULL,
	[rpti_kw] [varchar](255) NULL,
	[schi] [int] NULL,
	[schi_kw] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[siac] [varchar](255) NULL,
	[simd] [int] NULL,
	[simd_kw] [varchar](255) NULL,
	[slbp] [int] NULL,
	[slbp_kw] [varchar](255) NULL,
	[slbs] [int] NULL,
	[slbs_kw] [varchar](255) NULL,
	[smfm] [int] NULL,
	[smfm_kw] [varchar](255) NULL,
	[smfs] [int] NULL,
	[smfs_kw] [varchar](255) NULL,
	[smii] [int] NULL,
	[smii_kw] [varchar](255) NULL,
	[spsp] [int] NULL,
	[spsp_kw] [varchar](255) NULL,
	[srvi] [int] NULL,
	[srvi_kw] [varchar](255) NULL,
	[ssmf] [int] NULL,
	[ssmf_kw] [varchar](255) NULL,
	[stat] [int] NULL,
	[stat_kw] [varchar](255) NULL,
	[tati] [int] NULL,
	[tati_kw] [varchar](255) NULL,
	[taxd] [int] NULL,
	[taxd_kw] [varchar](255) NULL,
	[ztimestamp] [datetime] NULL,
	[tlgi] [int] NULL,
	[tlgi_kw] [varchar](255) NULL,
	[trcn] [int] NULL,
	[trcn_kw] [varchar](255) NULL,
	[ucpu] [int] NULL,
	[ucpu_kw] [varchar](255) NULL,
	[ucsl] [int] NULL,
	[ucsl_kw] [varchar](255) NULL,
	[unef] [int] NULL,
	[unef_kw] [varchar](255) NULL,
	[username] [varchar](8) NULL,
	[usup] [int] NULL,
	[usup_kw] [varchar](255) NULL,
	[uwht] [int] NULL,
	[uwht_kw] [varchar](255) NULL,
	[vmic] [int] NULL,
	[vmic_kw] [varchar](255) NULL,
	[vmis] [int] NULL,
	[vmis_kw] [varchar](255) NULL,
	[wmbi] [int] NULL,
	[wmbi_kw] [varchar](255) NULL,
	[wrhi] [int] NULL,
	[wrhi_kw] [varchar](255) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [indt] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs065]
Description:Departments Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 13-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs065];

CREATE TABLE [acq101].[dst_tcmcs065]
(
	[cadr] [varchar](9) NULL,
	[cadr_ref_compnr] [varchar](10) NULL,
	[casi] [varchar](3) NULL,
	[casi_ref_compnr] [varchar](10) NULL,
	[ccal] [varchar](9) NULL,
	[ccal_ref_compnr] [varchar](10) NULL,
	[city] [varchar](255) NULL,
	[clrt] [varchar](6) NULL,
	[clrt_ref_compnr] [varchar](10) NULL,
	[comp] [int] NULL,
	[compnr] [varchar](10) NULL,
	[cwoc] [varchar](6) NULL,
	[cwoc_eunt] [varchar](6) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[emno] [varchar](9) NULL,
	[emno_ref_compnr] [varchar](10) NULL,
	[eunt_rcmp] [int] NULL,
	[ract] [varchar](6) NULL,
	[ract_ref_compnr] [varchar](10) NULL,
	[sequencenumber] [int] NULL,
	[site] [varchar](9) NULL,
	[site_ref_compnr] [varchar](10) NULL,
	[ztimestamp] [datetime] NULL,
	[typd] [int] NULL,
	[typd_kw] [varchar](255) NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [cwoc] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs010]
Description: Countries Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs010];

CREATE TABLE [acq101].[dst_tcmcs010]
(
	[afal] [varchar](3) NULL,
	[afal_ref_compnr] [varchar](10) NULL,
	[awtn] [int] NULL,
	[awtn_kw] [varchar](255) NULL,
	[bnch] [int] NULL,
	[bnch_kw] [varchar](255) NULL,
	[ccty] [varchar](3) NULL,
	[ccur] [varchar](3) NULL,
	[ccur_ref_compnr] [varchar](10) NULL,
	[cgp1] [varchar](3) NULL,
	[cgp1_ref_compnr] [varchar](10) NULL,
	[cgp2] [varchar](3) NULL,
	[cgp2_ref_compnr] [varchar](10) NULL,
	[clan] [varchar](3) NULL,
	[clan_ref_compnr] [varchar](10) NULL,
	[coaf] [varchar](3) NULL,
	[coaf_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[esgn] [varchar](1) NULL,
	[fxcd] [varchar](6) NULL,
	[geoc] [varchar](3) NULL,
	[ict2] [varchar](2) NULL,
	[ictc] [varchar](3) NULL,
	[meec] [int] NULL,
	[meec_kw] [varchar](255) NULL,
	[pltx] [int] NULL,
	[pltx_kw] [varchar](255) NULL,
	[ppcd] [int] NULL,
	[ptta] [int] NULL,
	[ptta_kw] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[ssgn] [varchar](1) NULL,
	[tfcd] [varchar](6) NULL,
	[ztimestamp] [datetime] NULL,
	[txcd] [varchar](6) NULL,
	[txmp] [int] NULL,
	[txmp_kw] [varchar](255) NULL,
	[tzid] [varchar](3) NULL,
	[tzid_ref_compnr] [varchar](10) NULL,
	[username] [varchar](8) NULL,
	[vnch] [int] NULL,
	[vnch_kw] [varchar](255) NULL,
	[xsgn] [varchar](1) NULL,
	[zmsk] [varchar](10) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [ccty] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom180]
Description: Country Set Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tccom180];

CREATE TABLE [acq101].[dst_tccom180]
(
	[compnr] [varchar](10) NULL,
	[ctst] [varchar](14) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [ctst] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom181]
Description: Countries by Country Set Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tccom181];

CREATE TABLE [acq101].[dst_tccom181]
(
	[ccty] [varchar](3) NULL,
	[ccty_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NULL,
	[ctst] [varchar](14) NULL,
	[ctst_ref_compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[sequencenumber] [varchar](10) NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [ccty] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom130]
Description: Addresses Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tccom130];

CREATE TABLE [acq101].[dst_tccom130]
(
	[afal] [varchar](3) NULL,
	[afal_ref_compnr] [varchar](10) NULL,
	[bldg] [varchar](255) NULL,
	[blfl] [varchar](255) NULL,
	[blun] [varchar](255) NULL,
	[cadr] [varchar](9) NULL,
	[ccal] [varchar](9) NULL,
	[ccal_ref_compnr] [varchar](10) NULL,
	[ccit] [varchar](8) NULL,
	[ccty] [varchar](3) NULL,
	[ccty_cste_ccit_ref_compnr] [varchar](10) NULL,
	[ccty_cste_ref_compnr] [varchar](10) NULL,
	[ccty_ref_compnr] [varchar](10) NULL,
	[cnty] [varchar](255) NULL,
	[coaf] [varchar](3) NULL,
	[coaf_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NULL,
	[crdt] [datetime] NULL,
	[crid] [int] NULL,
	[crte] [varchar](5) NULL,
	[crte_ref_compnr] [varchar](10) NULL,
	[cste] [varchar](3) NULL,
	[defa] [int] NULL,
	[defa_kw] [varchar](255) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[dtlm] [datetime] NULL,
	[etyp] [int] NULL,
	[etyp_kw] [varchar](255) NULL,
	[foid] [int] NULL,
	[fovn] [varchar](24) NULL,
	[geoc] [varchar](10) NULL,
	[glat] [float] NULL,
	[glon] [float] NULL,
	[hono] [varchar](255) NULL,
	[icty] [varchar](3) NULL,
	[inet] [varchar](255) NULL,
	[info] [varchar](255) NULL,
	[lmus] [varchar](16) NULL,
	[ln01] [varchar](255) NULL,
	[ln02] [varchar](255) NULL,
	[ln03] [varchar](255) NULL,
	[ln04] [varchar](255) NULL,
	[ln05] [varchar](255) NULL,
	[ln06] [varchar](255) NULL,
	[lvdt] [datetime] NULL,
	[nama] [varchar](255) NULL,
	[namb] [varchar](255) NULL,
	[namc] [varchar](255) NULL,
	[namd] [varchar](255) NULL,
	[namf] [varchar](255) NULL,
	[pobn] [varchar](255) NULL,
	[pstc] [varchar](255) NULL,
	[seak] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[sita] [varchar](7) NULL,
	[smsa] [varchar](255) NULL,
	[tefx] [varchar](32) NULL,
	[telp] [varchar](32) NULL,
	[telx] [varchar](15) NULL,
	[ztimestamp] [datetime] NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[tzid] [varchar](3) NULL,
	[tzid_ref_compnr] [varchar](10) NULL,
	[zuser] [varchar](16) NULL,
	[username] [varchar](8) NULL,
	[valr] [int] NULL,
	[valr_kw] [varchar](255) NULL,
	[vatl] [varchar](25) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [cadr] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom100]
Description: Business Partners Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tccom100];

CREATE TABLE [acq101].[dst_tccom100]
(
	[beid] [varchar](255) NULL,
	[bpid] [varchar](9) NULL,
	[bprl] [int] NULL,
	[bprl_kw] [varchar](255) NULL,
	[bptx] [varchar](9) NULL,
	[bptx_ref_compnr] [varchar](10) NULL,
	[btbv] [int] NULL,
	[btbv_kw] [varchar](255) NULL,
	[cadr] [varchar](9) NULL,
	[cadr_ref_compnr] [varchar](10) NULL,
	[cbcl] [varchar](3) NULL,
	[cbcl_ref_compnr] [varchar](10) NULL,
	[ccnt] [varchar](9) NULL,
	[ccnt_ref_compnr] [varchar](10) NULL,
	[ccur] [varchar](3) NULL,
	[ccur_ref_compnr] [varchar](10) NULL,
	[cint] [int] NULL,
	[cint_kw] [varchar](255) NULL,
	[clan] [varchar](3) NULL,
	[clan_ref_compnr] [varchar](10) NULL,
	[clcd] [int] NULL,
	[clcd_kw] [varchar](255) NULL,
	[cmid] [varchar](255) NULL,
	[coff] [int] NULL,
	[coff_kw] [varchar](255) NULL,
	[compnr] [varchar](10) NULL,
	[crdt] [datetime] NULL,
	[crid] [int] NULL,
	[ctit] [varchar](3) NULL,
	[ctit_ref_compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[ecmp] [int] NULL,
	[edyn] [int] NULL,
	[edyn_kw] [varchar](255) NULL,
	[endt] [datetime] NULL,
	[fact] [int] NULL,
	[fact_kw] [varchar](255) NULL,
	[foid] [int] NULL,
	[fovn] [varchar](35) NULL,
	[icod] [int] NULL,
	[icod_kw] [varchar](255) NULL,
	[icst] [int] NULL,
	[icst_kw] [varchar](255) NULL,
	[imag] [varchar](22) NULL,
	[inet] [varchar](255) NULL,
	[inrl] [int] NULL,
	[inrl_kw] [varchar](255) NULL,
	[iscn] [int] NULL,
	[lgid] [varchar](255) NULL,
	[lmdt] [datetime] NULL,
	[lmus] [varchar](16) NULL,
	[lvdt] [datetime] NULL,
	[nama] [varchar](255) NULL,
	[prbp] [varchar](9) NULL,
	[prbp_ref_compnr] [varchar](10) NULL,
	[prst] [int] NULL,
	[prst_kw] [varchar](255) NULL,
	[seak] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[sml1] [varchar](255) NULL,
	[sml2] [varchar](255) NULL,
	[sml3] [varchar](255) NULL,
	[sml4] [varchar](255) NULL,
	[sml5] [varchar](255) NULL,
	[smt1] [int] NULL,
	[smt1_kw] [varchar](255) NULL,
	[smt2] [int] NULL,
	[smt2_kw] [varchar](255) NULL,
	[smt3] [int] NULL,
	[smt3_kw] [varchar](255) NULL,
	[smt4] [int] NULL,
	[smt4_kw] [varchar](255) NULL,
	[smt5] [int] NULL,
	[smt5_kw] [varchar](255) NULL,
	[sndr] [int] NULL,
	[sndr_kw] [varchar](255) NULL,
	[stdt] [datetime] NULL,
	[tefx] [varchar](32) NULL,
	[telp] [varchar](32) NULL,
	[tfci] [varchar](15) NULL,
	[tfcy] [varchar](6) NULL,
	[tfex] [varchar](15) NULL,
	[tfln] [varchar](32) NULL,
	[ztimestamp] [datetime] NULL,
	[tlci] [varchar](15) NULL,
	[tlcy] [varchar](6) NULL,
	[tlex] [varchar](15) NULL,
	[tlln] [varchar](32) NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[username] [varchar](8) NULL,
	[usid] [varchar](16) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [bpid] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom112]
Description: Invoice-to Business Partners
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tccom112];

CREATE TABLE [acq101].[dst_tccom112]
(
	[adam] [float] NULL,
	[adpc] [float] NULL,
	[bicy] [varchar](9) NULL,
	[bicy_ref_compnr] [varchar](10) NULL,
	[bpcl] [varchar](12) NULL,
	[bpcl_ref_compnr] [varchar](10) NULL,
	[cadr] [varchar](9) NULL,
	[cadr_ref_compnr] [varchar](10) NULL,
	[cbps] [varchar](3) NULL,
	[cbps_ref_compnr] [varchar](10) NULL,
	[cbtp] [varchar](3) NULL,
	[cbtp_ref_compnr] [varchar](10) NULL,
	[ccic] [varchar](3) NULL,
	[ccic_ref_compnr] [varchar](10) NULL,
	[ccnt] [varchar](9) NULL,
	[ccnt_ref_compnr] [varchar](10) NULL,
	[ccra] [varchar](9) NULL,
	[ccra_ref_compnr] [varchar](10) NULL,
	[ccrs] [varchar](3) NULL,
	[ccrs_ref_compnr] [varchar](10) NULL,
	[ccur] [varchar](3) NULL,
	[ccur_ref_compnr] [varchar](10) NULL,
	[cfcg] [varchar](3) NULL,
	[cfcg_rcmp] [int] NULL,
	[chin] [int] NULL,
	[chin_kw] [varchar](255) NULL,
	[cidm] [varchar](3) NULL,
	[cidm_ref_compnr] [varchar](10) NULL,
	[cinm] [varchar](3) NULL,
	[cinm_ref_compnr] [varchar](10) NULL,
	[clan] [varchar](3) NULL,
	[clan_ref_compnr] [varchar](10) NULL,
	[clin] [float] NULL,
	[clmt] [varchar](3) NULL,
	[clmt_ref_compnr] [varchar](10) NULL,
	[cofc] [varchar](6) NULL,
	[cofc_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NULL,
	[cpay] [varchar](3) NULL,
	[cpay_ref_compnr] [varchar](10) NULL,
	[crat] [varchar](3) NULL,
	[crat_ref_compnr] [varchar](10) NULL,
	[crbu] [varchar](30) NULL,
	[crdt] [datetime] NULL,
	[crlr] [float] NULL,
	[cvyn] [int] NULL,
	[cvyn_kw] [varchar](255) NULL,
	[deleted] [varchar](10) NULL,
	[dim1] [varchar](9) NULL,
	[dim2] [varchar](9) NULL,
	[dim3] [varchar](9) NULL,
	[dim4] [varchar](9) NULL,
	[dim5] [varchar](9) NULL,
	[dim6] [varchar](9) NULL,
	[dim7] [varchar](9) NULL,
	[dim8] [varchar](9) NULL,
	[dim9] [varchar](9) NULL,
	[dlcr] [datetime] NULL,
	[dm10] [varchar](9) NULL,
	[dm11] [varchar](9) NULL,
	[dm12] [varchar](9) NULL,
	[ecod] [varchar](5) NULL,
	[edci] [datetime] NULL,
	[endt] [datetime] NULL,
	[hcru] [float] NULL,
	[infq] [int] NULL,
	[infr] [int] NULL,
	[infr_kw] [varchar](255) NULL,
	[inpl] [varchar](9) NULL,
	[inpl_ref_compnr] [varchar](10) NULL,
	[ircd] [varchar](3) NULL,
	[itbp] [varchar](9) NULL,
	[itbp_ref_compnr] [varchar](10) NULL,
	[itst] [int] NULL,
	[itst_kw] [varchar](255) NULL,
	[lidt] [datetime] NULL,
	[lkst] [int] NULL,
	[lkst_kw] [varchar](255) NULL,
	[lmdt] [datetime] NULL,
	[lmus] [varchar](16) NULL,
	[mcod] [varchar](3) NULL,
	[mcod_ref_compnr] [varchar](10) NULL,
	[mstm] [varchar](3) NULL,
	[ncin] [int] NULL,
	[paym] [varchar](3) NULL,
	[pfbp] [varchar](9) NULL,
	[pfbp_ref_compnr] [varchar](10) NULL,
	[rcrs] [varchar](3) NULL,
	[rcrs_ref_compnr] [varchar](10) NULL,
	[rfci] [varchar](15) NULL,
	[rpay] [varchar](3) NULL,
	[rpay_ref_compnr] [varchar](10) NULL,
	[rpym] [varchar](3) NULL,
	[rtyp] [varchar](3) NULL,
	[rtyp_ref_compnr] [varchar](10) NULL,
	[seak] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[sirn] [varchar](9) NULL,
	[stdt] [datetime] NULL,
	[tamd] [float] NULL,
	[tefx] [varchar](32) NULL,
	[telp] [varchar](32) NULL,
	[tfci] [varchar](15) NULL,
	[tfcy] [varchar](6) NULL,
	[tfex] [varchar](15) NULL,
	[tfln] [varchar](32) NULL,
	[ztimestamp] [datetime] NULL,
	[tlci] [varchar](15) NULL,
	[tlcy] [varchar](6) NULL,
	[tlex] [varchar](15) NULL,
	[tlln] [varchar](32) NULL,
	[tpcd] [float] NULL,
	[qrbl] [varchar](255) NULL,
	[qrbl_kw] [varchar](255) NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[zuser] [varchar](16) NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [itbp] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom122]
Description: This is a DST table for Invoice-from Business partners

Data Type: Dimension Data

Original Project: JBT Finance Model
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tccom122];

CREATE TABLE [acq101].[dst_tccom122]
(
	bloc [varchar](3) NULL,
	bpcl [varchar](12) NULL,
	bpcl_ref_compnr [varchar](10) NULL,
	bpst [int] NULL,
	bpst_kw [varchar](255) NULL,
	cadr [varchar](9) NULL,
	cadr_ref_compnr [varchar](10) NULL,
	cbps [varchar](3) NULL,
	cbps_ref_compnr [varchar](10) NULL,
	cbtp [varchar](3) NULL,
	cbtp_ref_compnr [varchar](10) NULL,
	ccnt [varchar](9) NULL,
	ccnt_ref_compnr [varchar](10) NULL,
	ccrs [varchar](3) NULL,
	ccrs_ref_compnr [varchar](10) NULL,
	ccur [varchar](3) NULL,
	ccur_ref_compnr [varchar](10) NULL,
	cdai [int] NULL,
	cdai_kw [varchar](255) NULL,
	cdap [int] NULL,
	cdap_kw [varchar](255) NULL,
	cfsg [varchar](3) NULL,
	cfsg_rcmp [int] NULL,
	clan [varchar](3) NULL,
	clan_ref_compnr [varchar](10) NULL,
	cofc [varchar](6) NOT NULL,
	cofc_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	cpay [varchar](3) NULL,
	cpay_ref_compnr [varchar](10) NULL,
	crdt [datetime] NULL,
	crlr [float] NULL,
	cvyn [int] NULL,
	cvyn_kw [varchar](255) NULL,
	deleted [varchar](10) NULL,
	dial [int] NULL,
	dial_kw [varchar](255) NULL,
	dim1 [varchar](9) NULL,
	dim2 [varchar](9) NULL,
	dim3 [varchar](9) NULL,
	dim4 [varchar](9) NULL,
	dim5 [varchar](9) NULL,
	dim6 [varchar](9) NULL,
	dim7 [varchar](9) NULL,
	dim8 [varchar](9) NULL,
	dim9 [varchar](9) NULL,
	dinc [int] NULL,
	dinc_kw [varchar](255) NULL,
	dlcr [datetime] NULL,
	dm10 [varchar](9) NULL,
	dm11 [varchar](9) NULL,
	dm12 [varchar](9) NULL,
	docm [varchar](3) NULL,
	ecod [varchar](5) NULL,
	eicd [int] NULL,
	eicd_kw [varchar](255) NULL,
	endt [datetime] NULL,
	etyp [int] NULL,
	etyp_kw [varchar](255) NULL,
	ifbp [varchar](9) NOT NULL,
	ifbp_ref_compnr [varchar](10) NULL,
	incb [int] NULL,
	incb_kw [varchar](255) NULL,
	incc [int] NULL,
	incc_kw [varchar](255) NULL,
	incy [int] NULL,
	incy_kw [varchar](255) NULL,
	inma [int] NULL,
	inma_kw [varchar](255) NULL,
	leac [varchar](12) NULL,
	lmdt [datetime] NULL,
	lmus [varchar](16) NULL,
	mstm [varchar](3) NULL,
	ncin [int] NULL,
	nrgr [varchar](3) NULL,
	pana [varchar](9) NULL,
	pana_ref_compnr [varchar](10) NULL,
	paya [varchar](3) NULL,
	paya_ref_compnr [varchar](10) NULL,
	paym [varchar](3) NULL,
	ptbp [varchar](9) NULL,
	ptbp_ref_compnr [varchar](10) NULL,
	rcrs [varchar](3) NULL,
	rcrs_ref_compnr [varchar](10) NULL,
	refr [varchar](255) NULL,
	rpay [varchar](3) NULL,
	rpay_ref_compnr [varchar](10) NULL,
	rpym [varchar](3) NULL,
	rrsi [int] NULL,
	rrsi_kw [varchar](255) NULL,
	rtyp [varchar](3) NULL,
	rtyp_ref_compnr [varchar](10) NULL,
	sbmt [varchar](3) NULL,
	sbmt_ref_compnr [varchar](10) NULL,
	seak [varchar](255) NULL,
	sequencenumber [int] NULL,
	seri [varchar](8) NULL,
	sirn [varchar](9) NULL,
	stdt [datetime] NULL,
	subc [int] NULL,
	subc_kw [varchar](255) NULL,
	tefx [varchar](32) NULL,
	telp [varchar](32) NULL,
	tfci [varchar](15) NULL,
	tfcy [varchar](6) NULL,
	tfex [varchar](15) NULL,
	tfln [varchar](32) NULL,
	ztimestamp [datetime] NULL,
	tlci [varchar](15) NULL,
	tlcy [varchar](6) NULL,
	tlex [varchar](15) NULL,
	tlln [varchar](32) NULL,
	trsc [varchar](3) NULL,
	txta [int] NULL,
	txta_ref_compnr [varchar](10) NULL,
	zuser [varchar](16) NULL,
	username [varchar](8) NULL,
	usin [int] NULL,
	usin_kw [varchar](255) NULL,
	vryn [int] NULL,
	vryn_kw [varchar](255) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (ifbp)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom110]
Description: Sold-to Business Partners Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tccom110];

CREATE TABLE [acq101].[dst_tccom110]
(
	[aalg] [int] NULL,
	[aalg_kw] [varchar](255) NULL,
	[aapr] [int] NULL,
	[aapr_kw] [varchar](255) NULL,
	[aaps] [int] NULL,
	[aaps_kw] [varchar](255) NULL,
	[ackx] [int] NULL,
	[ackx_kw] [varchar](255) NULL,
	[aprc] [int] NULL,
	[aprc_kw] [varchar](255) NULL,
	[apsr] [int] NULL,
	[apsr_kw] [varchar](255) NULL,
	[arcu] [varchar](3) NULL,
	[arcu_ref_compnr] [varchar](10) NULL,
	[arev] [float] NULL,
	[asma] [int] NULL,
	[asma_kw] [varchar](255) NULL,
	[bppr] [varchar](9) NULL,
	[bppr_ref_compnr] [varchar](10) NULL,
	[bpst] [int] NULL,
	[bpst_kw] [varchar](255) NULL,
	[bpus] [varchar](9) NULL,
	[bpus_ref_compnr] [varchar](10) NULL,
	[cacf] [int] NULL,
	[cacf_kw] [varchar](255) NULL,
	[cacs] [int] NULL,
	[cacs_kw] [varchar](255) NULL,
	[cadr] [varchar](9) NULL,
	[cadr_ref_compnr] [varchar](10) NULL,
	[cbps] [varchar](3) NULL,
	[cbps_ref_compnr] [varchar](10) NULL,
	[cbrn] [varchar](6) NULL,
	[cbrn_ref_compnr] [varchar](10) NULL,
	[cbtp] [varchar](3) NULL,
	[cbtp_ref_compnr] [varchar](10) NULL,
	[ccal] [varchar](9) NULL,
	[ccal_ref_compnr] [varchar](10) NULL,
	[ccnt] [varchar](9) NULL,
	[ccnt_ref_compnr] [varchar](10) NULL,
	[cdec] [varchar](3) NULL,
	[cdec_ref_compnr] [varchar](10) NULL,
	[chak] [int] NULL,
	[chak_kw] [varchar](255) NULL,
	[chan] [varchar](3) NULL,
	[chan_ref_compnr] [varchar](10) NULL,
	[clan] [varchar](3) NULL,
	[clan_ref_compnr] [varchar](10) NULL,
	[clgr] [varchar](3) NULL,
	[clgr_ref_compnr] [varchar](10) NULL,
	[cofc] [varchar](6) NULL,
	[compnr] [varchar](10) NULL,
	[cpls] [varchar](3) NULL,
	[cpls_ref_compnr] [varchar](10) NULL,
	[crdt] [datetime] NULL,
	[creg] [varchar](3) NULL,
	[creg_ref_compnr] [varchar](10) NULL,
	[crep] [varchar](9) NULL,
	[crep_ref_compnr] [varchar](10) NULL,
	[crtc] [varchar](3) NULL,
	[cspr] [int] NULL,
	[cspr_ref_compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[endt] [datetime] NULL,
	[frin] [int] NULL,
	[frin_kw] [varchar](255) NULL,
	[incd] [varchar](10) NULL,
	[incd_ref_compnr] [varchar](10) NULL,
	[itbp] [varchar](9) NULL,
	[itbp_ref_compnr] [varchar](10) NULL,
	[lcmp] [int] NULL,
	[lcmp_ref_compnr] [varchar](10) NULL,
	[lmdt] [datetime] NULL,
	[lmsp] [float] NULL,
	[lmus] [varchar](16) NULL,
	[macc] [int] NULL,
	[macc_kw] [varchar](255) NULL,
	[mask] [varchar](9) NULL,
	[mask_ref_compnr] [varchar](10) NULL,
	[mcfr] [int] NULL,
	[mcfr_kw] [varchar](255) NULL,
	[noem] [int] NULL,
	[odis] [float] NULL,
	[ofbp] [varchar](9) NULL,
	[ofbp_ref_compnr] [varchar](10) NULL,
	[ofbp_stbp_ref_compnr] [varchar](10) NULL,
	[osno] [varchar](15) NULL,
	[osrp] [varchar](9) NULL,
	[osrp_ref_compnr] [varchar](10) NULL,
	[owsh] [varchar](255) NULL,
	[pldd] [varchar](3) NULL,
	[pldd_ref_compnr] [varchar](10) NULL,
	[prio] [int] NULL,
	[prio_ref_compnr] [varchar](10) NULL,
	[prms] [int] NULL,
	[prms_kw] [varchar](255) NULL,
	[ptpa] [varchar](9) NULL,
	[ptpa_ref_compnr] [varchar](10) NULL,
	[rdec] [varchar](3) NULL,
	[rdec_ref_compnr] [varchar](10) NULL,
	[rtng] [int] NULL,
	[rtng_kw] [varchar](255) NULL,
	[sbil] [int] NULL,
	[sbil_kw] [varchar](255) NULL,
	[scon] [int] NULL,
	[scon_kw] [varchar](255) NULL,
	[scqq] [int] NULL,
	[scqq_kw] [varchar](255) NULL,
	[seak] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[sotp] [varchar](3) NULL,
	[sscc] [int] NULL,
	[sscc_kw] [varchar](255) NULL,
	[stbp] [varchar](9) NULL,
	[stbp_ref_compnr] [varchar](10) NULL,
	[stdt] [datetime] NULL,
	[ster] [varchar](6) NULL,
	[ster_ref_compnr] [varchar](10) NULL,
	[tefx] [varchar](32) NULL,
	[telp] [varchar](32) NULL,
	[tfci] [varchar](15) NULL,
	[tfcy] [varchar](6) NULL,
	[tfex] [varchar](15) NULL,
	[tfln] [varchar](32) NULL,
	[ztimestamp] [datetime] NULL,
	[tlci] [varchar](15) NULL,
	[tlcy] [varchar](6) NULL,
	[tlex] [varchar](15) NULL,
	[tlln] [varchar](32) NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[ucnd] [int] NULL,
	[ucnd_kw] [varchar](255) NULL,
	[umsp] [float] NULL,
	[zuser] [varchar](16) NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [ofbp] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom111]
Description: Ship-to Business Partners
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tccom111];

CREATE TABLE [acq101].[dst_tccom111]
(
	[aetc] [int] NULL,
	[aetc_kw] [varchar](255) NULL,
	[apsr] [int] NULL,
	[apsr_kw] [varchar](255) NULL,
	[bpst] [int] NULL,
	[bpst_kw] [varchar](255) NULL,
	[cadr] [varchar](9) NULL,
	[cadr_ref_compnr] [varchar](10) NULL,
	[capp] [int] NULL,
	[capp_kw] [varchar](255) NULL,
	[cbps] [varchar](3) NULL,
	[cbps_ref_compnr] [varchar](10) NULL,
	[cbtp] [varchar](3) NULL,
	[cbtp_ref_compnr] [varchar](10) NULL,
	[ccal] [varchar](9) NULL,
	[ccal_ref_compnr] [varchar](10) NULL,
	[ccnt] [varchar](9) NULL,
	[ccnt_ref_compnr] [varchar](10) NULL,
	[cdec] [varchar](3) NULL,
	[cdec_ref_compnr] [varchar](10) NULL,
	[cfrw] [varchar](3) NULL,
	[cfrw_ref_compnr] [varchar](10) NULL,
	[clan] [varchar](3) NULL,
	[clan_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NULL,
	[crdt] [datetime] NULL,
	[cwar] [varchar](6) NULL,
	[cwar_ref_compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[endt] [datetime] NULL,
	[lmdt] [datetime] NULL,
	[lmus] [varchar](16) NULL,
	[mask] [varchar](9) NULL,
	[mask_ref_compnr] [varchar](10) NULL,
	[ofbp] [varchar](9) NULL,
	[ofbp_ref_compnr] [varchar](10) NULL,
	[ptpa] [varchar](9) NULL,
	[ptpa_ref_compnr] [varchar](10) NULL,
	[rdec] [varchar](3) NULL,
	[rdec_ref_compnr] [varchar](10) NULL,
	[rfia] [int] NULL,
	[rfia_kw] [varchar](255) NULL,
	[rfis] [varchar](9) NULL,
	[rrqt] [int] NULL,
	[rrqt_kw] [varchar](255) NULL,
	[seak] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[serv] [varchar](3) NULL,
	[serv_ref_compnr] [varchar](10) NULL,
	[site] [varchar](9) NULL,
	[site_ref_compnr] [varchar](10) NULL,
	[sscc] [int] NULL,
	[sscc_kw] [varchar](255) NULL,
	[stbp] [varchar](9) NULL,
	[stbp_ref_compnr] [varchar](10) NULL,
	[stdt] [datetime] NULL,
	[tefx] [varchar](32) NULL,
	[telp] [varchar](32) NULL,
	[tfci] [varchar](15) NULL,
	[tfcy] [varchar](6) NULL,
	[tfex] [varchar](15) NULL,
	[tfln] [varchar](32) NULL,
	[ztimestamp] [datetime] NULL,
	[tlci] [varchar](15) NULL,
	[tlcy] [varchar](6) NULL,
	[tlex] [varchar](15) NULL,
	[tlln] [varchar](32) NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[zuser] [varchar](16) NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [stbp] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom114]
Description: This is a DST table for Pay-by Business Partners

Data Type: Dimension Data

Original Project: JBT Finance Model
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tccom114];

CREATE TABLE [acq101].[dst_tccom114]
(
	aofc [varchar](6) NULL,
	aofc_ref_compnr [varchar](10) NULL,
	bank [varchar](3) NULL,
	bpst [int] NULL,
	bpst_kw [varchar](255) NULL,
	cadr [varchar](9) NULL,
	cadr_ref_compnr [varchar](10) NULL,
	cban [varchar](3) NULL,
	cbps [varchar](3) NULL,
	cbps_ref_compnr [varchar](10) NULL,
	cbtp [varchar](3) NULL,
	cbtp_ref_compnr [varchar](10) NULL,
	ccal [varchar](9) NULL,
	ccal_ref_compnr [varchar](10) NULL,
	ccnt [varchar](9) NULL,
	ccnt_ref_compnr [varchar](10) NULL,
	ccur [varchar](3) NULL,
	ccur_ref_compnr [varchar](10) NULL,
	clan [varchar](3) NULL,
	clan_ref_compnr [varchar](10) NULL,
	cofc [varchar](6) NOT NULL,
	cofc_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	crdt [datetime] NULL,
	deleted [varchar](10) NULL,
	eded [int] NULL,
	endt [datetime] NULL,
	lmdt [datetime] NULL,
	lmus [varchar](16) NULL,
	mrem [varchar](3) NULL,
	mxtn [int] NULL,
	pfbp [varchar](9) NOT NULL,
	pfbp_cban_ref_compnr [varchar](10) NULL,
	pfbp_ref_compnr [varchar](10) NULL,
	ppsl [int] NULL,
	ppsl_kw [varchar](255) NULL,
	prra [int] NULL,
	prra_kw [varchar](255) NULL,
	rtad [varchar](9) NULL,
	rtad_ref_compnr [varchar](10) NULL,
	rtyp [varchar](3) NULL,
	rtyp_ref_compnr [varchar](10) NULL,
	seak [varchar](255) NULL,
	sequencenumber [int] NULL,
	stdt [datetime] NULL,
	stxa [int] NULL,
	stxa_kw [varchar](255) NULL,
	tefx [varchar](32) NULL,
	telp [varchar](32) NULL,
	tfci [varchar](15) NULL,
	tfcy [varchar](6) NULL,
	tfex [varchar](15) NULL,
	tfln [varchar](32) NULL,
	ztimestamp [datetime] NULL,
	tlci [varchar](15) NULL,
	tlcy [varchar](6) NULL,
	tlex [varchar](15) NULL,
	tlln [varchar](32) NULL,
	tndm [int] NULL,
	tndm_kw [varchar](255) NULL,
	txta [int] NULL,
	txta_ref_compnr [varchar](10) NULL,
	zuser [varchar](16) NULL,
	username [varchar](8) NULL,
	vtcb [int] NULL,
	vtcb_kw [varchar](255) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (pfbp)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom124]
Description: This is a DST table for Pay-to Business Partners

Data Type: Dimension Data

Original Project: JBT Finance Model
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tccom124];

CREATE TABLE [acq101].[dst_tccom124]
(
	aofc [varchar](6) NULL,
	aofc_ref_compnr [varchar](10) NULL,
	bank [varchar](3) NULL,
	bcbs [int] NULL,
	bcbs_kw [varchar](255) NULL,
	bpst [int] NULL,
	bpst_kw [varchar](255) NULL,
	cadr [varchar](9) NULL,
	cadr_ref_compnr [varchar](10) NULL,
	cban [varchar](3) NULL,
	cbps [varchar](3) NULL,
	cbps_ref_compnr [varchar](10) NULL,
	cbtp [varchar](3) NULL,
	cbtp_ref_compnr [varchar](10) NULL,
	ccal [varchar](9) NULL,
	ccal_ref_compnr [varchar](10) NULL,
	ccnt [varchar](9) NULL,
	ccnt_ref_compnr [varchar](10) NULL,
	ccur [varchar](3) NULL,
	ccur_ref_compnr [varchar](10) NULL,
	clan [varchar](3) NULL,
	clan_ref_compnr [varchar](10) NULL,
	cnsm [int] NULL,
	cofc [varchar](6) NOT NULL,
	cofc_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	crdt [datetime] NULL,
	deleted [varchar](10) NULL,
	eded [int] NULL,
	endt [datetime] NULL,
	exor [int] NULL,
	exor_kw [varchar](255) NULL,
	expo [int] NULL,
	expo_kw [varchar](255) NULL,
	lmdt [datetime] NULL,
	lmus [varchar](16) NULL,
	mxtn [int] NULL,
	ptbp [varchar](9) NOT NULL,
	ptbp_cban_ref_compnr [varchar](10) NULL,
	ptbp_ref_compnr [varchar](10) NULL,
	rtyp [varchar](3) NULL,
	rtyp_ref_compnr [varchar](10) NULL,
	seak [varchar](255) NULL,
	sequencenumber [int] NULL,
	stdt [datetime] NULL,
	stxa [int] NULL,
	stxa_kw [varchar](255) NULL,
	tefx [varchar](32) NULL,
	telp [varchar](32) NULL,
	tfci [varchar](15) NULL,
	tfcy [varchar](6) NULL,
	tfex [varchar](15) NULL,
	tfln [varchar](32) NULL,
	ztimestamp [datetime] NULL,
	tlci [varchar](15) NULL,
	tlcy [varchar](6) NULL,
	tlex [varchar](15) NULL,
	tlln [varchar](32) NULL,
	tndm [int] NULL,
	tndm_kw [varchar](255) NULL,
	txno [varchar](255) NULL,
	txta [int] NULL,
	txta_ref_compnr [varchar](10) NULL,
	uptc [int] NULL,
	uptc_kw [varchar](255) NULL,
	zuser [varchar](16) NULL,
	username [varchar](8) NULL,
	uwht [int] NULL,
	uwht_kw [varchar](255) NULL,
	valf [datetime] NULL,
	valt [datetime] NULL,
	vryn [int] NULL,
	vryn_kw [varchar](255) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (ptbp)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom120]
Description: This is a DST table for Buy-from Business Partners

Data Type: Dimension Data

Original Project: JBT Finance Model
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tccom120];

CREATE TABLE [acq101].[dst_tccom120]
(
	ackx [int] NULL,
	ackx_kw [varchar](255) NULL,
	afrb [int] NULL,
	afrb_kw [varchar](255) NULL,
	bppr [varchar](9) NULL,
	bppr_ref_compnr [varchar](10) NULL,
	bpst [int] NULL,
	bpst_kw [varchar](255) NULL,
	bpus [varchar](9) NULL,
	bpus_ref_compnr [varchar](10) NULL,
	cadr [varchar](9) NULL,
	cadr_ref_compnr [varchar](10) NULL,
	cbps [varchar](3) NULL,
	cbps_ref_compnr [varchar](10) NULL,
	cbrn [varchar](6) NULL,
	cbrn_ref_compnr [varchar](10) NULL,
	cbtp [varchar](3) NULL,
	cbtp_ref_compnr [varchar](10) NULL,
	ccal [varchar](9) NULL,
	ccal_ref_compnr [varchar](10) NULL,
	ccnt [varchar](9) NULL,
	ccnt_ref_compnr [varchar](10) NULL,
	ccon [varchar](9) NULL,
	ccon_ref_compnr [varchar](10) NULL,
	cdec [varchar](3) NULL,
	cdec_ref_compnr [varchar](10) NULL,
	clan [varchar](3) NULL,
	clan_ref_compnr [varchar](10) NULL,
	clgr [varchar](3) NULL,
	clgr_ref_compnr [varchar](10) NULL,
	cofc [varchar](6) NULL,
	compnr [varchar](10) NOT NULL,
	cplp [varchar](3) NULL,
	cplp_ref_compnr [varchar](10) NULL,
	crdt [datetime] NULL,
	creg [varchar](3) NULL,
	creg_ref_compnr [varchar](10) NULL,
	crrf [int] NULL,
	crrf_kw [varchar](255) NULL,
	deleted [varchar](10) NULL,
	encd [int] NULL,
	encd_kw [varchar](255) NULL,
	endt [datetime] NULL,
	frin [int] NULL,
	frin_kw [varchar](255) NULL,
	ifbp [varchar](9) NULL,
	ifbp_ref_compnr [varchar](10) NULL,
	lcmp [int] NULL,
	lcmp_ref_compnr [varchar](10) NULL,
	lmdt [datetime] NULL,
	lmus [varchar](16) NULL,
	mcfr [int] NULL,
	mcfr_kw [varchar](255) NULL,
	mesv [int] NULL,
	mesv_kw [varchar](255) NULL,
	ocus [varchar](15) NULL,
	odis [float] NULL,
	otbp [varchar](9) NOT NULL,
	otbp_ref_compnr [varchar](10) NULL,
	paft [int] NULL,
	paft_kw [varchar](255) NULL,
	potp [varchar](3) NULL,
	ptpa [varchar](9) NULL,
	ptpa_ref_compnr [varchar](10) NULL,
	raur [int] NULL,
	raur_kw [varchar](255) NULL,
	rdec [varchar](3) NULL,
	rdec_ref_compnr [varchar](10) NULL,
	sbdt [int] NULL,
	sbdt_kw [varchar](255) NULL,
	sbil [int] NULL,
	sbil_kw [varchar](255) NULL,
	scqq [int] NULL,
	scqq_kw [varchar](255) NULL,
	seak [varchar](255) NULL,
	sequencenumber [int] NULL,
	sfbp [varchar](9) NULL,
	sfbp_ref_compnr [varchar](10) NULL,
	stdt [datetime] NULL,
	tefx [varchar](32) NULL,
	telp [varchar](32) NULL,
	tfci [varchar](15) NULL,
	tfcy [varchar](6) NULL,
	tfex [varchar](15) NULL,
	tfln [varchar](32) NULL,
	ztimestamp [datetime] NULL,
	tlci [varchar](15) NULL,
	tlcy [varchar](6) NULL,
	tlex [varchar](15) NULL,
	tlln [varchar](32) NULL,
	txta [int] NULL,
	txta_ref_compnr [varchar](10) NULL,
	ucnd [int] NULL,
	ucnd_kw [varchar](255) NULL,
	zuser [varchar](16) NULL,
	username [varchar](8) NULL,
	vryn [int] NULL,
	vryn_kw [varchar](255) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (otbp)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom121]
Description: This is a DST table for Ship-from Business Partners

Data Type: Dimension Data

Original Project: JBT Finance Model
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tccom121];

CREATE TABLE [acq101].[dst_tccom121]
(
	bpst [int] NULL,
	bpst_kw [varchar](255) NULL,
	cadr [varchar](9) NULL,
	cadr_ref_compnr [varchar](10) NULL,
	cbps [varchar](3) NULL,
	cbps_ref_compnr [varchar](10) NULL,
	cbtp [varchar](3) NULL,
	cbtp_ref_compnr [varchar](10) NULL,
	ccal [varchar](9) NULL,
	ccal_ref_compnr [varchar](10) NULL,
	ccnt [varchar](9) NULL,
	ccnt_ref_compnr [varchar](10) NULL,
	cdec [varchar](3) NULL,
	cdec_ref_compnr [varchar](10) NULL,
	cfrw [varchar](3) NULL,
	cfrw_ref_compnr [varchar](10) NULL,
	clan [varchar](3) NULL,
	clan_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	crdt [datetime] NULL,
	cwar [varchar](6) NULL,
	cwar_ref_compnr [varchar](10) NULL,
	deleted [varchar](10) NULL,
	endt [datetime] NULL,
	lmdt [datetime] NULL,
	lmus [varchar](16) NULL,
	otbp [varchar](9) NULL,
	otbp_ref_compnr [varchar](10) NULL,
	ptpa [varchar](9) NULL,
	ptpa_ref_compnr [varchar](10) NULL,
	qual [int] NULL,
	qual_kw [varchar](255) NULL,
	rdec [varchar](3) NULL,
	rdec_ref_compnr [varchar](10) NULL,
	sasn [int] NULL,
	sasn_kw [varchar](255) NULL,
	seak [varchar](255) NULL,
	sequencenumber [int] NULL,
	serv [varchar](3) NULL,
	serv_ref_compnr [varchar](10) NULL,
	sfbp [varchar](9) NOT NULL,
	sfbp_ref_compnr [varchar](10) NULL,
	site [varchar](9) NULL,
	site_ref_compnr [varchar](10) NULL,
	stdt [datetime] NULL,
	tefx [varchar](32) NULL,
	telp [varchar](32) NULL,
	tfci [varchar](15) NULL,
	tfcy [varchar](6) NULL,
	tfex [varchar](15) NULL,
	tfln [varchar](32) NULL,
	ztimestamp [datetime] NULL,
	tlci [varchar](15) NULL,
	tlcy [varchar](6) NULL,
	tlex [varchar](15) NULL,
	tlln [varchar](32) NULL,
	txta [int] NULL,
	txta_ref_compnr [varchar](10) NULL,
	zuser [varchar](16) NULL,
	username [varchar](8) NULL,
	vryn [int] NULL,
	vryn_kw [varchar](255) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (sfbp)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs013]
Description: Payment Terms Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs013];

CREATE TABLE [acq101].[dst_tcmcs013]
(
	[atie] [int] NULL,
	[atie_kw] [varchar](255) NULL,
	[cdde] [int] NULL,
	[cdde_kw] [varchar](255) NULL,
	[cdis] [int] NULL,
	[cdis_kw] [varchar](255) NULL,
	[compnr] [varchar](10) NULL,
	[cpay] [varchar](3) NULL,
	[day1] [int] NULL,
	[day2] [int] NULL,
	[day3] [int] NULL,
	[deleted] [varchar](10) NULL,
	[disa] [int] NULL,
	[disb] [int] NULL,
	[disc] [int] NULL,
	[dsca] [varchar](255) NULL,
	[fdis] [int] NULL,
	[fdue] [int] NULL,
	[pash] [varchar](3) NULL,
	[pash_ref_compnr] [varchar](10) NULL,
	[pdin] [int] NULL,
	[pdin_kw] [varchar](255) NULL,
	[pdis] [int] NULL,
	[pdis_kw] [varchar](255) NULL,
	[pdyn] [int] NULL,
	[pdyn_kw] [varchar](255) NULL,
	[pper] [int] NULL,
	[prca] [float] NULL,
	[prcb] [float] NULL,
	[prcc] [float] NULL,
	[prio] [int] NULL,
	[prio_kw] [varchar](255) NULL,
	[ptyp] [int] NULL,
	[ptyp_kw] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[tlsd] [int] NULL,
	[tola] [float] NULL,
	[told] [float] NULL,
	[tolp] [int] NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [cpay] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs062]
Description: Product Classes Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 13-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs062];

CREATE TABLE [acq101].[dst_tcmcs062]
(
	[compnr] [varchar](10) NULL,
	[cpcl] [varchar](6) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [cpcl] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs061]
Description: Product Lines Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 13-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs061];

CREATE TABLE [acq101].[dst_tcmcs061]
(
	[compnr] [varchar](10) NULL,
	[cpln] [varchar](6) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [cpln] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs015]
Description: Product Types Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs015];

CREATE TABLE [acq101].[dst_tcmcs015]
(
	[compnr] [varchar](10) NULL,
	[ctyp] [varchar](3) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [ctyp] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcibd001]
Description: Items Table
Data Type: Dimension Data
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcibd001];

CREATE TABLE [acq101].[dst_tcibd001]
(
	[ccde] [varchar](25) NULL,
	[ccde_ref_compnr] [varchar](10) NULL,
	[ccfg] [varchar](6) NULL,
	[ccfg_ref_compnr] [varchar](10) NULL,
	[cean] [varchar](14) NULL,
	[chma] [int] NULL,
	[chma_kw] [varchar](255) NULL,
	[citg] [varchar](6) NULL,
	[citg_ref_compnr] [varchar](10) NULL,
	[cmnf] [varchar](6) NULL,
	[cmnf_ref_compnr] [varchar](10) NULL,
	[cnfg] [int] NULL,
	[cnfg_kw] [varchar](255) NULL,
	[cntr] [varchar](3) NULL,
	[cntr_ref_compnr] [varchar](10) NULL,
	[coeu] [int] NULL,
	[coeu_kw] [varchar](255) NULL,
	[compnr] [varchar](10) NULL,
	[cont] [int] NULL,
	[cont_kw] [varchar](255) NULL,
	[cood] [varchar](9) NULL,
	[cood_ref_compnr] [varchar](10) NULL,
	[cpcl] [varchar](6) NULL,
	[cpcl_ref_compnr] [varchar](10) NULL,
	[cpcp] [varchar](8) NULL,
	[cpcp_ref_compnr] [varchar](10) NULL,
	[cpln] [varchar](6) NULL,
	[cpln_ref_compnr] [varchar](10) NULL,
	[cprj] [varchar](9) NULL,
	[cprj_ref_compnr] [varchar](10) NULL,
	[cpva] [int] NULL,
	[cpva_rcmp] [int] NULL,
	[crdt] [datetime] NULL,
	[csel] [varchar](3) NULL,
	[csel_ref_compnr] [varchar](10) NULL,
	[csig] [varchar](3) NULL,
	[csig_ref_compnr] [varchar](10) NULL,
	[ctyo] [varchar](3) NULL,
	[ctyo_ref_compnr] [varchar](10) NULL,
	[ctyp] [varchar](3) NULL,
	[ctyp_ref_compnr] [varchar](10) NULL,
	[cuni] [varchar](3) NULL,
	[cuni_ref_compnr] [varchar](10) NULL,
	[cust] [int] NULL,
	[cust_kw] [varchar](255) NULL,
	[cwun] [varchar](3) NULL,
	[cwun_ref_compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[dfit] [varchar](47) NULL,
	[dfit_ref_compnr] [varchar](10) NULL,
	[dpcr] [int] NULL,
	[dpcr_kw] [varchar](255) NULL,
	[dpeg] [int] NULL,
	[dpeg_kw] [varchar](255) NULL,
	[dptp] [int] NULL,
	[dptp_kw] [varchar](255) NULL,
	[dpuu] [int] NULL,
	[dpuu_kw] [varchar](255) NULL,
	[dsca] [varchar](255) NULL,
	[dscb] [varchar](255) NULL,
	[dscc] [varchar](255) NULL,
	[dscd] [varchar](255) NULL,
	[edco] [int] NULL,
	[edco_kw] [varchar](255) NULL,
	[efco] [varchar](8) NULL,
	[efpr] [int] NULL,
	[efpr_kw] [varchar](255) NULL,
	[eitm] [int] NULL,
	[eitm_kw] [varchar](255) NULL,
	[elcm] [int] NULL,
	[elcm_kw] [varchar](255) NULL,
	[elrq] [int] NULL,
	[elrq_kw] [varchar](255) NULL,
	[envc] [int] NULL,
	[envc_kw] [varchar](255) NULL,
	[exin] [varchar](8) NULL,
	[ichg] [int] NULL,
	[ichg_kw] [varchar](255) NULL,
	[icsi] [int] NULL,
	[icsi_kw] [varchar](255) NULL,
	[imag] [varchar](22) NULL,
	[indt] [datetime] NULL,
	[ippg] [int] NULL,
	[ippg_kw] [varchar](255) NULL,
	[item] [varchar](47) NULL,
	[itmt] [int] NULL,
	[itmt_kw] [varchar](255) NULL,
	[kitm] [int] NULL,
	[kitm_kw] [varchar](255) NULL,
	[lmdt] [datetime] NULL,
	[ltct] [int] NULL,
	[ltct_kw] [varchar](255) NULL,
	[mcoa] [int] NULL,
	[mcoa_kw] [varchar](255) NULL,
	[oktm] [int] NULL,
	[opol] [int] NULL,
	[opol_kw] [varchar](255) NULL,
	[opts] [int] NULL,
	[osys] [int] NULL,
	[osys_kw] [varchar](255) NULL,
	[ppeg] [int] NULL,
	[ppeg_kw] [varchar](255) NULL,
	[ppss] [int] NULL,
	[ppss_kw] [varchar](255) NULL,
	[psiu] [int] NULL,
	[psiu_kw] [varchar](255) NULL,
	[rdpt] [varchar](6) NULL,
	[rdpt_ref_compnr] [varchar](10) NULL,
	[repl] [int] NULL,
	[repl_kw] [varchar](255) NULL,
	[sayn] [int] NULL,
	[sayn_kw] [varchar](255) NULL,
	[seab] [varchar](255) NULL,
	[seak] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[seri] [int] NULL,
	[seri_kw] [varchar](255) NULL,
	[sgtc] [int] NULL,
	[sgtc_kw] [varchar](255) NULL,
	[srce] [int] NULL,
	[srce_kw] [varchar](255) NULL,
	[stoi] [int] NULL,
	[stoi_kw] [varchar](255) NULL,
	[styp] [int] NULL,
	[styp_kw] [varchar](255) NULL,
	[subc] [int] NULL,
	[subc_kw] [varchar](255) NULL,
	[ztimestamp] [datetime] NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[uefs] [int] NULL,
	[uefs_kw] [varchar](255) NULL,
	[umer] [int] NULL,
	[umer_kw] [varchar](255) NULL,
	[unef] [int] NULL,
	[unef_kw] [varchar](255) NULL,
	[username] [varchar](8) NULL,
	[uset] [varchar](6) NULL,
	[uset_cwun_ref_compnr] [varchar](10) NULL,
	[uset_ref_compnr] [varchar](10) NULL,
	[wght] [float] NULL,
	[wpcs] [int] NULL,
	[wpcs_kw] [varchar](255) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [item] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tctax016]
Description: Tax Classifications Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 13-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tctax016];

CREATE TABLE [acq101].[dst_tctax016]
(
	[bpcl] [varchar](12) NULL,
	[compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[pvat] [float] NULL,
	[scta] [int] NULL,
	[scta_kw] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[whta] [int] NULL,
	[whta_kw] [varchar](255) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [bpcl] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs031]
Description: Lines of Business Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 13-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs031];

CREATE TABLE [acq101].[dst_tcmcs031]
(
	[cbrn] [varchar](6) NULL,
	[compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [cbrn] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs080]
Description: Carriers Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 13-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs080];

CREATE TABLE [acq101].[dst_tcmcs080]
(
	[cfrw] [varchar](3) NOT NULL,
	[compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[scac] [varchar](20) NULL,
	[seak] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[suno] [varchar](9) NULL,
	[suno_ref_compnr] [varchar](10) NULL,
	[ztimestamp] [datetime] NULL,
	[trmd] [int] NULL,
	[trmd_kw] [varchar](255) NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [cfrw] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tdsls012]
Description: Sales Office Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tdsls012];

CREATE TABLE [acq101].[dst_tdsls012]
(
	[cofc] [varchar](6) NULL,
	[cofc_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NULL,
	[cwar] [varchar](6) NULL,
	[cwar_ref_compnr] [varchar](10) NULL,
	[cwoc] [varchar](6) NULL,
	[cwoc_ref_compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[ngsc] [varchar](3) NULL,
	[ngsc_ref_compnr] [varchar](10) NULL,
	[ngsc_sesc_ref_compnr] [varchar](10) NULL,
	[ngso] [varchar](3) NULL,
	[ngso_ref_compnr] [varchar](10) NULL,
	[ngso_seso_ref_compnr] [varchar](10) NULL,
	[ngso_sess_ref_compnr] [varchar](10) NULL,
	[ngsq] [varchar](3) NULL,
	[ngsq_ref_compnr] [varchar](10) NULL,
	[ngsq_sesq_ref_compnr] [varchar](10) NULL,
	[sequencenumber] [int] NULL,
	[sesc] [varchar](8) NULL,
	[seso] [varchar](8) NULL,
	[sesq] [varchar](8) NULL,
	[sess] [varchar](8) NULL,
	[site] [varchar](9) NULL,
	[site_ref_compnr] [varchar](10) NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [cofc] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tdpur012]
Description: This is a DST table for Purchase Office

Data Type: Dimension Data

Original Project: JBT Finance Model
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tdpur012];

CREATE TABLE [acq101].[dst_tdpur012]
(
	cofc [varchar](6) NOT NULL,
	cofc_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	cwar [varchar](6) NULL,
	cwar_ref_compnr [varchar](10) NULL,
	deleted [varchar](10) NULL,
	dsca [varchar](255) NULL,
	ngco [varchar](3) NULL,
	ngco_ref_compnr [varchar](10) NULL,
	ngco_scid_ref_compnr [varchar](10) NULL,
	ngpc [varchar](3) NULL,
	ngpc_ref_compnr [varchar](10) NULL,
	ngpc_sepc_ref_compnr [varchar](10) NULL,
	ngpo [varchar](3) NULL,
	ngpo_ref_compnr [varchar](10) NULL,
	ngpo_sepo_ref_compnr [varchar](10) NULL,
	ngpo_seps_ref_compnr [varchar](10) NULL,
	ngpq [varchar](3) NULL,
	ngpq_ref_compnr [varchar](10) NULL,
	ngpq_sepq_ref_compnr [varchar](10) NULL,
	ngpr [varchar](3) NULL,
	ngpr_ref_compnr [varchar](10) NULL,
	ngpr_sepr_ref_compnr [varchar](10) NULL,
	ngrl [varchar](3) NULL,
	ngrl_ref_compnr [varchar](10) NULL,
	ngrl_serl_ref_compnr [varchar](10) NULL,
	scid [varchar](8) NULL,
	sepc [varchar](8) NULL,
	sepo [varchar](8) NULL,
	sepq [varchar](8) NULL,
	sepr [varchar](8) NULL,
	seps [varchar](8) NULL,
	sequencenumber [int] NULL,
	serl [varchar](8) NULL,
	site [varchar](9) NULL,
	site_ref_compnr [varchar](10) NULL,
	ztimestamp [datetime] NULL,
	username [varchar](8) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (cofc)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs003]
Description: Warehouses Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs003];

CREATE TABLE [acq101].[dst_tcmcs003]
(
	[bpid] [varchar](9) NULL,
	[cadr] [varchar](9) NULL,
	[cadr_ref_compnr] [varchar](10) NULL,
	[casi] [varchar](3) NULL,
	[casi_ref_compnr] [varchar](10) NULL,
	[clan] [varchar](3) NULL,
	[clan_ref_compnr] [varchar](10) NULL,
	[comp] [int] NULL,
	[compnr] [varchar](10) NULL,
	[cprj] [varchar](9) NULL,
	[cprj_ref_compnr] [varchar](10) NULL,
	[cwar] [varchar](6) NULL,
	[cwar_eunt] [varchar](6) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[eunt_rcmp] [int] NULL,
	[imbp] [varchar](9) NULL,
	[imbp_ref_compnr] [varchar](10) NULL,
	[imgt] [int] NULL,
	[imgt_kw] [varchar](255) NULL,
	[inep] [int] NULL,
	[inep_kw] [varchar](255) NULL,
	[ofbp] [varchar](9) NULL,
	[ofbp_ref_compnr] [varchar](10) NULL,
	[otbp] [varchar](9) NULL,
	[otbp_ref_compnr] [varchar](10) NULL,
	[pwip] [int] NULL,
	[pwip_kw] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[sfbp] [varchar](9) NULL,
	[sfbp_ref_compnr] [varchar](10) NULL,
	[stbp] [varchar](9) NULL,
	[stbp_ref_compnr] [varchar](10) NULL,
	[swhu] [int] NULL,
	[swhu_kw] [varchar](255) NULL,
	[ztimestamp] [datetime] NULL,
	[typw] [int] NULL,
	[typw_kw] [varchar](255) NULL,
	[username] [varchar](8) NULL,
	[wmsc] [int] NULL,
	[wmsc_kw] [varchar](255) NULL,
	[xsbp] [varchar](9) NULL,
	[xsbp_ref_compnr] [varchar](10) NULL,
	[xsit] [int] NULL,
	[xsit_kw] [varchar](255) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [cwar] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tccom001]
Description: Employees Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tccom001];

CREATE TABLE [acq101].[dst_tccom001]
(
	[ccal] [varchar](9) NULL,
	[ccal_ref_compnr] [varchar](10) NULL,
	[clan] [varchar](3) NULL,
	[clan_ref_compnr] [varchar](10) NULL,
	[clrt] [varchar](6) NULL,
	[clrt_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NULL,
	[cpcp] [varchar](8) NULL,
	[cpcp_ref_compnr] [varchar](10) NULL,
	[ctit] [varchar](3) NULL,
	[ctit_ref_compnr] [varchar](10) NULL,
	[cwoc] [varchar](6) NULL,
	[cwoc_ref_compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[emno] [varchar](9) NULL,
	[guid] [varchar](22) NULL,
	[imag] [varchar](22) NULL,
	[loco] [varchar](16) NULL,
	[nama] [varchar](255) NULL,
	[namb] [varchar](255) NULL,
	[namc] [varchar](255) NULL,
	[namd] [varchar](255) NULL,
	[seak] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [emno] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs042]
Description: Point of Title Passage Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 13-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs042];

CREATE TABLE [acq101].[dst_tcmcs042]
(
	[cadr] [varchar](9) NULL,
	[cadr_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[ptpa] [varchar](9) NULL,
	[seak] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[spec] [int] NULL,
	[spec_kw] [varchar](255) NULL,
	[ztimestamp] [datetime] NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [ptpa] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs005]
Description: Reasons Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs005];

CREATE TABLE [acq101].[dst_tcmcs005]
(
	[appr] [int] NULL,
	[appr_kw] [varchar](255) NULL,
	[bilb] [int] NULL,
	[bilb_kw] [varchar](255) NULL,
	[cdis] [varchar](6) NULL,
	[compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[drpi] [int] NULL,
	[drpi_kw] [varchar](255) NULL,
	[dsca] [varchar](255) NULL,
	[efdt] [datetime] NULL,
	[etrt] [int] NULL,
	[etrt_kw] [varchar](255) NULL,
	[exdt] [datetime] NULL,
	[rstp] [int] NULL,
	[rstp_kw] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [cdis] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tdsls094]
Description: Sales Order Types Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 13-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tdsls094];

CREATE TABLE [acq101].[dst_tdsls094]
(
	[aaps] [int] NULL,
	[aaps_kw] [varchar](255) NULL,
	[aprd] [int] NULL,
	[aprd_kw] [varchar](255) NULL,
	[apur] [int] NULL,
	[apur_kw] [varchar](255) NULL,
	[blcs] [varchar](13) NULL,
	[cnsi] [int] NULL,
	[cnsi_kw] [varchar](255) NULL,
	[cnsr] [int] NULL,
	[cnsr_kw] [varchar](255) NULL,
	[compnr] [varchar](10) NULL,
	[coun] [int] NULL,
	[coun_kw] [varchar](255) NULL,
	[cphl] [int] NULL,
	[cphl_kw] [varchar](255) NULL,
	[crdc] [int] NULL,
	[crdc_kw] [varchar](255) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[efdt] [datetime] NULL,
	[einc] [int] NULL,
	[einc_kw] [varchar](255) NULL,
	[exdt] [datetime] NULL,
	[gmrc] [int] NULL,
	[gmrc_kw] [varchar](255) NULL,
	[incm] [int] NULL,
	[incm_kw] [varchar](255) NULL,
	[mwdl] [int] NULL,
	[mwdl_kw] [varchar](255) NULL,
	[ngsc] [varchar](3) NULL,
	[ngsc_ref_compnr] [varchar](10) NULL,
	[ngsc_sesc_ref_compnr] [varchar](10) NULL,
	[ngso] [varchar](3) NULL,
	[ngso_ref_compnr] [varchar](10) NULL,
	[ngso_seso_ref_compnr] [varchar](10) NULL,
	[ngsq] [varchar](3) NULL,
	[ngsq_ref_compnr] [varchar](10) NULL,
	[ngsq_sesq_ref_compnr] [varchar](10) NULL,
	[pmsk] [varchar](20) NULL,
	[zproc] [varchar](6) NULL,
	[retb] [int] NULL,
	[retb_kw] [varchar](255) NULL,
	[reto] [int] NULL,
	[reto_kw] [varchar](255) NULL,
	[scon] [int] NULL,
	[scon_kw] [varchar](255) NULL,
	[sdec] [varchar](3) NULL,
	[sdec_ref_compnr] [varchar](10) NULL,
	[sequencenumber] [int] NULL,
	[sesc] [varchar](8) NULL,
	[seso] [varchar](8) NULL,
	[sesq] [varchar](8) NULL,
	[sotp] [varchar](3) NULL,
	[spay] [varchar](3) NULL,
	[spay_ref_compnr] [varchar](10) NULL,
	[ssoa] [int] NULL,
	[ssoa_kw] [varchar](255) NULL,
	[ssob] [int] NULL,
	[ssob_kw] [varchar](255) NULL,
	[ssoc] [int] NULL,
	[ssoc_kw] [varchar](255) NULL,
	[ssod] [int] NULL,
	[ssod_kw] [varchar](255) NULL,
	[ssoe] [int] NULL,
	[ssoe_kw] [varchar](255) NULL,
	[ssof] [int] NULL,
	[ssof_kw] [varchar](255) NULL,
	[sund] [int] NULL,
	[sund_kw] [varchar](255) NULL,
	[ztimestamp] [datetime] NULL,
	[udps] [int] NULL,
	[udps_kw] [varchar](255) NULL,
	[upls] [int] NULL,
	[upls_kw] [varchar](255) NULL,
	[upsh] [int] NULL,
	[upsh_kw] [varchar](255) NULL,
	[username] [varchar](8) NULL,
	[wpal] [int] NULL,
	[wpal_kw] [varchar](255) NULL,
	[wrhp] [varchar](3) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [sotp] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tdsls097]
Description: Change Reasons Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 13-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tdsls097];

CREATE TABLE [acq101].[dst_tdsls097]
(
	[compnr] [varchar](10) NULL,
	[crcd] [varchar](6) NULL,
	[deleted] [varchar](10) NULL,
	[demd] [int] NULL,
	[demd_kw] [varchar](255) NULL,
	[dsca] [varchar](255) NULL,
	[lsts] [int] NULL,
	[lsts_kw] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [crcd] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs202]
Description: Sales Type Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 13-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs202];

CREATE TABLE [acq101].[dst_tcmcs202]
(
	[cfrs] [varchar](6) NULL,
	[cfrs_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[zdesc] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[styp] [varchar](6) NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[z5tp] [int] NULL,
	[z5tp_kw] [varchar](255) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [styp] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs036]
Description: Tax Codes Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 13-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs036];

CREATE TABLE [acq101].[dst_tcmcs036]
(
	[agtx] [int] NULL,
	[agtx_kw] [varchar](255) NULL,
	[appr] [int] NULL,
	[appr_kw] [varchar](255) NULL,
	[ccty] [varchar](3) NULL,
	[ccty_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NULL,
	[ctau] [varchar](10) NULL,
	[ctau_ref_compnr] [varchar](10) NULL,
	[cvat] [varchar](9) NULL,
	[cvat_ref_compnr] [varchar](10) NULL,
	[ddis] [int] NULL,
	[ddis_kw] [varchar](255) NULL,
	[ddos] [int] NULL,
	[ddos_kw] [varchar](255) NULL,
	[ddpt] [int] NULL,
	[ddpt_kw] [varchar](255) NULL,
	[ddst] [int] NULL,
	[ddst_kw] [varchar](255) NULL,
	[ddtt] [int] NULL,
	[ddtt_kw] [varchar](255) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[extx] [int] NULL,
	[extx_kw] [varchar](255) NULL,
	[gnen] [int] NULL,
	[gnen_kw] [varchar](255) NULL,
	[gtax] [int] NULL,
	[gtax_kw] [varchar](255) NULL,
	[idtx] [varchar](3) NULL,
	[idtx_ref_compnr] [varchar](10) NULL,
	[ifbp] [varchar](9) NULL,
	[ifbp_ref_compnr] [varchar](10) NULL,
	[intx] [int] NULL,
	[intx_kw] [varchar](255) NULL,
	[invb] [int] NULL,
	[invb_kw] [varchar](255) NULL,
	[ivca] [int] NULL,
	[ivca_kw] [varchar](255) NULL,
	[ivtc] [varchar](9) NULL,
	[ktax] [int] NULL,
	[ktax_kw] [varchar](255) NULL,
	[ntax] [int] NULL,
	[ntax_kw] [varchar](255) NULL,
	[otro] [int] NULL,
	[otro_kw] [varchar](255) NULL,
	[payt] [int] NULL,
	[payt_kw] [varchar](255) NULL,
	[regt] [varchar](9) NULL,
	[regt_ref_compnr] [varchar](10) NULL,
	[rnva] [int] NULL,
	[rnva_kw] [varchar](255) NULL,
	[scen] [int] NULL,
	[scen_kw] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[smpl] [int] NULL,
	[smpl_kw] [varchar](255) NULL,
	[stax] [varchar](9) NULL,
	[stax_ref_compnr] [varchar](10) NULL,
	[tbvf] [varchar](3) NULL,
	[tbvf_ref_compnr] [varchar](10) NULL,
	[ztimestamp] [datetime] NULL,
	[tvat] [int] NULL,
	[tvat_kw] [varchar](255) NULL,
	[txcg] [varchar](12) NULL,
	[txcg_ref_compnr] [varchar](10) NULL,
	[txdt] [int] NULL,
	[txdt_kw] [varchar](255) NULL,
	[txrl] [varchar](6) NULL,
	[txrl_ref_compnr] [varchar](10) NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[usag] [int] NULL,
	[usag_kw] [varchar](255) NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [ccty] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs041]
Description: Delivery Terms Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcmcs041];

CREATE TABLE [acq101].[dst_tcmcs041]
(
	[cdec] [varchar](3) NULL,
	[cdyn] [int] NULL,
	[cdyn_kw] [varchar](255) NULL,
	[compnr] [varchar](10) NULL,
	[cptp] [int] NULL,
	[cptp_kw] [varchar](255) NULL,
	[crpd] [int] NULL,
	[crpd_kw] [varchar](255) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[fcba] [varchar](9) NULL,
	[fcba_ref_compnr] [varchar](10) NULL,
	[potp] [int] NULL,
	[potp_kw] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[spec] [int] NULL,
	[spec_kw] [varchar](255) NULL,
	[tdgp] [int] NULL,
	[tdgp_kw] [varchar](255) NULL,
	[ztimestamp] [datetime] NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [cdec] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tfcmg003]
Description: Payment Method Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tfcmg003];

CREATE TABLE [acq101].[dst_tfcmg003]
(
	[adbp] [int] NULL,
	[adbp_kw] [varchar](255) NULL,
	[alpm] [varchar](3) NULL,
	[alpm_ref_compnr] [varchar](10) NULL,
	[auto] [int] NULL,
	[auto_kw] [varchar](255) NULL,
	[badr] [int] NULL,
	[badr_kw] [varchar](255) NULL,
	[bank] [int] NULL,
	[bank_kw] [varchar](255) NULL,
	[bodd] [int] NULL,
	[bodd_kw] [varchar](255) NULL,
	[bomd] [int] NULL,
	[bomd_kw] [varchar](255) NULL,
	[cact] [int] NULL,
	[cact_kw] [varchar](255) NULL,
	[ccur] [varchar](3) NULL,
	[ccur_ref_compnr] [varchar](10) NULL,
	[cheq] [int] NULL,
	[cheq_kw] [varchar](255) NULL,
	[clim] [int] NULL,
	[cmaf] [varchar](3) NULL,
	[cmaf_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NULL,
	[copt] [int] NULL,
	[copt_kw] [varchar](255) NULL,
	[ddpr] [int] NULL,
	[ddpr_kw] [varchar](255) NULL,
	[deleted] [varchar](10) NULL,
	[zdesc] [varchar](255) NULL,
	[dev1] [varchar](14) NULL,
	[dev2] [varchar](14) NULL,
	[disc] [float] NULL,
	[dnum] [int] NULL,
	[dnum_kw] [varchar](255) NULL,
	[erpm] [varchar](3) NULL,
	[erpm_ref_compnr] [varchar](10) NULL,
	[fctr] [int] NULL,
	[fctr_kw] [varchar](255) NULL,
	[fcur] [int] NULL,
	[fcur_kw] [varchar](255) NULL,
	[ficr] [int] NULL,
	[ficr_kw] [varchar](255) NULL,
	[fpcr] [varchar](1) NULL,
	[hash] [int] NULL,
	[hash_kw] [varchar](255) NULL,
	[iban] [int] NULL,
	[iban_kw] [varchar](255) NULL,
	[issc] [varchar](6) NULL,
	[issc_ref_compnr] [varchar](10) NULL,
	[issu] [int] NULL,
	[issu_kw] [varchar](255) NULL,
	[matc] [varchar](6) NULL,
	[matc_ref_compnr] [varchar](10) NULL,
	[mato] [int] NULL,
	[mato_kw] [varchar](255) NULL,
	[matp] [int] NULL,
	[matp_kw] [varchar](255) NULL,
	[matu] [int] NULL,
	[matu_kw] [varchar](255) NULL,
	[maxa] [float] NULL,
	[mina] [float] NULL,
	[mndr] [int] NULL,
	[mndr_kw] [varchar](255) NULL,
	[nepa] [int] NULL,
	[nepa_kw] [varchar](255) NULL,
	[numb] [int] NULL,
	[odv1] [int] NULL,
	[odv1_kw] [varchar](255) NULL,
	[paso] [int] NULL,
	[paso_kw] [varchar](255) NULL,
	[paym] [varchar](3) NULL,
	[pfby] [int] NULL,
	[pfby_kw] [varchar](255) NULL,
	[pmod] [int] NULL,
	[pmod_kw] [varchar](255) NULL,
	[poda] [int] NULL,
	[poda_kw] [varchar](255) NULL,
	[ppal] [int] NULL,
	[ppal_kw] [varchar](255) NULL,
	[prej] [varchar](3) NULL,
	[prej_ref_compnr] [varchar](10) NULL,
	[zproc] [int] NULL,
	[proc_kw] [varchar](255) NULL,
	[ps01] [int] NULL,
	[ps01_kw] [varchar](255) NULL,
	[ps02] [int] NULL,
	[ps02_kw] [varchar](255) NULL,
	[ps1c] [varchar](6) NULL,
	[ps1c_ref_compnr] [varchar](10) NULL,
	[ps2c] [varchar](6) NULL,
	[ps2c_ref_compnr] [varchar](10) NULL,
	[pvoi] [int] NULL,
	[pvoi_kw] [varchar](255) NULL,
	[rabo] [int] NULL,
	[rabo_kw] [varchar](255) NULL,
	[rcol] [int] NULL,
	[rcol_kw] [varchar](255) NULL,
	[rdis] [int] NULL,
	[rdis_kw] [varchar](255) NULL,
	[reas] [int] NULL,
	[reas_kw] [varchar](255) NULL,
	[renc] [varchar](6) NULL,
	[renc_ref_compnr] [varchar](10) NULL,
	[rend] [int] NULL,
	[rend_kw] [varchar](255) NULL,
	[reop] [int] NULL,
	[reop_kw] [varchar](255) NULL,
	[repa] [int] NULL,
	[repa_kw] [varchar](255) NULL,
	[rgr2] [int] NULL,
	[rgrp] [int] NULL,
	[rpsb] [int] NULL,
	[rpsb_kw] [varchar](255) NULL,
	[rs01] [int] NULL,
	[rs01_kw] [varchar](255) NULL,
	[rs02] [int] NULL,
	[rs02_kw] [varchar](255) NULL,
	[rs03] [int] NULL,
	[rs03_kw] [varchar](255) NULL,
	[rs1c] [varchar](6) NULL,
	[rs1c_ref_compnr] [varchar](10) NULL,
	[rs2c] [varchar](6) NULL,
	[rs2c_ref_compnr] [varchar](10) NULL,
	[rs3c] [varchar](6) NULL,
	[rs3c_ref_compnr] [varchar](10) NULL,
	[rsbc] [varchar](6) NULL,
	[rsbc_ref_compnr] [varchar](10) NULL,
	[rsbd] [int] NULL,
	[rsbd_kw] [varchar](255) NULL,
	[sbdo] [int] NULL,
	[sbdo_kw] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[sess] [varchar](20) NULL,
	[stpo] [int] NULL,
	[stpo_kw] [varchar](255) NULL,
	[ztimestamp] [datetime] NULL,
	[tnty] [varchar](3) NULL,
	[tnty_ref_compnr] [varchar](10) NULL,
	[topy] [varchar](3) NULL,
	[topy_ref_compnr] [varchar](10) NULL,
	[typp] [int] NULL,
	[typp_kw] [varchar](255) NULL,
	[uiba] [int] NULL,
	[uiba_kw] [varchar](255) NULL,
	[uicc] [int] NULL,
	[uicc_kw] [varchar](255) NULL,
	[uifc] [int] NULL,
	[uifc_kw] [varchar](255) NULL,
	[upbl] [int] NULL,
	[upbl_kw] [varchar](255) NULL,
	[urcc] [int] NULL,
	[urcc_kw] [varchar](255) NULL,
	[username] [varchar](8) NULL,
	[xfyn] [int] NULL,
	[xfyn_kw] [varchar](255) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [paym] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tdpct001]
Description: Category Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tdpct001];

CREATE TABLE [acq101].[dst_tdpct001]
(
	[catc] [varchar](6) NULL,
	[compnr] [varchar](10) NULL,
	[ctyp] [int] NULL,
	[ctyp_kw] [varchar](255) NULL,
	[deleted] [varchar](10) NULL,
	[dsca] [varchar](255) NULL,
	[effd] [datetime] NULL,
	[expd] [datetime] NULL,
	[gsid] [int] NULL,
	[gsid_kw] [varchar](255) NULL,
	[imag] [varchar](22) NULL,
	[pcat] [int] NULL,
	[pcat_kw] [varchar](255) NULL,
	[remp] [varchar](9) NULL,
	[remp_ref_compnr] [varchar](10) NULL,
	[rofc] [varchar](6) NULL,
	[rofc_ref_compnr] [varchar](10) NULL,
	[seak] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [catc] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tdpct002]
Description:Category Structure Table
Data Type: Dimension Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tdpct002];

CREATE TABLE [acq101].[dst_tdpct002]
(
	[catc] [varchar](6) NULL,
	[catc_ref_compnr] [varchar](10) NULL,
	[city] [int] NULL,
	[city_kw] [varchar](255) NULL,
	[cmnf] [varchar](6) NULL,
	[cmnf_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[item] [varchar](47) NULL,
	[item_ref_compnr] [varchar](10) NULL,
	[otbp] [varchar](9) NULL,
	[otbp_ref_compnr] [varchar](10) NULL,
	[pono] [int] NULL,
	[scat] [varchar](6) NULL,
	[scat_ref_compnr] [varchar](10) NULL,
	[seak] [varchar](255) NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [scat] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_whwmd215]
Description: Item Inventory by Warehouse Table
Data Type: Transaction Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 12-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_whwmd215];

CREATE TABLE [acq101].[dst_whwmd215]
(
	[compnr] [varchar](10) NULL,
	[cwar] [varchar](6) NULL,
	[cwar_item_ref_compnr] [varchar](10) NULL,
	[cwar_ref_compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[hstd] [datetime] NULL,
	[item] [varchar](47) NULL,
	[item_ref_compnr] [varchar](10) NULL,
	[lsid] [datetime] NULL,
	[ltdt] [datetime] NULL,
	[qall] [float] NULL,
	[qblk] [float] NULL,
	[qbpl] [float] NULL,
	[qcal] [float] NULL,
	[qchd] [float] NULL,
	[qcis] [float] NULL,
	[qcit] [float] NULL,
	[qcom] [float] NULL,
	[qcor] [float] NULL,
	[qcpr] [float] NULL,
	[qcrj] [float] NULL,
	[qgit] [float] NULL,
	[qhib] [float] NULL,
	[qhnd] [float] NULL,
	[qhrj] [float] NULL,
	[qint] [float] NULL,
	[qlal] [float] NULL,
	[qnal] [float] NULL,
	[qnbl] [float] NULL,
	[qnbp] [float] NULL,
	[qnhd] [float] NULL,
	[qnit] [float] NULL,
	[qnor] [float] NULL,
	[qnrj] [float] NULL,
	[qoal] [float] NULL,
	[qoor] [float] NULL,
	[qord] [float] NULL,
	[sequencenumber] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[username] [varchar](8) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [item] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_whinr110]
Description: Items Transactions by Item and Warehouse
Data Type: Transaction Data 
Original Project: JBT Sales
Developer: Srilatha Naregudam
Date: 13-04-2021
Reviewed By: Atul Raje


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_whinr110];

CREATE TABLE [acq101].[dst_whinr110]
(
	[bfbp] [varchar](9) NULL,
	[boml] [int] NULL,
	[bpid] [varchar](9) NULL,
	[bpid_ref_compnr] [varchar](10) NULL,
	[cact] [varchar](16) NULL,
	[ccco] [varchar](8) NULL,
	[chan] [varchar](3) NULL,
	[chan_ref_compnr] [varchar](10) NULL,
	[cinv] [int] NULL,
	[clot] [varchar](20) NULL,
	[compnr] [varchar](10) NULL,
	[cons] [int] NULL,
	[cons_kw] [varchar](255) NULL,
	[cosv] [int] NULL,
	[cosv_kw] [varchar](255) NULL,
	[cprj] [varchar](9) NULL,
	[cprj_ref_compnr] [varchar](10) NULL,
	[cspa] [varchar](16) NULL,
	[cstl] [varchar](4) NULL,
	[ctrr] [int] NULL,
	[ctrr_kw] [varchar](255) NULL,
	[cwar] [varchar](6) NULL,
	[cwar_ref_compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[dlin] [int] NULL,
	[effn] [int] NULL,
	[effn_ref_compnr] [varchar](10) NULL,
	[ilgd] [datetime] NULL,
	[invd] [datetime] NULL,
	[iseq] [int] NULL,
	[item] [varchar](47) NULL,
	[item_ref_compnr] [varchar](10) NULL,
	[itid] [varchar](9) NULL,
	[itrd] [datetime] NULL,
	[itse] [int] NULL,
	[koor] [int] NULL,
	[koor_kw] [varchar](255) NULL,
	[kost] [int] NULL,
	[kost_kw] [varchar](255) NULL,
	[lgdt] [datetime] NULL,
	[logn] [varchar](16) NULL,
	[ocmp] [int] NULL,
	[ocmp_ref_compnr] [varchar](10) NULL,
	[orno] [varchar](9) NULL,
	[ownr] [varchar](9) NULL,
	[owns] [int] NULL,
	[owns_kw] [varchar](255) NULL,
	[phtr] [int] NULL,
	[phtr_kw] [varchar](255) NULL,
	[pono] [int] NULL,
	[prjp] [int] NULL,
	[prjp_kw] [varchar](255) NULL,
	[prnt] [int] NULL,
	[prnt_kw] [varchar](255) NULL,
	[pyps] [int] NULL,
	[qhnd] [float] NULL,
	[qstk] [float] NULL,
	[rcln] [int] NULL,
	[rcno] [varchar](9) NULL,
	[reco] [int] NULL,
	[reco_kw] [varchar](255) NULL,
	[reje] [int] NULL,
	[reje_kw] [varchar](255) NULL,
	[seqn] [int] NULL,
	[sequencenumber] [int] NULL,
	[serl] [varchar](30) NULL,
	[shpm] [varchar](9) NULL,
	[shpo] [int] NULL,
	[site] [varchar](9) NULL,
	[site_ref_compnr] [varchar](10) NULL,
	[spcn] [varchar](22) NULL,
	[srnb] [int] NULL,
	[ztimestamp] [datetime] NULL,
	[trdt] [datetime] NULL,
	[ttyp] [varchar](3) NULL,
	[username] [varchar](8) NULL,
	[valm] [int] NULL,
	[valm_kw] [varchar](255) NULL,
	[vwvg] [int] NULL,
	[vwvg_kw] [varchar](255) NULL,
	[wvgr] [varchar](6) NULL,
	[wvgr_ref_compnr] [varchar](10) NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NULL
)
WITH
(
	DISTRIBUTION = HASH ( [item] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcemm050]
Description: This is a DST table for Sites

Data Type: Dimension Data

Original Project: JBT Finance Model
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tcemm050];

CREATE TABLE [acq101].[dst_tcemm050]
(
	admo [int] NULL,
	admo_kw [varchar](255) NULL,
	bpid [varchar](9) NULL,
	bpid_ref_compnr [varchar](10) NULL,
	cadr [varchar](9) NULL,
	cadr_ref_compnr [varchar](10) NULL,
	ccal [varchar](9) NULL,
	ccal_ref_compnr [varchar](10) NULL,
	clus [varchar](3) NULL,
	clus_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	crby [varchar](16) NULL,
	crdt [datetime] NULL,
	cwar [varchar](6) NULL,
	cwar_ref_compnr [varchar](10) NULL,
	deleted [varchar](10) NULL,
	zdesc [varchar](255) NULL,
	eunt [varchar](6) NULL,
	eunt_ref_compnr [varchar](10) NULL,
	imag [varchar](22) NULL,
	inf1 [varchar](255) NULL,
	inf2 [varchar](255) NULL,
	lcmp [int] NULL,
	lcmp_ref_compnr [varchar](10) NULL,
	ofbp [varchar](9) NULL,
	ofbp_ref_compnr [varchar](10) NULL,
	psit [varchar](9) NULL,
	psit_ref_compnr [varchar](10) NULL,
	ract [varchar](6) NULL,
	ract_ref_compnr [varchar](10) NULL,
	scat [varchar](9) NULL,
	scat_ref_compnr [varchar](10) NULL,
	sequencenumber [int] NULL,
	site [varchar](9) NOT NULL,
	stat [int] NULL,
	stat_kw [varchar](255) NULL,
	stbp [varchar](9) NULL,
	stbp_ref_compnr [varchar](10) NULL,
	ztimestamp [datetime] NULL,
	txta [int] NULL,
	txta_ref_compnr [varchar](10) NULL,
	username [varchar](8) NULL,
	xsit [int] NULL,
	xsit_kw [varchar](255) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (site)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcibd150]
Description: Items data for product classification into purchasing and manufacturing categories..(Item By Site)
Data Type: Transaction Data 
Original Project: JBT Sales
Developer: Pooja Thakur
Date: 17-06-2021
Reviewed By: Atul Raje/Majid


Change History:
**********************************************************************************************************************/
--Drop Table [acq101].[dst_tcibd150];

CREATE TABLE [acq101].[dst_tcibd150]
(
	[ccde] [varchar](25) NULL,
	[ccde_ref_compnr] [varchar](10) NULL,
	[cean] [varchar](14) NULL,
	[cmnf] [varchar](6) NULL,
	[cmnf_ref_compnr] [varchar](10) NULL,
	[compnr] [varchar](10) NULL,
	[cpcl] [varchar](6) NULL,
	[cpcl_ref_compnr] [varchar](10) NULL,
	[cpln] [varchar](6) NULL,
	[cpln_ref_compnr] [varchar](10) NULL,
	[csel] [varchar](3) NULL,
	[csel_ref_compnr] [varchar](10) NULL,
	[csig] [varchar](3) NULL,
	[csig_ref_compnr] [varchar](10) NULL,
	[ctyo] [varchar](3) NULL,
	[ctyo_ref_compnr] [varchar](10) NULL,
	[ctyp] [varchar](3) NULL,
	[ctyp_ref_compnr] [varchar](10) NULL,
	[cwun] [varchar](3) NULL,
	[cwun_ref_compnr] [varchar](10) NULL,
	[deleted] [varchar](10) NULL,
	[dscb] [varchar](255) NULL,
	[dscc] [varchar](255) NULL,
	[dscd] [varchar](255) NULL,
	[efpr] [int] NULL,
	[efpr_kw] [varchar](255) NULL,
	[envc] [int] NULL,
	[envc_kw] [varchar](255) NULL,
	[icsi] [int] NULL,
	[icsi_kw] [varchar](255) NULL,
	[item] [varchar](47) NOT NULL,
	[item_ref_compnr] [varchar](10) NULL,
	[prdg] [varchar](9) NULL,
	[rdpt] [varchar](6) NULL,
	[rdpt_ref_compnr] [varchar](10) NULL,
	[sequencenumber] [int] NULL,
	[site] [varchar](9) NOT NULL,
	[site_prdg_ref_compnr] [varchar](10) NULL,
	[site_ref_compnr] [varchar](10) NULL,
	[srce] [int] NULL,
	[srce_kw] [varchar](255) NULL,
	[ztimestamp] [datetime] NULL,
	[txta] [int] NULL,
	[txta_ref_compnr] [varchar](10) NULL,
	[uidt] [int] NULL,
	[uidt_kw] [varchar](255) NULL,
	[username] [varchar](8) NULL,
	[wght] [float] NULL,
	[file_name] [varchar](100) NOT NULL,
	[dwh_load_time] [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [item] )
	
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_whwmd200]
Description: This is a DST table for Warehouses

Data Type: Dimension Data

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 20/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_whwmd200];

CREATE TABLE [acq101].[dst_whwmd200]
(
	aipd [int] NULL,
	aipd_kw [varchar](255) NULL,
	aoit [int] NULL,
	aoit_kw [varchar](255) NULL,
	arlo [varchar](10) NULL,
	bcyc [int] NULL,
	bcyc_kw [varchar](255) NULL,
	binb [int] NULL,
	binb_kw [varchar](255) NULL,
	bloc [varchar](6) NULL,
	bloc_ref_compnr [varchar](10) NULL,
	bout [int] NULL,
	bout_kw [varchar](255) NULL,
	ccal [varchar](9) NULL,
	ccal_ref_compnr [varchar](10) NULL,
	cdap [int] NULL,
	cdap_kw [varchar](255) NULL,
	cdcr [int] NULL,
	cdcr_kw [varchar](255) NULL,
	cdlt [float] NULL,
	cdlu [int] NULL,
	cdlu_kw [varchar](255) NULL,
	cdoa [int] NULL,
	cdoa_kw [varchar](255) NULL,
	cdpd [varchar](3) NULL,
	cdpd_ref_compnr [varchar](10) NULL,
	cdrd [varchar](3) NULL,
	cdrd_ref_compnr [varchar](10) NULL,
	cdro [int] NULL,
	cdro_kw [varchar](255) NULL,
	coka [int] NULL,
	compnr [varchar](10) NULL,
	cons [int] NULL,
	cons_kw [varchar](255) NULL,
	copa [int] NULL,
	copc [int] NULL,
	copp [int] NULL,
	copr [int] NULL,
	copu [int] NULL,
	cwar [varchar](6) NULL,
	cwar_arlo_ref_compnr [varchar](10) NULL,
	cwar_palo_ref_compnr [varchar](10) NULL,
	cwar_ref_compnr [varchar](10) NULL,
	cwar_relo_ref_compnr [varchar](10) NULL,
	cwar_stlo_ref_compnr [varchar](10) NULL,
	ddti [int] NULL,
	ddti_kw [varchar](255) NULL,
	ddwi [int] NULL,
	ddwi_kw [varchar](255) NULL,
	ddwr [int] NULL,
	ddwr_kw [varchar](255) NULL,
	deleted [varchar](10) NULL,
	diws [int] NULL,
	diws_kw [varchar](255) NULL,
	dmdt [int] NULL,
	dmdt_kw [varchar](255) NULL,
	dmph [float] NULL,
	dmsi [int] NULL,
	dmsi_kw [varchar](255) NULL,
	dmsl [varchar](3) NULL,
	dmsl_ref_compnr [varchar](10) NULL,
	dmsp [int] NULL,
	dmsp_kw [varchar](255) NULL,
	dmsr [int] NULL,
	dmsr_kw [varchar](255) NULL,
	dmss [int] NULL,
	dmss_kw [varchar](255) NULL,
	dphi [float] NULL,
	dprl [int] NULL,
	dprl_kw [varchar](255) NULL,
	dptr [int] NULL,
	dptr_kw [varchar](255) NULL,
	dycd [int] NULL,
	dycd_kw [varchar](255) NULL,
	fire [int] NULL,
	fire_kw [varchar](255) NULL,
	flhu [int] NULL,
	flhu_kw [varchar](255) NULL,
	flup [int] NULL,
	flup_kw [varchar](255) NULL,
	zfree [float] NULL,
	frlo [int] NULL,
	frlo_kw [varchar](255) NULL,
	geha [int] NULL,
	geha_kw [varchar](255) NULL,
	gehc [int] NULL,
	gehc_kw [varchar](255) NULL,
	gehp [int] NULL,
	gehp_kw [varchar](255) NULL,
	gehr [int] NULL,
	gehr_kw [varchar](255) NULL,
	gehu [int] NULL,
	gehu_kw [varchar](255) NULL,
	ghps [int] NULL,
	ghps_kw [varchar](255) NULL,
	gnsh [int] NULL,
	gnsh_kw [varchar](255) NULL,
	ialt [int] NULL,
	ialt_kw [varchar](255) NULL,
	ieod [int] NULL,
	ieod_kw [varchar](255) NULL,
	ilmc [varchar](9) NULL,
	ilmc_ref_compnr [varchar](10) NULL,
	iltm [float] NULL,
	iltu [int] NULL,
	iltu_kw [varchar](255) NULL,
	imdp [varchar](6) NULL,
	imdp_ref_compnr [varchar](10) NULL,
	itlo [int] NULL,
	itlo_kw [varchar](255) NULL,
	kdev [varchar](15) NULL,
	kmsk [varchar](9) NULL,
	kmsk_ref_compnr [varchar](10) NULL,
	laba [varchar](3) NULL,
	laba_ref_compnr [varchar](10) NULL,
	labc [varchar](3) NULL,
	labc_ref_compnr [varchar](10) NULL,
	labi [varchar](3) NULL,
	labi_ref_compnr [varchar](10) NULL,
	labo [varchar](3) NULL,
	labo_ref_compnr [varchar](10) NULL,
	labr [varchar](3) NULL,
	labr_ref_compnr [varchar](10) NULL,
	lolo [int] NULL,
	lolo_kw [varchar](255) NULL,
	lpad [int] NULL,
	lpad_kw [varchar](255) NULL,
	lpas [int] NULL,
	lpas_kw [varchar](255) NULL,
	lpcc [int] NULL,
	lpcc_kw [varchar](255) NULL,
	lppi [int] NULL,
	lppi_kw [varchar](255) NULL,
	lpre [int] NULL,
	lpre_kw [varchar](255) NULL,
	mada [int] NULL,
	mada_kw [varchar](255) NULL,
	masi [float] NULL,
	masu [int] NULL,
	masu_kw [varchar](255) NULL,
	matt [float] NULL,
	matu [int] NULL,
	matu_kw [varchar](255) NULL,
	mcca [int] NULL,
	mcca_kw [varchar](255) NULL,
	mipa [int] NULL,
	mipa_kw [varchar](255) NULL,
	misi [float] NULL,
	misu [int] NULL,
	misu_kw [varchar](255) NULL,
	mitt [float] NULL,
	mitu [int] NULL,
	mitu_kw [varchar](255) NULL,
	mopa [int] NULL,
	mopa_kw [varchar](255) NULL,
	mrhu [int] NULL,
	mrhu_kw [varchar](255) NULL,
	olmc [varchar](9) NULL,
	olmc_ref_compnr [varchar](10) NULL,
	oltm [float] NULL,
	oltu [int] NULL,
	oltu_kw [varchar](255) NULL,
	orbo [int] NULL,
	orbo_kw [varchar](255) NULL,
	palo [varchar](10) NULL,
	prla [int] NULL,
	prla_kw [varchar](255) NULL,
	prlc [int] NULL,
	prlc_kw [varchar](255) NULL,
	prlp [int] NULL,
	prlp_kw [varchar](255) NULL,
	prlr [int] NULL,
	prlr_kw [varchar](255) NULL,
	prlu [int] NULL,
	prlu_kw [varchar](255) NULL,
	prmp [int] NULL,
	prmp_kw [varchar](255) NULL,
	prmr [int] NULL,
	prmr_kw [varchar](255) NULL,
	prmu [int] NULL,
	prmu_kw [varchar](255) NULL,
	prva [int] NULL,
	prva_kw [varchar](255) NULL,
	qfma [float] NULL,
	qfmi [float] NULL,
	qmoo [int] NULL,
	qmoo_kw [varchar](255) NULL,
	qwrh [varchar](6) NULL,
	qwrh_ref_compnr [varchar](10) NULL,
	ract [varchar](6) NULL,
	ract_ref_compnr [varchar](10) NULL,
	reje [int] NULL,
	reje_kw [varchar](255) NULL,
	relo [varchar](10) NULL,
	rfsa [int] NULL,
	rfsa_kw [varchar](255) NULL,
	rkbs [int] NULL,
	rkbs_kw [varchar](255) NULL,
	rsdn [int] NULL,
	rsdn_kw [varchar](255) NULL,
	rsrc [int] NULL,
	rsrc_kw [varchar](255) NULL,
	rtcf [int] NULL,
	rtcf_kw [varchar](255) NULL,
	scom [int] NULL,
	sequencenumber [int] NULL,
	sfwh [int] NULL,
	sfwh_kw [varchar](255) NULL,
	shhu [int] NULL,
	shhu_kw [varchar](255) NULL,
	shtw [varchar](6) NULL,
	shtw_ref_compnr [varchar](10) NULL,
	site [varchar](9) NULL,
	site_ref_compnr [varchar](10) NULL,
	sloc [int] NULL,
	sloc_kw [varchar](255) NULL,
	smsh [int] NULL,
	smsh_kw [varchar](255) NULL,
	spps [int] NULL,
	spps_kw [varchar](255) NULL,
	sscc [int] NULL,
	sscc_kw [varchar](255) NULL,
	stlo [varchar](10) NULL,
	sups [int] NULL,
	sups_kw [varchar](255) NULL,
	supw [varchar](6) NULL,
	supw_ref_compnr [varchar](10) NULL,
	ztimestamp [datetime] NULL,
	trdc [int] NULL,
	trdc_kw [varchar](255) NULL,
	ufpl [int] NULL,
	ufpl_kw [varchar](255) NULL,
	uhii [int] NULL,
	uhii_kw [varchar](255) NULL,
	uhin [int] NULL,
	uhin_kw [varchar](255) NULL,
	uhir [int] NULL,
	uhir_kw [varchar](255) NULL,
	uhis [int] NULL,
	uhis_kw [varchar](255) NULL,
	uhnd [int] NULL,
	uhnd_kw [varchar](255) NULL,
	uhoa [int] NULL,
	uhoa_kw [varchar](255) NULL,
	uhri [int] NULL,
	uhri_kw [varchar](255) NULL,
	uidt [int] NULL,
	uidt_kw [varchar](255) NULL,
	uolo [int] NULL,
	uolo_kw [varchar](255) NULL,
	username [varchar](8) NULL,
	usmd [int] NULL,
	usmd_kw [varchar](255) NULL,
	usse [int] NULL,
	usse_kw [varchar](255) NULL,
	uudl [int] NULL,
	uudl_kw [varchar](255) NULL,
	uwtr [int] NULL,
	uwtr_kw [varchar](255) NULL,
	vpad [int] NULL,
	vpad_kw [varchar](255) NULL,
	vpcc [int] NULL,
	vpcc_kw [varchar](255) NULL,
	wvgr [varchar](6) NULL,
	wvgr_ref_compnr [varchar](10) NULL,
	zere [int] NULL,
	zere_kw [varchar](255) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (cwar)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_enum]
Description: This is a DST table for Enum Descriptions

Data Type: Dimension Data

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 20/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_enum];

CREATE TABLE [acq101].[dst_enum]
(
	const 			[int] NOT NULL,
	deleted 		[varchar](10) NULL,
	description 	[varchar](255) NOT NULL,
	zdomain 		[varchar](14)NOT NULL,
	keyword 		[varchar](30)NOT NULL,
	zlanguage 		[varchar](5)NOT NULL,
	sequencenumber 	[int] NULL,
	ztimestamp    	[datetime] NULL,
	username 	  	[varchar](8) NULL,
	file_name 	  	[varchar](100) NOT NULL,
	dwh_load_time 	[datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (zdomain)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tdipu081]
Description: This is a DST table for Item - Purchase by Site or Purchase Office

Data Type: Dimension Data

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 02/09/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tdipu081];

CREATE TABLE [acq101].[dst_tdipu081] 
(
	acci [int] NULL,
	acci_kw [varchar](255) NULL,
	buyr [varchar](9) NULL,
	buyr_ref_compnr [varchar](10) NULL,
	casl [int] NULL,
	casl_kw [varchar](255) NULL,
	ccur [varchar](3) NULL,
	ccur_ref_compnr [varchar](10) NULL,
	cims [int] NULL,
	cims_kw [varchar](255) NULL,
	cmnf [varchar](6) NULL,
	cmnf_ref_compnr [varchar](10) NULL,
	cncd [varchar](6) NULL,
	cofc [varchar](6) NULL,
	cofc_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	cpgp [varchar](6) NULL,
	cpgp_ref_compnr [varchar](10) NULL,
	csgp [varchar](6) NULL,
	csgp_ref_compnr [varchar](10) NULL,
	cupp [varchar](3) NULL,
	cupp_ref_compnr [varchar](10) NULL,
	cuqp [varchar](3) NULL,
	cuqp_ref_compnr [varchar](10) NULL,
	cvat [varchar](9) NULL,
	cvat_ref_compnr [varchar](10) NULL,
	cwar [varchar](6) NULL,
	cwar_ref_compnr [varchar](10) NULL,
	deleted [varchar](10) NULL,
	edco [int] NULL,
	edco_kw [varchar](255) NULL,
	hstd [int] NULL,
	hstd_kw [varchar](255) NULL,
	hstq [int] NULL,
	hstq_kw [varchar](255) NULL,
	ispr [float] NULL,
	issp [int] NULL,
	issp_kw [varchar](255) NULL,
	item [varchar](47) NOT NULL,
	item_ref_compnr [varchar](10) NULL,
	item_site_ref_compnr [varchar](10) NULL,
	mlco [int] NULL,
	mlco_kw [varchar](255) NULL,
	mmnf [int] NULL,
	mmnf_kw [varchar](255) NULL,
	mpnr [varchar](35) NULL,
	mpnr_cmnf_ref_compnr [varchar](10) NULL,
	mpyn [int] NULL,
	mpyn_kw [varchar](255) NULL,
	otbp [varchar](9) NULL,
	otbp_ref_compnr [varchar](10) NULL,
	poff [varchar](6) NOT NULL,
	poff_ref_compnr [varchar](10) NULL,
	prip [float] NULL,
	qual [int] NULL,
	qual_kw [varchar](255) NULL,
	retw [int] NULL,
	retw_kw [varchar](255) NULL,
	rmss [int] NULL,
	rmss_kw [varchar](255) NULL,
	rqms [int] NULL,
	rqms_kw [varchar](255) NULL,
	rtdm [int] NULL,
	rtdp [int] NULL,
	rtqm [float] NULL,
	rtqp [float] NULL,
	scpr [float] NULL,
	scus [int] NULL,
	scus_kw [varchar](255) NULL,
	sequencenumber [int] NULL,
	site [varchar](9) NOT NULL,
	site_ref_compnr [varchar](10) NULL,
	sopr [int] NULL,
	sopr_kw [varchar](255) NULL,
	sops [int] NULL,
	sops_kw [varchar](255) NULL,
	spco [int] NULL,
	spco_kw [varchar](255) NULL,
	sspr [float] NULL,
	styp [int] NULL,
	styp_kw [varchar](255) NULL,
	suti [float] NULL,
	sutu [int] NULL,
	sutu_kw [varchar](255) NULL,
	ztimestamp [datetime] NULL,
	txtp [int] NULL,
	txtp_ref_compnr [varchar](10) NULL,
	ugip [int] NULL,
	ugip_kw [varchar](255) NULL,
	username [varchar](8) NULL,
	vryn [int] NULL,
	vryn_kw [varchar](255) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (item)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_cprpd100]
Description: This is a DST table for Items - Planning

Data Type: Dimension Data

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 02/09/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_cprpd100];

CREATE TABLE [acq101].[dst_cprpd100]
(
	atho [int] NULL,
	atta [float] NULL,
	attm [float] NULL,
	audf [int] NULL,
	audf_kw [varchar](255) NULL,
	auiv [int] NULL,
	auiv_kw [varchar](255) NULL,
	aupr [int] NULL,
	aupr_kw [varchar](255) NULL,
	aupu [int] NULL,
	aupu_kw [varchar](255) NULL,
	blit [varchar](50) NULL,
	catp [int] NULL,
	catp_kw [varchar](255) NULL,
	chat [int] NULL,
	chat_kw [varchar](255) NULL,
	clus [varchar](3) NULL,
	clus_ref_compnr [varchar](10) NULL,
	coat [int] NULL,
	coat_kw [varchar](255) NULL,
	colt [int] NULL,
	compnr [varchar](10) NOT NULL,
	cprj [varchar](9) NULL,
	cria [int] NULL,
	cria_kw [varchar](255) NULL,
	crmp [int] NULL,
	crmp_kw [varchar](255) NULL,
	cwar [varchar](6) NULL,
	cwar_ref_compnr [varchar](10) NULL,
	deleted [varchar](10) NULL,
	depd [int] NULL,
	depd_kw [varchar](255) NULL,
	deps [int] NULL,
	deps_kw [varchar](255) NULL,
	efpg [int] NULL,
	efpg_kw [varchar](255) NULL,
	eltm [float] NULL,
	eltu [int] NULL,
	eltu_kw [varchar](255) NULL,
	fasi [int] NULL,
	fatp [int] NULL,
	fatp_kw [varchar](255) NULL,
	fclt [int] NULL,
	fctf [int] NULL,
	fica [int] NULL,
	fica_kw [varchar](255) NULL,
	fide [varchar](3) NULL,
	fide_ref_compnr [varchar](10) NULL,
	fite [varchar](50) NULL,
	fltm [int] NULL,
	fnct [int] NULL,
	hoat [int] NULL,
	info [int] NULL,
	info_kw [varchar](255) NULL,
	inho [int] NULL,
	item [varchar](47) NULL,
	item_ref_compnr [varchar](10) NULL,
	maxp [int] NULL,
	mrnm [int] NULL,
	mrnm_kw [varchar](255) NULL,
	mrnp [int] NULL,
	mrnp_kw [varchar](255) NULL,
	mrph [int] NULL,
	mrpu [varchar](3) NULL,
	mrpu_ref_compnr [varchar](10) NULL,
	mult [int] NULL,
	mult_kw [varchar](255) NULL,
	nclt [int] NULL,
	netc [int] NULL,
	netc_kw [varchar](255) NULL,
	netd [datetime] NULL,
	nphn [int] NULL,
	onat [int] NULL,
	onat_kw [varchar](255) NULL,
	osys [int] NULL,
	osys_kw [varchar](255) NULL,
	otmf [int] NULL,
	pbpl [int] NULL,
	pbpl_kw [varchar](255) NULL,
	phch [int] NULL,
	phnu [int] NULL,
	plid [varchar](9) NULL,
	plid_ref_compnr [varchar](10) NULL,
	plit [int] NULL,
	plit_kw [varchar](255) NULL,
	plni [varchar](50) NOT NULL,
	plvl [int] NULL,
	pnet [int] NULL,
	pnet_kw [varchar](255) NULL,
	prio [int] NULL,
	prio_kw [varchar](255) NULL,
	psho [int] NULL,
	ptmf [int] NULL,
	puph [int] NULL,
	push [int] NULL,
	retf [int] NULL,
	rpun [varchar](3) NULL,
	rpun_ref_compnr [varchar](10) NULL,
	sequencenumber [int] NULL,
	site [varchar](9) NULL,
	site_ref_compnr [varchar](10) NULL,
	sour [int] NULL,
	sour_kw [varchar](255) NULL,
	sphc [int] NULL,
	tfat [int] NULL,
	ztimestamp [datetime] NULL,
	tmfc [float] NULL,
	tmfu [int] NULL,
	tmfu_kw [varchar](255) NULL,
	txta [int] NULL,
	txta_ref_compnr [varchar](10) NULL,
	uatt [int] NULL,
	uatt_kw [varchar](255) NULL,
	upho [int] NULL,
	upho_kw [varchar](255) NULL,
	username [varchar](8) NULL,
	utmf [int] NULL,
	utmf_kw [varchar](255) NULL,
	vmir [int] NULL,
	vmir_kw [varchar](255) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (plni)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcibd003]
Description: This is a DST table for Conversion Factors

Data Type: Dimension Data

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 02/09/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tcibd003];

CREATE TABLE [acq101].[dst_tcibd003]
(
	appr [int] NULL,
	appr_kw [varchar](255) NULL,
	basu [varchar](3) NOT NULL,
	basu_ref_compnr [varchar](10) NULL,
	citg [varchar](6) NOT NULL,
	citg_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	conv [float] NULL,
	deleted [varchar](10) NULL,
	item [varchar](47) NOT NULL,
	item_ref_compnr [varchar](10) NULL,
	rpow [int] NULL,
	sequencenumber [int] NULL,
	ztimestamp [datetime] NULL,
	unit [varchar](3) NOT NULL,
	unit_ref_compnr [varchar](10) NULL,
	username [varchar](8) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (basu)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_whwmd404]
Description: This is a Temp table for Item - Warehousing by Site

Data Type: Dimension Data

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 02/09/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_whwmd404];

CREATE TABLE [acq101].[dst_whwmd404] 
(
	abcc [varchar](1) NULL,
	acoa [int] NULL,
	acoa_kw [varchar](255) NULL,
	alle [int] NULL,
	alle_kw [varchar](255) NULL,
	arpr [int] NULL,
	arpr_kw [varchar](255) NULL,
	askp [int] NULL,
	askp_kw [varchar](255) NULL,
	ccma [int] NULL,
	ccma_kw [varchar](255) NULL,
	cfmd [varchar](3) NULL,
	cfmd_ref_compnr [varchar](10) NULL,
	coad [int] NULL,
	coad_kw [varchar](255) NULL,
	coas [int] NULL,
	coas_kw [varchar](255) NULL,
	compnr [varchar](10) NOT NULL,
	ctzi [int] NULL,
	ctzi_kw [varchar](255) NULL,
	ddlt [int] NULL,
	deleted [varchar](10) NULL,
	dils [float] NULL,
	dmsi [int] NULL,
	dmsi_kw [varchar](255) NULL,
	dmsp [int] NULL,
	dmsp_kw [varchar](255) NULL,
	dmsr [int] NULL,
	dmsr_kw [varchar](255) NULL,
	dmss [int] NULL,
	dmss_kw [varchar](255) NULL,
	dpth [float] NULL,
	dwhs [int] NULL,
	dwhs_kw [varchar](255) NULL,
	dycd [int] NULL,
	dycd_kw [varchar](255) NULL,
	excc [int] NULL,
	excc_kw [varchar](255) NULL,
	ffsi [int] NULL,
	goad [int] NULL,
	goad_kw [varchar](255) NULL,
	hama [int] NULL,
	hama_kw [varchar](255) NULL,
	hght [float] NULL,
	inin [int] NULL,
	inin_kw [varchar](255) NULL,
	item [varchar](47) NOT NULL,
	item_pkdf_ref_compnr [varchar](10) NULL,
	item_ref_compnr [varchar](10) NULL,
	item_site_ref_compnr [varchar](10) NULL,
	ivgr [varchar](6) NULL,
	ivgr_ref_compnr [varchar](10) NULL,
	kpsl [int] NULL,
	kpsl_kw [varchar](255) NULL,
	ledd [int] NULL,
	ledd_kw [varchar](255) NULL,
	ledr [int] NULL,
	ledr_kw [varchar](255) NULL,
	ledt [int] NULL,
	ledt_kw [varchar](255) NULL,
	linv [int] NULL,
	linv_kw [varchar](255) NULL,
	lisf [int] NULL,
	lisf_kw [varchar](255) NULL,
	lism [int] NULL,
	lism_kw [varchar](255) NULL,
	locc [int] NULL,
	locc_kw [varchar](255) NULL,
	ltpr [int] NULL,
	ltpr_kw [varchar](255) NULL,
	lttr [int] NULL,
	lttr_kw [varchar](255) NULL,
	lveh [int] NULL,
	lveh_kw [varchar](255) NULL,
	mabc [int] NULL,
	mabc_kw [varchar](255) NULL,
	niwo [int] NULL,
	niwo_kw [varchar](255) NULL,
	nopr [int] NULL,
	npsl [int] NULL,
	obpr [int] NULL,
	obpr_kw [varchar](255) NULL,
	owip [int] NULL,
	owip_kw [varchar](255) NULL,
	owrl [int] NULL,
	owrl_kw [varchar](255) NULL,
	owrt [int] NULL,
	owrt_kw [varchar](255) NULL,
	pics [int] NULL,
	pics_kw [varchar](255) NULL,
	pkdf [varchar](6) NULL,
	pkdf_ref_compnr [varchar](10) NULL,
	prva [int] NULL,
	prva_kw [varchar](255) NULL,
	ptxt [int] NULL,
	ptxt_ref_compnr [varchar](10) NULL,
	ptyp [int] NULL,
	ptyp_kw [varchar](255) NULL,
	qcma [float] NULL,
	qcmi [float] NULL,
	rgtm [varchar](3) NULL,
	rgtm_ref_compnr [varchar](10) NULL,
	risk [varchar](15) NULL,
	rjha [int] NULL,
	rjha_kw [varchar](255) NULL,
	scst [float] NULL,
	seak [varchar](255) NULL,
	sedd [int] NULL,
	sedd_kw [varchar](255) NULL,
	sedr [int] NULL,
	sedr_kw [varchar](255) NULL,
	sedt [int] NULL,
	sedt_kw [varchar](255) NULL,
	sequencenumber [int] NULL,
	sinv [int] NULL,
	sinv_kw [varchar](255) NULL,
	sisf [int] NULL,
	sisf_kw [varchar](255) NULL,
	sism [int] NULL,
	sism_kw [varchar](255) NULL,
	site [varchar](9) NOT NULL,
	site_ref_compnr [varchar](10) NULL,
	slmp [int] NULL,
	spri [int] NULL,
	spri_kw [varchar](255) NULL,
	srpr [int] NULL,
	srpr_kw [varchar](255) NULL,
	srtr [int] NULL,
	srtr_kw [varchar](255) NULL,
	thus [int] NULL,
	thus_kw [varchar](255) NULL,
	ztimestamp [datetime] NULL,
	tmun [int] NULL,
	tmun_kw [varchar](255) NULL,
	txta [int] NULL,
	txta_ref_compnr [varchar](10) NULL,
	ufpl [int] NULL,
	ufpl_kw [varchar](255) NULL,
	ugiw [int] NULL,
	ugiw_kw [varchar](255) NULL,
	uhnd [int] NULL,
	uhnd_kw [varchar](255) NULL,
	uidt [int] NULL,
	uidt_kw [varchar](255) NULL,
	usab [float] NULL,
	username [varchar](8) NULL,
	vers [int] NULL,
	vers_kw [varchar](255) NULL,
	wdth [float] NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (item)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_whwmd216]
Description: This is a Temp table for Inventory by Warehouse, Item and Effectivity Unit

Data Type: Dimension Data

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 02/09/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_whwmd216];

CREATE TABLE [acq101].[dst_whwmd216] 
(
	compnr [varchar](10) NOT NULL,
	cwar [varchar](6) NOT NULL,
	cwar_item_ref_compnr [varchar](10) NULL,
	cwar_ref_compnr [varchar](10) NULL,
	deleted [varchar](10) NULL,
	effn [int] NOT NULL,
	effn_ref_compnr [varchar](10) NULL,
	item [varchar](47) NOT NULL,
	item_ref_compnr [varchar](10) NULL,
	qall [float] NULL,
	qblk [float] NULL,
	qbpl [float] NULL,
	qcom [float] NULL,
	qcpr [float] NULL,
	qhnd [float] NULL,
	qlal [float] NULL,
	qnbl [float] NULL,
	qnbp [float] NULL,
	qord [float] NULL,
	sequencenumber [int] NULL,
	ztimestamp [datetime] NULL,
	username [varchar](8) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (item)
)
GO




