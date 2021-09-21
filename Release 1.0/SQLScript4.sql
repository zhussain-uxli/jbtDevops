/**********************************************************************************************************************
Stored Procedure Name: [intcf].[SP_Error_Log]
Description: This Framework stored procedure is used to load the error messages into Errorlog table. 
When ever errors occurs in pipeline runs.

Lookup Tables: N/A
Data Load Frequency: Manual
Load Type: Delta load
Integration Framework:  

Original Project: JBT
Developer: Kishore Makke
Date: 27-04-2021
Reviewed By: Ramakrishnan Velu 

Change History:
**********************************************************************************************************************/

CREATE PROC intcf.SP_Error_Log @Interface_Id varchar(20),@Business_Area varchar(50),@Pipeline_Name varchar(50),@DataFactoryInstance varchar(100),@PipeLine_Type varchar(100),@ADF_RunId varchar(100),@ADF_ErrorMsg varchar(1000),@Failed_Activity varchar(100),@CreatedOn datetime AS
BEGIN
INSERT INTO
intcf.ErrorLog
(
Interface_Id,
Business_Area,
Pipeline_Name,
DataFactoryInstance,
PipeLine_Type,
ADF_RunId,
ADF_ErrorMsg,
Failed_Activity,
CreatedOn
)
VALUES
(
@Interface_Id,
@Business_Area,
@Pipeline_Name,
@DataFactoryInstance,
@PipeLine_Type,
@ADF_RunId,
@ADF_ErrorMsg,
@Failed_Activity,
@CreatedOn
)
END;
GO


/**********************************************************************************************************************
Stored Procedure Name: [intcf].[SP_Update_FileConfig_Maxvalue]
Description: This Framework stored procedure is used to update 'LastModified_From' and  'LastModified_To' columns
in 'intcf.FileToDataLake' table. Based on those the 'filetodatalake' dynamic pipeline picks latest files from the source.


Lookup Tables: N/A
Data Load Frequency: Manual
Load Type: Delta load
Integration Framework:  

Original Project: JBT
Developer: Kishore Makke
Date: 27-04-2021
Reviewed By: Ramakrishnan Velu 

Change History:
**********************************************************************************************************************/

CREATE PROC [intcf].[SP_Update_FileConfig_Maxvalue] @fromtime [datetime],@totime [datetime],@interface_id [varchar](50) AS
BEGIN
    UPDATE intcf.FileToDataLake
    SET LastModified_From = @fromtime,
    LastModified_To = @totime    
WHERE Interface_id = @interface_id
END;
GO


/**********************************************************************************************************************
Stored Procedure Name: [intcf].[SP_update_controltable_maxvalue]
Description: This Framework stored procedure is used to update 'Delta_Value' column
in 'intcf.DBToDataLake' table. Based on those the 'DBToDataLake' dynamic pipeline picks Delta records 
from the source database.


Lookup Tables: N/A
Data Load Frequency: Manual
Load Type: Delta load
Integration Framework:  

Original Project: JBT
Developer: Kishore Makke
Date: 27-04-2021
Reviewed By: Ramakrishnan Velu 

Change History:
**********************************************************************************************************************/

CREATE PROC intcf.SP_update_controltable_maxvalue @Modifiedtime datetime,@interface_id varchar(50) AS 

BEGIN
    UPDATE intcf.DBToDataLake
    SET Delta_Value = @Modifiedtime
WHERE interface_id = @interface_id 

END;
GO




/**********************************************************************************************************************
Stored Procedure Name: [intcf].[SP_Update_DailySchedule]
Description: This Framework stored procedure is used to load data into 'intcf.dailyschedule' table from 'intcf.schedulemaster'
table. Based on the frequency (Monthly,weekly,Hourly) of the interface_id's.


Lookup Tables: N/A
Data Load Frequency: Manual
Load Type: Delta load
Integration Framework:  

Original Project: JBT
Developer: Kishore Makke
Date: 27-04-2021
Reviewed By: Ramakrishnan Velu 

Change History:
**********************************************************************************************************************/


CREATE PROC intcf.SP_Update_DailySchedule AS BEGIN 
DECLARE @intFlag INT

SET @intFlag = 0

WHILE (@intFlag <=23)

BEGIN

   

                PRINT CONCAT ( CONVERT(DATE, GETDATE()), ' ' , @intFlag ,':' , DATEPART(mi,GETDATE()) ,':' ,DATEPART(ss,GETDATE())  )

                insert into intcf.Dates_tab

                select CONCAT ( CONVERT(DATE, GETDATE()), ' ' , @intFlag ,':' , DATEPART(mi,GETDATE()) ,':' ,DATEPART(ss,GETDATE())  )

                ,  'Hourly'  

    SET @intFlag = @intFlag + 1

END

insert into intcf.DailySchedule

select interface_id,Business_Area,Pipeline_Name,frequency,scheduled_time

