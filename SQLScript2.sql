/*  Jbt SERVER to DATALAKE (incoming): */


INSERT INTO intcf.InterfaceMaster select
'SALES_10_001','load LN_ Files into Datalake(prodincoming) From Jbt Server','Jbt-Sales','Sales','SMB',
'Datalake','File','IF_File_to_Datalake','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.filetodatalake select
'SALES_10_001','Sales','File Extraction','SMB','','','LN_','json','Datalake',
'inforln','incoming','F','','kishore.Makke@jbtc.com',getdate(),'',''


/* DATALAKE(incoming) to DATALAKE(processing): */



INSERT INTO intcf.InterfaceMaster select
'SALES_20_001','load LN_ Files into Datalake (processing) From Datalake(prodincoming)','Jbt-Sales','Sales','DATALAKE',
'Datalake','File','IF_File_to_Datalake','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.filetodatalake select
'SALES_20_001','Sales','File Extraction','Datalake','inforln','incoming','LN_','json','Datalake',
'inforln','processing','F','','kishore.Makke@jbtc.com',getdate(),'',''

 /* DATALAKE(processing) to Datawarehouse(Tmp): */


     /* DIMENSIONS: */


INSERT INTO intcf.InterfaceMaster select
'SALES_30_001','load LN_tctax016 Files into tmp_tctax016','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_001','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tctax016','',
'ls_synapsedw',
'acq101','tmp_tctax016','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tctax016' where interface_id = 'SALES_30_001'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_002','load LN_tcmcs031 Files into tmp_tcmcs031','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_002','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs031','',
'ls_synapsedw',
'acq101','tmp_tcmcs031','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs031' where interface_id = 'SALES_30_002'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_003','load LN_tcmcs080 Files into tmp_tcmcs080','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_003','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs080','',
'ls_synapsedw',
'acq101','tmp_tcmcs080','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs080' where interface_id = 'SALES_30_003'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_004','load LN_tcmcs013 Files into tmp_tcmcs013','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_004','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs013','',
'ls_synapsedw',
'acq101','tmp_tcmcs013','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs013' where interface_id = 'SALES_30_004'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_005','load LN_tdsls012 Files into tmp_tdsls012','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_005','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tdsls012','',
'ls_synapsedw',
'acq101','tmp_tdsls012','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tdsls012' where interface_id = 'SALES_30_005'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_006','load LN_tcmcs003 Files into tmp_tcmcs003','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_006','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs003','',
'ls_synapsedw',
'acq101','tmp_tcmcs003','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs003' where interface_id = 'SALES_30_006'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_007','load LN_tcmcs065 Files into tmp_tcmcs065','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_007','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs065','',
'ls_synapsedw',
'acq101','tmp_tcmcs065','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs065' where interface_id = 'SALES_30_007'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_008','load LN_tccom130 Files into tmp_tccom130','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_008','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tccom130','',
'ls_synapsedw',
'acq101','tmp_tccom130','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tccom130' where interface_id = 'SALES_30_008'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_009','load LN_tccom100 Files into tmp_tccom100','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_009','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tccom100','',
'ls_synapsedw',
'acq101','tmp_tccom100','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tccom100' where interface_id = 'SALES_30_009'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_010','load LN_tccom110 Files into tmp_tccom110','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_010','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tccom110','',
'ls_synapsedw',
'acq101','tmp_tccom110','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tccom110' where interface_id = 'SALES_30_010'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_011','load LN_tccom001 Files into tmp_tccom001','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_011','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tccom001','',
'ls_synapsedw',
'acq101','tmp_tccom001','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tccom001' where interface_id = 'SALES_30_011'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_012','load LN_tcmcs042 Files into tmp_tcmcs042','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_012','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs042','',
'ls_synapsedw',
'acq101','tmp_tcmcs042','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs042' where interface_id = 'SALES_30_012'



INSERT INTO intcf.InterfaceMaster select
'SALES_30_013','load LN_tcmcs005 Files into tmp_tcmcs005','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_013','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs005','',
'ls_synapsedw',
'acq101','tmp_tcmcs005','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs005' where interface_id = 'SALES_30_013'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_014','load LN_tdsls094 Files into tmp_tdsls094','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_014','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tdsls094','',
'ls_synapsedw',
'acq101','tmp_tdsls094','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tdsls094' where interface_id = 'SALES_30_014'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_015','load LN_tccom111 Files into tmp_tccom111','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_015','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tccom111','',
'ls_synapsedw',
'acq101','tmp_tccom111','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tccom111' where interface_id = 'SALES_30_015'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_016','load LN_tdsls097 Files into tmp_tdsls097','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_016','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tdsls097','',
'ls_synapsedw',
'acq101','tmp_tdsls097','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tdsls097' where interface_id = 'SALES_30_016'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_017','load LN_tcmcs202 Files into tmp_tcmcs202','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_017','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs202','',
'ls_synapsedw',
'acq101','tmp_tcmcs202','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs202' where interface_id = 'SALES_30_017'




INSERT INTO intcf.InterfaceMaster select
'SALES_30_018','load LN_tcmcs036 Files into tmp_tcmcs036','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_018','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs036','',
'ls_synapsedw',
'acq101','tmp_tcmcs036','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs036' where interface_id = 'SALES_30_018'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_019','load LN_tcmcs041 Files into tmp_tcmcs041','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_019','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs041','',
'ls_synapsedw',
'acq101','tmp_tcmcs041','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs041' where interface_id = 'SALES_30_019'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_020','load LN_tfcmg003 Files into tmp_tfcmg003','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_020','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tfcmg003','',
'ls_synapsedw',
'acq101','tmp_tfcmg003','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tfcmg003' where interface_id = 'SALES_30_020'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_021','load LN_tcmcs061 Files into tmp_tcmcs061','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_021','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs061','',
'ls_synapsedw',
'acq101','tmp_tcmcs061','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs061' where interface_id = 'SALES_30_021'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_022','load LN_tcibd001 Files into tmp_tcibd001','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_022','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcibd001','',
'ls_synapsedw',
'acq101','tmp_tcibd001','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcibd001' where interface_id = 'SALES_30_022'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_023','load LN_tcmcs062 Files into tmp_tcmcs062','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_023','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs062','',
'ls_synapsedw',
'acq101','tmp_tcmcs062','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs062' where interface_id = 'SALES_30_023'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_024','load LN_tcmcs015 Files into tmp_tcmcs015','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_024','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs015','',
'ls_synapsedw',
'acq101','tmp_tcmcs015','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs015' where interface_id = 'SALES_30_024'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_025','load LN_tdpct001 Files into tmp_tdpct001','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_025','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tdpct001','',
'ls_synapsedw',
'acq101','tmp_tdpct001','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tdpct001' where interface_id = 'SALES_30_025'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_026','load LN_tdpct002 Files into tmp_tdpct002','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_026','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tdpct002','',
'ls_synapsedw',
'acq101','tmp_tdpct002','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tdpct002' where interface_id = 'SALES_30_026'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_027','load LN_tcmcs010 Files into tmp_tcmcs010','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_027','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs010','',
'ls_synapsedw',
'acq101','tmp_tcmcs010','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs010' where interface_id = 'SALES_30_027'



INSERT INTO intcf.InterfaceMaster select
'SALES_30_028','load LN_tcmcs002 Files into tmp_tcmcs002','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_028','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tcmcs002','',
'ls_synapsedw',
'acq101','tmp_tcmcs002','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tcmcs002' where interface_id = 'SALES_30_028'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_029','load LN_tccom000 Files into tmp_tccom000','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_029','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tccom000','',
'ls_synapsedw',
'acq101','tmp_tccom000','F','','Kishore.Makke@jbtc.com',getdate(),''


