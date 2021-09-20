/**********************************************************************************************************************
Stored Procedure Name: [dwhcda].[SP_6_invoice_fact]
Description: This stored procedure is used to load the data from Invoice Lines Transformation table to Fact Sales Invoices table.

Delta mechanish is handeled by extracting only latest data from Source table based on max "dwh_load_time" from Target table.

Based on the key columns for each record in the target table, if there already exist a record for the same key then Overwrite the record else Insert the record.

Data Type: Fact Table
Source Table: [dwhcda].[lnc_trn_cisli310]
Target Table: [dwhcda].[lnc_fct_Sales_Invoice]

Lookup Tables: N/A
Data Load Frequency: Automatic
Load Type: Delta load
Integration Framework: 

Original Project: JBT
Developer: Srilatha Naregudam
Date: 27-04-2021
Reviewed By: Atul Raje

Change History:
Dt:10/06/2021
Added new field "srcp" in invoice fact table as per Business requirement,since company number is not storing correctly in compnr field as per Sales order data.
**********************************************************************************************************************/

CREATE PROCEDURE [dwhcda].[SP_6_invoice_fact] AS
BEGIN
	SET NOCOUNT ON;
	
	IF OBJECT_ID('[dwhcda].[temp_lnc_fct_sales_inv]', 'U') IS NOT NULL
	DROP TABLE [dwhcda].[temp_lnc_fct_sales_inv]

    Select * INTO [dwhcda].[temp_lnc_fct_sales_inv]    
	From [dwhcda].[lnc_fct_Sales_Invoice] where 1 = 2;
	

	BEGIN TRANSACTION;
	
	BEGIN TRY
	
	Insert into [dwhcda].[temp_lnc_fct_sales_inv]
    (amth_1,cbrn,cdec,cofc,cvat,deln,ddat,odat,idoc,item,ofbp,orno,pono,prel_kw,ptpa,shln,
	shpm,sotp,srtp,stad,stbp,ztimestamp,ztran,cpay,fdpt,itbp,paym,dqua,compnr,line,sfcp,creg,crep,	
		orderno, [lineno] ,Table_ID ,Table_Flag,deleted,srcp,dwh_load_time)		
	Select amth_1,cbrn,cdec,cofc,cvat,deln,ddat,odat,idoc,item,ofbp,orno,pono,prel_kw,ptpa,shln,
	shpm,sotp,srtp,stad,stbp,ztimestamp,ztran,cpay,fdpt,itbp,paym,dqua,compnr,line,sfcp,creg,crep,
	orno as orderno,  line as [lineno],
	'Inv_Lines_Fact' as Table_ID,'IL' as Table_Flag,deleted,srcp,dwh_load_time
	from  [dwhcda].[lnc_trn_cisli310] 	
	Where 	[dwh_load_time] > CASE WHEN (( SELECT count(*) AS count
                                      FROM [dwhcda].[lnc_fct_Sales_Invoice] )) = 0 THEN convert(datetime,'1900-01-01 00:00:00')
                                      ELSE ( SELECT max(dwh_load_time) FROM [dwhcda].[lnc_fct_Sales_Invoice]
									  Where Table_Flag = 'IL') END OPTION (LABEL = '[SP_6_fct_Sales_Invoice_1]');
	
	MERGE [dwhcda].[lnc_fct_Sales_Invoice] As A
	USING [dwhcda].[temp_lnc_fct_sales_inv]  B 
	ON A.compnr = B.compnr And A.idoc = B.idoc And A.orderno = B.orderno And A.[lineno] = B.[lineno] And A.Table_Flag = B.Table_Flag
	WHEN Matched AND B.[ztimestamp] > A.[ztimestamp] THEN UPDATE SET A.amth_1  = B.amth_1, A.cbrn = B.cbrn, A.cdec = B.cdec,
     A.cofc = B.cofc, A.cvat= B.cvat, A.deln= B.deln, A.ddat= B.ddat, A.odat = B.odat,
     A.item= B.item, A.ofbp= B.ofbp, A.orno= B.orno, A.pono= B.pono, A.prel_kw= B.prel_kw, A.ptpa= B.ptpa, 
     A.shln= B.shln, A.shpm= B.shpm, A.sotp= B.sotp, A.srtp= B.srtp, A.stad= B.stad, A.stbp= B.stbp,
      A.ztimestamp= B.ztimestamp, A.ztran= B.ztran, A.cpay= B.cpay, A.fdpt= B.fdpt, A.itbp= B.itbp, 
      A.paym= B.paym, A.dqua= B.dqua, A.line= B.line, A.sfcp= B.sfcp, A.creg= B.creg, 
      A.crep= B.crep,A.Table_ID = B.Table_ID,A.deleted = B.deleted,A.srcp = B.srcp,A.dwh_load_time = B.dwh_load_time
	
	WHEN NOT MATCHED BY TARGET THEN 
	Insert (amth_1,cbrn,cdec,cofc,cvat,deln,ddat,odat,idoc,item,ofbp,orno,pono,prel_kw,ptpa,shln,
	shpm,sotp,srtp,stad,stbp,ztimestamp,ztran,cpay,fdpt,itbp,paym,dqua,compnr,line,sfcp,creg,crep,
	orderno, [lineno] ,Table_ID ,Table_Flag,deleted,srcp,dwh_load_time)
	VALUES (B.amth_1,B.cbrn, B.cdec, B.cofc, B.cvat, B.deln, B.ddat, B.odat, B.idoc, B.item, B.ofbp, 
    B.orno, B.pono, B.prel_kw, B.ptpa, B.shln, B.shpm, B.sotp, B.srtp, B.stad, B.stbp, 
    B.ztimestamp, B.ztran, B.cpay, B.fdpt, B.itbp, B.paym, B.dqua, B.compnr, B.line, B.sfcp, B.creg, B.crep,
	B.orderno,B.[lineno],B.Table_ID,B.Table_Flag,B.deleted,B.srcp,B.dwh_load_time) 
	OPTION (LABEL = '[SP_6_fct_Sales_Invoice_2]');

		
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