from (

select interface_id ,ScheduleMaster.frequency,StartDateTime, EndDateTime ,Business_Area,Pipeline_Name,

lower(FORMAT(getdate(), 'dddd')) AS current_day ,

Dates_tab.date_value  ,date_name ,execution_flag,

case when execution_flag='Y' and lower(FORMAT(getdate(), 'dddd')) = lower(date_name) then 'Valid'

else 'Invalid' end day_valid,

case

when ScheduleMaster.frequency='Daily' and getdate() between convert(varchar,StartDateTime , 20) and convert(varchar,EndDateTime , 20)

then convert(varchar,concat( CONVERT(date, getdate() ) ,' ', FORMAT(StartDateTime,'HH:mm:ss') ) , 20)

when ScheduleMaster.frequency='Hourly' and getdate() between convert(varchar,StartDateTime , 20) and convert(varchar,EndDateTime , 20)

and DATEADD(hh, DATEDIFF(hh, 0, Dates_tab.date_value ), 0) >= convert(varchar,concat( CONVERT(date, getdate() ) ,' ', FORMAT(StartDateTime,'HH:00:00') ) , 20)

and DATEADD(hh, DATEDIFF(hh, 0, Dates_tab.date_value ), 0) <= convert(varchar,concat( CONVERT(date, getdate() ) ,' ', FORMAT(EndDateTime,'HH:00:00') ) , 20)

then

convert(varchar,concat( CONVERT(date, Dates_tab.date_value  ) ,' ', FORMAT(Dates_tab.date_value ,'HH') ,':', FORMAT(StartDateTime,'mm:ss') ) , 20)

--Dates_tab.date_value

 when ScheduleMaster.frequency='Weekly' and CONVERT(date, getdate()) between convert(varchar,StartDateTime , 20) and convert(varchar,EndDateTime , 20)

then convert(varchar,concat( CONVERT(date,getdate()) ,' ', FORMAT(StartDateTime,'HH:mm:ss') ) , 20)

when ScheduleMaster.frequency='Monthly' and CONVERT(date, getdate()) between CONVERT(date, StartDateTime) and CONVERT(date, EndDateTime )

then -- DATEADD(month,1,getdate())

-- convert(varchar,concat( CONVERT(date, DATEADD(month,1,getdate())) ,' ', FORMAT(StartDateTime,'HH:mm:ss') ) , 20)

convert(varchar,concat( DATEPART(year,getdate()),'-', DATEPART(month,getdate() )

,'-', DATEPART(day,StartDateTime ) ,' ', FORMAT(StartDateTime,'HH:mm:ss') ) , 20)

when ScheduleMaster.frequency='OneTime' and CONVERT(date, getdate()) between CONVERT(date, StartDateTime) and CONVERT(date, EndDateTime )

then StartDateTime

else null

end as scheduled_time

from (SELECT interface_id ,frequency,StartDateTime, EndDateTime ,Business_Area,Pipeline_Name,

date_name ,execution_flag

FROM intcf.ScheduleMaster

UNPIVOT

(

execution_flag

FOR date_name IN (monday, Tuesday, Wednesday, Thursday,Friday,Saturday,Sunday)

) AS P) ScheduleMaster

 

LEFT JOIN intcf.Dates_tab

ON ScheduleMaster.frequency = Dates_tab.frequency

where 1=1

) a where CONVERT(date, scheduled_time) = CONVERT(date, getdate()) --- yesterday date

and day_valid='Valid'

;
truncate table intcf.Dates_tab;
END;
GO


/**********************************************************************************************************************
Stored Procedure Name: [intcf].[sp_getColumnMapping]
Description: This Framework stored procedure is used to generate the json file based on the entries in the 'intcf.columnmapping'
table, for every temp table.


Lookup Tables: N/A
Data Load Frequency: Manual
Load Type: Delta load
Integration Framework:  

Original Project: JBT
Developer: Kishore Makke
Date: 27-04-2021
Reviewed By: Ramakrishnan Velu 

Change History:
**********************************************************************************************************************/


CREATE PROC [intcf].[sp_getColumnMapping] @table_name [VARCHAR](100),@schema_name [VARCHAR](50) AS
BEGIN
  DECLARE @json_construct varchar(MAX) =  '@json(concat('''+'{"type": "TabularTranslator", "mappings": {X} ,  "collectionReference" : ""}';
  DECLARE @json VARCHAR(MAX);
    
  SET @json = (
    SELECT
        concat('$[''''''', ',''',c.source_column,''''''','']')
        + '' +
          COALESCE('['''''','''+c.lang+''''''','']','') AS 'source.path', 
        c.target_column AS 'sink.name'
    FROM intcf.column_mapping as c
  WHERE trim(c.schema_name) = trim(@schema_name)
    AND trim(c.table_name) = trim(@table_name) 

   );
 
    SELECT REPLACE(REPLACE(@json_construct,'{X}', @json),'?','') + '''''''))' AS json_output;
END;
GO

/**********************************************************************************************************************
Stored Procedure Name: [intcf].[SP_JsonLoad]
Description: This Framework stored procedure load the  generate json file into 'intcf.jsonload' table.

Lookup Tables: N/A
Data Load Frequency: Manual
Load Type: Delta load
Integration Framework:  

Original Project: JBT
Developer: Kishore Makke
Date: 27-04-2021
Reviewed By: Ramakrishnan Velu 

Change History:
**********************************************************************************************************************/

CREATE PROC [intcf].[SP_JsonLoad] @schemaname [varchar](50),@tablename [varchar](50),@jout [nvarchar](max) AS
BEGIN
INSERT INTO
intcf.JsonLoad
(
schemaname,
tablename,
jout
)
VALUES
(
@schemaname,
@tablename,
@jout
)
END;
GO

/**********************************************************************************************************************
Stored Procedure Name: [intcf].[SP_delete_temp_history_data]
Description: This Framework stored procedure delete history data from tmp tables.except latest 2 days of data.

Lookup Tables: N/A
Data Load Frequency: Manual
Load Type: Delta load
Integration Framework:  

Original Project: JBT
Developer: Kishore Makke
Date: 27-04-2021
Reviewed By: Ramakrishnan Velu 

Change History:
**********************************************************************************************************************/

CREATE PROC intcf.SP_delete_temp_history_data @tablename varchar(50),@schemaname varchar(50) AS
 BEGIN
 declare @sql nvarchar(max);
 SET @sql = 
'DELETE FROM '+@schemaname+'.'+@tablename +'where CONVERT (DATE,dwh_loadtime) >   DATEADD(DAY, -2, GETDATE())' 
PRINT @sql;
exec(@sql);
END;
GO