update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tccom000' where interface_id = 'SALES_30_029'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_030','load LN_tccom180 Files into tmp_tccom180','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_030','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tccom180','',
'ls_synapsedw',
'acq101','tmp_tccom180','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tccom180' where interface_id = 'SALES_30_030'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_031','load LN_tccom181 Files into tmp_tccom181','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_031','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tccom181','',
'ls_synapsedw',
'acq101','tmp_tccom181','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tccom181' where interface_id = 'SALES_30_031'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_032','load LN_tccom112 Files into tmp_tccom112','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_032','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tccom112','',
'ls_synapsedw',
'acq101','tmp_tccom112','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tccom112' where interface_id = 'SALES_30_032'


          /* FACTS */


INSERT INTO intcf.InterfaceMaster select
'SALES_30_033','load LN_tdsls400 Files into tmp_tdsls401','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_033','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tdsls400','',
'ls_synapsedw',
'acq101','tmp_tdsls400','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tdsls400' where interface_id = 'SALES_30_033'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_034','load LN_tdsls401 Files into tmp_tdsls401','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_034','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tdsls401','',
'ls_synapsedw',
'acq101','tmp_tdsls401','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tdsls401' where interface_id = 'SALES_30_034'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_035','load LN_tscmm100 Files into tmp_tscmm100','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_035','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tscmm100','',
'ls_synapsedw',
'acq101','tmp_tscmm100','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tscmm100' where interface_id = 'SALES_30_035'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_036','load LN_tscmm110 Files into tmp_tscmm110','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_036','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tscmm110','',
'ls_synapsedw',
'acq101','tmp_tscmm110','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tscmm110' where interface_id = 'SALES_30_036'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_037','load LN_tssoc200 Files into tmp_tssoc200','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_037','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tssoc200','',
'ls_synapsedw',
'acq101','tmp_tssoc200','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tssoc200' where interface_id = 'SALES_30_037'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_038','load LN_cisli220 Files into tmp_cisli220','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_038','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_cisli220','',
'ls_synapsedw',
'acq101','tmp_cisli220','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_cisli220' where interface_id = 'SALES_30_038'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_039','load LN_cisli225 Files into tmp_cisli225','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_039','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_cisli225','',
'ls_synapsedw',
'acq101','tmp_cisli225','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_cisli225' where interface_id = 'SALES_30_039'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_040','load LN_tsmsc100 Files into tmp_tsmsc100','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_040','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tsmsc100','',
'ls_synapsedw',
'acq101','tmp_tsmsc100','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tsmsc100' where interface_id = 'SALES_30_040'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_041','load LN_tsmsc110 Files into tmp_tsmsc110','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_041','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tsmsc110','',
'ls_synapsedw',
'acq101','tmp_tsmsc110','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tsmsc110' where interface_id = 'SALES_30_041'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_042','load LN_cisli305 Files into tmp_cisli305','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_042','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_cisli305','',
'ls_synapsedw',
'acq101','tmp_cisli305','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_cisli305' where interface_id = 'SALES_30_042'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_043','load LN_cisli310 Files into tmp_cisli310','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_043','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_cisli310','',
'ls_synapsedw',
'acq101','tmp_cisli310','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_cisli310' where interface_id = 'SALES_30_043'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_044','load LN_tssoc220 Files into tmp_tssoc220','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_044','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tssoc220','',
'ls_synapsedw',
'acq101','tmp_tssoc220','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tssoc220' where interface_id = 'SALES_30_044'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_045','load LN_tssoc230 Files into tmp_tssoc230','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_045','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tssoc230','',
'ls_synapsedw',
'acq101','tmp_tssoc230','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tssoc230' where interface_id = 'SALES_30_045'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_046','load LN_tssoc240 Files into tmp_tssoc240','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_046','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_tssoc240','',
'ls_synapsedw',
'acq101','tmp_tssoc240','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_tssoc240' where interface_id = 'SALES_30_046'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_047','load LN_whwmd215 Files into tmp_whwmd215','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_047','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_whwmd215','',
'ls_synapsedw',
'acq101','tmp_whwmd215','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_whwmd215' where interface_id = 'SALES_30_047'


INSERT INTO intcf.InterfaceMaster select
'SALES_30_048','load LN_whinr110 Files into tmp_whinr110','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_048','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed','error','LN_whinr110','',
'ls_synapsedw',
'acq101','tmp_whinr110','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set src_archivefolder = 'processed/ln_whinr110' where interface_id = 'SALES_30_048'

INSERT INTO intcf.InterfaceMaster select
'SALES_30_049','load LN_tdsls450 Files into tmp_tdsls450','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_049','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tdsls450','error','LN_tdsls450','',
'ls_synapsedw',
'acq101','tmp_tdsls450','F','','Kishore.Makke@jbtc.com',getdate(),''

INSERT INTO intcf.InterfaceMaster select
'SALES_30_050','load LN_tdsls451 Files into tmp_tdsls451','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_050','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tdsls451','error','LN_tdsls451','',
'ls_synapsedw',
'acq101','tmp_tdsls451','F','','Kishore.Makke@jbtc.com',getdate(),''

INSERT INTO intcf.InterfaceMaster select
'SALES_30_051','load LN_tcibd150 Files into tmp_tcibd150','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_051','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tcibd150','error','LN_tcibd150','',
'ls_synapsedw',
'acq101','tmp_tcibd150','F','','Kishore.Makke@jbtc.com',getdate(),''


INSERT INTO intcf.InterfaceMaster select
'SALES_30_052','load LN_whwmd200 Files into tmp_whwmd200','Jbt-Sales','Sales','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'SALES_30_052','Jbt-Sales','Sales','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_whwmd200','error','LN_whwmd200','',
'ls_synapsedw',
'acq101','tmp_whwmd200','F','','Kishore.Makke@jbtc.com',getdate(),''

update intcf.DataLakeToDataWarehouse set Src_FileType = 'json'



/* Datawarehouse(Tmp) to Processing(Dst) */


