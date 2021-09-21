/**********************************************************************************************************************
Table Name: [acq101].[dst_tfacr307]
Description: This is a DST table for Account Receivable Collections by ITBP

Data Type: Transaction Data

Original Project: JBT Finance Account Receivable
Developer: Mohammed Majid
Date: 06/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/
--DROP TABLE [acq101].[dst_tfacr307];

CREATE TABLE [acq101].[dst_tfacr307]
 (
	adfp [int] NULL,
	adod [int] NULL,
	ados [int] NULL,
	buil [float] NULL,
	ccra [varchar](9) NOT NULL,
	ccra_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	dadi [float] NULL,
	dand [float] NULL,
	deleted [varchar](10) NULL,
	fcom [int] NOT NULL,
	itbp [varchar](9) NOT NULL,
	itbp_ref_compnr [varchar](10) NULL,
	nddi [float] NULL,
	ndnd [float] NULL,
	nrdp [int] NULL,
	nrod [int] NULL,
	nrop [int] NULL,
	nrrm [int] NULL,
	nrun [int] NULL,
	odnr [float] NULL,
	odue [float] NULL,
	prbp [varchar](9) NULL,
	prbp_ref_compnr [varchar](10) NULL,
	remi [float] NULL,
	sequencenumber [int] NULL,
	ztimestamp [datetime] NULL,
	unal [float] NULL,
	username [varchar](8) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (ccra)
)
GO


/**********************************************************************************************************************
Table Name: [acq101].[dst_tfacr500]
Description: This is a DST table for Account Receivable Open Items AP

Data Type: Transaction Data

Original Project: JBT Finance Account Receivable
Developer: Mohammed Majid
Date: 06/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tfacr500];

CREATE TABLE [acq101].[dst_tfacr500] 
(
	adrs [varchar](9) NULL,
	amnt [float] NULL,
	amth_1 [float] NULL,
	amth_2 [float] NULL,
	amth_3 [float] NULL,
	amti [float] NULL,
	arrq [int] NULL,
	arrq_kw [varchar](255) NULL,
	baca_1 [float] NULL,
	baca_2 [float] NULL,
	baca_3 [float] NULL,
	baco [float] NULL,
	bahc_1 [float] NULL,
	bahc_2 [float] NULL,
	bahc_3 [float] NULL,
	bala [float] NULL,
	balc [float] NULL,
	balh_1 [float] NULL,
	balh_2 [float] NULL,
	balh_3 [float] NULL,
	bank [varchar](3) NULL,
	basi [float] NULL,
	bdsp [int] NULL,
	bdsp_kw [varchar](255) NULL,
	bkrn [varchar](27) NULL,
	bppn [varchar](15) NULL,
	brat [float] NULL,
	btno [int] NULL,
	cain [int] NULL,
	cain_kw [varchar](255) NULL,
	ccrs [varchar](3) NULL,
	ccur [varchar](3) NULL,
	cdam_1 [float] NULL,
	cdam_2 [float] NULL,
	cdam_3 [float] NULL,
	cfrs [varchar](6) NULL,
	compnr [varchar](10) NOT NULL,
	cpay [varchar](3) NULL,
	crep [varchar](9) NULL,
	csbi [varchar](255) NULL,
	cvat [varchar](9) NULL,
	dbnt [int] NULL,
	dbnt_kw [varchar](255) NULL,
	dc1a [float] NULL,
	dc1h_1 [float] NULL,
	dc1h_2 [float] NULL,
	dc1h_3 [float] NULL,
	dc1i [float] NULL,
	dc2a [float] NULL,
	dc2h_1 [float] NULL,
	dc2h_2 [float] NULL,
	dc2h_3 [float] NULL,
	dc2i [float] NULL,
	dc3a [float] NULL,
	dc3h_1 [float] NULL,
	dc3h_2 [float] NULL,
	dc3h_3 [float] NULL,
	dc3i [float] NULL,
	deleted [varchar](10) NULL,
	did1 [varchar](10) NULL,
	did2 [varchar](10) NULL,
	did3 [varchar](10) NULL,
	dim1 [varchar](9) NULL,
	dim2 [varchar](9) NULL,
	dim3 [varchar](9) NULL,
	dim4 [varchar](9) NULL,
	dim5 [varchar](9) NULL,
	dim6 [varchar](9) NULL,
	dim7 [varchar](9) NULL,
	dim8 [varchar](9) NULL,
	dim9 [varchar](9) NULL,
	dm10 [varchar](9) NULL,
	dm11 [varchar](9) NULL,
	dm12 [varchar](9) NULL,
	doca [int] NULL,
	docd [varchar](10) NULL,
	doub [int] NULL,
	doub_kw [varchar](255) NULL,
	dued [varchar](10) NULL,
	fact [int] NULL,
	fact_kw [varchar](255) NULL,
	fcmh_1 [float] NULL,
	fcmh_2 [float] NULL,
	fcmh_3 [float] NULL,
	fcmi [float] NULL,
	fcmt [float] NULL,
	fcom [int] NOT NULL,
	ficu [varchar](3) NULL,
	flpd [int] NULL,
	flpd_kw [varchar](255) NULL,
	itbp [varchar](9) NULL,
	itbp_ref_compnr [varchar](10) NULL,
	lamt [float] NULL,
	lapa [float] NULL,
	laph_1 [float] NULL,
	laph_2 [float] NULL,
	laph_3 [float] NULL,
	lapi [float] NULL,
	lcdt [varchar](10) NULL,
	leac [varchar](12) NULL,
	lett [int] NULL,
	line [int] NOT NULL,
	liqd [varchar](10) NULL,
	lmbi [int] NULL,
	lmbi_kw [varchar](255) NULL,
	lpdt [varchar](10) NULL,
	lvat [int] NULL,
	lvat_kw [varchar](255) NULL,
	mbno [varchar](9) NULL,
	ninv [int] NOT NULL,
	nuid [varchar](22) NULL,
	ofbp [varchar](9) NULL,
	oinv [int] NULL,
	opbp [varchar](9) NULL,
	opbp_ref_compnr [varchar](10) NULL,
	orno [varchar](9) NULL,
	osch [int] NULL,
	otyp [varchar](3) NULL,
	owbk [varchar](3) NULL,
	owbk_ref_compnr [varchar](10) NULL,
	pada [float] NULL,
	padh_1 [float] NULL,
	padh_2 [float] NULL,
	padh_3 [float] NULL,
	padi [float] NULL,
	paym [varchar](3) NULL,
	pdat [varchar](10) NULL,
	pfbp [varchar](9) NULL,
	pfbp_ref_compnr [varchar](10) NULL,
	post [int] NULL,
	pref [varchar](3) NULL,
	prob [varchar](3) NULL,
	prod [int] NULL,
	proj [varchar](9) NULL,
	prop [varchar](10) NULL,
	pysh [int] NULL,
	pysh_kw [varchar](255) NULL,
	rade [int] NULL,
	rade_kw [varchar](255) NULL,
	ratd [datetime] NULL,
	rate_1 [float] NULL,
	rate_2 [float] NULL,
	rate_3 [float] NULL,
	ratf_1 [int] NULL,
	ratf_2 [int] NULL,
	ratf_3 [int] NULL,
	rcod [varchar](15) NULL,
	rcpt [int] NULL,
	rcpt_kw [varchar](255) NULL,
	reas [varchar](3) NULL,
	refr [varchar](255) NULL,
	rtyp [varchar](3) NULL,
	sbid [varchar](9) NULL,
	schn [int] NULL,
	sequencenumber [int] NULL,
	sgdd [int] NULL,
	sgdd_kw [varchar](255) NULL,
	sgtp [int] NULL,
	sgtp_kw [varchar](255) NULL,
	stat [int] NULL,
	stat_kw [varchar](255) NULL,
	step [int] NULL,
	step_kw [varchar](255) NULL,
	styp [varchar](6) NULL,
	svah_1 [float] NULL,
	svah_2 [float] NULL,
	svah_3 [float] NULL,
	svam [float] NULL,
	tbrl [float] NULL,
	tcur [varchar](3) NULL,
	tcur_ref_compnr [varchar](10) NULL,
	text [int] NULL,
	text_ref_compnr [varchar](10) NULL,
	ztimestamp [datetime] NULL,
	tnrn [varchar](9) NULL,
	toba [float] NULL,
	tore_1 [float] NULL,
	tore_2 [float] NULL,
	tore_3 [float] NULL,
	trec [int] NULL,
	trec_kw [varchar](255) NULL,
	ttyp [varchar](3) NOT NULL,
	txdt [varchar](10) NULL,
	txtb [int] NULL,
	txtb_ref_compnr [varchar](10) NULL,
	typa [varchar](3) NULL,
	zuser [varchar](16) NULL,
	username [varchar](8) NULL,
	vata [float] NULL,
	vatc [varchar](3) NULL,
	vath_1 [float] NULL,
	vath_2 [float] NULL,
	vath_3 [float] NULL,
	vati [float] NULL,
	vatp [int] NULL,
	vaty [int] NULL,
	wros [int] NULL,
	wros_kw [varchar](255) NULL,
	zyear [int] NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (line)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tfacr601]
Description: This is a DST table for Account Receivable Invoices/Documents by Receipt-related Documents

Data Type: Transaction Data

Original Project: JBT Finance Account Receivable
Developer: Mohammed Majid
Date: 06/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tfacr601];

CREATE TABLE [acq101].[dst_tfacr601] 
(
	amnt [float] NULL,
	amti [float] NULL,
	amtl [float] NULL,
	bank [varchar](3) NULL,
	compnr [varchar](10) NOT NULL,
	curr [varchar](3) NULL,
	ddat [varchar](10) NULL,
	deleted [varchar](10) NULL,
	disi [float] NULL,
	disl [float] NULL,
	disr [float] NULL,
	doct [int] NULL,
	doct_kw [varchar](255) NULL,
	icom [int] NOT NULL,
	icur [varchar](3) NULL,
	idoc [int] NOT NULL,
	ilin [int] NOT NULL,
	isch [int] NOT NULL,
	itbp [varchar](9) NULL,
	itbp_ref_compnr [varchar](10) NULL,
	ityp [varchar](3) NOT NULL,
	lpsi [float] NULL,
	lpsl [float] NULL,
	lpsr [float] NULL,
	pbbp [varchar](9) NULL,
	pbbp_ref_compnr [varchar](10) NULL,
	pdfi [float] NULL,
	pdfl [float] NULL,
	pdfr [float] NULL,
	rcid [varchar](15) NULL,
	rcom [int] NOT NULL,
	recd [int] NOT NULL,
	recl [int] NOT NULL,
	recs [int] NOT NULL,
	rect [varchar](3) NOT NULL,
	refr [varchar](255) NULL,
	sdat [datetime] NULL,
	seqn [int] NOT NULL,
	sequencenumber [int] NULL,
	step [int] NULL,
	step_kw [varchar](255) NULL,
	ztimestamp [datetime] NULL,
	tpbp [varchar](9) NULL,
	tpbp_ref_compnr [varchar](10) NULL,
	username [varchar](8) NULL,
	usrc [varchar](16) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (seqn)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_cisli315]
Description: This is a DST table for Account Receivable Tax Details

Data Type: Transaction Data

Original Project: JBT Finance Account Receivable
Developer: Mohammed Majid
Date: 06/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_cisli315];

CREATE TABLE [acq101].[dst_cisli315] 
(
	ccty [varchar](3) NOT NULL,
	ccty_cvat_ref_compnr [varchar](10) NULL,
	ccty_ltax_ref_compnr [varchar](10) NULL,
	ccty_ref_compnr [varchar](10) NULL,
	ceno [varchar](24) NULL,
	compnr [varchar](10) NOT NULL,
	ctau [varchar](10) NULL,
	ctyp [int] NULL,
	ctyp_kw [varchar](255) NULL,
	cvat [varchar](9) NOT NULL,
	cvat_ref_compnr [varchar](10) NULL,
	deleted [varchar](10) NULL,
	dsca [varchar](255) NULL,
	etls [int] NOT NULL,
	exmt [int] NULL,
	exmt_kw [varchar](255) NULL,
	idoc [int] NOT NULL,
	ifcy [varchar](3) NULL,
	ifcy_ref_compnr [varchar](10) NULL,
	itcy [varchar](3) NULL,
	itcy_ref_compnr [varchar](10) NULL,
	itls [int] NOT NULL,
	ltax [varchar](9) NULL,
	ltax_ref_compnr [varchar](10) NULL,
	perc [float] NULL,
	rcod [varchar](6) NULL,
	rcod_ref_compnr [varchar](10) NULL,
	rsti [float] NULL,
	rtbh_1 [float] NULL,
	rtbh_2 [float] NULL,
	rtbh_3 [float] NULL,
	rtbi [float] NULL,
	rtoh_1 [float] NULL,
	rtoh_2 [float] NULL,
	rtoh_3 [float] NULL,
	rtoi [float] NULL,
	rtxh_1 [float] NULL,
	rtxh_2 [float] NULL,
	rtxh_3 [float] NULL,
	rtxi [float] NULL,
	sequencenumber [int] NULL,
	sfcp [int] NOT NULL,
	sfcp_ref_compnr [varchar](10) NULL,
	sfcp_tran_idoc_ref_compnr [varchar](10) NULL,
	sfcy [varchar](3) NULL,
	sfcy_ref_compnr [varchar](10) NULL,
	sgmt [varchar](25) NULL,
	ssti [float] NULL,
	sstt [float] NULL,
	stah_1 [float] NULL,
	stah_2 [float] NULL,
	stah_3 [float] NULL,
	stai [float] NULL,
	stat [float] NULL,
	stbh_1 [float] NULL,
	stbh_2 [float] NULL,
	stbh_3 [float] NULL,
	stbi [float] NULL,
	stbt [float] NULL,
	stcy [varchar](3) NULL,
	stcy_ref_compnr [varchar](10) NULL,
	stoh_1 [float] NULL,
	stoh_2 [float] NULL,
	stoh_3 [float] NULL,
	stoi [float] NULL,
	stot [float] NULL,
	stxh_1 [float] NULL,
	stxh_2 [float] NULL,
	stxh_3 [float] NULL,
	stxi [float] NULL,
	tbah_1 [float] NULL,
	tbah_2 [float] NULL,
	tbah_3 [float] NULL,
	tbai [float] NULL,
	tcba [float] NULL,
	tcbr [float] NULL,
	tcsa [float] NULL,
	tcsr [float] NULL,
	tcta [float] NULL,
	tcto [float] NULL,
	tctr [float] NULL,
	ztimestamp [datetime] NULL,
	tlsq [int] NOT NULL,
	toah_1 [float] NULL,
	toah_2 [float] NULL,
	toah_3 [float] NULL,
	toai [float] NULL,
	ztran [varchar](3) NOT NULL,
	ttor [float] NULL,
	txah_1 [float] NULL,
	txah_2 [float] NULL,
	txah_3 [float] NULL,
	txai [float] NULL,
	txdt [datetime] NULL,
	txih [int] NULL,
	txih_kw [varchar](255) NULL,
	username [varchar](8) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (tlsq)
)
GO


/**********************************************************************************************************************
Table Name: [acq101].[dst_tcstl150]
Description: This is a DST table for Account Receivable Notes

Data Type: Transaction Data

Original Project: JBT Finance Account Receivable
Developer: Mohammed Majid
Date: 06/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tcstl150];

CREATE TABLE [acq101].[dst_tcstl150] (
	acty [varchar](9) NULL,
	acty_ref_compnr [varchar](10) NULL,
	bpid [varchar](9) NULL,
	bpid_ref_compnr [varchar](10) NULL,
	ccnt [varchar](9) NULL,
	ccnt_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	crdt [datetime] NULL,
	deleted [varchar](10) NULL,
	extn [int] NULL,
	extn_kw [varchar](255) NULL,
	lmdt [datetime] NULL,
	lmus [varchar](16) NULL,
	nogd [varchar](22) NOT NULL,
	ntnr [int] NOT NULL,
	obbj [varchar](25) NULL,
	obdr [varchar](90) NULL,
	oblr [varchar](90) NULL,
	obty [int] NULL,
	obty_kw [varchar](255) NULL,
	sequencenumber [int] NULL,
	subj [varchar](255) NULL,
	ztimestamp [datetime] NULL,
	txta [int] NULL,
	txta_ref_compnr [varchar](10) NULL,
	zuser [varchar](16) NULL,
	username [varchar](8) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (ntnr)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tfacr200]
Description: This is a DST table for Account Receivable Open Items (Sales Invoices & Receipts)

Data Type: Transaction Data

Original Project: JBT Finance Account Receivable
Developer: Mohammed Majid
Date: 06/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tfacr200];

CREATE TABLE [acq101].[dst_tfacr200] 
(
	adrs [varchar](9) NULL,
	adrs_ref_compnr [varchar](10) NULL,
	amnt [float] NULL,
	amth_1 [float] NULL,
	amth_2 [float] NULL,
	amth_3 [float] NULL,
	amti [float] NULL,
	arrq [int] NULL,
	arrq_kw [varchar](255) NULL,
	baca_1 [float] NULL,
	baca_2 [float] NULL,
	baca_3 [float] NULL,
	baco [float] NULL,
	bahc_1 [float] NULL,
	bahc_2 [float] NULL,
	bahc_3 [float] NULL,
	bala [float] NULL,
	balc [float] NULL,
	balh_1 [float] NULL,
	balh_2 [float] NULL,
	balh_3 [float] NULL,
	bank [varchar](3) NULL,
	basi [float] NULL,
	bdsp [int] NULL,
	bdsp_kw [varchar](255) NULL,
	bkrn [varchar](27) NULL,
	bppn [varchar](15) NULL,
	btno [int] NULL,
	cain [int] NULL,
	cain_kw [varchar](255) NULL,
	ccrs [varchar](3) NULL,
	ccrs_ref_compnr [varchar](10) NULL,
	ccur [varchar](3) NULL,
	ccur_ref_compnr [varchar](10) NULL,
	cdam_1 [float] NULL,
	cdam_2 [float] NULL,
	cdam_3 [float] NULL,
	cfrs [varchar](6) NULL,
	cfrs_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	cpay [varchar](3) NULL,
	cpay_ref_compnr [varchar](10) NULL,
	crep [varchar](9) NULL,
	crep_ref_compnr [varchar](10) NULL,
	csbi [varchar](255) NULL,
	cvat [varchar](9) NULL,
	cvat_ref_compnr [varchar](10) NULL,
	dbnt [int] NULL,
	dbnt_kw [varchar](255) NULL,
	dc1a [float] NULL,
	dc1h_1 [float] NULL,
	dc1h_2 [float] NULL,
	dc1h_3 [float] NULL,
	dc1i [float] NULL,
	dc2a [float] NULL,
	dc2h_1 [float] NULL,
	dc2h_2 [float] NULL,
	dc2h_3 [float] NULL,
	dc2i [float] NULL,
	dc3a [float] NULL,
	dc3h_1 [float] NULL,
	dc3h_2 [float] NULL,
	dc3h_3 [float] NULL,
	dc3i [float] NULL,
	deleted [varchar](10) NULL,
	did1 [varchar](10) NULL,
	did2 [varchar](10) NULL,
	did3 [varchar](10) NULL,
	dim1 [varchar](9) NULL,
	dim2 [varchar](9) NULL,
	dim3 [varchar](9) NULL,
	dim4 [varchar](9) NULL,
	dim5 [varchar](9) NULL,
	dim6 [varchar](9) NULL,
	dim7 [varchar](9) NULL,
	dim8 [varchar](9) NULL,
	dim9 [varchar](9) NULL,
	dm10 [varchar](9) NULL,
	dm11 [varchar](9) NULL,
	dm12 [varchar](9) NULL,
	doca [int] NULL,
	docd [varchar](10) NULL,
	docn [int] NOT NULL,
	doub [int] NULL,
	doub_kw [varchar](255) NULL,
	dued [varchar](10) NULL,
	fact [int] NULL,
	fact_kw [varchar](255) NULL,
	fcmh_1 [float] NULL,
	fcmh_2 [float] NULL,
	fcmh_3 [float] NULL,
	fcmi [float] NULL,
	fcmt [float] NULL,
	itbp [varchar](9) NULL,
	itbp_ref_compnr [varchar](10) NULL,
	lamt [float] NULL,
	lapa [float] NULL,
	laph_1 [float] NULL,
	laph_2 [float] NULL,
	laph_3 [float] NULL,
	lapi [float] NULL,
	lcdt [varchar](10) NULL,
	leac [varchar](12) NULL,
	leac_ref_compnr [varchar](10) NULL,
	lett [int] NULL,
	line [int] NOT NULL,
	lino [int] NOT NULL,
	liqd [varchar](10) NULL,
	lmbi [int] NULL,
	lmbi_kw [varchar](255) NULL,
	lpdt [varchar](10) NULL,
	lvat [int] NULL,
	lvat_kw [varchar](255) NULL,
	mbno [varchar](9) NULL,
	ninv [int] NOT NULL,
	nuid [varchar](22) NULL,
	ofbp [varchar](9) NULL,
	oinv [int] NULL,
	opbp [varchar](9) NULL,
	opbp_ref_compnr [varchar](10) NULL,
	orno [varchar](9) NULL,
	osch [int] NULL,
	otyp [varchar](3) NULL,
	otyp_ref_compnr [varchar](10) NULL,
	owbk [varchar](3) NULL,
	owbk_ref_compnr [varchar](10) NULL,
	pada [float] NULL,
	padh_1 [float] NULL,
	padh_2 [float] NULL,
	padh_3 [float] NULL,
	padi [float] NULL,
	paym [varchar](3) NULL,
	paym_ref_compnr [varchar](10) NULL,
	pdat [varchar](10) NULL,
	pfbp [varchar](9) NULL,
	pfbp_bank_ref_compnr [varchar](10) NULL,
	pfbp_ref_compnr [varchar](10) NULL,
	post [int] NULL,
	pref [varchar](3) NULL,
	pref_ref_compnr [varchar](10) NULL,
	prob [varchar](3) NULL,
	prob_ref_compnr [varchar](10) NULL,
	prod [int] NULL,
	proj [varchar](9) NULL,
	prop [varchar](10) NULL,
	pysh [int] NULL,
	pysh_kw [varchar](255) NULL,
	rade [int] NULL,
	rade_kw [varchar](255) NULL,
	ratd [datetime] NULL,
	rate_1 [float] NULL,
	rate_2 [float] NULL,
	rate_3 [float] NULL,
	ratf_1 [int] NULL,
	ratf_2 [int] NULL,
	ratf_3 [int] NULL,
	rcod [varchar](15) NULL,
	rcom [int] NULL,
	rcpt [int] NULL,
	rcpt_kw [varchar](255) NULL,
	reas [varchar](3) NULL,
	reas_ref_compnr [varchar](10) NULL,
	recd [int] NULL,
	recl [int] NULL,
	rect [varchar](3) NULL,
	refr [varchar](255) NULL,
	rtyp [varchar](3) NULL,
	sbid [varchar](9) NULL,
	schn [int] NULL,
	sequencenumber [int] NULL,
	sgtp [int] NULL,
	sgtp_kw [varchar](255) NULL,
	stat [int] NULL,
	stat_kw [varchar](255) NULL,
	step [int] NULL,
	step_kw [varchar](255) NULL,
	styp [varchar](6) NULL,
	styp_ref_compnr [varchar](10) NULL,
	svah_1 [float] NULL,
	svah_2 [float] NULL,
	svah_3 [float] NULL,
	svam [float] NULL,
	tbrl [float] NULL,
	tdoc [varchar](3) NOT NULL,
	tdoc_ref_compnr [varchar](10) NULL,
	text [int] NULL,
	text_ref_compnr [varchar](10) NULL,
	ztimestamp [datetime] NULL,
	tnrn [varchar](9) NULL,
	tore_1 [float] NULL,
	tore_2 [float] NULL,
	tore_3 [float] NULL,
	trec [int] NULL,
	trec_kw [varchar](255) NULL,
	ttyp [varchar](3) NOT NULL,
	ttyp_ref_compnr [varchar](10) NULL,
	txdt [varchar](10) NULL,
	txtb [int] NULL,
	txtb_ref_compnr [varchar](10) NULL,
	typa [varchar](3) NULL,
	typa_ref_compnr [varchar](10) NULL,
	zuser [varchar](16) NULL,
	username [varchar](8) NULL,
	vata [float] NULL,
	vatc [varchar](3) NULL,
	vatc_cvat_ref_compnr [varchar](10) NULL,
	vatc_ref_compnr [varchar](10) NULL,
	vath_1 [float] NULL,
	vath_2 [float] NULL,
	vath_3 [float] NULL,
	vati [float] NULL,
	vatp [int] NULL,
	vaty [int] NULL,
	wros [int] NULL,
	wros_kw [varchar](255) NULL,
	zyear [int] NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (lino)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tfgld482]
Description: This is a DST table for Account Receivable Integration Transactions

Data Type: Transaction Data

Original Project: JBT Finance Account Receivable
Developer: Mohammed Majid
Date: 06/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tfgld482];

CREATE TABLE [acq101].[dst_tfgld482] 
(
	admm [int] NULL,
	admm_kw [varchar](255) NULL,
	alam [int] NULL,
	alam_kw [varchar](255) NULL,
	amnt [float] NULL,
	amth_1 [float] NULL,
	amth_2 [float] NULL,
	amth_3 [float] NULL,
	bpid [varchar](9) NULL,
	btno [int] NULL,
	buid [varchar](22) NULL,
	ccur [varchar](3) NULL,
	ccur_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	crdt [datetime] NULL,
	crus [varchar](16) NULL,
	cuni [varchar](3) NULL,
	cuni_ref_compnr [varchar](10) NULL,
	dbcr [int] NOT NULL,
	dbcr_kw [varchar](255) NULL,
	deleted [varchar](10) NULL,
	dim1 [varchar](9) NULL,
	dim2 [varchar](9) NULL,
	dim3 [varchar](9) NULL,
	dim4 [varchar](9) NULL,
	dim5 [varchar](9) NULL,
	dim6 [varchar](9) NULL,
	dim7 [varchar](9) NULL,
	dim8 [varchar](9) NULL,
	dim9 [varchar](9) NULL,
	dm10 [varchar](9) NULL,
	dm11 [varchar](9) NULL,
	dm12 [varchar](9) NULL,
	docn [int] NULL,
	eibc_1 [int] NULL,
	eibc_2 [int] NULL,
	eibc_3 [int] NULL,
	eibc_kw_1 [varchar](255) NULL,
	eibc_kw_2 [varchar](255) NULL,
	eibc_kw_3 [varchar](255) NULL,
	fcom [int] NULL,
	fprd [int] NULL,
	fyer [int] NULL,
	glcu [int] NULL,
	glcu_kw [varchar](255) NULL,
	guid [varchar](22) NOT NULL,
	idtc [varchar](8) NULL,
	idtc_ref_compnr [varchar](10) NULL,
	leac [varchar](12) NULL,
	lino [int] NULL,
	mscd [varchar](6) NULL,
	msvs [int] NULL,
	nuni [float] NULL,
	obre [varchar](90) NULL,
	ocmp [int] NULL,
	podt [datetime] NULL,
	pous [varchar](16) NULL,
	prin [int] NULL,
	prin_kw [varchar](255) NULL,
	ratd [datetime] NULL,
	rate_1 [float] NULL,
	rate_2 [float] NULL,
	rate_3 [float] NULL,
	ratf_1 [int] NULL,
	ratf_2 [int] NULL,
	ratf_3 [int] NULL,
	rbid [varchar](11) NULL,
	rbon [varchar](17) NULL,
	rbon_ref_compnr [varchar](10) NULL,
	rpon [int] NULL,
	rprd [int] NULL,
	rtyp [varchar](3) NULL,
	ryer [int] NULL,
	secd [varchar](12) NULL,
	sequencenumber [int] NULL,
	seva [varchar](50) NULL,
	sint [int] NULL,
	sint_kw [varchar](255) NULL,
	tcmp [int] NULL,
	ztimestamp [datetime] NULL,
	tprd [int] NULL,
	trdt [datetime] NULL,
	ttyp [varchar](3) NULL,
	tyer [int] NULL,
	username [varchar](8) NULL,
	usgr [varchar](6) NULL,
	usgr_ref_compnr [int] NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (guid)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tfgld010]
Description: This is a DST table for Account Receivable Dimensions

Data Type: Dimension Data

Original Project: JBT Finance Account Receivable
Developer: Mohammed Majid
Date: 06/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tfgld010];

CREATE TABLE [acq101].[dst_tfgld010] 
(
	atyp [int] NULL,
	atyp_kw [varchar](255) NULL,
	bfdt [varchar](10) NULL,
	bloc [int] NULL,
	bloc_kw [varchar](255) NULL,
	budt [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	deleted [varchar](10) NULL,
	zdesc [varchar](255) NULL,
	dimx [varchar](9) NOT NULL,
	dtyp [int] NOT NULL,
	dtyp_pdix_ref_compnr [varchar](10) NULL,
	dtyp_ref_compnr [varchar](10) NULL,
	emno [varchar](9) NULL,
	emno_ref_compnr [varchar](10) NULL,
	pdix [varchar](9) NULL,
	pseq [int] NULL,
	qan1 [varchar](3) NULL,
	qan1_ref_compnr [varchar](10) NULL,
	qan2 [varchar](3) NULL,
	qan2_ref_compnr [varchar](10) NULL,
	sequencenumber [int] NULL,
	skey [varchar](255) NULL,
	subl [int] NULL,
	text [int] NULL,
	text_ref_compnr [varchar](10) NULL,
	ztimestamp [datetime] NULL,
	uni1 [int] NULL,
	uni1_kw [varchar](255) NULL,
	uni2 [int] NULL,
	uni2_kw [varchar](255) NULL,
	username [varchar](8) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (dtyp)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tfcmg301]
Description: This is a DST table for Account Receivable Cash Forecast

Data Type: Transaction Data

Original Project: JBT Finance Account Receivable
Developer: Mohammed Majid
Date: 06/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tfcmg301];

CREATE TABLE [acq101].[dst_tfcmg301] (
	amnt [float] NULL,
	amth [float] NULL,
	bpid [varchar](9) NOT NULL,
	bpid_ref_compnr [varchar](10) NULL,
	ccur [varchar](3) NOT NULL,
	ccur_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	zdate [varchar](10) NOT NULL,
	deleted [varchar](10) NOT NULL,
	forc [int] NOT NULL,
	forc_kw [varchar](255) NULL,
	ftyp [int] NOT NULL,
	ftyp_kw [varchar](255) NULL,
	ninv [int] NOT NULL,
	orig [varchar](30) NOT NULL,
	schn [int] NOT NULL,
	sequencenumber [int] NOT NULL,
	ztimestamp [datetime] NOT NULL,
	ttyp [varchar](3) NOT NULL,
	ttyp_ref_compnr [varchar](10) NULL,
	username [varchar](8) NOT NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (bpid)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcmcs008]
Description: This is a DST table for Account Receivable Currency Rates

Data Type: Dimension Data

Original Project: JBT Finance Account Receivable
Developer: Mohammed Majid
Date: 06/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tcmcs008];

CREATE TABLE [acq101].[dst_tcmcs008] (
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
	DISTRIBUTION = HASH (bcur)
)
GO