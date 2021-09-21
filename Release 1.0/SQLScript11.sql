/**********************************************************************************************************************
Stored Procedure Name: [dwhcda].[SP_2_business_partners_enrichment]
Description: This Dynamic stored procedure is used to load the delta data from DST layer table to DIM layer table. This Stored Procedure is used to join 2 lookup tables and select the correcponding columns from each table based on the parameters passed.

Based on the key columns for each record in the target table, if there already exist a record for the same key and timestamp from the source table is greater than the target table then delete the record from target table and then Insert the record.

Data Type: Master / Transaction

Parameter1: Is used for source_table_name, which is passed dynamically
Parameter2: Is used for target_table_name, which is passed dynamically
Parameter3: Is used for input_pk_list(Primary Key), which is passed dynamically
Parameter4: Is used for schema_name, which is passed dynamically
Parameter5: Is used for First Lookup Table Name, which is passed dynamically
Parameter6: Is used for Join key for First Lookup Table, which is passed dynamically
Parameter7: Is used for O/P Columns List from First Lookup Table, which is passed dynamically
Parameter8: Is used for Second Lookup Table Name, which is passed dynamically
Parameter9: Is used for Join key for Second Lookup Table, which is passed dynamically
Parameter10:Is used for O/P Columns List from Second Lookup Table, which is passed dynamically
Parameter11: Is used for Target table schema_name, which is passed dynamically

Since the Stored Procedures are executed through Integration Framework, so as per the configuration table if a SP has parameters then all the stored proceudres should be created with same number of parameters by considering the max number of parameters used in all the stored procedures.

In this SP, we are passing null values for parameters from 12-14,while executing the SP as these parameters are not used in the SP.
@Parameter12,@Parameter13,@Parameter14 are dummy parameters, these are used to maintain the consistency in all the SP's.

Lookup Tables: Two lookup tables, which are passed dynamically
Data Load Frequency: Manual
Load Type: Delta load
Integration Framework: 

Original Project: JBT
Developer: Srilatha Naregudam
Date: 30-04-2021
Reviewed By: Atul Raje

Change History:
**********************************************************************************************************************/

CREATE PROCEDURE [dwhcda].[SP_2_business_partners_enrichment] 
@Parameter1 VARCHAR(100),
@Parameter2 VARCHAR(100),
@Parameter3 VARCHAR(200),
@Parameter4 VARCHAR(50),
@Parameter5 VARCHAR(50),
@Parameter6 VARCHAR(50),
@Parameter7 VARCHAR(500),
@Parameter8 VARCHAR(50),
@Parameter9 VARCHAR(50),
@Parameter10 VARCHAR(500),
@Parameter11 VARCHAR(50),
@Parameter12 VARCHAR(50),
@Parameter13 VARCHAR(500),
@Parameter14 VARCHAR(500) 

AS
BEGIN  

SET NOCOUNT ON;