INSERT INTO intcf.InterfaceMaster select
'SALES_40_001','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tctax016','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_001','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tctax016',
'dst_tctax016','compnr,bpcl','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_002','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs031','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_002','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs031',
'dst_tcmcs031','compnr,cbrn','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_003','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs080','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_003','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs080',
'dst_tcmcs080','compnr,cfrw','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_004','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs013','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_004','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs013',
'dst_tcmcs013','compnr,cpay','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_005','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdsls012','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_005','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdsls012',
'dst_tdsls012','compnr,cofc','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_006','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs003','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_006','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs003',
'dst_tcmcs003','compnr,cwar','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_007','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs065','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_007','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs065',
'dst_tcmcs065','compnr,cwoc','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_008','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom130','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_008','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom130',
'dst_tccom130','compnr,cadr','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_009','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom100','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_009','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom100',
'dst_tccom100','compnr,bpid','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_010','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom110','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_010','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom110',
'dst_tccom110','compnr,ofbp','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_011','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom001','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_011','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom001',
'dst_tccom001','compnr,emno','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_012','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs042','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_012','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs042',
'dst_tcmcs042','compnr,ptpa','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_013','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs005','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_013','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs005',
'dst_tcmcs005','compnr,cdis','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_014','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdsls094','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_014','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdsls094',
'dst_tdsls094','compnr,sotp','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_015','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom111','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_015','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom111',
'dst_tccom111','compnr,stbp','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_016','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdsls097','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_016','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdsls097',
'dst_tdsls097','compnr,crcd','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_017','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs202','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_017','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs202',
'dst_tcmcs202','compnr,styp','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_018','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs036','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_018','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs036',
'dst_tcmcs036','compnr,ccty,cvat','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_019','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs041','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_019','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs041',
'dst_tcmcs041','compnr,cdec','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_020','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfcmg003','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_020','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfcmg003',
'dst_tfcmg003','compnr,paym','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_021','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs061','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_021','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs061',
'dst_tcmcs061','compnr,cpln','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_022','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcibd001','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_022','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcibd001',
'dst_tcibd001','compnr,item','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_023','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs062','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_023','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs062',
'dst_tcmcs062','compnr,cpcl','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_024','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs015','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_024','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs015',
'dst_tcmcs015','compnr,ctyp','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_025','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdpct001','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_025','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdpct001',
'dst_tdpct001','compnr,catc','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_026','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdpct002','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_026','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdpct002',
'dst_tdpct002','compnr,pono,scat','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_027','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs010','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_027','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs010',
'dst_tcmcs010','compnr,ccty','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_028','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs002','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_028','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs002',
'dst_tcmcs002',
'compnr,ccur','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_029','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom000','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_029','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom000',
'dst_tccom000',
'compnr,indt,ncmp','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_030','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom180','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_030','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom180',
'dst_tccom180',
'compnr,ctst','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_031','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom181','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_031','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom181',
'dst_tccom181',
'compnr,ccty,ctst','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()



INSERT INTO intcf.InterfaceMaster select
'SALES_40_032','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom112','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_032','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom112',
'dst_tccom112','compnr,itbp,cofc','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_033','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdsls400','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_033','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdsls400',
'dst_tdsls400','compnr,orno','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_034','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdsls401','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_034','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdsls401',
'dst_tdsls401','compnr,orno,pono,sqnb','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()



INSERT INTO intcf.InterfaceMaster select
'SALES_40_035','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tscmm100','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_035','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tscmm100',
'dst_tscmm100','compnr,ccno','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_036','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tscmm110','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_036','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tscmm110',
'dst_tscmm110','compnr,ccno,lino','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_037','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tssoc200','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_037','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tssoc200',
'dst_tssoc200','compnr,orno','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_038','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_cisli220','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_038','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_cisli220',
'dst_cisli220','compnr,sfcp,msid','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_039','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_cisli225','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_039','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_cisli225',
'dst_cisli225','compnr,sfcp,msid,msln','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_040','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tsmsc100','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_040','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tsmsc100',
'dst_tsmsc100','compnr,cmso','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_041','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tsmsc110','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_041','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tsmsc110',
'dst_tsmsc110','compnr,cmso,lino','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()



INSERT INTO intcf.InterfaceMaster select
'SALES_40_042','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_cisli305','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_042','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_cisli305',
'dst_cisli305','compnr,sfcp,tran,idoc','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_043','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_cisli310','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_043','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_cisli310',
'dst_cisli310','compnr,sfcp,tran,idoc,line','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_044','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tssoc220','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_044','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tssoc220',
'dst_tssoc220',
'compnr,lino,orno','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_045','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tssoc230','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_045','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tssoc230',
'dst_tssoc230','compnr,lino,orno','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_046','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tssoc240','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_046','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tssoc240',
'dst_tssoc240',
'compnr,lino,orno','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_047','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_whwmd215','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_047','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_whwmd215',
'dst_whwmd215','compnr,cwar,item','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_048','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_whinr110 ','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_048','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_whinr110 ',
'dst_whinr110 ','compnr,cwar,item,seqn,trdt','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()




INSERT INTO intcf.InterfaceMaster select
'SALES_40_090','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdsls450','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_090','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdsls450',
'dst_tdsls450','compnr,orno,trdt','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_091','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdsls451','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_091','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdsls451',
'dst_tdsls451','compnr,orno,pono,sqnb,ckor,sern,trdt','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_092','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcibd150','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_092','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcibd150',
'dst_tcibd150','compnr,item,site','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_098','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_whwmd200','Jbt-Sales','Sales','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_098','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_whwmd200',
'dst_whwmd200','compnr,cwar','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()



/* DST_DIM to INC_DIM */





INSERT INTO intcf.InterfaceMaster select
'SALES_40_065','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tcmcs002','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_065','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcmcs002',
'lnc_dim_tcmcs002','compnr,ccur','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_066','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tccom000','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_066','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tccom000',
'lnc_dim_tccom000','compnr,indt,ncmp','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_067','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tcmcs065','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_067','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcmcs065',
'lnc_dim_tcmcs065','compnr,cwoc','acq101','','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_068','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tcmcs010','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_068','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcmcs010',
'lnc_dim_tcmcs010','compnr,ccty','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_073','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tcmcs013','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_073','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcmcs013',
'lnc_dim_tcmcs013','compnr,cpay','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_075','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tctax016','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_075','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tctax016',
'lnc_dim_tctax016','compnr,bpcl','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_076','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tcmcs031','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_076','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcmcs031',
'lnc_dim_tcmcs031','compnr,cbrn','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_077','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tcmcs080','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_077','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcmcs080',
'lnc_dim_tcmcs080','compnr,cfrw','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_078','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tdsls012','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_078','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tdsls012',
'lnc_dim_tdsls012','compnr,cofc','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_079','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tcmcs003','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_079','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcmcs003',
'lnc_dim_tcmcs003','compnr,cwar','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_080','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tccom001','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_080','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tccom001',
'lnc_dim_tccom001','compnr,emno','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_081','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tcmcs042','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_081','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcmcs042',
'lnc_dim_tcmcs042','compnr,ptpa','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_082','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tcmcs005','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_082','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcmcs005',
'lnc_dim_tcmcs005','compnr,cdis','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_083','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tdsls094','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_083','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tdsls094',
'lnc_dim_tdsls094','compnr,sotp','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_084','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tdsls097','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_084','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tdsls097',
'lnc_dim_tdsls097','compnr,crcd','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_085','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tcmcs202','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_085','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcmcs202',
'lnc_dim_tcmcs202','compnr,styp','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_086','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tcmcs036','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_086','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcmcs036',
'lnc_dim_tcmcs036','compnr,ccty,cvat','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_087','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tcmcs041','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_087','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcmcs041',
'lnc_dim_tcmcs041','compnr,cdec','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_088','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tfcmg003','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_088','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tfcmg003',
'lnc_dim_tfcmg003','compnr,paym','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_089','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_whwmd215','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_089','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_whwmd215',
'lnc_dim_whwmd215','compnr,cwar,item','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_093','Triggering Dynamic Stored Procedure [dwhcda].[SP_8_dim_data_transfer] for lnc_dim_tcibd150','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_093','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcibd150',
'lnc_dim_tcibd150','compnr,item,site','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_097','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_whinr110','JbtSales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_097','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_whinr110',
'lnc_dim_whinr110','compnr,item,prmd,prmv','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_099','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_whwmd200','JbtSales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_099','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_whwmd200',
'lnc_dim_whwmd200','compnr,cwar','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()





/* TRANSACTION LAYER */


