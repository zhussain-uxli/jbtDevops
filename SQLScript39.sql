CREATE PROC [dwhcda].[SP_20_AP_Open_Items_fct] AS
BEGIN

	SET NOCOUNT ON;
			    
    IF OBJECT_ID('tempdb..#ap_open_item', 'U') IS NOT NULL
    DROP TABLE #ap_open_item;

    Select * INTO #ap_open_item    
    From [dwhcda].[lnc_fct_AP_Open_Items] where 1 = 2;

	BEGIN TRANSACTION;

	BEGIN TRY
		
--Open_Items

	Insert into [#ap_open_item]
	 ([adcd],[adif],[adty],[adty_kw],[afpy],[afpy_kw],[amnt],[amth_1],[amth_2],[amth_3],[amti],[appr],[appr_kw],[autm],[autm_kw],[baca_1],[baca_2],
	 [baca_3],[baco],[bahc_1],[bahc_2],[bahc_3],[bala],[balc],[balh_1],[balh_2],[balh_3],[bank],[basi],[bdat],[bdsp],[bdsp_kw],[bkrn],[blac],[blac_kw],
	 [bloc],[brat],[bref],[btno],[bust],[bust_kw],[ccrs],[ccur],[cdam_1],[cdam_2],[cdam_3],[cfrs],[clus],[compnr],[copy],[copy_kw],[cpay],[cvat],[dapr],
	 [dc1a],[dc1h_1],[dc1h_2],[dc1h_3],[dc1i],[dc2a],[dc2h_1],[dc2h_2],[dc2h_3],[dc2i],[dc3a],[dc3h_1],[dc3h_2],[dc3h_3],[dc3i],[deleted],[did1],[did2],[did3],
	 [dim1],[dim2],[dim3],[dim4],[dim5],[dim6],[dim7],[dim8],[dim9],[dm10],[dm11],[dm12],[doca],[docd],[dued],[edtp],[edtp_kw],[fcom],[fisu],[flpd],[flpd_kw],
	 [iadr],[icls],[icls_kw],[idmr],[ifbp],[ildp],[ildp_kw],[irdt],[isup],[ityp],[ityp_kw],[lapa],[laph_1],[laph_2],[laph_3],[lapi],[leac],[line],[link],[liqd],
	 [zload],[loco],[lpdt],[lvat],[lvat_kw],[mane],[mane_kw],[msts],[msts_kw],[ninv],[oinv],[optb],[orno],[osch],[osup],[otbp],[otyp],[pada],[padh_1],[padh_2],
	 [padh_3],[padi],[papr],[papr_kw],[paya],[paym],[pdat],[pdif],[pdoc],[pfre],[pfre_kw],[post],[prin],[prin_kw],[prod],[ptbp],[ptyp],[pysh],[pysh_kw],[rade],
	 [rade_kw],[ragr],[ratd],[rate_1],[rate_2],[rate_3],[ratf_1],[ratf_2],[ratf_3],[rcom],[rcpt],[rcpt_kw],[reas],[refr],[retr],[rinv],[rtyp],[schn],[sgdd],
	 [sgdd_kw],[sgtp],[sgtp_kw],[shpi],[shpm],[stap],[stap_kw],[stat],[stat_kw],[step],[step_kw],[subc],[subc_kw],[svah_1],[svah_2],[svah_3],[svam],[tapr],[tbrl],[tcns],[tcns_kw],[tcur],[text],[ztimestamp],[tnpn],[toba],[tore_1],[tore_2],[tore_3],[tpay],[tpay_kw],[ttyp],[txdt],[txtb],[typa],[zuser],[vata],[vatc],[vath_1],[vath_2],[vath_3],[vati],[vatp],[vaty],[vrsm],[whti],[whti_kw],[wtph_1],[wtph_2],[wtph_3],[wtpi],[zyear],[file_name],[dwh_load_time],[Open_Item_fct_key])
select 
[adcd],[adif],[adty],[adty_kw],[afpy],[afpy_kw],[amnt],[amth_1],[amth_2],[amth_3],[amti],[appr],[appr_kw],[autm],[autm_kw],[baca_1],
[baca_2],[baca_3],[baco],[bahc_1],[bahc_2],[bahc_3],[bala],[balc],[balh_1],[balh_2],[balh_3],[bank],[basi],[bdat],[bdsp],[bdsp_kw],[bkrn],[blac],
[blac_kw],[bloc],[brat],[bref],[btno],[bust],[bust_kw],[ccrs],[ccur],[cdam_1],[cdam_2],[cdam_3],[cfrs],[clus],[compnr],[copy],[copy_kw],
[cpay],[cvat],[dapr],[dc1a],[dc1h_1],[dc1h_2],[dc1h_3],[dc1i],[dc2a],[dc2h_1],[dc2h_2],[dc2h_3],[dc2i],[dc3a],[dc3h_1],[dc3h_2],[dc3h_3],[dc3i],[deleted],[did1],
[did2],[did3],[dim1],[dim2],[dim3],[dim4],[dim5],[dim6],[dim7],[dim8],[dim9],[dm10],[dm11],[dm12],[doca],[docd],[dued],[edtp],[edtp_kw],[fcom],[fisu],[flpd],
[flpd_kw],[iadr],[icls],[icls_kw],[idmr],[ifbp],[ildp],[ildp_kw],[irdt],[isup],[ityp],[ityp_kw],[lapa],[laph_1],[laph_2],[laph_3],[lapi],[leac],[line],[link],
[liqd],[zload],[loco],[lpdt],[lvat],[lvat_kw],[mane],[mane_kw],[msts],[msts_kw],[ninv],[oinv],[optb],[orno],[osch],[osup],[otbp],[otyp],[pada],[padh_1],[padh_2]
,[padh_3],[padi],[papr],[papr_kw],[paya],[paym],[pdat],[pdif],[pdoc],[pfre],[pfre_kw],[post],[prin],[prin_kw],[prod],[ptbp],[ptyp],[pysh],[pysh_kw],[rade],
[rade_kw],[ragr],[ratd],[rate_1],[rate_2],[rate_3],[ratf_1],[ratf_2],[ratf_3],[rcom],[rcpt],[rcpt_kw],[reas],[refr],[retr],[rinv],[rtyp],[schn],[sgdd],[sgdd_kw],
[sgtp],[sgtp_kw],[shpi],[shpm],[stap],[stap_kw],[stat],[stat_kw],[step],[step_kw],[subc],[subc_kw],[svah_1],[svah_2],[svah_3],[svam],[tapr],[tbrl],[tcns],
[tcns_kw],[tcur],[text],[ztimestamp],[tnpn],[toba],[tore_1],[tore_2],[tore_3],[tpay],[tpay_kw],[ttyp],[txdt],[txtb],[typa],[zuser],[vata],[vatc],[vath_1],
[vath_2],[vath_3],[vati],[vatp],[vaty],[vrsm],[whti],[whti_kw],[wtph_1],[wtph_2],[wtph_3],[wtpi],[zyear],[file_name],
[dwh_load_time],compnr + '_' + Cast(fcom as Varchar)+ '_' + Cast(line as Varchar)+ '_' + Cast(ninv as Varchar)+ '_' + ttyp  As Open_Item_fct_key 
from [acq101].[dst_tfacp500]  A
Where A.[dwh_load_time] > CASE WHEN (( SELECT count(*) AS count
                                      FROM [dwhcda].[lnc_fct_AP_Open_Items])) = 0 THEN convert(datetime,'1900-01-01 00:00:00')
                                      ELSE ( SELECT max(dwh_load_time) FROM [dwhcda].[lnc_fct_AP_Open_Items]) END OPTION (LABEL = '[SP_20_AP_Open_Items_fct_1]');

MERGE [dwhcda].[lnc_fct_AP_Open_Items] As A
USING [#ap_open_item] as B 
On A.[Open_Item_fct_key] = B.[Open_Item_fct_key] 

WHEN Matched AND B.[ztimestamp] > A.[ztimestamp] THEN UPDATE SET 
A.[adcd] = B.[adcd],A.[adif] = B.[adif],A.[adty] = B.[adty],A.[adty_kw] = B.[adty_kw],A.[afpy] = B.[afpy],A.[afpy_kw] = B.[afpy_kw],A.[amnt] = B.[amnt],A.[amth_1] = B.[amth_1],A.[amth_2] = B.[amth_2],A.[amth_3] = B.[amth_3],A.[amti] = B.[amti],A.[appr] = B.[appr],A.[appr_kw] = B.[appr_kw],A.[autm] = B.[autm],A.[autm_kw] = B.[autm_kw],A.[baca_1] = B.[baca_1],A.[baca_2] = B.[baca_2],A.[baca_3] = B.[baca_3],A.[baco] = B.[baco],A.[bahc_1] = B.[bahc_1],A.[bahc_2] = B.[bahc_2],A.[bahc_3] = B.[bahc_3],A.[bala] = B.[bala],A.[balc] = B.[balc],A.[balh_1] = B.[balh_1],A.[balh_2] = B.[balh_2],A.[balh_3] = B.[balh_3],A.[bank] = B.[bank],A.[basi] = B.[basi],A.[bdat] = B.[bdat],A.[bdsp] = B.[bdsp],A.[bdsp_kw] = B.[bdsp_kw],A.[bkrn] = B.[bkrn],A.[blac] = B.[blac],A.[blac_kw] = B.[blac_kw],A.[bloc] = B.[bloc],A.[brat] = B.[brat],A.[bref] = B.[bref],A.[btno] = B.[btno],A.[bust] = B.[bust],A.[bust_kw] = B.[bust_kw],A.[ccrs] = B.[ccrs],A.[ccur] = B.[ccur],A.[cdam_1] = B.[cdam_1],A.[cdam_2] = B.[cdam_2],A.[cdam_3] = B.[cdam_3],A.[cfrs] = B.[cfrs],A.[clus] = B.[clus],A.[copy] = B.[copy],A.[copy_kw] = B.[copy_kw],A.[cpay] = B.[cpay],A.[cvat] = B.[cvat],A.[dapr] = B.[dapr],A.[dc1a] = B.[dc1a],A.[dc1h_1] = B.[dc1h_1],A.[dc1h_2] = B.[dc1h_2],A.[dc1h_3] = B.[dc1h_3],A.[dc1i] = B.[dc1i],A.[dc2a] = B.[dc2a],A.[dc2h_1] = B.[dc2h_1],A.[dc2h_2] = B.[dc2h_2],A.[dc2h_3] = B.[dc2h_3],A.[dc2i] = B.[dc2i],A.[dc3a] = B.[dc3a],A.[dc3h_1] = B.[dc3h_1],A.[dc3h_2] = B.[dc3h_2],A.[dc3h_3] = B.[dc3h_3],A.[dc3i] = B.[dc3i],A.[deleted] = B.[deleted],A.[did1] = B.[did1],A.[did2] = B.[did2],A.[did3] = B.[did3],A.[dim1] = B.[dim1],A.[dim2] = B.[dim2],A.[dim3] = B.[dim3],A.[dim4] = B.[dim4],A.[dim5] = B.[dim5],A.[dim6] = B.[dim6],A.[dim7] = B.[dim7],A.[dim8] = B.[dim8],A.[dim9] = B.[dim9],A.[dm10] = B.[dm10],A.[dm11] = B.[dm11],A.[dm12] = B.[dm12],A.[doca] = B.[doca],A.[docd] = B.[docd],A.[dued] = B.[dued],A.[edtp] = B.[edtp],A.[edtp_kw] = B.[edtp_kw],A.[fisu] = B.[fisu],A.[flpd] = B.[flpd],A.[flpd_kw] = B.[flpd_kw],A.[iadr] = B.[iadr],A.[icls] = B.[icls],A.[icls_kw] = B.[icls_kw],A.[idmr] = B.[idmr],A.[ifbp] = B.[ifbp],A.[ildp] = B.[ildp],A.[ildp_kw] = B.[ildp_kw],A.[irdt] = B.[irdt],A.[isup] = B.[isup],A.[ityp] = B.[ityp],A.[ityp_kw] = B.[ityp_kw],A.[lapa] = B.[lapa],A.[laph_1] = B.[laph_1],A.[laph_2] = B.[laph_2],A.[laph_3] = B.[laph_3],A.[lapi] = B.[lapi],A.[leac] = B.[leac],A.[link] = B.[link],A.[liqd] = B.[liqd],A.[zload] = B.[zload],A.[loco] = B.[loco],A.[lpdt] = B.[lpdt],A.[lvat] = B.[lvat],A.[lvat_kw] = B.[lvat_kw],A.[mane] = B.[mane],A.[mane_kw] = B.[mane_kw],A.[msts] = B.[msts],A.[msts_kw] = B.[msts_kw],A.[oinv] = B.[oinv],A.[optb] = B.[optb],A.[orno] = B.[orno],A.[osch] = B.[osch],A.[osup] = B.[osup],A.[otbp] = B.[otbp],A.[otyp] = B.[otyp],A.[pada] = B.[pada],A.[padh_1] = B.[padh_1],A.[padh_2] = B.[padh_2],A.[padh_3] = B.[padh_3],A.[padi] = B.[padi],A.[papr] = B.[papr],A.[papr_kw] = B.[papr_kw],A.[paya] = B.[paya],A.[paym] = B.[paym],A.[pdat] = B.[pdat],A.[pdif] = B.[pdif],A.[pdoc] = B.[pdoc],A.[pfre] = B.[pfre],A.[pfre_kw] = B.[pfre_kw],A.[post] = B.[post],A.[prin] = B.[prin],A.[prin_kw] = B.[prin_kw],A.[prod] = B.[prod],A.[ptbp] = B.[ptbp],A.[ptyp] = B.[ptyp],A.[pysh] = B.[pysh],A.[pysh_kw] = B.[pysh_kw],A.[rade] = B.[rade],A.[rade_kw] = B.[rade_kw],A.[ragr] = B.[ragr],A.[ratd] = B.[ratd],A.[rate_1] = B.[rate_1],A.[rate_2] = B.[rate_2],A.[rate_3] = B.[rate_3],A.[ratf_1] = B.[ratf_1],A.[ratf_2] = B.[ratf_2],A.[ratf_3] = B.[ratf_3],A.[rcom] = B.[rcom],A.[rcpt] = B.[rcpt],A.[rcpt_kw] = B.[rcpt_kw],A.[reas] = B.[reas],A.[refr] = B.[refr],A.[retr] = B.[retr],A.[rinv] = B.[rinv],A.[rtyp] = B.[rtyp],A.[schn] = B.[schn],A.[sgdd] = B.[sgdd],A.[sgdd_kw] = B.[sgdd_kw],A.[sgtp] = B.[sgtp],A.[sgtp_kw] = B.[sgtp_kw],A.[shpi] = B.[shpi],A.[shpm] = B.[shpm],A.[stap] = B.[stap],A.[stap_kw] = B.[stap_kw],A.[stat] = B.[stat],A.[stat_kw] = B.[stat_kw],A.[step] = B.[step],A.[step_kw] = B.[step_kw],A.[subc] = B.[subc],A.[subc_kw] = B.[subc_kw],A.[svah_1] = B.[svah_1],A.[svah_2] = B.[svah_2],A.[svah_3] = B.[svah_3],A.[svam] = B.[svam],A.[tapr] = B.[tapr],A.[tbrl] = B.[tbrl],A.[tcns] = B.[tcns],A.[tcns_kw] = B.[tcns_kw],A.[tcur] = B.[tcur],A.[text] = B.[text],A.[ztimestamp] = B.[ztimestamp],A.[tnpn] = B.[tnpn],A.[toba] = B.[toba],A.[tore_1] = B.[tore_1],A.[tore_2] = B.[tore_2],A.[tore_3] = B.[tore_3],A.[tpay] = B.[tpay],A.[tpay_kw] = B.[tpay_kw],A.[txdt] = B.[txdt],A.[txtb] = B.[txtb],A.[typa] = B.[typa],A.[zuser] = B.[zuser],A.[vata] = B.[vata],A.[vatc] = B.[vatc],A.[vath_1] = B.[vath_1],A.[vath_2] = B.[vath_2],A.[vath_3] = B.[vath_3],A.[vati] = B.[vati],A.[vatp] = B.[vatp],A.[vaty] = B.[vaty],A.[vrsm] = B.[vrsm],A.[whti] = B.[whti],A.[whti_kw] = B.[whti_kw],A.[wtph_1] = B.[wtph_1],A.[wtph_2] = B.[wtph_2],A.[wtph_3] = B.[wtph_3],A.[wtpi] = B.[wtpi],A.[zyear] = B.[zyear],A.[file_name] = B.[file_name],A.[dwh_load_time] = B.[dwh_load_time]

WHEN NOT MATCHED BY TARGET THEN 
Insert ([adcd],[adif],[adty],[adty_kw],[afpy],[afpy_kw],[amnt],[amth_1],[amth_2],[amth_3],[amti],[appr],[appr_kw],[autm],[autm_kw],[baca_1],[baca_2],[baca_3],[baco],[bahc_1],[bahc_2],[bahc_3],[bala],[balc],[balh_1],[balh_2],[balh_3],[bank],[basi],[bdat],[bdsp],[bdsp_kw],[bkrn],[blac],[blac_kw],[bloc],[brat],[bref],[btno],[bust],[bust_kw],[ccrs],[ccur],[cdam_1],[cdam_2],[cdam_3],[cfrs],[clus],[compnr],[copy],[copy_kw],[cpay],[cvat],[dapr],[dc1a],[dc1h_1],[dc1h_2],[dc1h_3],[dc1i],[dc2a],[dc2h_1],[dc2h_2],[dc2h_3],[dc2i],[dc3a],[dc3h_1],[dc3h_2],[dc3h_3],[dc3i],[deleted],[did1],[did2],[did3],[dim1],[dim2],[dim3],[dim4],[dim5],[dim6],[dim7],[dim8],[dim9],[dm10],[dm11],[dm12],[doca],[docd],[dued],[edtp],[edtp_kw],[fcom],[fisu],[flpd],[flpd_kw],[iadr],[icls],[icls_kw],[idmr],[ifbp],[ildp],[ildp_kw],[irdt],[isup],[ityp],[ityp_kw],[lapa],[laph_1],[laph_2],[laph_3],[lapi],[leac],[line],[link],[liqd],[zload],[loco],[lpdt],[lvat],[lvat_kw],[mane],[mane_kw],[msts],[msts_kw],[ninv],[oinv],[optb],[orno],[osch],[osup],[otbp],[otyp],[pada],[padh_1],[padh_2],[padh_3],[padi],[papr],[papr_kw],[paya],[paym],[pdat],[pdif],[pdoc],[pfre],[pfre_kw],[post],[prin],[prin_kw],[prod],[ptbp],[ptyp],[pysh],[pysh_kw],[rade],[rade_kw],[ragr],[ratd],[rate_1],[rate_2],[rate_3],[ratf_1],[ratf_2],[ratf_3],[rcom],[rcpt],[rcpt_kw],[reas],[refr],[retr],[rinv],[rtyp],[schn],[sgdd],[sgdd_kw],[sgtp],[sgtp_kw],[shpi],[shpm],[stap],[stap_kw],[stat],[stat_kw],[step],[step_kw],[subc],[subc_kw],[svah_1],[svah_2],[svah_3],[svam],[tapr],[tbrl],[tcns],[tcns_kw],[tcur],[text],[ztimestamp],[tnpn],[toba],[tore_1],[tore_2],[tore_3],[tpay],[tpay_kw],[ttyp],[txdt],[txtb],[typa],[zuser],[vata],[vatc],[vath_1],[vath_2],[vath_3],[vati],[vatp],[vaty],[vrsm],[whti],[whti_kw],[wtph_1],[wtph_2],[wtph_3],[wtpi],[zyear],[file_name],[dwh_load_time],[Open_Item_fct_key])
VALUES
(B.[adcd],B.[adif],B.[adty],B.[adty_kw],B.[afpy],B.[afpy_kw],B.[amnt],B.[amth_1],B.[amth_2],B.[amth_3],B.[amti],B.[appr],B.[appr_kw],B.[autm],B.[autm_kw],B.[baca_1],B.[baca_2],B.[baca_3],B.[baco],B.[bahc_1],B.[bahc_2],B.[bahc_3],B.[bala],B.[balc],B.[balh_1],B.[balh_2],B.[balh_3],B.[bank],B.[basi],B.[bdat],B.[bdsp],B.[bdsp_kw],B.[bkrn],B.[blac],B.[blac_kw],B.[bloc],B.[brat],B.[bref],B.[btno],B.[bust],B.[bust_kw],B.[ccrs],B.[ccur],B.[cdam_1],B.[cdam_2],B.[cdam_3],B.[cfrs],B.[clus],B.[compnr],B.[copy],B.[copy_kw],B.[cpay],B.[cvat],B.[dapr],B.[dc1a],B.[dc1h_1],B.[dc1h_2],B.[dc1h_3],B.[dc1i],B.[dc2a],B.[dc2h_1],B.[dc2h_2],B.[dc2h_3],B.[dc2i],B.[dc3a],B.[dc3h_1],B.[dc3h_2],B.[dc3h_3],B.[dc3i],B.[deleted],B.[did1],B.[did2],B.[did3],B.[dim1],B.[dim2],B.[dim3],B.[dim4],B.[dim5],B.[dim6],B.[dim7],B.[dim8],B.[dim9],B.[dm10],B.[dm11],B.[dm12],B.[doca],B.[docd],B.[dued],B.[edtp],B.[edtp_kw],B.[fcom],B.[fisu],B.[flpd],B.[flpd_kw],B.[iadr],B.[icls],B.[icls_kw],B.[idmr],B.[ifbp],B.[ildp],B.[ildp_kw],B.[irdt],B.[isup],B.[ityp],B.[ityp_kw],B.[lapa],B.[laph_1],B.[laph_2],B.[laph_3],B.[lapi],B.[leac],B.[line],B.[link],B.[liqd],B.[zload],B.[loco],B.[lpdt],B.[lvat],B.[lvat_kw],B.[mane],B.[mane_kw],B.[msts],B.[msts_kw],B.[ninv],B.[oinv],B.[optb],B.[orno],B.[osch],B.[osup],B.[otbp],B.[otyp],B.[pada],B.[padh_1],B.[padh_2],B.[padh_3],B.[padi],B.[papr],B.[papr_kw],B.[paya],B.[paym],B.[pdat],B.[pdif],B.[pdoc],B.[pfre],B.[pfre_kw],B.[post],B.[prin],B.[prin_kw],B.[prod],B.[ptbp],B.[ptyp],B.[pysh],B.[pysh_kw],B.[rade],B.[rade_kw],B.[ragr],B.[ratd],B.[rate_1],B.[rate_2],B.[rate_3],B.[ratf_1],B.[ratf_2],B.[ratf_3],B.[rcom],B.[rcpt],B.[rcpt_kw],B.[reas],B.[refr],B.[retr],B.[rinv],B.[rtyp],B.[schn],B.[sgdd],B.[sgdd_kw],B.[sgtp],B.[sgtp_kw],B.[shpi],B.[shpm],B.[stap],B.[stap_kw],B.[stat],B.[stat_kw],B.[step],B.[step_kw],B.[subc],B.[subc_kw],B.[svah_1],B.[svah_2],B.[svah_3],B.[svam],B.[tapr],B.[tbrl],B.[tcns],B.[tcns_kw],B.[tcur],B.[text],B.[ztimestamp],B.[tnpn],B.[toba],B.[tore_1],B.[tore_2],B.[tore_3],B.[tpay],B.[tpay_kw],B.[ttyp],B.[txdt],B.[txtb],B.[typa],B.[zuser],B.[vata],B.[vatc],B.[vath_1],B.[vath_2],B.[vath_3],B.[vati],B.[vatp],B.[vaty],B.[vrsm],B.[whti],B.[whti_kw],B.[wtph_1],B.[wtph_2],B.[wtph_3],B.[wtpi],B.[zyear],B.[file_name],B.[dwh_load_time],B.[Open_Item_fct_key])
OPTION (LABEL = '[SP_20_AP_Open_Items_fct_8]');

									  
	END TRY

	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		ELSE
			COMMIT TRANSACTION;

		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

		SELECT @ErrorMessage = ERROR_MESSAGE();

		SELECT @ErrorSeverity = ERROR_SEVERITY();

		SELECT @ErrorState = ERROR_STATE();

		RAISERROR (
				@ErrorMessage
				,@ErrorSeverity
				,@ErrorState
				);
	END CATCH

	COMMIT TRANSACTION;
END;
GO


