CREATE PROC [dwhcda].[SP_23_AP_Pur_Pay_Rcpt_for_Ord_Sch_fct] AS
BEGIN

	SET NOCOUNT ON;
			    
    IF OBJECT_ID('tempdb..#ap_Purchase_Payable', 'U') IS NOT NULL
    DROP TABLE #ap_Purchase_Payable;

    Select * INTO #ap_Purchase_Payable   
    From [dwhcda].[lnc_fct_AP_Pur_Pay_Rcpt_for_Ord_Sch] where 1 = 2;

	BEGIN TRANSACTION;

	BEGIN TRY
		
--Purchase Payable Receipts For Orders And Schedules

 Insert into #ap_Purchase_Payable
 ([amld],[amod],[ccof],[cdis_1],[cdis_10],[cdis_11],[cdis_2],[cdis_3],[cdis_4],[cdis_5],[cdis_6],[cdis_7],[cdis_8],[cdis_9],[cnig],[cnig_kw],[compnr],[cono],[cpon],[csqn],[cupp],[cvpp],[deleted],[disc_1],[disc_10],[disc_11],[disc_2],[disc_3],[disc_4],[disc_5],[disc_6],[disc_7],[disc_8],[disc_9],[dmde_1],[dmde_10],[dmde_11],[dmde_2],[dmde_3],[dmde_4],[dmde_5],[dmde_6],[dmde_7],[dmde_8],[dmde_9],[dmse_1],[dmse_10],[dmse_11],[dmse_2],[dmse_3],[dmse_4],[dmse_5],[dmse_6],[dmse_7],[dmse_8],[dmse_9],[dmth_1],[dmth_10],[dmth_11],[dmth_2],[dmth_3],[dmth_4],[dmth_5],[dmth_6],[dmth_7],[dmth_8],[dmth_9],[dmth_kw_1],[dmth_kw_10],[dmth_kw_11],[dmth_kw_2],[dmth_kw_3],[dmth_kw_4],[dmth_kw_5],[dmth_kw_6],[dmth_kw_7],[dmth_kw_8],[dmth_kw_9],[dmty_1],[dmty_10],[dmty_11],[dmty_2],[dmty_3],[dmty_4],[dmty_5],[dmty_6],[dmty_7],[dmty_8],[dmty_9],[dmty_kw_1],[dmty_kw_10],[dmty_kw_11],[dmty_kw_2],[dmty_kw_3],[dmty_kw_4],[dmty_kw_5],[dmty_kw_6],[dmty_kw_7],[dmty_kw_8],[dmty_kw_9],[dorg_1],[dorg_10],[dorg_11],[dorg_2],[dorg_3],[dorg_4],[dorg_5],[dorg_6],[dorg_7],[dorg_8],[dorg_9],[dorg_kw_1],[dorg_kw_10],[dorg_kw_11],[dorg_kw_2],[dorg_kw_3],[dorg_kw_4],[dorg_kw_5],[dorg_kw_6],[dorg_kw_7],[dorg_kw_8],[dorg_kw_9],[dtrm],[dtrm_kw],[elgb],[elgb_kw],[ftdt],[iamt],[invd],[invn],[ldam_1],[ldam_10],[ldam_11],[ldam_2],[ldam_3],[ldam_4],[ldam_5],[ldam_6],[ldam_7],[ldam_8],[ldam_9],[opsq],[orno],[pamt],[pmde],[pmse],[pono],[porg],[porg_kw],[pric],[zproc],[proc_kw],[prsg],[psqn],[ptyp],[ptyp_kw],[qiiv],[qipr],[ract],[ract_kw],[rarc],[rarc_kw],[rsqn],[sqnb],[stsc],[stsc_kw],[stsd],[stsd_kw],[styp],[styp_kw],[ztimestamp],[uldt],[usdt],[file_name],[dwh_load_time],Pur_Pay_fct_key)
 select 
  [amld],[amod],[ccof],[cdis_1],[cdis_10],[cdis_11],[cdis_2],[cdis_3],[cdis_4],[cdis_5],[cdis_6],[cdis_7],[cdis_8],[cdis_9],[cnig],[cnig_kw],[compnr],[cono],[cpon],[csqn],[cupp],[cvpp],[deleted],[disc_1],[disc_10],[disc_11],[disc_2],[disc_3],[disc_4],[disc_5],[disc_6],[disc_7],[disc_8],[disc_9],[dmde_1],[dmde_10],[dmde_11],[dmde_2],[dmde_3],[dmde_4],[dmde_5],[dmde_6],[dmde_7],[dmde_8],[dmde_9],[dmse_1],[dmse_10],[dmse_11],[dmse_2],[dmse_3],[dmse_4],[dmse_5],[dmse_6],[dmse_7],[dmse_8],[dmse_9],[dmth_1],[dmth_10],[dmth_11],[dmth_2],[dmth_3],[dmth_4],[dmth_5],[dmth_6],[dmth_7],[dmth_8],[dmth_9],[dmth_kw_1],[dmth_kw_10],[dmth_kw_11],[dmth_kw_2],[dmth_kw_3],[dmth_kw_4],[dmth_kw_5],[dmth_kw_6],[dmth_kw_7],[dmth_kw_8],[dmth_kw_9],[dmty_1],[dmty_10],[dmty_11],[dmty_2],[dmty_3],[dmty_4],[dmty_5],[dmty_6],[dmty_7],[dmty_8],[dmty_9],[dmty_kw_1],[dmty_kw_10],[dmty_kw_11],[dmty_kw_2],[dmty_kw_3],[dmty_kw_4],[dmty_kw_5],[dmty_kw_6],[dmty_kw_7],[dmty_kw_8],[dmty_kw_9],[dorg_1],[dorg_10],[dorg_11],[dorg_2],[dorg_3],[dorg_4],[dorg_5],[dorg_6],[dorg_7],[dorg_8],[dorg_9],[dorg_kw_1],[dorg_kw_10],[dorg_kw_11],[dorg_kw_2],[dorg_kw_3],[dorg_kw_4],[dorg_kw_5],[dorg_kw_6],[dorg_kw_7],[dorg_kw_8],[dorg_kw_9],[dtrm],[dtrm_kw],[elgb],[elgb_kw],[ftdt],[iamt],[invd],[invn],[ldam_1],[ldam_10],[ldam_11],[ldam_2],[ldam_3],[ldam_4],[ldam_5],[ldam_6],[ldam_7],[ldam_8],[ldam_9],[opsq],[orno],[pamt],[pmde],[pmse],[pono],[porg],[porg_kw],[pric],[zproc],[proc_kw],[prsg],[psqn],[ptyp],[ptyp_kw],[qiiv],[qipr],[ract],[ract_kw],[rarc],[rarc_kw],[rsqn],[sqnb],[stsc],[stsc_kw],[stsd],[stsd_kw],[styp],[styp_kw],[ztimestamp],[uldt],[usdt],[file_name],[dwh_load_time],compnr + '_' + orno + '_' + Cast(pono as Varchar) + '_' + Cast(psqn as Varchar)+ '_' + Cast(rsqn as Varchar)+ '_' +  Cast(sqnb as Varchar) As Pur_Pay_fct_key from [acq101].[dst_tdpur430] A
  Where A.[dwh_load_time] > CASE WHEN (( SELECT count(*) AS count
                                      FROM [dwhcda].[lnc_fct_AP_Pur_Pay_Rcpt_for_Ord_Sch])) = 0 THEN convert(datetime,'1900-01-01 00:00:00')
                                      ELSE ( SELECT max(dwh_load_time) FROM [dwhcda].[lnc_fct_AP_Pur_Pay_Rcpt_for_Ord_Sch]) END OPTION (LABEL = '[SP_12_AP_Pur_Payable_fct_1]');