INSERT INTO intcf.InterfaceMaster select
'SALES_40_049','Triggering Dynamic Stored Procedure dwhcda.SP_4_header_item_consolidation for lnc_trn_tdsls401 ','Jbt-Sales','Sales','Dst',
'Trn','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_049','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_4_header_item_consolidation]','Y','dst_tdsls401',
'lnc_trn_tdsls401','compnr,orno,pono,sqnb','acq101','dst_tdsls400','compnr,orno','cbrn,cofc,crep,fdpt,itad,itbp,ofad,osrp,paym,retr,rtyp,sotp,ccur,cpls,ddat,futo,hdst,odis,hdst_kw',
'','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_050','Triggering Dynamic Stored Procedure dwhcda.SP_4_header_item_consolidation for lnc_trn_tssoc220','Jbt-Sales','Sales','Dst',
'Trn','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_050','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_4_header_item_consolidation]','Y','dst_tssoc220',
'lnc_trn_tssoc220','compnr,lino,orno','acq101','dst_tssoc200','compnr,orno','cbrn,cpay,crep,fdpt,itad,itbp,ofad,ofbp,paym,rtyp,cosh,amnt,cadt,cctp,ccur,csco,cstp,cwoc,oamt,pmtd,pstm,wrtp',
'','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_051','Triggering Dynamic Stored Procedure dwhcda.SP_4_header_item_consolidation for lnc_trn_tssoc230','Jbt-Sales','Sales','Dst',
'Trn','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_051','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_4_header_item_consolidation]','Y','dst_tssoc230',
'lnc_trn_tssoc230','compnr,lino,orno','acq101','dst_tssoc200','compnr,orno','cbrn,cdec,cfrw,cpay,crep,fdpt,itad,itbp,ofad,ofbp,paym,ptpa,rtyp,cosh,amnt,cadt,cctp,ccur,csco,cstp,cwoc,oamt,pmtd,pris,pstm,smto,wrtp',
'','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_052','Triggering Dynamic Stored Procedure dwhcda.SP_4_header_item_consolidation for lnc_trn_tssoc240','Jbt-Sales','Sales','Dst',
'Trn','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_052','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_4_header_item_consolidation]','Y','dst_tssoc240',
'lnc_trn_tssoc240','compnr,lino,orno','acq101','dst_tssoc200','compnr,orno','cbrn,cdec,cfrw,cpay,crep,fdpt,itad,itbp,ofad,ofbp,paym,ptpa,rtyp,cosh,amnt,cadt,cctp,ccur,csco,cstp,cwoc,oamt,pmtd,pstm,smto,wrtp',
'','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_053','Triggering Dynamic Stored Procedure dwhcda.SP_4_header_item_consolidation for lnc_trn_cisli225','Jbt-Sales','Sales','Dst',
'Trn','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_053','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_4_header_item_consolidation]','Y','dst_cisli225',
'lnc_trn_cisli225','compnr,msid,msln,sfcp','acq101','dst_cisli220','compnr,msid','cdec,cfrw,cofc,cpay,crep,itbp,ofbp,paym,ptpa',
'','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_054','Triggering Dynamic Stored Procedure dwhcda.SP_4_header_item_consolidation for lnc_trn_tscmm110','Jbt-Sales','Sales','Dst',
'Trn','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_054','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_4_header_item_consolidation]','Y','dst_tscmm110',
'lnc_trn_tscmm110','ccno,compnr,lino','acq101','dst_tscmm100','compnr,ccno','',
'cbrn,cdec,cpay,ofad,ofbp,paym,ptpa,rtyp,stad,stbp,ccur,cndt,crtm,cwoc,fldt,irep,ocmp,odno,odty,oosy,zuser','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_055','Triggering Dynamic Stored Procedure dwhcda.SP_4_header_item_consolidation for lnc_trn_tsmsc110','Jbt-Sales','Sales','Dst',
'Trn','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_055','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_4_header_item_consolidation]','Y','dst_tsmsc110',
'lnc_trn_tsmsc110','cmso,compnr,lino','acq101','dst_tsmsc100','compnr,cmso','bpcl,cbrn,cfrw,cpay,itad,itbp,ofad,ofbp,paym,rtyp,ccur,zdesc,inpl,ordt,osta',
'','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_056','Triggering Dynamic Stored Procedure dwhcda.SP_4_header_item_consolidation for lnc_trn_cisli310','Jbt-Sales','Sales','Dst',
'Trn','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_056','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_4_header_item_consolidation]','Y','dst_cisli310',
'lnc_trn_cisli310','compnr,idoc,line,sfcp,ztran','acq101','dst_cisli305','compnr,idoc,sfcp,ztran','cpay,fdpt,itbp,paym',
'','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_094','Triggering Dynamic Stored Procedure [dwhcda].[SP_9_header_item_consolidation_max_columns] for lnc_trn_tdsls451','Jbt-Sales','Sales','Dst',
'Trn','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_094','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_9_header_item_consolidation_max_columns]','Y','dst_tdsls451',
'lnc_trn_tdsls451','compnr,orno,pono,sqnb,ckor,sern,trdt','acq101','dst_tdsls400','compnr,orno',
'cbrn,crep,fdpt,itad,itbp,ofad,osrp,paym,retr,sotp,ccur,cpls,ddat,futo,hdst,odis,hdst_kw',
'dwhcda','','','','','','','Kishore.Makke@jbtc.com',getdate()


/* FINAL DIM TABLES */




INSERT INTO intcf.InterfaceMaster select
'SALES_40_057','Triggering Dynamic Stored Procedure [acq101].[SP_2_business_partners_enrichment] for lnc_dim_tccom100','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_057','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_2_business_partners_enrichment]','Y','dst_tccom100',
'lnc_dim_tccom100','compnr,bpid','acq101','dst_tccom130','cadr','ccty',
'dst_tcmcs010','ccty','dsca','','','','','Kishore.Makke@jbtc.com',getdate()



INSERT INTO intcf.InterfaceMaster select
'SALES_40_058','Triggering Dynamic Stored Procedure [acq101].[SP_2_business_partners_enrichment] for lnc_dim_tccom111','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_058','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_2_business_partners_enrichment]','Y','dst_tccom111',
'lnc_dim_tccom111','compnr,stbp','acq101','dst_tccom130','cadr','ccty',
'dst_tcmcs010','ccty','dsca','','','','','Kishore.Makke@jbtc.com',getdate()



INSERT INTO intcf.InterfaceMaster select
'SALES_40_059','Triggering Dynamic Stored Procedure [acq101].[SP_2_business_partners_enrichment] for lnc_dim_tccom110','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_059','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_2_business_partners_enrichment]','Y','dst_tccom110',
'lnc_dim_tccom110','compnr,ofbp','acq101','dst_tccom130','cadr','ccty',
'dst_tcmcs010','ccty','dsca','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_060','Triggering Dynamic Stored Procedure [acq101].[SP_2_business_partners_enrichment] for lnc_dim_tccom112','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_060','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_2_business_partners_enrichment]','Y','dst_tccom112',
'lnc_dim_tccom112','compnr,cofc,itbp','acq101','dst_tccom130','cadr','ccty',
'dst_tcmcs010','ccty','dsca','','','','','Kishore.Makke@jbtc.com',getdate()




INSERT INTO intcf.InterfaceMaster select
'SALES_40_061','Triggering Dynamic Stored Procedure [acq101].[SP_3_items_master]','Jbt-Sales','Sales','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_061','Jbt-Sales','Sales','ls_synapsedw','[acq101].[SP_3_items_master]','N','',
'','','','','','',
'','','','','','','','Kishore.Makke@jbtc.com',getdate()



  /* FACT */