DECLARE @target_col_list NVARCHAR(MAX)  
DECLARE @mod_input_pk_list NVARCHAR(4000) 
DECLARE @pk_keys NVARCHAR(4000) 
DECLARE @join_pk_col_list NVARCHAR(4000) 
DECLARE @source_col_list NVARCHAR(MAX) 
DECLARE @in_source_col_list NVARCHAR(max)
DECLARE @sub_table NVARCHAR(MAX) 
DECLARE @lookup_cols_list_table_1 NVARCHAR(MAX)
DECLARE @sep_lookup_cols_list_table_1 NVARCHAR(MAX)
DECLARE @in_sep_lookup_cols_list_table_1 NVARCHAR(MAX)
DECLARE @lookup_cols_list_table_2 NVARCHAR(MAX) 
DECLARE @sep_lookup_cols_list_table_2 NVARCHAR(MAX) 
DECLARE @in_sep_lookup_cols_list_table_2 NVARCHAR(MAX) 
DECLARE @mod_lookup_cols_list_table_1 NVARCHAR(MAX) 
DECLARE @mod_lookup_cols_list_table_2 NVARCHAR(MAX)
DECLARE @sub_pk_keys_table_1 NVARCHAR(4000)  
DECLARE @sub_pk_keys_table_2 NVARCHAR(4000)  
DECLARE @mod_join_cols_list_table_1 NVARCHAR(4000) 
DECLARE @mod_join_cols_list_table_2 NVARCHAR(4000) 


	--Print @Parameter3
	
	/* Converting the O/P columns list from First Lookup table into select statment */
	
	select @mod_lookup_cols_list_table_1 = ' select '''+replace(@Parameter7,',',''' as name  union select ''') + ''' as name '
	
	--Print 'modified column list table 1: ' + @mod_lookup_cols_list_table_1
	
	/* Converting the O/P columns list from Second Lookup table into select statment */
	select @mod_lookup_cols_list_table_2 = ' select '''+replace(@Parameter10,',',''' as name  union select ''') + ''' as name '
	
	--Print 'modified column list table 2: ' + @mod_lookup_cols_list_table_2
	
	/* Converting the Joining columns list from First Lookup table into select statment */
	select @mod_join_cols_list_table_1 = ' select '''+replace(@Parameter6,',',''' as name  union select ''') + ''' as name '
	
	--Print 'modified join column list table 1: ' + @mod_join_cols_list_table_1
	
	/* Converting the Joining columns list from Second Lookup table into select statment */
	select @mod_join_cols_list_table_2 = ' select '''+replace(@Parameter9,',',''' as name  union select ''') + ''' as name '
	
	--Print 'modified join column list table 2: ' + @mod_join_cols_list_table_2
	
	/* Preparing joining condition for First Lookup table */ 
	DECLARE @join_lookup_col_list_table_1 nvarchar(max) = 'select @sub_pk_keys_table_1 = 
		STRING_AGG(cast((' + '''a.''' + ' + name + ' + ''' = b.''' + ' + name) as NVARCHAR(max)),' + ''' and ''' + ') 
		from ('+ @mod_join_cols_list_table_1+' )  b'
	--Print ' join_lookup_col_list_table_1 is: ' +@join_lookup_col_list_table_1
	EXEC sp_executesql @join_lookup_col_list_table_1, @Params = N'@sub_pk_keys_table_1 NVARCHAR(max) OUTPUT', @sub_pk_keys_table_1 = @sub_pk_keys_table_1 OUTPUT
	
	--Print 'sub_pk_keys are '+ @sub_pk_keys_table_1
	
	/* Preparing joining condition for Second Lookup table */
	DECLARE @join_lookup_col_list_table_2 nvarchar(max) = 'select @sub_pk_keys_table_2 = 
		STRING_AGG(cast((' + '''b.''' + ' + name + ' + ''' = c.''' + ' + name) as NVARCHAR(max)),' + ''' and ''' + ') 
		from ('+ @mod_join_cols_list_table_2+' )  b'
	--Print ' join_lookup_col_list_table_2 is: ' +@join_lookup_col_list_table_2
	EXEC sp_executesql @join_lookup_col_list_table_2, @Params = N'@sub_pk_keys_table_2 NVARCHAR(max) OUTPUT', @sub_pk_keys_table_2 = @sub_pk_keys_table_2 OUTPUT
	
	--Print 'sub_pk_keys are '+ @sub_pk_keys_table_2
	
	/* O/P columns list for First Lookup table */
	select @lookup_cols_list_table_1 = @Parameter7 
	
	--Print @lookup_cols_list_table_1
	
	/* Prefexing "b." for O/P columns list for First Lookup table */
	select @sep_lookup_cols_list_table_1 = 'b.'+replace(@Parameter7, ',' , ',b.') 
	
	--Print @sep_lookup_cols_list_table_1
	
	/* Prefexing "a." for O/P columns list for First Lookup table */
	select @in_sep_lookup_cols_list_table_1 = 'a.'+replace(@Parameter7, ',' , ',a.') 
	
	--Print @in_sep_lookup_cols_list_table_1
	
	/* O/P columns list for Second Lookup table */
	select @lookup_cols_list_table_2 = @Parameter10 
	
	--Print @lookup_cols_list_table_2
	
	/* Prefexing "c." for O/P columns list for Second Lookup table */
	select @sep_lookup_cols_list_table_2 = 'c.'+replace(@Parameter10, ',' , ',c.') 
	
	--Print @sep_lookup_cols_list_table_2
	
	/* Prefexing "a." for O/P columns list for Second Lookup table */
	select @in_sep_lookup_cols_list_table_2 = 'a.'+replace(@Parameter10, ',' , ',a.') 
	
	--Print @in_sep_lookup_cols_list_table_2
	
	
	/*Extracting Source table columns list from sys.columns based on the source table name parameter passed and storing into valiable*/
	
	SELECT @source_col_list =  
	STRING_AGG( cast((col.name) as NVARCHAR(max)) , ',') WITHIN GROUP (ORDER BY column_id )
	from sys.tables as tab
		inner join sys.columns as col
			on tab.object_id = col.object_id
		left join sys.types as t
		on col.user_type_id = t.user_type_id
		WHERE lower(schema_name(tab.schema_id))  = lower(@Parameter4)
		AND lower(tab.name) = lower(@Parameter1) 
		
	--Print 'source_col_list is: '+ @source_col_list
	
	/*Extracting Source table columns list from sys.columns by appending with "b." based on the source table name parameter passed and storing into valiable. This parameter is used in values section of the insert statement*/
	
	SELECT @in_source_col_list =  
	STRING_AGG( cast(('a.'+col.name) as NVARCHAR(max)) , ',') WITHIN GROUP (ORDER BY column_id )
	from sys.tables as tab
		inner join sys.columns as col
			on tab.object_id = col.object_id
		left join sys.types as t
		on col.user_type_id = t.user_type_id
		WHERE lower(schema_name(tab.schema_id))  = lower(@Parameter4)
		AND lower(tab.name) = lower(@Parameter1) 
		
	--Print 'In source_col_list: '+ @in_source_col_list
	
	/* Preparing Sub query by concating the multible valiables which are required for the sub query */
	
	Select @sub_table = 'Select '+ @in_source_col_list + ',' + @sep_lookup_cols_list_table_1 + ',' + @sep_lookup_cols_list_table_2
	+ ' FROM '  + @Parameter4 +'.'+ @Parameter1 +' a LEFT JOIN ' + @Parameter4 +'.'+ @Parameter5 + ' b ON ' + @sub_pk_keys_table_1
	+' LEFT JOIN ' + @Parameter4 +'.'+ @Parameter8 + ' c ON ' + @sub_pk_keys_table_2 + 
	' Where a.dwh_load_time > CASE WHEN ((SELECT count(*) AS count
	FROM ' + @Parameter11 +'.'+ @Parameter2 + ')) = 0 THEN convert(datetime,' + '''1900-01-01 00:00:00''' +')
	ELSE (SELECT max(dwh_load_time) FROM ' + @Parameter11 +'.'+ @Parameter2 + ') END'
	
	--Print ' Final source col list ' +@sub_table
	
	/*Extracting Target table columns list from sys.columns based on the target table name parameter passed and storing into valiable*/
	
	SELECT @target_col_list =  
	STRING_AGG( cast(( col.name ) as NVARCHAR(max)), ',') WITHIN GROUP (ORDER BY column_id ) 
	from sys.tables as tab
		inner join sys.columns as col
			on tab.object_id = col.object_id
		left join sys.types as t
		on col.user_type_id = t.user_type_id
		WHERE lower(schema_name(tab.schema_id))  = lower(@Parameter11)
		AND lower(tab.name) = lower(@Parameter2) 
	
	--Print 'target_col_list: '+@target_col_list
	
	/*Preparing a query for the Input PK list which is passed as a parameter, which can be used in next steps*/
	
	select @mod_input_pk_list= ' select '''+replace(@Parameter3,',',''' as name union select ''') + ''' as name '
	
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
	--Print @tsql4
	EXEC sp_executesql @tsql4;
	
	/* Storing primary key columns into a variable */
	
	DECLARE @tsql8 nvarchar(max) = 'select @pk_keys = 
	STRING_AGG(name,'+''','''+') from (
	select name from #cttae1 INTERSECT select name from #cttae2 ) b OPTION (LABEL = ''SP_2_business_partners_enrichment_1'')'
	
	EXEC sp_executesql @tsql8, @Params = N'@pk_keys NVARCHAR(max) OUTPUT', @pk_keys = @pk_keys OUTPUT
	
	--Print 'pk_keys are: '+ @pk_keys
	
	/* Storing joining condition columns into a variable by framing into correct syntax */
	
	DECLARE @tsql10 nvarchar(max) = 'select @join_pk_col_list = 
	STRING_AGG(' + '''A.''' + ' + name + ' + ''' = B.''' + ' + name,' + ''' and ''' + ') from ( (
	select name from #cttae1 
	UNION ALL
	'+ @mod_lookup_cols_list_table_1 +
	' UNION ALL
	'+ @mod_lookup_cols_list_table_2 
	+' ) INTERSECT ('+@mod_input_pk_list +') ) b OPTION (LABEL = ''SP_2_business_partners_enrichment_2'')'
	
	EXEC sp_executesql @tsql10, @Params = N'@join_pk_col_list NVARCHAR(max) OUTPUT', @join_pk_col_list = @join_pk_col_list OUTPUT
	
	--Print 'join_pk_col_list is: '+@join_pk_col_list 

	/* Creating Temporary table as per the Target Table Structure */
	
	IF OBJECT_ID('tempdb..#business_partners_dim', 'U') IS NOT NULL
		DROP TABLE #business_partners_dim;

	Declare @tsql11 nvarchar(max) = 
	'Select * into #business_partners_dim FROM ' + @Parameter11 + '.' + @Parameter2 + ' Where 1=2;'
	
	--PRINT 'tsql11:' + @tsql11;
	EXEC sp_executesql @tsql11;

	/*Finally Insert Or Update data into Target Table*/
	
	BEGIN TRANSACTION;

	BEGIN TRY
	
	/* Preparing query to insert data into Temporary table from the source table query by joining with lookup tables which was defined based on delta mechanism*/
	/*
	'Insert Into #business_partners_dim (' + @source_col_list + ',' + @lookup_cols_list_table_1 + ',' + @lookup_cols_list_table_2 + ') ' + 
	*/
	Declare @tsql12 nvarchar(max) = 
	'Insert Into #business_partners_dim (' + @target_col_list + ') ' + 
	@sub_table + ' OPTION (LABEL = ''SP_2_business_partners_enrichment_3'');'

	--PRINT 'tsql12 :' + @tsql12;
	EXEC sp_executesql @tsql12;
	
	/*Finally Delete & Insert data into Target Table*/
		
	/* Deleting Matching records from #table where ztimestamp of source #table is less than or equal to ztimestamp of target table. */
	
	Declare @tsql13 nvarchar(max) = 
	'DELETE B 
	 FROM ' + @Parameter11 + '.' + @Parameter2 + ' AS A 
	INNER JOIN #business_partners_dim AS B 
	 ON ' + @join_pk_col_list + ' AND B.ztimestamp <= A.ztimestamp;'

	--PRINT 'tsql13 :' + @tsql13;
	EXEC sp_executesql @tsql13;
	
	/* Deleting Matching records from Target table where ztimestamp of source table is greater than ztimestamp of target table. As these updated records need to be inserted into Target table after deletion */
	
	Declare @tsql14 nvarchar(max) = 
	'DELETE B
	 FROM #business_partners_dim as A 
	INNER JOIN ' + @Parameter11 + '.' + @Parameter2 + ' AS B
	ON ' + @join_pk_col_list + ' AND A.ztimestamp > B.ztimestamp;'
	
	--PRINT 'tsql14 :' + @tsql14;
	EXEC sp_executesql @tsql14;
	
	/*Finally Inserting both New and Updated records into Target Table*/
	/*
	') (Select ' + @in_source_col_list + ',' + @in_sep_lookup_cols_list_table_1 + ',' + @in_sep_lookup_cols_list_table_2 + 
	*/
	
	Declare @tsql15 nvarchar(max) = 
	'INSERT INTO ' + @Parameter11 + '.' + @Parameter2 + '(' + @target_col_list + 
	') (Select ' + @target_col_list + 
	' FROM #business_partners_dim as a ) OPTION (LABEL = ''SP_2_business_partners_enrichment_4'');'

	--PRINT 'tsql15 :' + @tsql15;
	EXEC sp_executesql @tsql15;
	
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


