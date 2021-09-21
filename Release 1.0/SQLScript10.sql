/**********************************************************************************************************************
Stored Procedure Name: [acq101].[SP_1_data_transfer]
Description: This Dynamic stored procedure is used to load the data from Temp layer table to DST layer table. As the Temp table is a Truncate and load so always we are loading delta data into DST table.
Since this SP is used to load data from DST to DIM tables, so delta mechanish is handeled by extracting only latest data from Source table based on max "dwh_load_time" from Target table.

Based on the key columns for each record in the target table, if there already exist a record for the same key then Overwrite the record else Insert the record.
Data Type: Master / Transaction
Parameter1: Is used for source_table_name, which is passed dynamically
Parameter2: Is used for target_table_name, which is passed dynamically
Parameter3: Is used for input_pk_list(Primary Key), which is passed dynamically
Parameter4: Is used for Source table schema_name, which is passed dynamically
Parameter5: Is used for Target table schema_name, which is passed dynamically

Since the Stored Procedures are executed through Integration Framework, so as per the configuration table if a SP has parameters then all the stored proceudres should be created with same number of parameters by considering the max number of parameters used in all the stored procedures.

In this SP, we are passing null values for parameters from 6-14,while executing the SP as these parameters are not used in the SP.
@Parameter6,@Parameter7,@Parameter8,@Parameter9,@Parameter10,@Parameter11,@Parameter12,@Parameter13,@Parameter14 are dummy parameters, these are used to maintain the consistency in all the SP's.

Lookup Tables: N/A
Data Load Frequency: Manual
Load Type: Delta load
Integration Framework: 

Original Project: JBT
Developer: Srilatha Naregudam
Date: 27-04-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

CREATE PROCEDURE [acq101].[SP_1_data_transfer] 
@Parameter1 VARCHAR(100),
@Parameter2 VARCHAR(100),
@Parameter3 varchar(200),
@Parameter4 VARCHAR(50),
@Parameter5 varchar(50),
@Parameter6 varchar(50),
@Parameter7 varchar(500),
@Parameter8 varchar(50),
@Parameter9 varchar(50),
@Parameter10 varchar(500),
@Parameter11 varchar(50),
@Parameter12 varchar(50),
@Parameter13 varchar(500),
@Parameter14 varchar(500) 

AS
BEGIN  

SET NOCOUNT ON;

DECLARE @target_col_list NVARCHAR(MAX)  
DECLARE @mod_input_pk_list NVARCHAR(4000) 
DECLARE @non_pk_keys NVARCHAR(MAX) 
DECLARE @pk_keys NVARCHAR(4000) 
DECLARE @update_non_pk_col_list NVARCHAR(MAX) 
DECLARE @join_pk_col_list NVARCHAR(4000) 
DECLARE @source_col_list NVARCHAR(MAX) 
DECLARE @in_source_col_list NVARCHAR(max)
DECLARE @sub_table NVARCHAR(MAX)
 

--Print @Parameter3

/*Extracting Source table columns list from sys.columns based on the source table name parameter passed and storing into valiable*/

SELECT @source_col_list =  
   STRING_AGG(Cast(col.name As NVARCHAR(MAX)) , ',') WITHIN GROUP (ORDER BY column_id )
from sys.tables as tab
    inner join sys.columns as col
        on tab.object_id = col.object_id
    left join sys.types as t
    on col.user_type_id = t.user_type_id
    WHERE lower(schema_name(tab.schema_id))  = lower(@Parameter4)
    AND lower(tab.name) = lower(@Parameter1) 

--Print 'source_col_list'+@source_col_list

/*Extracting Source table columns list from sys.columns by appending with "b." based on the source table name parameter passed and storing into valiable. This parameter is used in values section of the insert statement*/

 SELECT @in_source_col_list =  
   STRING_AGG( cast(('b.'+col.name) as NVARCHAR(max)) , ',') WITHIN GROUP (ORDER BY column_id )
from sys.tables as tab
    inner join sys.columns as col
        on tab.object_id = col.object_id
    left join sys.types as t
    on col.user_type_id = t.user_type_id
    WHERE lower(schema_name(tab.schema_id))  = lower(@Parameter4)
    AND lower(tab.name) = lower(@Parameter1) 
	
 --Print 'In source_col_list: '+ @in_source_col_list

/* Preparing Final Source query with delt mechanism. Also handling to consider only one record with latest ztimestampt value, if the source data has multiple records with same key columns */

