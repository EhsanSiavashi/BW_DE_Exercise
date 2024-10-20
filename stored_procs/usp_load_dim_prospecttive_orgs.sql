
CREATE PROC [dbo].[usp_load_dim_prospecttive_orgs] 
AS
BEGIN TRY
	/* Loading a type 2 dimension table for current and historical data: [dbo].[dim_prospecttive_orgs]
	
		1. The remaining BKs are the existing records that have changed 1 or more fields. For these:
			1. Set end_elt_date = GETDATE() for these BKs in the Dim.
			2. INSERT the records with such BKs into the Dim with: start_elt_date = GETDATE() and end_elt_date as NULL.
		2. Load new records (identify by BK: Phone+Address not in target), simply load them into [dim_prospecttive_orgs] with start_elt_date = GETDATE() and end_elt_date as NULL.
	*/

		-- Step 1: Set end_elt_date = GETDATE() for existing BKs in the Dim.
		UPDATE  d 
		SET end_elt_date = GETDATE()
		FROM [dbo].[dim_prospecttive_orgs] d
		JOIN [dbo].[Staging] s ON s.phone = d.phone and s.address1 = d.address1 and end_elt_date IS NULL

		-- Step 2: Insert the updated records into Dim with etl_end_date as NULL:
		INSERT INTO [dbo].[dim_prospecttive_orgs] 
		SELECT s.[accepts_financial_aid]
				  ,s.[ages_served]
				  ,s.[capacity]
				  ,s.[certificate_expiration_date]
				  ,s.[city]
				  ,s.[address1]
				  ,s.[address2]
				  ,s.[company]
				  ,s.[phone]
				  ,s.[phone2]
				  ,s.[county]
				  ,s.[curriculum_type]
				  ,s.[email]
				  ,s.[first_name]
				  ,s.[language]
				  ,s.[last_name]
				  ,s.[license_status]
				  ,s.[license_issued]
				  ,s.[license_number]
				  ,s.[license_renewed]
				  ,s.[license_type]
				  ,s.[licensee_name]
				  ,s.[max_age]
				  ,s.[min_age]
				  ,s.[operator]
				  ,s.[provider_id]
				  ,s.[schedule]
				  ,s.[state]
				  ,s.[title]
				  ,s.[website_address]
				  ,s.[zip]
				  ,s.[facility_type]
				  , GETDATE() as [start_elt_date]
				  , NULL      as [end_elt_date]
		FROM [dbo].[Staging] s
		INNER JOIN [dbo].[dim_prospecttive_orgs] d 
		ON s.phone = d.phone and s.address1 = d.address1 

	-- Step 3: Load New Records:
	INSERT INTO [dbo].[dim_prospecttive_orgs] 
	SELECT s.[accepts_financial_aid]
				  ,s.[ages_served]
				  ,s.[capacity]
				  ,s.[certificate_expiration_date]
				  ,s.[city]
				  ,s.[address1]
				  ,s.[address2]
				  ,s.[company]
				  ,s.[phone]
				  ,s.[phone2]
				  ,s.[county]
				  ,s.[curriculum_type]
				  ,s.[email]
				  ,s.[first_name]
				  ,s.[language]
				  ,s.[last_name]
				  ,s.[license_status]
				  ,s.[license_issued]
				  ,s.[license_number]
				  ,s.[license_renewed]
				  ,s.[license_type]
				  ,s.[licensee_name]
				  ,s.[max_age]
				  ,s.[min_age]
				  ,s.[operator]
				  ,s.[provider_id]
				  ,s.[schedule]
				  ,s.[state]
				  ,s.[title]
				  ,s.[website_address]
				  ,s.[zip]
				  ,s.[facility_type]
				  , GETDATE() as [start_elt_date]
				  , NULL      as [end_elt_date]
		FROM [dbo].[Staging] s
		LEFT JOIN [dbo].[dim_prospecttive_orgs] d 
		ON s.phone = d.phone and s.address1 = d.address1 
		WHERE d.phone is NULL

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