INSERT INTO intcf.InterfaceMaster select
'SALES_40_062','Triggering Dynamic Stored Procedure [dwhcda].[SP_5_order_fact]','Jbt-Sales','Sales','Trn',
'Fact','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_062','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_5_order_fact]','N','',
'','','','','','',
'','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_063','Triggering Dynamic Stored Procedure [dwhcda].[SP_6_invoice_fact]','Jbt-Sales','Sales','Trn',
'Fact','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_063','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_6_invoice_fact]','N','',
'','','','','','',
'','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_064','Triggering Dynamic Stored Procedure [replncss].[SP_7_fct_Sales_Revenue_Cube]','Jbt-Sales','Sales','Trn',
'Fact','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_064','Jbt-Sales','Sales','ls_synapsedw','[replncss].[SP_7_fct_Sales_Revenue_Cube]','N','',
'','','','','','',
'','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'SALES_40_095','Triggering Dynamic Stored Procedure [dwhcda].[SP_10_order_fact_hist]','Jbt-Sales','Sales','Trn',
'Fact','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_095','Jbt-Sales','Sales','ls_synapsedw','[dwhcda].[SP_10_order_fact_hist]','N','',
'','','','','','',
'','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'SALES_40_096','Triggering Dynamic Stored Procedure [replncss].[SP_11_fct_History_Sales_Revenue_Cube]','Jbt-Sales','Sales','Trn',
'Fact','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'SALES_40_096','Jbt-Sales','Sales','ls_synapsedw','[replncss].[SP_11_fct_History_Sales_Revenue_Cube]','N','',
'','','','','','',
'','','','','','','','Kishore.Makke@jbtc.com',getdate()






/*DEPENDENCIES:*/

--LOAD FILES TO DATALAKE (PROCESSING).

INSERT INTO intcf.interfacedependencies SELECT 'SALES_20_001','SALES_10_001','Kishore.Makke@jbtc.com',getdate()


--LOAD DATA TO TMP TABLES:

INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_001','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_002','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_003','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_004','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_005','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_006','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_007','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_008','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_009','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_010','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_011','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_012','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_013','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_014','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_015','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_016','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_017','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_018','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_019','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_020','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_021','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_022','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_023','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_024','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_025','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_026','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_027','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_028','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_029','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_030','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_031','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_032','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_033','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_034','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_035','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_036','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_037','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_038','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_039','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_040','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_041','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_042','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_043','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_044','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_045','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_046','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_047','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_048','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_049','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_050','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_051','SALES_20_001','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.interfacedependencies SELECT 'SALES_30_052','SALES_20_001','Kishore.Makke@jbtc.com',getdate()


--LOAD DATA TO DST TABLES:

INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_001','SALES_30_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_002','SALES_30_002','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_003','SALES_30_003','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_004','SALES_30_004','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_005','SALES_30_005','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_006','SALES_30_006','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_007','SALES_30_007','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_008','SALES_30_008','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_009','SALES_30_009','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_010','SALES_30_010','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_011','SALES_30_011','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_012','SALES_30_012','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_013','SALES_30_013','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_014','SALES_30_014','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_015','SALES_30_015','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_016','SALES_30_016','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_017','SALES_30_017','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_018','SALES_30_018','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_019','SALES_30_019','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_020','SALES_30_020','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_021','SALES_30_021','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_022','SALES_30_022','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_023','SALES_30_023','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_024','SALES_30_024','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_025','SALES_30_025','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_026','SALES_30_026','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_027','SALES_30_027','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_028','SALES_30_028','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_029','SALES_30_029','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_030','SALES_30_030','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_031','SALES_30_031','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_032','SALES_30_032','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_033','SALES_30_033','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_034','SALES_30_034','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_035','SALES_30_035','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_036','SALES_30_036','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_037','SALES_30_037','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_038','SALES_30_038','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_039','SALES_30_039','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_040','SALES_30_040','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_041','SALES_30_041','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_042','SALES_30_042','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_043','SALES_30_043','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_044','SALES_30_044','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_045','SALES_30_045','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_046','SALES_30_046','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_047','SALES_30_047','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_090','SALES_30_049','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_091','SALES_30_050','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_092','SALES_30_051','Kishore.Makke@jbtc.com',getdate()


 --FINAL DIM:

INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_065','SALES_40_028','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_066','SALES_40_029','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_067','SALES_40_007','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_068','SALES_40_027','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_073','SALES_40_004','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_075','SALES_40_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_076','SALES_40_002','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_077','SALES_40_003','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_078','SALES_40_005','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_079','SALES_40_006','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_080','SALES_40_011','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_081','SALES_40_012','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_082','SALES_40_013','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_083','SALES_40_014','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_084','SALES_40_016','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_085','SALES_40_017','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_086','SALES_40_018','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_087','SALES_40_019','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_088','SALES_40_020','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_089','SALES_40_047','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_093','SALES_40_092','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_048','SALES_30_048','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_098','SALES_30_052','Kishore.Makke@jbtc.com',getdate()


--TRN:

INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_049','SALES_40_034','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_049','SALES_40_033','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_050','SALES_40_044','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_050','SALES_40_037','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_051','SALES_40_045','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_051','SALES_40_037','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_052','SALES_40_046','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_052','SALES_40_037','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_053','SALES_40_039','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_053','SALES_40_038','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_054','SALES_40_036','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_054','SALES_40_035','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_055','SALES_40_041','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_055','SALES_40_040','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_056','SALES_40_043','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_056','SALES_40_042','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_094','SALES_40_091','Kishore.Makke@jbtc.com',getdate()


--FINAL DIM:

INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_057','SALES_40_008','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_057','SALES_40_009','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_057','SALES_40_027','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_058','SALES_40_008','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_058','SALES_40_015','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_058','SALES_40_027','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_059','SALES_40_008','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_059','SALES_40_010','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_059','SALES_40_027','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_060','SALES_40_032','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_060','SALES_40_008','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_060','SALES_40_027','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_061','SALES_40_022','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_097','SALES_40_048','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_099','SALES_40_098','Kishore.Makke@jbtc.com',getdate()

--FINAl FACT:

INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_062','SALES_40_049','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_062','SALES_40_050','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_062','SALES_40_051','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_062','SALES_40_052','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_062','SALES_40_055','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_062','SALES_40_053','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_062','SALES_40_054','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_063','SALES_40_056','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_064','SALES_40_062','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_064','SALES_40_063','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_095','SALES_40_094','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'SALES_40_096','SALES_40_095','Kishore.Makke@jbtc.com',getdate()


/*********************************************        FINANCE  *************************************************/

/***************************  Purchasing & AP *******************************************/

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_001','load LN_tfacp500 Files into tmp_tfacp500','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_001','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tfacp500','error','LN_tfacp500','',
'ls_synapsedw',
'acq101','tmp_tfacp500','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_002','load LN_tdpur400 Files into tmp_tdpur400','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_002','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tdpur400','error','LN_tdpur400','',
'ls_synapsedw',
'acq101','tmp_tdpur400','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_003','load LN_tdpur401 Files into tmp_tdpur401','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_003','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tdpur401','error','LN_tdpur401','',
'ls_synapsedw',
'acq101','tmp_tdpur401','F','','Kishore.Makke@jbtc.com',getdate(),'json'


 INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_004','load LN_tdpur450 Files into tmp_tdpur450','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_004','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tdpur450','error','LN_tdpur450','',