MERGE [dwhcda].[lnc_fct_AP_Pur_Pay_Rcpt_for_Ord_Sch] As A
USING [#ap_Purchase_Payable] as B 
On A.[Pur_Pay_fct_key] = B.[Pur_Pay_fct_key] 
WHEN Matched AND B.[ztimestamp] > A.[ztimestamp] THEN UPDATE SET 
A.[amld] = B. [amld],A.[amod] =B.[amod],A.[ccof] =B.[ccof],A.[cdis_1] =B.[cdis_1],A.[cdis_10] =B.[cdis_10],A.[cdis_11] =B.[cdis_11],A.[cdis_2] =B.[cdis_2],A.[cdis_3] =B.[cdis_3],A.[cdis_4] =B.[cdis_4],A.[cdis_5] =B.[cdis_5],A.[cdis_6] =B.[cdis_6],A.[cdis_7] =B.[cdis_7],A.[cdis_8] =B.[cdis_8],A.[cdis_9] =B.[cdis_9],A.[cnig] =B.[cnig],A.[cnig_kw] =B.[cnig_kw],
A.[cono] =B.[cono],A.[cpon] =B.[cpon],A.[csqn] =B.[csqn],A.[cupp] =B.[cupp],A.[cvpp] =B.[cvpp],A.[deleted] =B.[deleted],A.[disc_1] =B.[disc_1],A.[disc_10] =B.[disc_10],A.[disc_11] =B.[disc_11],A.[disc_2] =B.[disc_2],A.[disc_3] =B.[disc_3],A.[disc_4] =B.[disc_4],A.[disc_5] =B.[disc_5],A.[disc_6] =B.[disc_6],A.[disc_7] =B.[disc_7],A.[disc_8] =B.[disc_8],A.[disc_9] =B.[disc_9],A.[dmde_1] =B.[dmde_1],A.[dmde_10] =B.[dmde_10],A.[dmde_11] =B.[dmde_11],A.[dmde_2] =B.[dmde_2],A.[dmde_3] =B.[dmde_3],A.[dmde_4] =B.[dmde_4],A.[dmde_5] =B.[dmde_5],A.[dmde_6] =B.[dmde_6],A.[dmde_7] =B.[dmde_7],A.[dmde_8] =B.[dmde_8],A.[dmde_9] =B.[dmde_9],A.[dmse_1] =B.[dmse_1],A.[dmse_10] =B.[dmse_10],A.[dmse_11] =B.[dmse_11],A.[dmse_2] =B.[dmse_2],A.[dmse_3] =B.[dmse_3],A.[dmse_4] =B.[dmse_4],A.[dmse_5] =B.[dmse_5],A.[dmse_6] =B.[dmse_6],A.[dmse_7] =B.[dmse_7],A.[dmse_8] =B.[dmse_8],A.[dmse_9] =B.[dmse_9],A.[dmth_1] =B.[dmth_1],A.[dmth_10] =B.[dmth_10],A.[dmth_11] =B.[dmth_11],A.[dmth_2] =B.[dmth_2],A.[dmth_3] =B.[dmth_3],A.[dmth_4] =B.[dmth_4],A.[dmth_5] =B.[dmth_5],A.[dmth_6] =B.[dmth_6],A.[dmth_7] =B.[dmth_7],A.[dmth_8] =B.[dmth_8],A.[dmth_9] =B.[dmth_9],A.[dmth_kw_1] =B.[dmth_kw_1],A.[dmth_kw_10] =B.[dmth_kw_10],A.[dmth_kw_11] =B.[dmth_kw_11],A.[dmth_kw_2] =B.[dmth_kw_2],A.[dmth_kw_3] =B.[dmth_kw_3],A.[dmth_kw_4] =B.[dmth_kw_4],A.[dmth_kw_5] =B.[dmth_kw_5],A.[dmth_kw_6] =B.[dmth_kw_6],A.[dmth_kw_7] =B.[dmth_kw_7],A.[dmth_kw_8] =B.[dmth_kw_8],A.[dmth_kw_9] =B.[dmth_kw_9],A.[dmty_1] =B.[dmty_1],A.[dmty_10] =B.[dmty_10],A.[dmty_11] =B.[dmty_11],A.[dmty_2] =B.[dmty_2],A.[dmty_3] =B.[dmty_3],A.[dmty_4] =B.[dmty_4],A.[dmty_5] =B.[dmty_5],A.[dmty_6] =B.[dmty_6],A.[dmty_7] =B.[dmty_7],A.[dmty_8] =B.[dmty_8],A.[dmty_9] =B.[dmty_9],A.[dmty_kw_1] =B.[dmty_kw_1],A.[dmty_kw_10] =B.[dmty_kw_10],A.[dmty_kw_11] =B.[dmty_kw_11],A.[dmty_kw_2] =B.[dmty_kw_2],A.[dmty_kw_3] =B.[dmty_kw_3],A.[dmty_kw_4] =B.[dmty_kw_4],A.[dmty_kw_5] =B.[dmty_kw_5],A.[dmty_kw_6] =B.[dmty_kw_6],A.[dmty_kw_7] =B.[dmty_kw_7],A.[dmty_kw_8] =B.[dmty_kw_8],A.[dmty_kw_9] =B.[dmty_kw_9],A.[dorg_1] =B.[dorg_1],A.[dorg_10] =B.[dorg_10],A.[dorg_11] =B.[dorg_11],A.[dorg_2] =B.[dorg_2],A.[dorg_3] =B.[dorg_3],A.[dorg_4] =B.[dorg_4],A.[dorg_5] =B.[dorg_5],A.[dorg_6] =B.[dorg_6],A.[dorg_7] =B.[dorg_7],A.[dorg_8] =B.[dorg_8],A.[dorg_9] =B.[dorg_9],A.[dorg_kw_1] =B.[dorg_kw_1],A.[dorg_kw_10] =B.[dorg_kw_10],A.[dorg_kw_11] =B.[dorg_kw_11],A.[dorg_kw_2] =B.[dorg_kw_2],A.[dorg_kw_3] =B.[dorg_kw_3],A.[dorg_kw_4] =B.[dorg_kw_4],A.[dorg_kw_5] =B.[dorg_kw_5],A.[dorg_kw_6] =B.[dorg_kw_6],A.[dorg_kw_7] =B.[dorg_kw_7],A.[dorg_kw_8] =B.[dorg_kw_8],A.[dorg_kw_9] =B.[dorg_kw_9],A.[dtrm] =B.[dtrm],A.[dtrm_kw] =B.[dtrm_kw],A.[elgb] =B.[elgb],A.[elgb_kw] =B.[elgb_kw],A.[ftdt] =B.[ftdt],A.[iamt] =B.[iamt],A.[invd] =B.[invd],A.[invn] =B.[invn],A.[ldam_1] =B.[ldam_1],A.[ldam_10] =B.[ldam_10],A.[ldam_11] =B.[ldam_11],A.[ldam_2] =B.[ldam_2],A.[ldam_3] =B.[ldam_3],A.[ldam_4] =B.[ldam_4],A.[ldam_5] =B.[ldam_5],A.[ldam_6] =B.[ldam_6],A.[ldam_7] =B.[ldam_7],A.[ldam_8] =B.[ldam_8],A.[ldam_9] =B.[ldam_9],A.[opsq] =B.[opsq],A.[pamt] =B.[pamt],A.[pmde] =B.[pmde],A.[pmse] =B.[pmse],A.[porg] =B.[porg],A.[porg_kw] =B.[porg_kw],A.[pric] =B.[pric],A.[zproc] =B.[zproc],A.[proc_kw] =B.[proc_kw],A.[prsg] =B.[prsg],A.[ptyp] =B.[ptyp],A.[ptyp_kw] =B.[ptyp_kw],A.[qiiv] =B.[qiiv],A.[qipr] =B.[qipr],A.[ract] =B.[ract],A.[ract_kw] =B.[ract_kw],A.[rarc] =B.[rarc],A.[rarc_kw] =B.[rarc_kw],A.[stsc] =B.[stsc],A.[stsc_kw] =B.[stsc_kw],A.[stsd] =B.[stsd],A.[stsd_kw] =B.[stsd_kw],A.[styp] =B.[styp],A.[styp_kw] =B.[styp_kw],A.[ztimestamp] =B.[ztimestamp],A.[uldt] =B.[uldt],A.[usdt] =B.[usdt],A.[file_name] =B.[file_name],A.[dwh_load_time] =B.[dwh_load_time]
WHEN NOT MATCHED BY TARGET THEN 
Insert ([amld],[amod],[ccof],[cdis_1],[cdis_10],[cdis_11],[cdis_2],[cdis_3],[cdis_4],[cdis_5],[cdis_6],[cdis_7],[cdis_8],[cdis_9],[cnig],[cnig_kw],[compnr],[cono],[cpon],[csqn],[cupp],[cvpp],[deleted],[disc_1],[disc_10],[disc_11],[disc_2],[disc_3],[disc_4],[disc_5],[disc_6],[disc_7],[disc_8],[disc_9],[dmde_1],[dmde_10],[dmde_11],[dmde_2],[dmde_3],[dmde_4],[dmde_5],[dmde_6],[dmde_7],[dmde_8],[dmde_9],[dmse_1],[dmse_10],[dmse_11],[dmse_2],[dmse_3],[dmse_4],[dmse_5],[dmse_6],[dmse_7],[dmse_8],[dmse_9],[dmth_1],[dmth_10],[dmth_11],[dmth_2],[dmth_3],[dmth_4],[dmth_5],[dmth_6],[dmth_7],[dmth_8],[dmth_9],[dmth_kw_1],[dmth_kw_10],[dmth_kw_11],[dmth_kw_2],[dmth_kw_3],[dmth_kw_4],[dmth_kw_5],[dmth_kw_6],[dmth_kw_7],[dmth_kw_8],[dmth_kw_9],[dmty_1],[dmty_10],[dmty_11],[dmty_2],[dmty_3],[dmty_4],[dmty_5],[dmty_6],[dmty_7],[dmty_8],[dmty_9],[dmty_kw_1],[dmty_kw_10],[dmty_kw_11],[dmty_kw_2],[dmty_kw_3],[dmty_kw_4],[dmty_kw_5],[dmty_kw_6],[dmty_kw_7],[dmty_kw_8],[dmty_kw_9],[dorg_1],[dorg_10],[dorg_11],[dorg_2],[dorg_3],[dorg_4],[dorg_5],[dorg_6],[dorg_7],[dorg_8],[dorg_9],[dorg_kw_1],[dorg_kw_10],[dorg_kw_11],[dorg_kw_2],[dorg_kw_3],[dorg_kw_4],[dorg_kw_5],[dorg_kw_6],[dorg_kw_7],[dorg_kw_8],[dorg_kw_9],[dtrm],[dtrm_kw],[elgb],[elgb_kw],[ftdt],[iamt],[invd],[invn],[ldam_1],[ldam_10],[ldam_11],[ldam_2],[ldam_3],[ldam_4],[ldam_5],[ldam_6],[ldam_7],[ldam_8],[ldam_9],[opsq],[orno],[pamt],[pmde],[pmse],[pono],[porg],[porg_kw],[pric],[zproc],[proc_kw],[prsg],[psqn],[ptyp],[ptyp_kw],[qiiv],[qipr],[ract],[ract_kw],[rarc],[rarc_kw],[rsqn],[sqnb],[stsc],[stsc_kw],[stsd],[stsd_kw],[styp],[styp_kw],[ztimestamp],[uldt],[usdt],[file_name],[dwh_load_time],[Pur_Pay_fct_key])
VALUES
(B.[amld],B.[amod],B.[ccof],B.[cdis_1],B.[cdis_10],B.[cdis_11],B.[cdis_2],B.[cdis_3],B.[cdis_4],B.[cdis_5],B.[cdis_6],B.[cdis_7],B.[cdis_8],B.[cdis_9],B.[cnig],B.[cnig_kw],B.[compnr],B.[cono],B.[cpon],B.[csqn],B.[cupp],B.[cvpp],B.[deleted],B.[disc_1],B.[disc_10],B.[disc_11],B.[disc_2],B.[disc_3],B.[disc_4],B.[disc_5],B.[disc_6],B.[disc_7],B.[disc_8],B.[disc_9],B.[dmde_1],B.[dmde_10],B.[dmde_11],B.[dmde_2],B.[dmde_3],B.[dmde_4],B.[dmde_5],B.[dmde_6],B.[dmde_7],B.[dmde_8],B.[dmde_9],B.[dmse_1],B.[dmse_10],B.[dmse_11],B.[dmse_2],B.[dmse_3],B.[dmse_4],B.[dmse_5],B.[dmse_6],B.[dmse_7],B.[dmse_8],B.[dmse_9],B.[dmth_1],B.[dmth_10],B.[dmth_11],B.[dmth_2],B.[dmth_3],B.[dmth_4],B.[dmth_5],B.[dmth_6],B.[dmth_7],B.[dmth_8],B.[dmth_9],B.[dmth_kw_1],B.[dmth_kw_10],B.[dmth_kw_11],B.[dmth_kw_2],B.[dmth_kw_3],B.[dmth_kw_4],B.[dmth_kw_5],B.[dmth_kw_6],B.[dmth_kw_7],B.[dmth_kw_8],B.[dmth_kw_9],B.[dmty_1],B.[dmty_10],B.[dmty_11],B.[dmty_2],B.[dmty_3],B.[dmty_4],B.[dmty_5],B.[dmty_6],B.[dmty_7],B.[dmty_8],B.[dmty_9],B.[dmty_kw_1],B.[dmty_kw_10],B.[dmty_kw_11],B.[dmty_kw_2],B.[dmty_kw_3],B.[dmty_kw_4],B.[dmty_kw_5],B.[dmty_kw_6],B.[dmty_kw_7],B.[dmty_kw_8],B.[dmty_kw_9],B.[dorg_1],B.[dorg_10],B.[dorg_11],B.[dorg_2],B.[dorg_3],B.[dorg_4],B.[dorg_5],B.[dorg_6],B.[dorg_7],B.[dorg_8],B.[dorg_9],B.[dorg_kw_1],B.[dorg_kw_10],B.[dorg_kw_11],B.[dorg_kw_2],B.[dorg_kw_3],B.[dorg_kw_4],B.[dorg_kw_5],B.[dorg_kw_6],B.[dorg_kw_7],B.[dorg_kw_8],B.[dorg_kw_9],B.[dtrm],B.[dtrm_kw],B.[elgb],B.[elgb_kw],B.[ftdt],B.[iamt],B.[invd],B.[invn],B.[ldam_1],B.[ldam_10],B.[ldam_11],B.[ldam_2],B.[ldam_3],B.[ldam_4],B.[ldam_5],B.[ldam_6],B.[ldam_7],B.[ldam_8],B.[ldam_9],B.[opsq],B.[orno],B.[pamt],B.[pmde],B.[pmse],B.[pono],B.[porg],B.[porg_kw],B.[pric],B.[zproc],B.[proc_kw],B.[prsg],B.[psqn],B.[ptyp],B.[ptyp_kw],B.[qiiv],B.[qipr],B.[ract],B.[ract_kw],B.[rarc],B.[rarc_kw],B.[rsqn],B.[sqnb],B.[stsc],B.[stsc_kw],B.[stsd],B.[stsd_kw],B.[styp],B.[styp_kw],B.[ztimestamp],B.[uldt],B.[usdt],B.[file_name],B.[dwh_load_time] ,B.[Pur_Pay_fct_key])
OPTION (LABEL = '[SP_23_AP_Pur_Pay_Rcpt_for_Ord_Sch_fct_8]');

									  
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


