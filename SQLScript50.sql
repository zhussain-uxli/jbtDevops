/**********************************************************************************************************************
Table Name: [dwhcda].[lnc_fct_GL_hist_opening_balance]
Description: This is a Fact table for GL Actual Ledger History GL Opening Balances

Data Type: Fact Data

Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 25/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [dwhcda].[lnc_fct_GL_hist_opening_balance];

CREATE TABLE [dwhcda].[lnc_fct_GL_hist_opening_balance] 
(
	bpid [varchar](9) NOT NULL,
	ccur [varchar](3) NOT NULL,
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
	ztimestamp [datetime] NULL,
	zyear [int] NOT NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL,
	GL_hist_open_bal_key [varchar](255) NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (GL_hist_open_bal_key)
)
GO

/**********************************************************************************************************************
Table Name: [dwhcda].[lnc_fct_GL_hist_transactions]
Description: This is a Fact table for GL Actual Ledger History GL Transactions

Data Type: Fact Data

Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 25/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [dwhcda].[lnc_fct_GL_hist_transactions];

CREATE TABLE [dwhcda].[lnc_fct_GL_hist_transactions] 
(
	bpid [varchar](9) NOT NULL,
	ccur [varchar](3) NOT NULL,
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
	ztimestamp [datetime] NULL,
	zyear [int] NOT NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL,
	GL_hist_trans_key [varchar](255) NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (GL_hist_trans_key)
)
GO

/**********************************************************************************************************************
Table Name: [dwhcda].[lnc_fct_forecast_budget_amount]
Description: This is a Fact table for GL Forecast Budget Amounts

Data Type: Fact Data

Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 26/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [dwhcda].[lnc_fct_forecast_budget_amount];

CREATE TABLE [dwhcda].[lnc_fct_forecast_budget_amount] 
(
	amnt [float] NULL,
	back [int] NULL,
	back_kw [varchar](255) NULL,
	budg [varchar](3) NOT NULL,
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
	dt11 [int] NULL,
	dt12 [int] NULL,
	dty1 [int] NULL,
	dty2 [int] NULL,
	dty3 [int] NULL,
	dty4 [int] NULL,
	dty5 [int] NULL,
	dty6 [int] NULL,
	dty7 [int] NULL,
	dty8 [int] NULL,
	dty9 [int] NULL,
	leac [varchar](12) NOT NULL,
	olap [int] NULL,
	peri [int] NOT NULL,
	qan1 [float] NULL,
	qan2 [float] NULL,
	stam [float] NULL,
	ztimestamp [datetime] NULL,
	zyear [int] NOT NULL,
	file_name [varchar](100) NOT NULL,
	dwh_load_time [datetime] NOT NULL,
	db_cr_amnt [float] NULL,
	frct_budg_amt_key [varchar](255) NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (frct_budg_amt_key)
)
GO

/**********************************************************************************************************************
Table Name: [dwhcda].[lnc_fct_GL_finalized_transactions]
Description: This is a Fact table for GL Actual Finalized Transactions

Data Type: Fact Data

Original Project: JBT Finance GL
Developer: Mohammed Majid
Date: 26/08/2021
Reviewed By: Atul Raje

Change History:N/A
**********************************************************************************************************************/

--DROP TABLE [dwhcda].[lnc_fct_GL_finalized_transactions];

CREATE TABLE [dwhcda].[lnc_fct_GL_finalized_transactions] 
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
	tcsh [int] NULL,
	tcsh_kw [varchar](255) NULL,
	tedt [varchar](10) NULL,
	ztime [int] NULL,
	ztimestamp [datetime] NULL,
	ztran [int] NULL,
	tran_kw [varchar](255) NULL,
	trun [int] NULL,
	txta [int] NULL,
	typ1 [int] NULL,
	typ2 [int] NULL,
	typ3 [int] NULL,
	typ4 [int] NULL,
	typ5 [int] NULL,
	zuser [varchar](16) NULL,
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
	dwh_load_time [datetime] NOT NULL,
	db_cr_amnt [float] NULL,
	GL_finz_trans_key [varchar](70) NOT NULL
)
WITH
(
	DISTRIBUTION = HASH (GL_finz_trans_key)
)
GO