'ls_synapsedw',
'acq101','tmp_tdpur450','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_005','load LN_tdpur430 Files into tmp_tdpur430','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_005','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tdpur430','error','LN_tdpur430','',
'ls_synapsedw',
'acq101','tmp_tdpur430','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_006','load LN_tfacp200 Files into tmp_tfacp200','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_006','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tfacp200','error','LN_tfacp200','',
'ls_synapsedw',
'acq101','tmp_tfacp200','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_007','load LN_tdpur406 Files into tmp_tdpur406','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_007','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tdpur406','error','LN_tdpur406','',
'ls_synapsedw',
'acq101','tmp_tdpur406','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_008','load LN_tdpur403 Files into tmp_tdpur403','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_008','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tdpur403','error','LN_tdpur403','',
'ls_synapsedw',
'acq101','tmp_tdpur403','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_009','load LN_tdpur094 Files into tmp_tdpur094','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_009','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tdpur094','error','LN_tdpur094','',
'ls_synapsedw',
'acq101','tmp_tdpur094','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_010','load LN_tdpur300 Files into tmp_tdpur300','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_010','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tdpur300','error','LN_tdpur300','',
'ls_synapsedw',
'acq101','tmp_tdpur300','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_011','load LN_tdpur411 Files into tmp_tdpur411','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_011','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tdpur411','error','LN_tdpur411','',
'ls_synapsedw',
'acq101','tmp_tdpur411','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_012','load LN_tdpur451 Files into tmp_tdpur451','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_012','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tdpur451','error','LN_tdpur451','',
'ls_synapsedw',
'acq101','tmp_tdpur451','F','','Kishore.Makke@jbtc.com',getdate(),'json'




/*****************************  AR *******************************************/



INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_013','load LN_tfacr307 Files into tmp_tfacr307','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_013','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tfacr307','error','LN_tfacr307','',
'ls_synapsedw',
'acq101','tmp_tfacr307','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_014','load LN_tfacr500 Files into tmp_tfacr500','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_014','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tfacr500','error','LN_tfacr500','',
'ls_synapsedw',
'acq101','tmp_tfacr500','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_015','load LN_tfacr601 Files into tmp_tfacr601','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_015','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tfacr601','error','LN_tfacr601','',
'ls_synapsedw',
'acq101','tmp_tfacr601','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_016','load LN_cisli315 Files into tmp_cisli315','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_016','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_cisli315','error','LN_cisli315','',
'ls_synapsedw',
'acq101','tmp_cisli315','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_017','load LN_tcstl150 Files into tmp_tcstl150','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_017','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tcstl150','error','LN_tcstl150','',
'ls_synapsedw',
'acq101','tmp_tcstl150','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_018','load LN_tfacr200 Files into tmp_tfacr200','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_018','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tfacr200','error','LN_tfacr200','',
'ls_synapsedw',
'acq101','tmp_tfacr200','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_019','load LN_tfgld482 Files into tmp_tfgld482','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_019','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tfgld482','error','LN_tfgld482','',
'ls_synapsedw',
'acq101','tmp_tfgld482','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_020','load LN_tfgld010 Files into tmp_tfgld010','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_020','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tfgld010','error','LN_tfgld010','',
'ls_synapsedw',
'acq101','tmp_tfgld010','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_021','load LN_tfcmg301 Files into tmp_tfcmg301','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_021','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tfcmg301','error','LN_tfcmg301','',
'ls_synapsedw',
'acq101','tmp_tfcmg301','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_022','load LN_tcmcs008 Files into tmp_tcmcs008','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_022','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tcmcs008','error','LN_tcmcs008','',
'ls_synapsedw',
'acq101','tmp_tcmcs008','F','','Kishore.Makke@jbtc.com',getdate(),'json'



/***************************  GL *******************************************/

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_023','load LN_tfgld206 Files into tmp_tfgld206','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_023','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tfgld206','error','LN_tfgld206','',
'ls_synapsedw',
'acq101','tmp_tfgld206','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_024','load LN_tfgld205 Files into tmp_tfgld205','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_024','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tfgld205','error','LN_tfgld205','',
'ls_synapsedw',
'acq101','tmp_tfgld205','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_025','load LN_tffbs101 Files into tmp_tffbs101','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_025','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tffbs101','error','LN_tffbs101','',
'ls_synapsedw',
'acq101','tmp_tffbs101','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_026','load LN_tffbs005 Files into tmp_tffbs005','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_026','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tffbs005','error','LN_tffbs005','',
'ls_synapsedw',
'acq101','tmp_tffbs005','F','','Kishore.Makke@jbtc.com',getdate(),'json'



INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_027','load LN_tffbs003 Files into tmp_tffbs003','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_027','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tffbs003','error','LN_tffbs003','',
'ls_synapsedw',
'acq101','tmp_tffbs003','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_028','load LN_tfgld106 Files into tmp_tfgld106','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_028','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tfgld106','error','LN_tfgld106','',
'ls_synapsedw',
'acq101','tmp_tfgld106','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_029','load LN_tfgld008 Files into tmp_tfgld008','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_029','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tfgld008','error','LN_tfgld008','',
'ls_synapsedw',
'acq101','tmp_tfgld008','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_030','load LN_tcemm170 Files into tmp_tcemm170','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_030','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tcemm170','error','LN_tcemm170','',
'ls_synapsedw',
'acq101','tmp_tcemm170','F','','Kishore.Makke@jbtc.com',getdate(),'json'


/****************************************  Production,Planning & Scheduline **************************************/

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_031','load LN_tirpt040 Files into tmp_tirpt040','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_031','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tirpt040','error','LN_tirpt040','',
'ls_synapsedw',
'acq101','tmp_tirpt040','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_032','load LN_tirpt401 Files into tmp_tirpt401','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_032','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tirpt401','error','LN_tirpt401','',
'ls_synapsedw',
'acq101','tmp_tirpt401','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_033','load LN_tirpt402 Files into tmp_tirpt402','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_033','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tirpt402','error','LN_tirpt402','',
'ls_synapsedw',
'acq101','tmp_tirpt402','F','','Kishore.Makke@jbtc.com',getdate(),'json'


INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_034','load LN_whinh200 Files into tmp_whinh200','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_034','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_whinh200','error','LN_whinh200','',
'ls_synapsedw',
'acq101','tmp_whinh200','F','','Kishore.Makke@jbtc.com',getdate(),'json'

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_035','load LN_tirpt404 Files into tmp_tirpt404','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_035','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tirpt404','error','LN_tirpt404','',
'ls_synapsedw',
'acq101','tmp_tirpt404','F','','Kishore.Makke@jbtc.com',getdate(),'json'

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_036','load LN_tirpt431 Files into tmp_tirpt431','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_036','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tirpt431','error','LN_tirpt431','',
'ls_synapsedw',
'acq101','tmp_tirpt431','F','','Kishore.Makke@jbtc.com',getdate(),'json'

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_037','load LN_tirpt200 Files into tmp_tirpt200','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_037','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tirpt200','error','LN_tirpt200','',
'ls_synapsedw',
'acq101','tmp_tirpt200','F','','Kishore.Makke@jbtc.com',getdate(),'json'

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_038','load LN_whinh312 Files into tmp_whinh312','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_038','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_whinh312','error','LN_whinh312','',
'ls_synapsedw',
'acq101','tmp_whinh312','F','','Kishore.Makke@jbtc.com',getdate(),'json'

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_039','load LN_timfc001 Files into tmp_timfc001','Jbt-Finance','Finance','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_039','Jbt-Finance','Finance','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_timfc001','error','LN_timfc001','',
'ls_synapsedw',
'acq101','tmp_timfc001','F','','Kishore.Makke@jbtc.com',getdate(),'json'

