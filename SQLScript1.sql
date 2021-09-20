/********************************************************************************************************************
Description: Creating Schemas to create Tables / Views / Stored Proceudres at different layers.
Developer: Mohammed Majid
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/

CREATE SCHEMA intcf;
CREATE SCHEMA acq101;
CREATE SCHEMA dwhcda;
CREATE SCHEMA replncss;
GO

/********************************************************************************************************************
Table Name: [intcf].[DailySchedule]
Description: This is a Framework table for Scheduling, 'IF_Schedule_Extraction' Dynamic pipeline get the entries
From 'intcf.DailySchedule' table and Trigger.
Data Type: Dimension Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/

CREATE TABLE intcf.DailySchedule
(
	Interface_Id varchar(20) NULL,
	Business_Area varchar(50) NULL,
	Pipeline_Name varchar(50) NULL,
	Frequency varchar(50) NULL,
	Scheduled_Time datetime NULL
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
    
);



/********************************************************************************************************************
Table Name: [intcf].[DataLakeToDataWarehouse]
Description: This is a Framework table. 'IF_Datalake_to_Datawarehouse' Dynamic pipeline get the entries
From 'intcf.DataLakeToDataWarehouse' table and Trigger.
Data Type: Framework Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/


CREATE TABLE intcf.DataLakeToDataWarehouse
(
	Interface_Id varchar(20) NOT NULL,
	Business_Area varchar(50) NULL,
	Pipeline_Name varchar(50) NULL,
	LS_SrcName varchar(100) NULL,
	Src_Container varchar(255) NULL,
	Src_Directory varchar(255) NULL,
	Src_ArchiveFolder varchar(255) NULL,
	Src_ErrorFolder varchar(255) NULL,
	Src_FileName varchar(50) NULL,
	Src_FileDelimiter varchar(50) NULL,
	LS_TrgName varchar(100) NULL,
	Trg_SchemaName varchar(50) NULL,
	Trg_TableName varchar(50) NULL,
	LoadType varchar(10) NULL,
	Upsert_Column varchar(50) NULL,
	[User] varchar(255) NULL,
	Updated_At datetime NULL,
	Src_FileType varchar(50)
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
    
);

/********************************************************************************************************************
Table Name: [intcf].[DataWarehouseProcessing]
Description: This is a Framework table. 'IF_Datawarehouse_Processing' Dynamic pipeline get the entries
From 'intcf.DataWarehouseProcessing' table and Trigger.
Data Type: Framework Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/

CREATE TABLE intcf.DataWarehouseProcessing
(
	Interface_Id varchar(20) NULL,
	Business_Area varchar(50) NULL,
	Pipeline_Name varchar(50) NULL,
	LS_TrgName varchar(100) NULL,
	StoredProcedure varchar(100) NULL,
	SP_Parameters varchar(10) NULL,
	Parameter1 varchar(250) NULL,
	Parameter2 varchar(250) NULL,
	Parameter3 varchar(250) NULL,
	Parameter4 varchar(250) NULL,
    Parameter5 varchar(250) NULL,
    Parameter6 varchar(250) NULL,
    Parameter7 varchar(250) NULL,
    Parameter8 varchar(250) NULL,
	Parameter9 varchar(250) NULL,
	Parameter10 varchar(250) NULL,
	Parameter11 varchar(250) NULL,
	Parameter12 varchar(250) NULL,
	Parameter13 varchar(250) NULL,
	Parameter14 varchar(250) NULL,
	[User] 		varchar(255) NULL,
	Updated_At datetime NULL
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
    
);

/********************************************************************************************************************
Table Name: [intcf].[dates_tab]
Description: This is a Framework table. Used in the 'intcf.SP_Update_DailySchedule' Framework Procedure.
Data Type: Framework Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/

CREATE TABLE intcf.dates_tab
(
	date_value datetime NULL,
	frequency varchar(20) NULL
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
    
);

/********************************************************************************************************************
Table Name: [intcf].[DBToDataLake]
Description: This is a Framework table. 'IF_DB_to_Datalake' Dynamic pipeline get the entries
From 'intcf.DBToDataLake' table and Trigger.
Data Type: Framework Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/

CREATE TABLE intcf.DBToDataLake
(
	Interface_Id varchar(20) NOT NULL,
	Business_Area varchar(50) NULL,
	Pipeline_Name varchar(50) NULL,
	LS_SrcName varchar(100) NULL,
	Schema_Name varchar(50) NULL,
	Table_Name varchar(50) NULL,
	Custom_SQL varchar(255) NULL,
	LS_TrgName varchar(100) NULL,
	Trg_Container varchar(255) NULL,
	Trg_Directory varchar(255) NULL,
	Trg_FileName varchar(50) NULL,
	LoadType varchar(10) NULL,
	Delta_Column varchar(50) NULL,
	Delta_Operator varchar(50) NULL,
	Delta_Value varchar(50) NULL,
	[User] varchar(255) NULL,
	Updated_At datetime NULL
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
    
)

/********************************************************************************************************************
Table Name: [intcf].[EmailAlert]
Description: This is a Framework table. Which sends Emails to the receipants, when error occurs in Pipeline runs.
Data Type: Framework Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/

CREATE TABLE intcf.EmailAlert
(
	Interface_Id varchar(20) NULL,
	Business_Area varchar(50) NULL,
	Pipeline_Name varchar(50) NULL,
	email_id varchar(255) NULL,
	files varchar(255) NULL,
	Updated_At datetime NULL
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
    
)

/********************************************************************************************************************
Table Name: [intcf].[ErrorLog]
Description: This is a Framework table. When ever errors occurs in pipeline runs,The error details Logged
into this Table.
Data Type: Framework Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/

CREATE TABLE intcf.ErrorLog
(
	Interface_Id varchar(20) NULL,
	Business_Area varchar(50) NULL,
	Pipeline_Name varchar(50) NULL,
	DataFactoryInstance varchar(100) NULL,
	PipeLine_Type varchar(100) NULL,
	ADF_RunId varchar(100) NULL,
	ADF_ErrorMsg varchar(4000) NULL,
	Failed_Activity varchar(100) NULL,
	Email_Flag varchar(50) NULL,
	CreatedOn datetime NULL
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
    
)

/********************************************************************************************************************
Table Name: [intcf].[FileToDataLake]
Description: This is a Framework table. 'IF_File_to_Datalake' Dynamic pipeline get the entries
From 'intcf.FileToDataLake' table and Trigger.
Data Type: Framework Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/

CREATE TABLE intcf.FileToDataLake
(
	Interface_Id varchar(20) NULL,
	Business_Area varchar(50) NULL,
	Pipeline_Name varchar(50) NULL,
	LS_SrcName varchar(100) NULL,
	Src_FolderPath varchar(255) NULL,
	Src_Directory varchar(255) NULL,
	Src_FileName varchar(50) NULL,
	Src_FileType varchar(10) NULL,
	LS_TrgName varchar(100) NULL,
	Trg_Container varchar(255) NULL,
	Trg_Directory varchar(255) NULL,
	LoadType varchar(10) NULL,
	NoFileError varchar(10) NULL,
	[User] varchar(255) NULL,
	Updated_At datetime NULL,
	LastModified_From datetime NULL,
	LastModified_To datetime NULL
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
    
)

/********************************************************************************************************************
Table Name: [intcf].[InterfaceDependencies]
Description: This is a Framework table. 'IF_Dependency_Extraction' Dynamic pipeline get the entries
From 'intcf.InterfaceDependencies' table and Trigger Dependant Interfaces.
Data Type: Framework Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/

CREATE TABLE intcf.InterfaceDependencies
(
	Interface_Id varchar(20) NULL,
	Parent_Interface varchar(20) NULL,
	[User] varchar(255) NULL,
	Updated_At datetime NULL
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
    
)

/********************************************************************************************************************
Table Name: [intcf].[InterfaceMaster]
Description: This is a Framework table. This is the Master table which holds Master Information of every Interface_Id.
Data Type: Framework Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/


CREATE TABLE intcf.InterfaceMaster
(
	Interface_Id varchar(20) NOT NULL,
	Interface_Desc varchar(255) NULL,
	Business_Area varchar(50) NULL,
	Pipeline_Name varchar(50) NULL,
	Source varchar(50) NULL,
	Target varchar(50) NULL,
	Format varchar(50) NULL,
	Pipeline_Type varchar(50) NULL,
	Active_Flag varchar(10) NULL,
	[User] varchar(255) NULL,
	Updated_At datetime NULL,
	Status varchar(255) NULL,
	Status_Updated_At datetime NULL,
	Run_Flag varchar(20) NULL

)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
    
)

/********************************************************************************************************************
Table Name: [intcf].[Status]
Description: This is a Framework table. This table holds information of every interface_id of it's run. 
(start time,end time, status, count etc)
Data Type: Framework Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/

CREATE TABLE intcf.Status
(
	Interface_Id varchar(20) NULL,
	Act_Start_Time datetime NULL,
	Act_End_Time datetime NULL,
	Act_Duration varchar(10) NULL,
	Source_Count int NULL,
	Target_Count int NULL,
	Interface_Status varchar(50) NULL,
	Interface_Trigger_Id varchar(100) NULL,
	Interface_Runid varchar(100) NULL
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
    
)


/********************************************************************************************************************
Table Name: [intcf].[ColumnMapping]
Description: This is a Framework table. which holds column names,schema name, table name of all temp tables.
which is used in '[intcf].[sp_getColumnMapping]' Procedure to generate Json Structure of every Tmp table.
Data Type: Framework Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/

CREATE TABLE [intcf].[ColumnMapping]
(
	[SchemaName] [varchar](50) NULL,
	[TableName] [varchar](50) NULL,
	[SourceColumn] [varchar](50) NULL,
	[TargetColumn] [varchar](50) NULL,
	[DataType] [varchar](50) NULL,
	[KeyColumn] [varchar](50) NULL
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
    
)


/********************************************************************************************************************
Table Name: [intcf].[ScheduleMaster]
Description: This is a Framework table. which holds schedule information
Data Type: Framework Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/


CREATE TABLE intcf.ScheduleMaster
(
	Interface_Id varchar(20) NOT NULL,
	Business_Area varchar(50) NULL,
	Pipeline_Name varchar(50) NULL,
	Frequency varchar(50) NULL,
	StartDateTime datetime NULL,
	EndDateTime datetime NULL,
	Monday varchar(1) NULL,
	Tuesday varchar(1) NULL,
	Wednesday varchar(1) NULL,
	Thursday varchar(1) NULL,
	Friday varchar(1) NULL,
	Saturday varchar(1) NULL,
	Sunday varchar(1) NULL,
	[User] varchar(255) NULL,
	Updated_At datetime NULL
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
    
);

/********************************************************************************************************************
Table Name: [intcf].[JsonLoad]
Description: This is a Framework table. which holds Json structure of every Tmp table,generated by
'[intcf].[sp_getColumnMapping] ' Procedure.
Data Type: Framework Data
Original Project: JBT Sales
Developer: Kishore Makke
Date: 28/04/2021
Reviewed By: Ramakrishnan Velu
*********************************************************************************************************************/


CREATE TABLE [intcf].[JsonLoad]
(
    [SchemaName] [varchar](50) NULL,
    [TableName] [varchar](50) NULL,
    [jout] [nvarchar](max) NULL
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN,
    HEAP
);


