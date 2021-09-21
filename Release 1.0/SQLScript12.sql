/**********************************************************************************************************************
Stored Procedure Name: [dwhcda].[SP_4_header_item_consolidation]
Description: This Dynamic stored procedure is used to load the data from dst layer table to TRN layer table. 

Based on the key columns for each record in the target table, if there already exist a record for the same key then Overwrite the record else Insert the record.
Data Type: Master / Transaction

Parameter1: Is used for source_table_name, which is passed dynamically
Parameter2: Is used for target_table_name, which is passed dynamically
Parameter3: Is used for input_pk_list(Primary Key), which is passed dynamically
Parameter4: Is used for schema_name, which is passed dynamically
Parameter5: Is used for First Lookup Table Name, which is passed dynamically
Parameter6: Is used for Join key for First Lookup Table, which is passed dynamically
Parameter7: Is used for O/P Columns List from First Lookup Table, which is passed dynamically
Parameter8: Is used for Target table schema_name, which is passed dynamically

Since the Stored Procedures are executed through Integration Framework, so as per the configuration table if a SP has parameters then all the stored proceudres should be created with same number of parameters by considering the max number of parameters used in all the stored procedures.

In this SP, we are passing null values for parameters from 09-14,while executing the SP as these parameters are not used in the SP.
@Parameter9,@Parameter10,@Parameter11,@Parameter12,@Parameter13,@Parameter14 are dummy parameters, these are used to maintain the consistency in all the SP's.

Data Load Frequency: Manual
Load Type: Delta load
Integration Framework: 

Original Project: JBT
Developer: Pooja Thakur
Date: 03-05-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

CREATE PROCEDURE [dwhcda].[SP_4_header_item_consolidation] 
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
@Parameter11 varchar(500),
@Parameter12 varchar(500),
@Parameter13 varchar(500),
@Parameter14 varchar(500) 

AS

BEGIN  

SET NOCOUNT ON;

DECLARE @target_col_list VARCHAR(MAX)  
DECLARE @mod_input_pk_list NVARCHAR(4000) 
DECLARE @non_pk_keys NVARCHAR(MAX) 
DECLARE @pk_keys NVARCHAR(4000) 
DECLARE @update_non_pk_col_list NVARCHAR(MAX) 
DECLARE @join_pk_col_list NVARCHAR(4000) 
DECLARE @source_col_list VARCHAR(MAX) 
DECLARE @sub_table VARCHAR(MAX) 
DECLARE @sep_lookup_cols_list  VARCHAR(MAX) 
DECLARE @mod_lookup_cols_list  VARCHAR(MAX) 
DECLARE @join_lookup_cols_list NVARCHAR(4000) 
DECLARE @sub_pk_keys NVARCHAR(4000)  
DECLARE @mod_join_cols_list NVARCHAR(4000) 
DECLARE @in_source_col_list varchar(max)

-----print @Parameter3

/* Converting the O/P columns list from Lookup table into select statment */

 select @mod_lookup_cols_list= ' select '''+replace(@Parameter7,',',''' as name  union select ''') + ''' as name '

---print 'modified column list ' + @mod_lookup_cols_list

/* Converting the Joining columns list from Lookup table into select statment */

 select @mod_join_cols_list= ' select '''+replace(@Parameter6,',',''' as name  union select ''') + ''' as name '

---print 'modified column list ' + @mod_join_cols_list

/* Preparing joining condition for Lookup table */ 

DECLARE @join_lookup_col_list nvarchar(max) = 'select @sub_pk_keys = 
    STRING_AGG(cast((' + '''A.''' + ' + name + ' + ''' = B.''' + ' + name) as varchar(max)),' + ''' and ''' + ') 
    from ('+ @mod_join_cols_list+' )  b'
	
--print ' join_lookup_col_list is' +@join_lookup_col_list

EXEC sp_executesql @join_lookup_col_list, @Params = N'@sub_pk_keys VARCHAR(max) OUTPUT', @sub_pk_keys = @sub_pk_keys OUTPUT

--print 'sub_pk_keys are '+ @sub_pk_keys

/* Prefexing "b." for O/P columns list for Lookup table */

select @sep_lookup_cols_list = 'b.'+replace(@Parameter7, ',' , ',b.') 

----print @sep_lookup_cols_list

 /*Extracting Source table columns list from sys.columns based on the source table name parameter passed and storing into valiable*/
 
SELECT @source_col_list =  
   STRING_AGG( cast(('a.'+col.name) as varchar(max)) , ',') WITHIN GROUP (ORDER BY column_id )
  ----STRING_AGG(cast(col.name  as NVARCHAR(MAX)))
from sys.tables as tab
    inner join sys.columns as col
        on tab.object_id = col.object_id
    left join sys.types as t
    on col.user_type_id = t.user_type_id
    WHERE lower(schema_name(tab.schema_id))  = lower(@Parameter4)
    AND lower(tab.name) = lower(@Parameter1) 
	
 ----print 'source_col_list'+@source_col_list

 /*Extracting Source table columns list from sys.columns by appending with "b." based on the source table name parameter passed and storing into valiable. This parameter is used in values section of the insert statement*/
 
 SELECT @in_source_col_list =  
   STRING_AGG( cast(('b.'+col.name) as varchar(max)) , ',') WITHIN GROUP (ORDER BY column_id )
  ----STRING_AGG(cast(col.name  as NVARCHAR(MAX)))
from sys.tables as tab
    inner join sys.columns as col
        on tab.object_id = col.object_id
    left join sys.types as t
    on col.user_type_id = t.user_type_id
    WHERE lower(schema_name(tab.schema_id))  = lower(@Parameter4)
    AND lower(tab.name) = lower(@Parameter1) 
 ----print 'source_col_list'+@in_source_col_list

---print ' souce cols list is done'

 /* Preparing Sub query by concating the multible valiables which are required for the sub query */
 
select @sub_table = 'select '+ @source_col_list + ',' + @sep_lookup_cols_list 
+ ' from '  + @Parameter4 +'.'+ @Parameter1 +' a LEFT JOIN ' + @Parameter4 +'.'+ @Parameter5 + ' b ON ' + @sub_pk_keys + 
' Where a.dwh_load_time > CASE WHEN ((SELECT count(*) AS count
FROM ' + @Parameter8 +'.'+ @Parameter2 + ')) = 0 THEN convert(datetime,' + '''1900-01-01 00:00:00''' +')
ELSE (SELECT max(dwh_load_time) FROM ' + @Parameter8 +'.'+ @Parameter2 + ') END'

---print ' final source col list ' +@sub_table

/*Extracting Target table columns list from sys.columns based on the target table name parameter passed and storing into valiable*/

SELECT @target_col_list =  
  STRING_AGG( cast(( col.name ) as varchar(max)), ',') WITHIN GROUP (ORDER BY column_id ) 
from sys.tables as tab
    inner join sys.columns as col
        on tab.object_id = col.object_id
    left join sys.types as t
    on col.user_type_id = t.user_type_id
    WHERE lower(schema_name(tab.schema_id))  = lower(@Parameter8)
    AND lower(tab.name) = lower(@Parameter2) 
	
--print 'target_col_list'+@target_col_list

/*Preparing a query for the Input PK list which is passed as a parameter, which can be used in next steps*/

select @mod_input_pk_list= ' select '''+replace(@Parameter3,',',''' as name  union select ''') + ''' as name '

---print @mod_input_pk_list

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
 (select name from #cttae1
UNION ALL
'+ @mod_lookup_cols_list+' ) EXCEPT ('+@mod_input_pk_list +') ) b OPTION (LABEL = ''SP_4_header_item_consolidation_1'')'
---print ' tsql7 is' +@tsql7

EXEC sp_executesql @tsql7, @Params = N'@non_pk_keys VARCHAR(max) OUTPUT', @non_pk_keys = @non_pk_keys OUTPUT

---print 'non_pk_keys are '+ @non_pk_keys

/* Storing primary key columns into a variable */

DECLARE @tsql8 nvarchar(max) = 'select @pk_keys = 
   STRING_AGG(name,'+''','''+') from (
select name from #cttae1 INTERSECT select name from #cttae2 ) b OPTION (LABEL = ''SP_4_header_item_consolidation_2'')'

EXEC sp_executesql @tsql8, @Params = N'@pk_keys VARCHAR(max) OUTPUT', @pk_keys = @pk_keys OUTPUT

---print 'pk_keys are  '+ @pk_keys

/* Storing updatable columns into a variable by excluding primary key columns*/

DECLARE @tsql9 nvarchar(max) = 'select @update_non_pk_col_list = 
   STRING_AGG(cast((' + '''A.''' + ' + name + ' + ''' = B.''' + ' + name) as varchar(max)),' + ''',''' + ') 
    from ( (
select name from #cttae1
UNION ALL
'+ @mod_lookup_cols_list+' ) EXCEPT ('+@mod_input_pk_list +') ) b OPTION (LABEL = ''SP_4_header_item_consolidation_3'')'

--print 'update non pk col list is done '

EXEC sp_executesql @tsql9, @Params = N'@update_non_pk_col_list VARCHAR(max) OUTPUT', @update_non_pk_col_list = @update_non_pk_col_list OUTPUT

--print 'update_non_pk_col_list'+@update_non_pk_col_list

/* Storing joining condition columns into a variable by framing into correct syntax */

DECLARE @tsql10 nvarchar(max) = 'select @join_pk_col_list = 
   STRING_AGG(' + '''A.''' + ' + name + ' + ''' = B.''' + ' + name,' + ''' and ''' + ') from ( (
select name from #cttae1
UNION ALL
'+ @mod_lookup_cols_list+' ) INTERSECT ('+@mod_input_pk_list +') ) b OPTION (LABEL = ''SP_4_header_item_consolidation_4'')'

EXEC sp_executesql @tsql10, @Params = N'@join_pk_col_list VARCHAR(max) OUTPUT', @join_pk_col_list = @join_pk_col_list OUTPUT

---print 'join_pk_col_list '+@join_pk_col_list 

	BEGIN TRANSACTION;

	BEGIN TRY

 DECLARE @tsql11 nvarchar(max) = 
'MERGE ' +  @Parameter8+'.'+@Parameter2 + ' as A 
USING  ( '+ @sub_table + ') as B 
ON '+ @join_pk_col_list +' 
WHEN MATCHED AND B.ztimestamp > A.ztimestamp
THEN UPDATE SET ' + @update_non_pk_col_list

DECLARE @tsql12 nvarchar(max) = 
' WHEN NOT MATCHED BY TARGET THEN 
INSERT (' + @target_col_list +')
values ('+@in_source_col_list + ',' + @sep_lookup_cols_list +') OPTION (LABEL = ''SP_4_header_item_consolidation_5'');'

--PRINT @tsql11
---PRINT @tsql12

EXEC (@tsql11+@tsql12)

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
GO