/**************************************** MASTER DIM TABLES ******************************************************/
INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_040','load LN_tccom122 Files into tmp_tccom122','Jbt-Dim','Dim','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_040','Jbt-Dim','Dim','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tccom122','error','LN_tccom122','',
'ls_synapsedw',
'acq101','tmp_tccom122','F','','Kishore.Makke@jbtc.com',getdate(),'json'

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_041','load LN_tccom114 Files into tmp_tccom114','Jbt-Dim','Dim','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_041','Jbt-Dim','Dim','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tccom114','error','LN_tccom114','',
'ls_synapsedw',
'acq101','tmp_tccom114','F','','Kishore.Makke@jbtc.com',getdate(),'json'

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_042','load LN_tccom124 Files into tmp_tccom124','Jbt-Dim','Dim','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_042','Jbt-Dim','Dim','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tccom124','error','LN_tccom124','',
'ls_synapsedw',
'acq101','tmp_tccom124','F','','Kishore.Makke@jbtc.com',getdate(),'json'

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_043','load LN_tccom120 Files into tmp_tccom120','Jbt-Dim','Dim','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_043','Jbt-Dim','Dim','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tccom120','error','LN_tccom120','',
'ls_synapsedw',
'acq101','tmp_tccom120','F','','Kishore.Makke@jbtc.com',getdate(),'json'

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_044','load LN_tccom121 Files into tmp_tccom121','Jbt-Dim','Dim','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_044','Jbt-Dim','Dim','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tccom121','error','LN_tccom121','',
'ls_synapsedw',
'acq101','tmp_tccom121','F','','Kishore.Makke@jbtc.com',getdate(),'json'

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_045','load LN_tdpur012 Files into tmp_tdpur012','Jbt-Dim','Dim','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_045','Jbt-Dim','Dim','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tdpur012','error','LN_tdpur012','',
'ls_synapsedw',
'acq101','tmp_tdpur012','F','','Kishore.Makke@jbtc.com',getdate(),'json'

INSERT INTO intcf.InterfaceMaster select
'FINANCE_30_046','load LN_tcemm050 Files into tmp_tcemm050','Jbt-Dim','Dim','DATALAKE',
'ls_synapsedw','File','IF_Datalake_to_Datawarehouse','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTO intcf.DataLakeToDataWarehouse select
'FINANCE_30_046','Jbt-Dim','Dim','synw-SALES-dw-dev-WorkspaceDefaultStorage','inforln',
'processing/','processed/ln_tcemm050','error','LN_tcemm050','',
'ls_synapsedw',
'acq101','tmp_tcemm050','F','','Kishore.Makke@jbtc.com',getdate(),'json'



/************************** DatawarehouseProcessing **************************************************************/
/**************************    Purchasing & AP      **************************************************************/   

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_001','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfacp500','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_001','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfacp500',
'dst_tfacp500','compnr,fcom,line,ninv,ttyp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_002','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdpur400','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_002','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdpur400',
'dst_tdpur400','compnr,orno','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_003','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdpur401','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_003','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdpur401',
'dst_tdpur401','compnr,orno,pono,sqnb','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()



INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_004','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdpur450','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_004','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdpur450',
'dst_tdpur450','compnr,orno,trdt','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_005','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdpur430','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_005','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdpur430',
'dst_tdpur430','compnr,orno,pono,psqn,rsqn,sqnb','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_006','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfacp200','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_006','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfacp200',
'dst_tfacp200','compnr,docn,line,lino,ninv,tdoc,ttyp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_007','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdpur406','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_007','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdpur406',
'dst_tdpur406','compnr,orno,pono,rsqn,sqnb','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_008','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdpur403','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_008','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdpur403',
'dst_tdpur403','compnr,orno,ponb,pono,sqnb','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_009','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdpur094','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_009','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdpur094',
'dst_tdpur094','compnr,potp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_010','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdpur300','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_010','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdpur300',
'dst_tdpur300','compnr,cono','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_011','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdpur411','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_011','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdpur411',
'dst_tdpur411','compnr,orno,pono,sqnb','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_012','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdpur451','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_012','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdpur451',
'dst_tdpur451','ckor,compnr,orno,pono,sern,sqnb,trdt','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

/**************************       AR      **************************************************************/


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_013','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfacr307','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_013','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfacr307',
'dst_tfacr307','ccra,compnr,fcom,itbp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_014','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfacr500','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_014','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfacr500',
'dst_tfacr500','compnr,fcom,line,ninv,ttyp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_015','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfacr601','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_015','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfacr601',
'dst_tfacr601','compnr,icom,idoc,ilin,isch,ityp,rcom,recd,recl,recs,rect,seqn','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_016','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_cisli315','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_016','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_cisli315',
'dst_cisli315','ccty,compnr,cvat,etls,idoc,itls,sfcp,tlsq,ztran','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_017','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcstl150','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_017','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcstl150',
'dst_tcstl150','compnr,nogd,ntnr','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_018','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfacr200','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_018','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfacr200',
'dst_tfacr200','compnr,docn,line,lino,ninv,tdoc,ttyp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_019','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfgld482','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_019','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfgld482',
'dst_tfgld482','compnr,dbcr,guid','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_020','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfgld010','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_020','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfgld010',
'dst_tfgld010','compnr,dimx,dtyp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_021','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfcmg301','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_021','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfcmg301',
'dst_tfcmg301','bpid,ccur,compnr,zdate,forc,ftyp,ninv,orig,schn,ttyp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_022','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcmcs008','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_022','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcmcs008',
'dst_tcmcs008','bcur,ccur,compnr,rtyp,stdt','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


/**************************************   GL  ************************************************************/

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_023','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfgld206','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_023','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfgld206',
'dst_tfgld206','bpid,ccur,compnr,cono,dim1,dim2,dim3,dim4,dim5,dims,duac,leac,zyear','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_024','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfgld205','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_024','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfgld205',
'dst_tfgld205','bpid,ccur,compnr,cono,dim1,dim2,dim3,dim4,dim5,dims,duac,leac,prno,ptyp,zyear','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_025','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tffbs101','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_025','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tffbs101',
'dst_tffbs101','budg,compnr,dim1,dim2,dim3,dim4,dim5,dim6,dim7,dim8,dim9,dm10,dm11,dm12,leac,peri,zyear','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_026','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tffbs005','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_026','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tffbs005',
'dst_tffbs005','budg,compnr,zyear','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()



INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_027','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tffbs003','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_027','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tffbs003',
'dst_tffbs003','budg,compnr','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_028','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfgld106','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_028','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfgld106',
'dst_tfgld106','compnr,odoc,olin,osrl,osrn,otyp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_029','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tfgld008','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_029','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tfgld008',
'dst_tfgld008','compnr,leac','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_030','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcemm170','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_030','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcemm170',
'dst_tcemm170','comp,compnr','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

/**************************************  PPS  **********************************************************************/

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_031','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tirpt040','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_031','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tirpt040',
'dst_tirpt040','compnr,cwoc','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_032','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tirpt401','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_032','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tirpt401',
'dst_tirpt401','compnr,prsh','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_033','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tirpt402','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_033','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tirpt402',
'dst_tirpt402','compnr,prsh,prsp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_034','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_whinh200','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_034','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_whinh200',
'dst_whinh200','compnr,oorg,orno,oset','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_035','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tirpt404','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_035','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tirpt404',
'dst_tirpt404','compnr,dlin,prsh,prsp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_036','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tirpt431','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_036','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tirpt431',
'dst_tirpt431','compnr,prsh,prsp,shft,wccd','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_037','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tirpt200','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_037','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tirpt200',
'dst_tirpt200','compnr,item,prmd,prmv','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_038','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_whinh312','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),'Y'

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_038','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_whinh312',
'dst_whinh312','compnr,rcln,rcno','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_039','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_timfc001','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_039','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_timfc001',
'dst_timfc001','compnr,ittp,oorg,pdno,pono,seqn','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