SELECT @sub_table = 'Select '+ @source_col_list + ' From (
Select '+ @source_col_list + ',row_number() Over (Partition by ' + @Parameter3 + ' Order by ztimestamp desc) As rno '
+ ' FROM '  + @Parameter4 +'.'+ @Parameter1 + 
' Where dwh_load_time > CASE WHEN ((SELECT count(*) AS count
FROM ' + @Parameter5 +'.'+ @Parameter2 + ')) = 0 THEN convert(datetime,' + '''1900-01-01 00:00:00''' +')
ELSE (SELECT max(dwh_load_time) FROM ' + @Parameter5 +'.'+ @Parameter2 + ') END ) a Where rno = 1'

--Print 'Final Source query with Delta: ' +@sub_table


/*Extracting Target table columns list from sys.columns based on the target table name parameter passed and storing into valiable*/

SELECT @target_col_list =  
  STRING_AGG( cast((col.name) as NVARCHAR(MAX)), ',') WITHIN GROUP (ORDER BY column_id ) 
from sys.tables as tab
    inner join sys.columns as col
        on tab.object_id = col.object_id
    left join sys.types as t
    on col.user_type_id = t.user_type_id
    WHERE lower(schema_name(tab.schema_id))  = lower(@Parameter5)
    AND lower(tab.name) = lower(@Parameter2) 
	
--Print 'target_col_list'+@target_col_list

/*Preparing a query for the Input PK list which is passed as a parameter, which can be used in next steps*/

Select @mod_input_pk_list= ' select '''+replace(@Parameter3,',',''' as name  union select ''') + ''' as name '

--Print @mod_input_pk_list

/*Dropping temporary table which is used to store the source table columns list*/

IF OBJECT_ID('tempdb..#cttae1', 'U') IS NOT NULL
    DROP TABLE #cttae1;
	
CREATE TABLE #cttae1 (name VARCHAR(255));	

/*Dropping temporary table which is used to store the Primary key columns list*/

IF OBJECT_ID('tempdb..#cttae2', 'U') IS NOT NULL
    DROP TABLE #cttae2;

CREATE TABLE #cttae2 (name VARCHAR(255));	

/*Adding primary key columns into temporary table based on the query which is defined in previous step*/

DECLARE @tsql3 nvarchar(max) = 'Insert into #cttae2 '+ @mod_input_pk_list 
--PRINT @tsql3
EXEC sp_executesql @tsql3;

/*Adding columns into temporary table from the Source table which is passed as an parameter*/

DECLARE @tsql4 nvarchar(max) = 'Insert into #cttae1 SELECT col.name from sys.columns as col
where object_NAME(col.OBJECT_ID) = ' + '''' + @Parameter1 + '''';
--PRINT @tsql4
EXEC sp_executesql @tsql4;

/* Storing non primary key columns into a variable */

DECLARE @tsql7 nvarchar(max) = 'select @non_pk_keys = 
   STRING_AGG(name,'+''',''' +') from (
select name from #cttae1 EXCEPT select name from #cttae2 ) b OPTION (LABEL = ''SP_1_data_transfer_1'')'

EXEC sp_executesql @tsql7, @Params = N'@non_pk_keys VARCHAR(max) OUTPUT', @non_pk_keys = @non_pk_keys OUTPUT

--print 'non_pk_keys are '+ @non_pk_keys

/* Storing primary key columns into a variable */

DECLARE @tsql8 nvarchar(max) = 'select @pk_keys = 
   STRING_AGG(name,'+''','''+') from (
select name from #cttae1 INTERSECT select name from #cttae2 ) b OPTION (LABEL = ''SP_1_data_transfer_2'')'

EXEC sp_executesql @tsql8, @Params = N'@pk_keys VARCHAR(max) OUTPUT', @pk_keys = @pk_keys OUTPUT

--print 'pk_keys are: '+ @pk_keys

/* Storing updatable columns into a variable by excluding primary key columns*/

DECLARE @tsql9 nvarchar(max) = 'select @update_non_pk_col_list = 
   STRING_AGG(cast((' + '''A.''' + ' + name + ' + ''' = B.''' + ' + name) as varchar(max)),' + ''',''' + ') 
    from (
select name from #cttae1 EXCEPT select name from #cttae2 ) b OPTION (LABEL = ''SP_1_data_transfer_3'')'

EXEC sp_executesql @tsql9, @Params = N'@update_non_pk_col_list VARCHAR(max) OUTPUT', @update_non_pk_col_list = @update_non_pk_col_list OUTPUT

--print 'update_non_pk_col_list'+@update_non_pk_col_list

/* Storing joining condition columns into a variable by framing into correct syntax */

DECLARE @tsql10 nvarchar(max) = 'select @join_pk_col_list = 
   STRING_AGG(' + '''A.''' + ' + name + ' + ''' = B.''' + ' + name,' + ''' and ''' + ') from (
select name from #cttae1 INTERSECT select name from #cttae2 ) b OPTION (LABEL = ''SP_1_data_transfer_4'')'

EXEC sp_executesql @tsql10, @Params = N'@join_pk_col_list VARCHAR(max) OUTPUT', @join_pk_col_list = @join_pk_col_list OUTPUT

--print 'join_pk_col_list '+@join_pk_col_list 

	/*Finally Insert Or Update data into Target Table*/
	
	BEGIN TRANSACTION;

	BEGIN TRY
	
	DECLARE @tsql11 nvarchar(max) = 
	'MERGE ' +  @Parameter5+'.'+@Parameter2 + ' as A 
	USING  ( '+ @sub_table + ') as B
	ON '+ @join_pk_col_list +' 
	WHEN MATCHED AND B.ztimestamp > A.ztimestamp
	THEN UPDATE SET ' + @update_non_pk_col_list

	DECLARE @tsql12 nvarchar(max) = 
	' WHEN NOT MATCHED BY TARGET THEN 
	INSERT (' + @target_col_list +')
	values ('+@in_source_col_list+') OPTION (LABEL = ''SP_1_data_transfer_5'');'

	--PRINT @tsql11
	--PRINT @tsql12


	EXEC (@tsql11+@tsql12);
	
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
	

END