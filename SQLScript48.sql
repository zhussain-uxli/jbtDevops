/**********************************************************************************************************************
Table Name: [acq101].[dst_tfgld206]
Description: This is a DST table for GL Actual Ledger History GL Opening Balances

Data Type: Transaction Data

Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 08/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tfgld206];

CREATE TABLE [acq101].[dst_tfgld206] 
(
	bpid [varchar](9) NOT NULL,
	ccur [varchar](3) NOT NULL,
	ccur_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	cono [int] NOT NULL,
	deleted [varchar](10) NULL,
	dim1 [varchar](9) NOT NULL,
	dim2 [varchar](9) NOT NULL,
	dim3 [varchar](9) NOT NULL,
	dim4 [varchar](9) NOT NULL,
	dim5 [varchar](9) NOT NULL,
	dim6 [varchar](9) NULL,
	dim7 [varchar](9) NULL,
	dim8 [varchar](9) NULL,
	dim9 [varchar](9) NULL,
	dims [varchar](63) NOT NULL,
	dimx_sgm1 [varchar](9) NULL,
	dimx_sgm2 [varchar](9) NULL,
	dm10 [varchar](9) NULL,
	dm11 [varchar](9) NULL,
	dm12 [varchar](9) NULL,
	duac [int] NOT NULL,
	duac_kw [varchar](255) NULL,
	fobh_1 [float] NULL,
	fobh_2 [float] NULL,
	fobh_3 [float] NULL,
	fobh_dtwc [float] NULL,
	fobh_rfrc [float] NULL,
	ftob [float] NULL,
	leac [varchar](12) NOT NULL,
	nob1 [float] NULL,
	nob2 [float] NULL,
	nobh_1 [float] NULL,
	nobh_2 [float] NULL,
	nobh_3 [float] NULL,
	nobh_dtwc [float] NULL,
	nobh_rfrc [float] NULL,
	ntob [float] NULL,
	olap [int] NULL,
	qob1 [float] NULL,
	qob2 [float] NULL,
	sequencenumber [int] NULL,
	ztimestamp [datetime] NULL,
	username [varchar](8) NULL,
	zyear [int] NOT NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (leac)
)
GO


/**********************************************************************************************************************
Table Name: [acq101].[dst_tfgld205]
Description: This is a DST table for GL Actual Ledger History GL Transactions

Data Type: Transaction Data

Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 08/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tfgld205];

CREATE TABLE [acq101].[dst_tfgld205] 
(
	bpid [varchar](9) NOT NULL,
	ccur [varchar](3) NOT NULL,
	ccur_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	cono [int] NOT NULL,
	deleted [varchar](10) NULL,
	dim1 [varchar](9) NOT NULL,
	dim2 [varchar](9) NOT NULL,
	dim3 [varchar](9) NOT NULL,
	dim4 [varchar](9) NOT NULL,
	dim5 [varchar](9) NOT NULL,
	dim6 [varchar](9) NULL,
	dim7 [varchar](9) NULL,
	dim8 [varchar](9) NULL,
	dim9 [varchar](9) NULL,
	dims [varchar](63) NOT NULL,
	dimx_sgm1 [varchar](9) NULL,
	dimx_sgm2 [varchar](9) NULL,
	dm10 [varchar](9) NULL,
	dm11 [varchar](9) NULL,
	dm12 [varchar](9) NULL,
	duac [int] NOT NULL,
	duac_kw [varchar](255) NULL,
	fcah_1 [float] NULL,
	fcah_2 [float] NULL,
	fcah_3 [float] NULL,
	fcah_dtwc [float] NULL,
	fcah_rfrc [float] NULL,
	fcam [float] NULL,
	fdah_1 [float] NULL,
	fdah_2 [float] NULL,
	fdah_3 [float] NULL,
	fdah_dtwc [float] NULL,
	fdah_rfrc [float] NULL,
	fdam [float] NULL,
	fqt1 [float] NULL,
	fqt2 [float] NULL,
	leac [varchar](12) NOT NULL,
	ncah_1 [float] NULL,
	ncah_2 [float] NULL,
	ncah_3 [float] NULL,
	ncah_dtwc [float] NULL,
	ncah_rfrc [float] NULL,
	ncam [float] NULL,
	ndah_1 [float] NULL,
	ndah_2 [float] NULL,
	ndah_3 [float] NULL,
	ndah_dtwc [float] NULL,
	ndah_rfrc [float] NULL,
	ndam [float] NULL,
	nqt1 [float] NULL,
	nqt2 [float] NULL,
	olap [int] NULL,
	prno [int] NOT NULL,
	ptyp [int] NOT NULL,
	ptyp_kw [varchar](255) NULL,
	sequencenumber [int] NULL,
	ztimestamp [datetime] NULL,
	username [varchar](8) NULL,
	zyear [int] NOT NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (leac)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tffbs101]
Description: This is a DST table for GL Forecast Budget Amounts

Data Type: Transaction Data

Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 08/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tffbs101];

CREATE TABLE [acq101].[dst_tffbs101] 
(
	amnt [float] NULL,
	back [int] NULL,
	back_kw [varchar](255) NULL,
	budg [varchar](3) NOT NULL,
	budg_ref_compnr [varchar](10) NULL,
	coam [float] NULL,
	compnr [varchar](10) NOT NULL,
	dbcr [int] NULL,
	dbcr_kw [varchar](255) NULL,
	deleted [varchar](10) NULL,
	dim1 [varchar](9) NOT NULL,
	dim2 [varchar](9) NOT NULL,
	dim3 [varchar](9) NOT NULL,
	dim4 [varchar](9) NOT NULL,
	dim5 [varchar](9) NOT NULL,
	dim6 [varchar](9) NOT NULL,
	dim7 [varchar](9) NOT NULL,
	dim8 [varchar](9) NOT NULL,
	dim9 [varchar](9) NOT NULL,
	dm10 [varchar](9) NOT NULL,
	dm11 [varchar](9) NOT NULL,
	dm12 [varchar](9) NOT NULL,
	dt10 [int] NULL,
	dt10_dm10_ref_compnr [varchar](10) NULL,
	dt10_ref_compnr [varchar](10) NULL,
	dt11 [int] NULL,
	dt11_dm11_ref_compnr [varchar](10) NULL,
	dt11_ref_compnr [varchar](10) NULL,
	dt12 [int] NULL,
	dt12_dm12_ref_compnr [varchar](10) NULL,
	dt12_ref_compnr [varchar](10) NULL,
	dty1 [int] NULL,
	dty1_dim1_ref_compnr [varchar](10) NULL,
	dty1_ref_compnr [varchar](10) NULL,
	dty2 [int] NULL,
	dty2_dim2_ref_compnr [varchar](10) NULL,
	dty2_ref_compnr [varchar](10) NULL,
	dty3 [int] NULL,
	dty3_dim3_ref_compnr [varchar](10) NULL,
	dty3_ref_compnr [varchar](10) NULL,
	dty4 [int] NULL,
	dty4_dim4_ref_compnr [varchar](10) NULL,
	dty4_ref_compnr [varchar](10) NULL,
	dty5 [int] NULL,
	dty5_dim5_ref_compnr [varchar](10) NULL,
	dty5_ref_compnr [varchar](10) NULL,
	dty6 [int] NULL,
	dty6_dim6_ref_compnr [varchar](10) NULL,
	dty6_ref_compnr [varchar](10) NULL,
	dty7 [int] NULL,
	dty7_dim7_ref_compnr [varchar](10) NULL,
	dty7_ref_compnr [varchar](10) NULL,
	dty8 [int] NULL,
	dty8_dim8_ref_compnr [varchar](10) NULL,
	dty8_ref_compnr [varchar](10) NULL,
	dty9 [int] NULL,
	dty9_dim9_ref_compnr [varchar](10) NULL,
	dty9_ref_compnr [varchar](10) NULL,
	leac [varchar](12) NOT NULL,
	leac_ref_compnr [varchar](10) NULL,
	olap [int] NULL,
	peri [int] NOT NULL,
	qan1 [float] NULL,
	qan2 [float] NULL,
	sequencenumber [int] NULL,
	stam [float] NULL,
	ztimestamp [datetime] NULL,
	username [varchar](8) NULL,
	zyear [int] NOT NULL,
	year_budg_ref_compnr [int] NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (budg)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tffbs005]
Description: This is a DST table for GL Forecast Budgets

Data Type: Dimension Data

Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 08/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tffbs005];

CREATE TABLE [acq101].[dst_tffbs005] 
(
	budg [varchar](3) NOT NULL,
	budg_ref_compnr [varchar](10) NULL,
	cbud [varchar](3) NULL,
	cbud_ref_compnr [varchar](10) NULL,
	cbyr [int] NULL,
	cbyr_cbud_ref_compnr [varchar](10) NULL,
	ccur [varchar](3) NULL,
	ccur_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	dbud [varchar](3) NULL,
	dbud_ref_compnr [varchar](10) NULL,
	dbyr [int] NULL,
	dbyr_dbud_ref_compnr [varchar](10) NULL,
	defi [int] NULL,
	defi_kw [varchar](255) NULL,
	deleted [varchar](10) NULL,
	disb [varchar](3) NULL,
	disb_ref_compnr [varchar](10) NULL,
	lmdt [datetime] NULL,
	pbud [varchar](3) NULL,
	pbud_ref_compnr [varchar](10) NULL,
	pbyr [int] NULL,
	pbyr_pbud_ref_compnr [varchar](10) NULL,
	ratc_1 [float] NULL,
	ratc_2 [float] NULL,
	ratc_3 [float] NULL,
	ratf_1 [int] NULL,
	ratf_2 [int] NULL,
	ratf_3 [int] NULL,
	sequencenumber [int] NULL,
	text [int] NULL,
	text_ref_compnr [varchar](10) NULL,
	ztimestamp [datetime] NULL,
	username [varchar](8) NULL,
	zyear [int] NOT NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (budg)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tffbs003]
Description: This is a DST table for GL Forecast Budget Master

Data Type: Dimension Data

Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 08/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tffbs003];

CREATE TABLE [acq101].[dst_tffbs003] 
(
	ad10 [int] NULL,
	ad10_kw [varchar](255) NULL,
	ad11 [int] NULL,
	ad11_kw [varchar](255) NULL,
	ad12 [int] NULL,
	ad12_kw [varchar](255) NULL,
	adt1 [int] NULL,
	adt1_kw [varchar](255) NULL,
	adt2 [int] NULL,
	adt2_kw [varchar](255) NULL,
	adt3 [int] NULL,
	adt3_kw [varchar](255) NULL,
	adt4 [int] NULL,
	adt4_kw [varchar](255) NULL,
	adt5 [int] NULL,
	adt5_kw [varchar](255) NULL,
	adt6 [int] NULL,
	adt6_kw [varchar](255) NULL,
	adt7 [int] NULL,
	adt7_kw [varchar](255) NULL,
	adt8 [int] NULL,
	adt8_kw [varchar](255) NULL,
	adt9 [int] NULL,
	adt9_kw [varchar](255) NULL,
	aqu1 [int] NULL,
	aqu1_kw [varchar](255) NULL,
	aqu2 [int] NULL,
	aqu2_kw [varchar](255) NULL,
	budg [varchar](3) NOT NULL,
	budm [int] NULL,
	budm_kw [varchar](255) NULL,
	compnr [varchar](10) NOT NULL,
	deleted [varchar](10) NULL,
	zdesc [varchar](255) NULL,
	llac [int] NULL,
	llac_kw [varchar](255) NULL,
	nbpr [int] NULL,
	sdbu [int] NULL,
	sdbu_kw [varchar](255) NULL,
	sequencenumber [int] NULL,
	text [int] NULL,
	text_ref_compnr [varchar](10) NULL,
	ztimestamp [datetime] NULL,
	username [varchar](8) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (budg)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tfgld106]
Description: This is a DST table for GL Actual Finalized Transactions

Data Type: Transaction Data

Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 08/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tfgld106];

CREATE TABLE [acq101].[dst_tfgld106] 
(
	adty [int] NULL,
	adty_kw [varchar](255) NULL,
	amnt [float] NULL,
	amth_1 [float] NULL,
	amth_2 [float] NULL,
	amth_3 [float] NULL,
	bpid [varchar](9) NULL,
	buex [int] NULL,
	buex_kw [varchar](255) NULL,
	cacc [varchar](12) NULL,
	catg [int] NULL,
	catg_kw [varchar](255) NULL,
	ccty [varchar](3) NULL,
	ccur [varchar](3) NULL,
	cdln [int] NULL,
	cfrs [varchar](6) NULL,
	cinv [int] NULL,
	clin [int] NULL,
	compnr [varchar](10) NOT NULL,
	cont [int] NULL,
	cont_kw [varchar](255) NULL,
	corn [int] NULL,
	crdt [datetime] NULL,
	csrn [int] NULL,
	ctyp [varchar](3) NULL,
	cvat [varchar](9) NULL,
	zdate [varchar](10) NULL,
	dbcr [int] NULL,
	dbcr_kw [varchar](255) NULL,
	dcdt [varchar](10) NULL,
	dele [int] NULL,
	dele_kw [varchar](255) NULL,
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
	expd [int] NULL,
	expd_kw [varchar](255) NULL,
	fact_1 [int] NULL,
	fact_2 [int] NULL,
	fact_3 [int] NULL,
	fdoc [int] NULL,
	fprd [int] NULL,
	ftyp [varchar](3) NULL,
	fyer [int] NULL,
	intt [int] NULL,
	intt_kw [varchar](255) NULL,
	leac [varchar](12) NULL,
	obat [int] NULL,
	ocmp [int] NULL,
	odoc [int] NOT NULL,
	olin [int] NOT NULL,
	osrl [int] NOT NULL,
	osrn [int] NOT NULL,
	otyp [varchar](3) NOT NULL,
	oyer [int] NULL,
	qty1 [float] NULL,
	qty2 [float] NULL,
	ratd [datetime] NULL,
	rate_1 [float] NULL,
	rate_2 [float] NULL,
	rate_3 [float] NULL,
	recl [int] NULL,
	recl_kw [varchar](255) NULL,
	reco [int] NULL,
	reco_kw [varchar](255) NULL,
	recs [int] NULL,
	ref2 [varchar](255) NULL,
	refr [varchar](255) NULL,
	rprd [int] NULL,
	rtyp [varchar](3) NULL,
	ryer [int] NULL,
	secd [varchar](3) NULL,
	sequencenumber [int] NULL,
	tcsh [int] NULL,
	tcsh_kw [varchar](255) NULL,
	tedt [varchar](10) NULL,
	ztime [int] NULL,
	ztimestamp [datetime] NULL,
	ztran [int] NULL,
	tran_kw [varchar](255) NULL,
	trun [int] NULL,
	txta [int] NULL,
	txta_ref_compnr [varchar](10) NULL,
	typ1 [int] NULL,
	typ2 [int] NULL,
	typ3 [int] NULL,
	typ4 [int] NULL,
	typ5 [int] NULL,
	zuser [varchar](16) NULL,
	username [varchar](8) NULL,
	vamh_1 [float] NULL,
	vamh_2 [float] NULL,
	vamh_3 [float] NULL,
	vamt [float] NULL,
	vlac [varchar](12) NULL,
	vprd [int] NULL,
	vtyp [int] NULL,
	vtyp_kw [varchar](255) NULL,
	vyer [int] NULL,
	wtsc [int] NULL,
	wtsc_kw [varchar](255) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (olin)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tfgld008]
Description: This is a DST table for GL Chart of Accounts

Data Type: Dimension Data

Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 08/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tfgld008];

CREATE TABLE [acq101].[dst_tfgld008] 
(
	acmp [varchar](8) NULL,
	acmp_ref_compnr [varchar](10) NULL,
	alat [int] NULL,
	alat_kw [varchar](255) NULL,
	atyp [int] NULL,
	atyp_kw [varchar](255) NULL,
	bfdt [varchar](10) NULL,
	blbp [int] NULL,
	blbp_kw [varchar](255) NULL,
	bloc [int] NULL,
	bloc_kw [varchar](255) NULL,
	budt [varchar](10) NULL,
	cdca [varchar](12) NULL,
	cdca_ref_compnr [varchar](10) NULL,
	cfic [varchar](6) NULL,
	cfic_ref_compnr [varchar](10) NULL,
	cfrs [varchar](6) NULL,
	cfrs_ref_compnr [varchar](10) NULL,
	compnr [varchar](10) NOT NULL,
	ctar [int] NULL,
	ctar_kw [varchar](255) NULL,
	ctlm [int] NULL,
	ctlm_kw [varchar](255) NULL,
	cvat [varchar](9) NULL,
	cvat_ref_compnr [varchar](10) NULL,
	dbcr [int] NULL,
	dbcr_kw [varchar](255) NULL,
	dblm [int] NULL,
	dblm_kw [varchar](255) NULL,
	deleted [varchar](10) NULL,
	zdesc [varchar](255) NULL,
	dga1 [varchar](12) NULL,
	dga1_ref_compnr [varchar](10) NULL,
	dga2 [varchar](12) NULL,
	dga2_ref_compnr [varchar](10) NULL,
	dim1 [int] NULL,
	dim1_kw [varchar](255) NULL,
	dim2 [int] NULL,
	dim2_kw [varchar](255) NULL,
	dim3 [int] NULL,
	dim3_kw [varchar](255) NULL,
	dim4 [int] NULL,
	dim4_kw [varchar](255) NULL,
	dim5 [int] NULL,
	dim5_kw [varchar](255) NULL,
	dim6 [int] NULL,
	dim6_kw [varchar](255) NULL,
	dim7 [int] NULL,
	dim7_kw [varchar](255) NULL,
	dim8 [int] NULL,
	dim8_kw [varchar](255) NULL,
	dim9 [int] NULL,
	dim9_kw [varchar](255) NULL,
	dla1 [varchar](12) NULL,
	dla1_ref_compnr [varchar](10) NULL,
	dla2 [varchar](12) NULL,
	dla2_ref_compnr [varchar](10) NULL,
	dm10 [int] NULL,
	dm10_kw [varchar](255) NULL,
	dm11 [int] NULL,
	dm11_kw [varchar](255) NULL,
	dm12 [int] NULL,
	dm12_kw [varchar](255) NULL,
	dmsq [int] NULL,
	duac [int] NULL,
	duac_kw [varchar](255) NULL,
	etyp [int] NULL,
	etyp_kw [varchar](255) NULL,
	icom [int] NULL,
	icom_kw [varchar](255) NULL,
	icur [int] NULL,
	icur_kw [varchar](255) NULL,
	ifas [int] NULL,
	ifas_kw [varchar](255) NULL,
	injb [int] NULL,
	injb_kw [varchar](255) NULL,
	inta [int] NULL,
	inta_kw [varchar](255) NULL,
	iprj [int] NULL,
	iprj_kw [varchar](255) NULL,
	leac [varchar](12) NOT NULL,
	ledc [varchar](255) NULL,
	lela [varchar](12) NULL,
	loco [int] NULL,
	mach [int] NULL,
	mach_kw [varchar](255) NULL,
	pcac [varchar](12) NULL,
	pcac_ref_compnr [varchar](10) NULL,
	perc [float] NULL,
	plac [varchar](12) NULL,
	plac_ref_compnr [varchar](10) NULL,
	pseq [int] NULL,
	sear [varchar](9) NULL,
	sear_ref_compnr [varchar](10) NULL,
	sequencenumber [int] NULL,
	skey [varchar](255) NULL,
	subl [int] NULL,
	tagp [varchar](9) NULL,
	tagp_ref_compnr [varchar](10) NULL,
	text [int] NULL,
	text_ref_compnr [varchar](10) NULL,
	ztimestamp [datetime] NULL,
	uni1 [varchar](3) NULL,
	uni1_ref_compnr [varchar](10) NULL,
	uni2 [varchar](3) NULL,
	uni2_ref_compnr [varchar](10) NULL,
	username [varchar](8) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (leac)
)
GO

/**********************************************************************************************************************
Table Name: [acq101].[dst_tcemm170]
Description: This is a DST table for GL Companies

Data Type: Dimension Data

Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 08/07/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [acq101].[dst_tcemm170];

CREATE TABLE [acq101].[dst_tcemm170] 
(
	ccal [varchar](9) NULL,
	ccal_ref_compnr [varchar](10) NULL,
	clcu [varchar](3) NULL,
	clcu_ref_compnr [varchar](10) NULL,
	comp [int] NOT NULL,
	compnr [varchar](10) NOT NULL,
	csys [int] NULL,
	csys_kw [varchar](255) NULL,
	ctya [int] NULL,
	ctya_kw [varchar](255) NULL,
	ctyb [int] NULL,
	ctyb_kw [varchar](255) NULL,
	ctyc [int] NULL,
	ctyc_kw [varchar](255) NULL,
	ctyp [int] NULL,
	ctyp_kw [varchar](255) NULL,
	dcur_comp [varchar](3) NULL,
	deleted [varchar](10) NULL,
	zdesc [varchar](255) NULL,
	erub [varchar](3) NULL,
	erub_ref_compnr [varchar](10) NULL,
	eruc [varchar](3) NULL,
	eruc_ref_compnr [varchar](10) NULL,
	euro [varchar](3) NULL,
	euro_ref_compnr [varchar](10) NULL,
	exeu [varchar](3) NULL,
	exex [varchar](3) NULL,
	expu [varchar](3) NULL,
	exsa [varchar](3) NULL,
	fcua [varchar](3) NULL,
	fcua_ref_compnr [varchar](10) NULL,
	fcub [varchar](3) NULL,
	fcub_ref_compnr [varchar](10) NULL,
	fcuc [varchar](3) NULL,
	fcuc_ref_compnr [varchar](10) NULL,
	lcur [varchar](3) NULL,
	lcur_ref_compnr [varchar](10) NULL,
	ract [varchar](6) NULL,
	ract_ref_compnr [varchar](10) NULL,
	rdub [int] NULL,
	rdub_kw [varchar](255) NULL,
	rduc [int] NULL,
	rduc_kw [varchar](255) NULL,
	sequencenumber [int] NULL,
	taxo_rcmp [int] NULL,
	ztimestamp [datetime] NULL,
	tmub [int] NULL,
	tmub_kw [varchar](255) NULL,
	tmuc [int] NULL,
	tmuc_kw [varchar](255) NULL,
	tzid [varchar](3) NULL,
	tzid_ref_compnr [varchar](10) NULL,
	umfc [int] NULL,
	umfc_kw [varchar](255) NULL,
	username [varchar](8) NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (comp)
)
GO
