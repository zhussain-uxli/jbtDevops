/**********************************************************************************************************************
Table Name: [acq101].[dst_tirpt040]
Description: This is a DST Table for Work Cells table

Data Type: Dimension Data

Original Project: JBT Production Planning & Scheduling
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tirpt040];

CREATE TABLE [acq101].[dst_tirpt040]
 (
	bfem [varchar](9) NULL,
	bfem_ref_compnr [varchar](10) NULL,
	cdf_devc [varchar](20) NULL,
	compnr [varchar](10) NOT NULL,
	cwoc [varchar](6) NOT NULL,
	cwoc_ref_compnr [varchar](10) NULL,
	deleted [varchar](10) NULL,
	dsca [varchar](255) NULL,
	noop [float] NULL,
	oprc [varchar](6) NULL,
	oprc_ref_compnr [varchar](10) NULL,
	pddp [varchar](6) NULL,
	pddp_ref_compnr [varchar](10) NULL,
	zrows [int] NULL,
	rows_kw [varchar](255) NULL,
	rpwc [varchar](6) NULL,
	sequencenumber [int] NULL,
	site [varchar](9) NULL,
	ztimestamp [datetime] NULL,
	username [varchar](8) NULL,
	wcpg [varchar](6) NULL,
	wcpg_ref_compnr [varchar](10) NULL,
	wctp [int] NULL,
	wctp_kw [varchar](255) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (cwoc)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tirpt401]
Description: This is a DST Table for Production Schedule

Data Type: Transaction Data

Original Project: JBT Production Planning & Scheduling
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tirpt401];

CREATE TABLE [acq101].[dst_tirpt401]
(
	apfd [datetime] NULL,
	apsd [datetime] NULL,
	clsd [int] NULL,
	clsd_kw [varchar](255) NULL,
	compnr [varchar](10) NOT NULL,
	cwar [varchar](6) NULL,
	cwar_ref_compnr [varchar](10) NULL,
	cwoc [varchar](6) NULL,
	cwoc_ref_compnr [varchar](10) NULL,
	deleted [varchar](10) NULL,
	mitm [varchar](47) NULL,
	mitm_prmd_pmrv_ref_compnr [varchar](10) NULL,
	mitm_ref_compnr [varchar](10) NULL,
	pmrv [varchar](6) NULL,
	prfd [datetime] NULL,
	prmd [varchar](9) NULL,
	prsd [datetime] NULL,
	prsh [varchar](9) NOT NULL,
	qrdr [float] NULL,
	sdtp [int] NULL,
	sdtp_kw [varchar](255) NULL,
	sequencenumber [int] NULL,
	site [varchar](9) NULL,
	spcn [varchar](22) NULL,
	ztimestamp [datetime] NULL,
	username [varchar](8) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (prsh)
)
GO


/**********************************************************************************************************************
Table Name: [acq101].[dst_tirpt402]
Description: This is a DST Table for Production Schedule Lines

Data Type: Transaction Data

Original Project: JBT Production Planning & Scheduling
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tirpt402];

CREATE TABLE [acq101].[dst_tirpt402] 
(
	apfd [datetime] NULL,
	apsd [datetime] NULL,
	compnr [varchar](10) NOT NULL,
	cwoc [varchar](6) NULL,
	deleted [varchar](10) NULL,
	mitm [varchar](47) NULL,
	ofdt [datetime] NULL,
	osdt [datetime] NULL,
	prfd [datetime] NULL,
	prsd [datetime] NULL,
	prsh [varchar](9) NOT NULL,
	prsh_ref_compnr [varchar](10) NULL,
	prso [int] NULL,
	prso_kw [varchar](255) NULL,
	prsp [int] NOT NULL,
	prss [int] NULL,
	prss_kw [varchar](255) NULL,
	qbfd [float] NULL,
	qcmp [float] NULL,
	qqar [float] NULL,
	qrdr [float] NULL,
	qrep [float] NULL,
	qscr [float] NULL,
	qtbf [float] NULL,
	qtor [float] NULL,
	qtrp [float] NULL,
	ruid [varchar](22) NULL,
	sequencenumber [int] NULL,
	ztimestamp [datetime] NULL,
	username [varchar](8) NULL,
	whon [varchar](9) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (prsp)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_whinh200]
Description: This is a DST Table for Warehousing Orders

Data Type: Dimension Data

Original Project: JBT Production Planning & Scheduling
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_whinh200];

CREATE TABLE [acq101].[dst_whinh200] 
(
	adat [datetime] NULL,
	adin [varchar](22) NULL,
	akit [varchar](15) NULL,
	akit_ref_compnr [varchar](10) NULL,
	asst [int] NULL,
	asst_kw [varchar](255) NULL,
	bflh [int] NULL,
	bflh_kw [varchar](255) NULL,
	blor [int] NULL,
	blor_kw [varchar](255) NULL,
	carr [varchar](3) NULL,
	carr_ref_compnr [varchar](10) NULL,
	cbin [int] NULL,
	cbin_kw [varchar](255) NULL,
	cdec [varchar](3) NULL,
	cdec_ref_compnr [varchar](10) NULL,
	clan [varchar](3) NULL,
	clan_ref_compnr [varchar](10) NULL,
	clgr [varchar](3) NULL,
	clgr_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	cons [int] NULL,
	cons_kw [varchar](255) NULL,
	crte [varchar](5) NULL,
	crte_ref_compnr [varchar](10) NULL,
	ctdt [datetime] NULL,
	delc [varchar](6) NULL,
	delc_ref_compnr [varchar](10) NULL,
	deleted [varchar](10) NULL,
	depc [int] NULL,
	depc_ref_compnr [varchar](10) NULL,
	dmst [int] NULL,
	dmst_kw [varchar](255) NULL,
	fqua [int] NULL,
	fqua_kw [varchar](255) NULL,
	gnld [varchar](22) NULL,
	grid [varchar](9) NULL,
	hsta [int] NULL,
	hsta_kw [varchar](255) NULL,
	huid [varchar](25) NULL,
	info [varchar](255) NULL,
	invc [int] NULL,
	invc_kw [varchar](255) NULL,
	iscn [int] NULL,
	iscn_kw [varchar](255) NULL,
	isit [int] NULL,
	isit_kw [varchar](255) NULL,
	item [varchar](47) NULL,
	item_ref_compnr [varchar](10) NULL,
	ittp [int] NULL,
	ittp_kw [varchar](255) NULL,
	ktor [int] NULL,
	ktor_kw [varchar](255) NULL,
	lccl [varchar](12) NULL,
	lccl_ref_compnr [varchar](10) NULL,
	list [varchar](47) NULL,
	list_ref_compnr [varchar](10) NULL,
	maxd [int] NULL,
	maxt [float] NULL,
	mind [int] NULL,
	mint [float] NULL,
	motv [varchar](6) NULL,
	motv_ref_compnr [varchar](10) NULL,
	odat [datetime] NULL,
	oorg [int] NOT NULL,
	oorg_kw [varchar](255) NULL,
	orno [varchar](9) NOT NULL,
	orun [varchar](3) NULL,
	orun_ref_compnr [varchar](10) NULL,
	oset [int] NOT NULL,
	otyp [varchar](3) NULL,
	otyp_ref_compnr [varchar](10) NULL,
	pddt [datetime] NULL,
	plbs [int] NULL,
	plbs_kw [varchar](255) NULL,
	prdt [datetime] NULL,
	ptpa [varchar](9) NULL,
	ptpa_ref_compnr [varchar](10) NULL,
	qord [float] NULL,
	qoro [float] NULL,
	quar [int] NULL,
	quar_kw [varchar](255) NULL,
	rdgd [int] NULL,
	rdgd_kw [varchar](255) NULL,
	refe [varchar](255) NULL,
	refg [varchar](255) NULL,
	rodr [varchar](9) NULL,
	rrgd [int] NULL,
	rrgd_kw [varchar](255) NULL,
	rtrn [int] NULL,
	rtrn_kw [varchar](255) NULL,
	scon [int] NULL,
	scon_kw [varchar](255) NULL,
	sequencenumber [int] NULL,
	seri [varchar](8) NULL,
	serv [varchar](3) NULL,
	serv_ref_compnr [varchar](10) NULL,
	setn [int] NULL,
	sfad [varchar](9) NULL,
	sfco [varchar](9) NULL,
	sfcp [int] NULL,
	sfit [varchar](47) NULL,
	sfit_ref_compnr [varchar](10) NULL,
	sflo [varchar](10) NULL,
	sflt [varchar](20) NULL,
	sfrv [varchar](6) NULL,
	sfsi [varchar](9) NULL,
	sfsi_ref_compnr [varchar](10) NULL,
	sfsr [varchar](30) NULL,
	sfty [int] NULL,
	sfty_kw [varchar](255) NULL,
	stad [varchar](9) NULL,
	stco [varchar](9) NULL,
	stcp [int] NULL,
	stit [varchar](47) NULL,
	stit_ref_compnr [varchar](10) NULL,
	stlo [varchar](10) NULL,
	stlt [varchar](20) NULL,
	strv [varchar](6) NULL,
	stsi [varchar](9) NULL,
	stsi_ref_compnr [varchar](10) NULL,
	stsr [varchar](30) NULL,
	stty [int] NULL,
	stty_kw [varchar](255) NULL,
	subc [int] NULL,
	subc_kw [varchar](255) NULL,
	ztimestamp [datetime] NULL,
	txta [int] NULL,
	txta_ref_compnr [varchar](10) NULL,
	txtb [int] NULL,
	txtb_ref_compnr [varchar](10) NULL,
	txtk [int] NULL,
	txtk_ref_compnr [varchar](10) NULL,
	username [varchar](8) NULL,
	wdep [varchar](6) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (orno)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tirpt404]
Description: This is a DST Table for Schedule Line Distribution

Data Type: Transaction Data

Original Project: JBT Production Planning & Scheduling
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tirpt404];

CREATE TABLE [acq101].[dst_tirpt404] 
(
	compnr [varchar](10) NOT NULL,
	deleted [varchar](10) NULL,
	dlin [int] NOT NULL,
	prsh [varchar](9) NOT NULL,
	prsh_dlin_ref_compnr [varchar](10) NULL,
	prsh_prsp_ref_compnr [varchar](10) NULL,
	prsh_ref_compnr [varchar](10) NULL,
	prsp [int] NOT NULL,
	qcmp [float] NULL,
	qdlv [float] NULL,
	qrdr [float] NULL,
	sequencenumber [int] NULL,
	ztimestamp [datetime] NULL,
	username [varchar](8) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (dlin)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tirpt431]
Description: This is a DST Table for Schedule Line Completions

Data Type: Transaction Data

Original Project: JBT Production Planning & Scheduling
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tirpt431];

CREATE TABLE [acq101].[dst_tirpt431] 
(
	compnr [varchar](10) NOT NULL,
	deleted [varchar](10) NULL,
	prsh [varchar](9) NOT NULL,
	prsh_ref_compnr [varchar](10) NULL,
	prsp [int] NOT NULL,
	qtbf [float] NULL,
	rcdt [datetime] NULL,
	sequencenumber [int] NULL,
	shft [varchar](22) NOT NULL,
	shft_ref_compnr [varchar](10) NULL,
	ztimestamp [datetime] NULL,
	username [varchar](8) NULL,
	wccd [varchar](9) NOT NULL,
	wccd_ref_compnr [varchar](10) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (prsp)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tirpt200]
Description: This is a DST table for Production Models

Data Type: Dimension Data

Original Project: JBT Production Planning & Scheduling
Developer: Mohammed Majid
Date: 13/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tirpt200];

CREATE TABLE [acq101].[dst_tirpt200]
(
	apby [varchar](12) NULL,
	apon [datetime] NULL,
	bmsc [int] NULL,
	bmsc_kw [varchar](255) NULL,
	compnr [varchar](10) NOT NULL,
	crby [varchar](12) NULL,
	cron [datetime] NULL,
	cwoc [varchar](6) NULL,
	cwoc_ref_compnr [varchar](10) NULL,
	deleted [varchar](10) NULL,
	efdt [datetime] NULL,
	exby [varchar](12) NULL,
	exdt [datetime] NULL,
	exon [datetime] NULL,
	item [varchar](47) NOT NULL,
	item_ref_compnr [varchar](10) NULL,
	item_site_ref_compnr [varchar](10) NULL,
	loca [varchar](10) NULL,
	mirq [float] NULL,
	mxrq [float] NULL,
	noop [float] NULL,
	oplt [float] NULL,
	oplu [int] NULL,
	oplu_kw [varchar](255) NULL,
	opqn [float] NULL,
	oprq [float] NULL,
	prmd [varchar](9) NOT NULL,
	prmt [int] NULL,
	prmt_kw [varchar](255) NULL,
	prmv [varchar](6) NOT NULL,
	psta [int] NULL,
	psta_kw [varchar](255) NULL,
	pufc [int] NULL,
	pufc_kw [varchar](255) NULL,
	pufp [int] NULL,
	pufp_kw [varchar](255) NULL,
	qwar [varchar](6) NULL,
	qwar_ref_compnr [varchar](10) NULL,
	rate [float] NULL,
	rltm [float] NULL,
	rltu [int] NULL,
	rltu_kw [varchar](255) NULL,
	zrows [int] NULL,
	rows_kw [varchar](255) NULL,
	rpwc [varchar](6) NULL,
	rpwc_ref_compnr [varchar](10) NULL,
	rttu [int] NULL,
	rttu_kw [varchar](255) NULL,
	rwar [varchar](6) NULL,
	rwar_ref_compnr [varchar](10) NULL,
	scrv [varchar](6) NULL,
	sequencenumber [int] NULL,
	site [varchar](9) NULL,
	slqn [float] NULL,
	ztimestamp [datetime] NULL,
	trqn [float] NULL,
	ufc2 [int] NULL,
	ufc2_kw [varchar](255) NULL,
	username [varchar](8),
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (item)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_whinh312]
Description: This is a DST Table for Warehouse Receipts

Data Type: Transaction Data

Original Project: JBT Production Planning & Scheduling
Developer: Mohammed Majid
Date: 16/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_whinh312];

CREATE TABLE [acq101].[dst_whinh312]
(
	acti [varchar](255) NULL,
	adin [varchar](22) NULL,
	ardt [datetime] NULL,
	arej [int] NULL,
	arej_kw [varchar](255) NULL,
	bgxc [int] NULL,
	bgxc_kw [varchar](255) NULL,
	blck [int] NULL,
	blck_kw [varchar](255) NULL,
	casi [varchar](3) NULL,
	casi_ref_compnr [varchar](10) NULL,
	cdck [int] NULL,
	cdck_kw [varchar](255) NULL,
	cdcr [int] NULL,
	cdcr_kw [varchar](255) NULL,
	circ [varchar](255) NULL,
	clot [varchar](20) NULL,
	cmnf [varchar](6) NULL,
	cmnf_ref_compnr [varchar](10) NULL,
	cmpl [int] NULL,
	cmpl_kw [varchar](255) NULL,
	compnr [varchar](10) NOT NULL,
	conf [int] NULL,
	conf_kw [varchar](255) NULL,
	cpro [varchar](255) NULL,
	cwar [varchar](6) NULL,
	cwar_dslo_ref_compnr [varchar](10) NULL,
	cwar_rclo_ref_compnr [varchar](10) NULL,
	cwar_ref_compnr [varchar](10) NULL,
	deleted [varchar](10) NULL,
	disp [int] NULL,
	disp_kw [varchar](255) NULL,
	dmse [int] NULL,
	dmse_kw [varchar](255) NULL,
	dslo [varchar](10) NULL,
	effn [int] NULL,
	effn_ref_compnr [varchar](10) NULL,
	exhu [varchar](25) NULL,
	exrr [varchar](20) NULL,
	fire [int] NULL,
	fire_kw [varchar](255) NULL,
	huid [varchar](25) NULL,
	huid_ref_compnr [varchar](10) NULL,
	hupr [int] NULL,
	hupr_kw [varchar](255) NULL,
	idat [datetime] NULL,
	insp [int] NULL,
	insp_kw [varchar](255) NULL,
	item [varchar](47) NULL,
	item_pkdf_ref_compnr [varchar](10) NULL,
	item_ref_compnr [varchar](10) NULL,
	itxt [int] NULL,
	itxt_ref_compnr [varchar](10) NULL,
	ksig [varchar](20) NULL,
	zload [varchar](9) NULL,
	logn [varchar](16) NULL,
	lsta [int] NULL,
	lsta_kw [varchar](255) NULL,
	ltbp [varchar](30) NULL,
	mpnr [varchar](35) NULL,
	oorg [int] NULL,
	oorg_kw [varchar](255) NULL,
	oorg_orno_pono_seqn_ref_compnr [varchar](10) NULL,
	orno [varchar](9) NULL,
	oset [int] NULL,
	pkdf [varchar](6) NULL,
	pkdf_ref_compnr [varchar](10) NULL,
	pmsk [varchar](20) NULL,
	pono [int] NULL,
	psno [varchar](255) NULL,
	psqr [float] NULL,
	psqu [float] NULL,
	psun [varchar](3) NULL,
	psun_ref_compnr [varchar](10) NULL,
	qadi [float] NULL,
	qadv [float] NULL,
	qapr [float] NULL,
	qdes [float] NULL,
	qdms [float] NULL,
	qpui [float] NULL,
	qput [float] NULL,
	qrcr [float] NULL,
	qrec [float] NULL,
	qrej [float] NULL,
	qrsc [float] NULL,
	rcln [int] NOT NULL,
	rclo [varchar](10) NULL,
	rcno [varchar](9) NOT NULL,
	rcun [varchar](3) NULL,
	rcun_ref_compnr [varchar](10) NULL,
	refe [varchar](255) NULL,
	resn [varchar](6) NULL,
	resn_ref_compnr [varchar](10) NULL,
	revi [varchar](6) NULL,
	rtcf [varchar](19) NULL,
	seqn [int] NULL,
	sequencenumber [int] NULL,
	serl [varchar](30) NULL,
	sfbp [varchar](9) NULL,
	sfbp_ref_compnr [varchar](10) NULL,
	shdt [datetime] NULL,
	shid [varchar](9) NULL,
	shpm [varchar](9) NULL,
	shsq [int] NULL,
	spcn [varchar](22) NULL,
	tcst [int] NULL,
	tcst_kw [varchar](255) NULL,
	ztimestamp [datetime] NULL,
	tlot [varchar](20) NULL,
	trdt [datetime] NULL,
	tsrl [varchar](30) NULL,
	txtn [int] NULL,
	txtn_ref_compnr [varchar](10) NULL,
	username [varchar](8) NULL,
	wght [float] NULL,
	wtun [varchar](3) NULL,
	wtun_ref_compnr [int] NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (rcno)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_timfc001]
Description: This is a DST Table for Production Warehouse Orders

Data Type: Transaction Data

Original Project: JBT Production Planning & Scheduling
Developer: Mohammed Majid
Date: 16/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_timfc001];

CREATE TABLE [acq101].[dst_timfc001] (
	blck [int] NULL,
	blck_kw [varchar](255) NULL,
	cact [varchar](16) NULL,
	clot [varchar](20) NULL,
	compnr [varchar](10) NOT NULL,
	cprj [varchar](9) NULL,
	cspa [varchar](16) NULL,
	cwar [varchar](6) NULL,
	cwar_ref_compnr [varchar](10) NULL,
	deleted [varchar](10) NULL,
	dlin [int] NULL,
	dpwo [int] NULL,
	dpwo_kw [varchar](255) NULL,
	effn [int] NULL,
	effn_ref_compnr [varchar](10) NULL,
	effo [int] NULL,
	huid [varchar](25) NULL,
	istr [int] NULL,
	istr_kw [varchar](255) NULL,
	item [varchar](47) NULL,
	item_ref_compnr [varchar](10) NULL,
	ittp [int] NOT NULL,
	ittp_kw [varchar](255) NULL,
	loca [varchar](10) NULL,
	lsel [int] NULL,
	lsel_kw [varchar](255) NULL,
	odat [datetime] NULL,
	oorg [int] NOT NULL,
	oorg_kw [varchar](255) NULL,
	opno [int] NULL,
	orun [varchar](3) NULL,
	otyp [varchar](3) NULL,
	pddt [datetime] NULL,
	pdno [varchar](9) NOT NULL,
	pono [int] NOT NULL,
	prdt [datetime] NULL,
	qcnd [float] NULL,
	qcnl [float] NULL,
	qoro [float] NULL,
	qrtn [float] NULL,
	quar [int] NULL,
	quar_kw [varchar](255) NULL,
	reas [varchar](6) NULL,
	reas_ref_compnr [varchar](10) NULL,
	revi [varchar](6) NULL,
	rlsd [int] NULL,
	rlsd_kw [varchar](255) NULL,
	rlwh [int] NULL,
	rlwh_kw [varchar](255) NULL,
	rorn [varchar](9) NULL,
	rtas [int] NULL,
	rtas_kw [varchar](255) NULL,
	rtrn [int] NULL,
	rtrn_kw [varchar](255) NULL,
	rtyp [int] NULL,
	rtyp_kw [varchar](255) NULL,
	seqn [int] NOT NULL,
	sequencenumber [int] NULL,
	serl [varchar](30) NULL,
	sfco [varchar](9) NULL,
	sfty [int] NULL,
	sfty_kw [varchar](255) NULL,
	shft [varchar](22) NULL,
	shft_ref_compnr [varchar](10) NULL,
	spcn [varchar](22) NULL,
	stco [varchar](9) NULL,
	stty [int] NULL,
	stty_kw [varchar](255) NULL,
	subd [int] NULL,
	subd_kw [varchar](255) NULL,
	ztimestamp [datetime] NULL,
	txta [int] NULL,
	txta_ref_compnr [varchar](10) NULL,
	username [varchar](8) NULL,
	wccd [varchar](9) NULL,
	wccd_ref_compnr [int] NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (seqn)
)
GO