/************************************************  MASTER DIM TABLES ****************************************************/

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_040','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom122','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_040','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom122',
'dst_tccom122','cofc,compnr,ifbp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_041','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom114','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_041','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom114',
'dst_tccom114','cofc,compnr,pfbp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_042','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom124','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_042','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom124',
'dst_tccom124','cofc,compnr,ptbp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_043','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom120','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_043','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom120',
'dst_tccom120','compnr,otbp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_044','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tccom121','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_044','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tccom121',
'dst_tccom121','compnr,sfbp','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_045','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tdpur012','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_045','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tdpur012',
'dst_tdpur012','cofc,compnr','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_046','Triggering Dynamic Stored Procedure SP_1_data_transfer for dst_tcemm050','Jbt-Finance','Finance','Tmp',
'Dst','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_046','Jbt-Finance','Finance','ls_synapsedw','[acq101].[SP_1_data_transfer]','Y','tmp_tcemm050',
'dst_tcemm050','compnr,site','acq101','acq101','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


/********************************************* FINAL DIM ***************************************************************************/


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_047','Triggering Dynamic SP dwhcda.SP_2_business_partners_enrichment for lnc_dim_tccom122','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_047','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_2_business_partners_enrichment]','Y','dst_tccom122',
'lnc_dim_tccom122','cofc,compnr,ifbp','acq101','dst_tccom130','cadr','ccty,cste,dsca','dst_tcmcs010','ccty','dsca','dwhcda','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_048','Triggering Dynamic SP dwhcda.SP_2_business_partners_enrichment for lnc_dim_tccom122','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_048','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_2_business_partners_enrichment]','Y','dst_tccom114',
'lnc_dim_tccom122','cofc,compnr,ifbp','acq101','dst_tccom130','ccty,cste,dsca','dst_tcmcs010','ccty','dsca','dwhcda','','','','','Kishore.Makke@jbtc.com',
getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_049','Triggering Dynamic SP dwhcda.SP_2_business_partners_enrichment for lnc_dim_tccom124','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_049','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_2_business_partners_enrichment]','Y','dst_tccom124',
'lnc_dim_tccom124','cofc,compnr,ptbp','acq101','dst_tccom130','ccty,cste,dsca','dst_tcmcs010','ccty','dsca','dwhcda','','','','','Kishore.Makke@jbtc.com',
getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_050','Triggering Dynamic SP dwhcda.SP_2_business_partners_enrichment for lnc_dim_tccom120','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_050','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_2_business_partners_enrichment]','Y','dst_tccom120',
'lnc_dim_tccom120','compnr,otbp','acq101','dst_tccom130','ccty,cste,dsca','dst_tcmcs010','ccty','dsca','dwhcda','','','','','Kishore.Makke@jbtc.com',
getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_051','Triggering Dynamic SP dwhcda.SP_2_business_partners_enrichment for lnc_dim_tccom121','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_051','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_2_business_partners_enrichment]','Y','dst_tccom121',
'lnc_dim_tccom121','compnr,sfbp','acq101','dst_tccom130','ccty,cste,dsca','dst_tcmcs010','ccty','dsca','dwhcda','','','','','Kishore.Makke@jbtc.com',
getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_052','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_tdpur012','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_052','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tdpur012',
'lnc_dim_tdpur012','cofc,compnr','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_053','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_tcemm050','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_053','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcemm050',
'lnc_dim_tcemm050','compnr,site','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_054','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_tfgld010','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_054','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tfgld010',
'lnc_dim_tfgld010','compnr,dimx,dtyp','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_055','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_tdpur403','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_055','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tdpur403',
'lnc_dim_tdpur403','compnr,orno,ponb,pono,sqnb','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_056','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_tdpur094','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_056','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tdpur094',
'lnc_dim_tdpur094','compnr,potp','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_057','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_tffbs005','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_057','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tffbs005',
'lnc_dim_tffbs005','budg,compnr,zyear','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_058','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_tffbs003','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_058','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tffbs003',
'lnc_dim_tffbs003','budg,compnr','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_059','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_tfgld008','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_059','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tfgld008',
'lnc_dim_tfgld008','compnr,leac','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_060','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_tcemm170','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_060','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tcemm170',
'lnc_dim_tcemm170','comp,compnr','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_061','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_tirpt040','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_061','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tirpt040',
'lnc_dim_tirpt040','compnr,cwoc','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_062','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_whinh200','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_062','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_whinh200',
'lnc_dim_whinh200','compnr,oorg,orno,oset','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.InterfaceMaster select
'FINANCE_40_063','Triggering Dynamic SP dwhcda.SP_8_dim_data_transfer for lnc_dim_tirpt200','Jbt-Finance','Finance','Dst',
'Dim','Table','IF_Datawarehouse_Processing','Y','Kishore.Makke@jbtc.com',getdate(),'Ready',getdate(),''

INSERT INTo intcf.DataWarehouseProcessing select
'FINANCE_40_063','Jbt-Finance','Finance','ls_synapsedw','[dwhcda].[SP_8_dim_data_transfer]','Y','dst_tirpt200',
'lnc_dim_tirpt200','compnr,item,prmd,prmv','acq101','dwhcda','','','','','','','','','','Kishore.Makke@jbtc.com',getdate()


/********** Dependencies ***************/

INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_001','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_002','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_003','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_004','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_005','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_006','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_007','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_008','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_009','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_010','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_011','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_012','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_013','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_014','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_015','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_016','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_017','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_018','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_019','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_020','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_021','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_022','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_023','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_024','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_025','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_026','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_027','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_028','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_029','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_030','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_031','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_032','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_033','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_034','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_035','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_036','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_037','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_038','SALES_20_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_30_039','SALES_20_001','Kishore.Makke@jbtc.com',getdate()

INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_001','SALES_30_001','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_002','SALES_30_002','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_003','SALES_30_003','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_004','SALES_30_004','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_005','SALES_30_005','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_006','SALES_30_006','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_007','SALES_30_007','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_008','SALES_30_008','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_009','SALES_30_009','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_010','SALES_30_010','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_011','SALES_30_011','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_012','SALES_30_012','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_013','SALES_30_013','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_014','SALES_30_014','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_015','SALES_30_015','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_016','SALES_30_016','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_017','SALES_30_017','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_018','SALES_30_018','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_019','SALES_30_019','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_020','SALES_30_020','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_021','SALES_30_021','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_022','SALES_30_022','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_023','SALES_30_023','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_024','SALES_30_024','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_025','SALES_30_025','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_026','SALES_30_026','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_027','SALES_30_027','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_028','SALES_30_028','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_029','SALES_30_029','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_030','SALES_30_030','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_031','SALES_30_031','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_032','SALES_30_032','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_033','SALES_30_033','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_034','SALES_30_034','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_035','SALES_30_035','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_036','SALES_30_036','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_037','SALES_30_037','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_038','SALES_30_038','Kishore.Makke@jbtc.com',getdate()
INSERT INTO intcf.interfacedependencies SELECT 'FINANCE_40_039','SALES_30_039','Kishore.Makke@jbtc.com',getdate()
