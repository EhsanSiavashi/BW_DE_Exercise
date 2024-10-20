CREATE PROC [dbo].[usp_load_staging] (@file_name VARCHAR(max))
AS 
BEGIN TRY
	-- Declare required variables for creating a dynamc sql query that will load the pre_staging table based on the mapping documents.
	DECLARE @map VARCHAR(MAX) = ''
	DECLARE @sql_query VARCHAR(MAX) = ''

	-- creating the mapping logic:
	SELECT @map = @map + ISNULL(source, 'NULL') + ' AS ' + target + ', '
	FROM Mapping_lookup 
	WHERE file_name = @file_name 

	-- Drop the pre-staging table if exists:
	DECLARE @drop varchar(max) = 'DROP TABLE IF EXISTS ' + @file_name + '_pre_stage;'
	EXEC(@drop)

	-- Create and execute the dynamic sql query that loads the pre-staging table:
	DECLARE @create_prestaging VARCHAR(MAX) = 'CREATE TABLE ' + @file_name + '_pre_stage (
																[accepts_financial_aid] [varchar](500) NULL,
																[ages_served] [varchar](500) NULL,
																[capacity] [int] NULL,
																[certificate_expiration_date] [date] NULL,
																[city] [varchar](500) NULL,
																[address1] [varchar](500) NULL,
																[address2] [varchar](500) NULL,
																[company] [varchar](500) NULL,
																[phone] [varchar](500) NULL,
																[phone2] [varchar](500) NULL,
																[county] [varchar](500) NULL,
																[curriculum_type] [varchar](500) NULL,
																[email] [varchar](500) NULL,
																[first_name] [varchar](500) NULL,
																[language] [varchar](500) NULL,
																[last_name] [varchar](500) NULL,
																[license_status] [varchar](500) NULL,
																[license_issued] [date] NULL,
																[license_number] [int] NULL,
																[license_renewed] [int] NULL,
																[license_type] [varchar](500) NULL,
																[licensee_name] [varchar](500) NULL,
																[max_age] [int] NULL,
																[min_age] [int] NULL,
																[operator] [varchar](500) NULL,
																[provider_id] [varchar](500) NULL,
																[schedule] [varchar](500) NULL,
																[state] [varchar](500) NULL,
																[title] [varchar](500) NULL,
																[website_address] [varchar](500) NULL,
																[zip] [varchar](500) NULL,
																[facility_type] [varchar](500) NULL);'

	EXEC(@create_prestaging)
	SELECT @sql_query = 'INSERT INTO ' + @file_name + '_pre_stage ' + 'SELECT ' + LEFT(@map, len(@map)-1) + ' FROM ' + @file_name + ';'
	EXEC(@sql_query)

	-- Load the delta into staging table:
	TRUNCATE TABLE [dbo].[staging];
	DECLARE @delta VARCHAR(MAX) = 'INSERT INTO [dbo].[staging] 
										SELECT ps.* FROM ' + @file_name + '_pre_stage ps
										LEFT JOIN [dbo].[dim_prospecttive_orgs] d 
										ON  ISNULL(ps.[accepts_financial_aid]		    ,'''')     =ISNULL( d.[accepts_financial_aid]				,'''')
										  AND ISNULL(ps.[ages_served]					,'''')     =ISNULL( d.[ages_served]							,'''')
										  AND ISNULL(ps.[capacity]						,'''')     =ISNULL( d.[capacity]							,'''')
										  AND ISNULL(ps.[certificate_expiration_date]	,'''')     =ISNULL( d.[certificate_expiration_date]			,'''')
										  AND ISNULL(ps.[city]							,'''')     =ISNULL( d.[city]									 ,'''')
										  AND ISNULL(ps.[address1]						,'''')     =ISNULL( d.[address1]								 ,'''')
										  AND ISNULL(ps.[address2]						,'''')     =ISNULL( d.[address2]								 ,'''')
										  AND ISNULL(ps.[company]						,'''')     =ISNULL( d.[company]								,'''')
										  AND ISNULL(ps.[phone]						    ,'''')     =ISNULL( d.[phone]									 ,'''')
										  AND ISNULL(ps.[phone2]						,'''')     =ISNULL( d.[phone2]								,'''')
										  AND ISNULL(ps.[county]						,'''')     =ISNULL( d.[county]								,'''')
										  AND ISNULL(ps.[curriculum_type]				,'''')     =ISNULL( d.[curriculum_type]						,'''')
										  AND ISNULL(ps.[email]						    ,'''')     =ISNULL( d.[email]									 ,'''')
										  AND ISNULL(ps.[first_name]					,'''')     =ISNULL( d.[first_name]							,'''')
										  AND ISNULL(ps.[language]						,'''')     =ISNULL( d.[language]								 ,'''')
										  AND ISNULL(ps.[last_name]					    ,'''')     =ISNULL( d.[last_name]								 ,'''')
										  AND ISNULL(ps.[license_status]				,'''')     =ISNULL( d.[license_status]						,'''')
										  AND ISNULL(ps.[license_issued]				,'''')     =ISNULL( d.[license_issued]						,'''')
										  AND ISNULL(ps.[license_number]				,'''')     =ISNULL( d.[license_number]						,'''')
										  AND ISNULL(ps.[license_renewed]				,'''')     =ISNULL( d.[license_renewed]						,'''')
										  AND ISNULL(ps.[license_type]					,'''')     =ISNULL( d.[license_type]							 ,'''')
										  AND ISNULL(ps.[licensee_name]				    ,'''')     =ISNULL( d.[licensee_name]							 ,'''')
										  AND ISNULL(ps.[max_age]						,'''')     =ISNULL( d.[max_age]								,'''')
										  AND ISNULL(ps.[min_age]						,'''')     =ISNULL( d.[min_age]								,'''')
										  AND ISNULL(ps.[operator]						,'''')     =ISNULL( d.[operator]								 ,'''')
										  AND ISNULL(ps.[provider_id]					,'''')     =ISNULL( d.[provider_id]							,'''')
										  AND ISNULL(ps.[schedule]						,'''')     =ISNULL( d.[schedule]								 ,'''')
										  AND ISNULL(ps.[state]						    ,'''')     =ISNULL( d.[state]									 ,'''')
										  AND ISNULL(ps.[title]						    ,'''')     =ISNULL( d.[title]									 ,'''')
										  AND ISNULL(ps.[website_address]				,'''')     =ISNULL( d.[website_address]						,'''')
										  AND ISNULL(ps.[zip]							,'''')     =ISNULL( d.[zip]									,'''')
										  AND ISNULL(ps.[facility_type]				    ,'''')     =ISNULL( d.[facility_type]							 ,'''')
										  WHERE d.phone is NULL ;'
	EXEC (@delta)	
END TRY
BEGIN CATCH
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY()
    DECLARE @ErrorState INT = ERROR_STATE()

	RAISERROR (@ErrorMessage, -- Message text.
        @ErrorSeverity, -- Severity.
        @ErrorState -- State.
    );
END CATCH
