/**********************************************************************************************************************
View Name: [replncss].[intg Data Check]
Description: This view is created on InterfaceMaster Table by joining with other interface tables which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[InterfaceMaster]
Target View: [replncss].[intg Data Check]
Lookup Tables: [intcf].[DataWarehouseProcessing],[intcf].[DataLakeToDataWarehouse],[intcf].[FileToDataLake],[intcf].[InterfaceDependencies]

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg Data Check];

CREATE VIEW [replncss].[intg Data Check] 
AS 
SELECT  --ac.sno,
im.Interface_Id as im_Interface_Id,im.Pipeline_Type , im.Active_Flag,im.Status ,
dp.Interface_Id as dp_Interface_Id,--atd.StoredProcedure,atd.trg_Fact_table
,ddw.Interface_Id as ddw_interfaceid , ddw.Trg_SchemaName,ddw.Trg_TableName,ddw.Src_Directory as ddw_Src_Directory ,ddw.Src_ArchiveFolder as ddw_Src_ArchiveFolder,ddw.Src_FileName as ddw_Src_FileName,ddw.Src_FileDelimiter as ddw_Src_FileDelimiter,
fd.Interface_Id as fd_Interface_Id , fd.Src_Directory, fd.Src_FileName, fd.Trg_Directory,fd.Trg_Container,
dep.Interface_Id as dep_Interface_Id , dep.Parent_Interface
FROM [intcf].[InterfaceMaster] im 
FULL OUTER JOIN [intcf].[DataWarehouseProcessing] dp on im.Interface_Id = dp.Interface_Id
FULL OUTER JOIN [intcf].[DataLakeToDataWarehouse] ddw on im.Interface_Id = ddw.Interface_Id
FULL OUTER JOIN [intcf].[FileToDataLake]  fd on im.Interface_Id = fd.Interface_Id
FULL OUTER JOIN [intcf].[InterfaceDependencies] dep on im.Interface_Id = dep.Interface_Id 
--FULL OUTER JOIN [intcf].[Adf_configTables] ac on im.Pipeline_Type = ac.Pipeline_Type
--FULL OUTER JOIN [intcf].[Adf_Transformation_details] atd on im.Interface_Id = atd.Interface_Id
;
GO

/**********************************************************************************************************************
View Name: [replncss].[intg Status Error]
Description: This view is created on status Table by joining with other interface tables which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[status]
Target View: [replncss].[intg Status Error]
Lookup Tables: [intcf].[Errorlog],[intcf].[interfacemaster]

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg Status Error];

CREATE VIEW [replncss].[intg Status Error]
AS
SELECT 
c.Interface_Id,
c.Business_Area,
c.Pipeline_Name,
c.Pipeline_Type,
c.Active_Flag,
a.DataFactoryInstance DataFactoryInstance,
a.ADF_RunId Error_ADF_RunId,
a.ADF_ErrorMsg ADF_ErrorMsg,
a.Failed_Activity ADF_Failed_Activity,
a.CreatedOn ErrorLog_CreatedOn,
b.Act_Start_Time Act_Start_Time,
b.Act_End_Time Act_End_Time,
b.Act_Duration Act_Duration,
b.Source_Count Source_Count,
b.Target_Count Target_Count,
b.Interface_Status Interface_Status,
b.Interface_Trigger_Id Interface_Trigger_Id,
b.Interface_Runid Status_Interface_Runid
FROM [intcf].[status] b 
left join [intcf].[Errorlog] a
ON a.adf_runid = b.Interface_Runid
INNER JOIN [intcf].[interfacemaster] c on c.interface_id = b.interface_id;
GO

/**********************************************************************************************************************
View Name: [replncss].[intg Status Error Logs]
Description: This view is created on status Table by joining with other interface tables which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[status]
Target View: [replncss].[intg Status Error Logs]
Lookup Tables: [intcf].[interfacemaster]

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg Status Error Logs];

CREATE VIEW [replncss].[intg Status Error Logs]
AS
SELECT
c.Interface_Id,
c.Business_Area,
c.Pipeline_Name,
c.Pipeline_Type,
c.Active_Flag,
a.DataFactoryInstance DataFactoryInstance,
a.ADF_RunId Error_ADF_RunId,
a.ADF_ErrorMsg ADF_ErrorMsg,
a.Failed_Activity ADF_Failed_Activity,
a.CreatedOn ErrorLog_CreatedOn,
b.Act_Start_Time Act_Start_Time,
b.Act_End_Time Act_End_Time,
b.Act_Duration Act_Duration,
b.Source_Count Source_Count,
b.Target_Count Target_Count,
b.Interface_Status Interface_Status,
b.Interface_Trigger_Id Interface_Trigger_Id,
b.Interface_Runid Status_Interface_Runid
FROM [intcf].[status] b left join [intcf].[Errorlog] a
ON a.adf_runid = b.Interface_Runid
INNER JOIN [intcf].[interfacemaster] c on c.interface_id = b.interface_id;
GO

/**********************************************************************************************************************
View Name: [replncss].[intg Daily Schedule]
Description: This view is created on DailySchedule Table which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[DailySchedule]
Target View: [replncss].[intg Daily Schedule]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg Daily Schedule];

CREATE VIEW [replncss].[intg Daily Schedule]
AS
SELECT * FROM [intcf].[DailySchedule];
GO

/**********************************************************************************************************************
View Name: [replncss].[intg DataLake To DataWarehouse]
Description: This view is created on DataLakeToDataWarehouse Table which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[DataLakeToDataWarehouse]
Target View: [replncss].[intg DataLake To DataWarehouse]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg DataLake To DataWarehouse];

CREATE VIEW [replncss].[intg DataLake To DataWarehouse] 
AS
SELECT * FROM [intcf].[DataLakeToDataWarehouse];
GO

/**********************************************************************************************************************
View Name: [replncss].[intg DataWarehouse Processing]
Description: This view is created on DataWarehouseProcessing Table which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[DataWarehouseProcessing]
Target View: [replncss].[intg DataWarehouse Processing]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg DataWarehouse Processing];

CREATE VIEW [replncss].[intg DataWarehouse Processing]
AS 
SELECT * FROM [intcf].[DataWarehouseProcessing];
GO

/**********************************************************************************************************************
View Name: [replncss].[intg DB To DataLake]
Description: This view is created on DBToDataLake Table which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[DBToDataLake]
Target View: [replncss].[intg DB To DataLake]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg DB To DataLake];

CREATE VIEW [replncss].[intg DB To DataLake]
AS 
SELECT * FROM [intcf].[DBToDataLake];
GO

/**********************************************************************************************************************
View Name: [replncss].[intg Email Alert]
Description: This view is created on EmailAlert Table which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[EmailAlert]
Target View: [replncss].[intg Email Alert]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg Email Alert];

CREATE VIEW [replncss].[intg Email Alert]
AS 
SELECT * FROM [intcf].[EmailAlert];
GO

/**********************************************************************************************************************
View Name: [replncss].[intg Error Log]
Description: This view is created on ErrorLog Table which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[ErrorLog]
Target View: [replncss].[intg Error Log]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg Error Log];

CREATE VIEW [replncss].[intg Error Log]
AS 
SELECT * FROM [intcf].[ErrorLog];
GO

/**********************************************************************************************************************
View Name: [replncss].[intg File To DataLake]
Description: This view is created on FileToDataLake Table which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[FileToDataLake]
Target View: [replncss].[intg File To DataLake]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg File To DataLake];

CREATE VIEW [replncss].[intg File To DataLake]
AS 
SELECT * FROM [intcf].[FileToDataLake];
GO

/**********************************************************************************************************************
View Name: [replncss].[intg Interface Dependencies]
Description: This view is created on InterfaceDependencies Table which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[InterfaceDependencies]
Target View: [replncss].[intg Interface Dependencies]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg Interface Dependencies];

CREATE VIEW [replncss].[intg Interface Dependencies]
AS 
SELECT * FROM [intcf].[InterfaceDependencies];
GO

/**********************************************************************************************************************
View Name: [replncss].[intg Interface Master]
Description: This view is created on InterfaceMaster Table which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[InterfaceMaster]
Target View: [replncss].[intg Interface Master]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg Interface Master];

CREATE VIEW [replncss].[intg Interface Master]
AS 
SELECT * FROM [intcf].[InterfaceMaster];
GO

/**********************************************************************************************************************
View Name: [replncss].[intg Schedule Master]
Description: This view is created on ScheduleMaster Table which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[ScheduleMaster]
Target View: [replncss].[intg Schedule Master]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg Schedule Master];

CREATE VIEW [replncss].[intg Schedule Master]
AS
SELECT * FROM [intcf].[ScheduleMaster];
GO

/**********************************************************************************************************************
View Name: [replncss].[intg Status]
Description: This view is created on Status Table which is exposed to Tableau for Dashboard Build.

Data Type: Transaction Data
Source Table:[intcf].[Status]
Target View: [replncss].[intg Status]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[intg Status];

CREATE VIEW [replncss].[intg Status]
AS 
SELECT [Interface_Id] As [Interface ID]
	  ,Convert(Date,[Act_Start_Time]) As [Actual Start Date]
      ,[Act_Start_Time] As [Actual Start DateTime]
      ,[Act_End_Time] As [Actual End DateTime]
      ,[Act_Duration] As [Actual Duration]
	  ,Case When [Act_End_Time] IS NULL then 0 Else DATEDIFF(MINUTE,act_start_time,act_end_time) End As [Actual Duration In Min]
      ,[Source_Count] As [Source Count]
      ,[Target_Count] As [Target Count]
      ,[Interface_Status] As [Interface Status]
	  ,Case When Upper([Interface_Status]) = 'SUCCESS' Then 0
		When Upper([Interface_Status]) = 'FAILED' Then 1 End As [Interface Status Flag]
      ,[Interface_Trigger_Id] As [Interface Trigger Id]
      ,[Interface_Runid] As [Interface Runid]
FROM [intcf].[Status];
GO

/**********************************************************************************************************************
View Name: [replncss].[Interface Load Status]
Description: This view is created on Interface pipeline run Status Table which is exposed to Tableau for Dashboard Build.
This is a simple 1-1 view by taking data from Status tables without any transformation logic.

Data Type: Transaction Data
Source Table:[intcf].[Status]
Target View: [Interface Load Stauts]
Lookup Tables: None

Original Project: JBT Sales
Developer: Mohammed Majid
Date: 14-07-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

--Drop View [replncss].[Interface Load Status];

CREATE View [replncss].[Interface Load Status]
AS
SELECT [Interface_Trigger_Id] As [Trigger ID]
	  ,[Interface_Id] As [Interface ID]
	  ,Convert(Date,[Act_Start_Time]) As [Trigger Run Date]
      ,FORMAT([Act_Start_Time],'HH:mm')[Start Time]
	  ,FORMAT([Act_End_Time],'HH:mm')[End Time]
      ,DATEDIFF(minute,[Act_Start_Time],[Act_End_Time]) As [Duration In Min]
      ,[Interface_Status] As [Interface Status]
 FROM [intcf].[Status];
 GO