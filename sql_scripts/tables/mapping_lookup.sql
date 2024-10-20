CREATE TABLE [dbo].[mapping_lookup](
	[file_name] [varchar](500) NULL,
	[source] [varchar](max) NULL,
	[target] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'accepts_financial_aid')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'ages_served')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'capacity')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', N'[Expiration Date]', N'certificate_expiration_date')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', N'CASE WHEN Address like ''%LAS VEGAS,%'' THEN ''LAS VEGAS''  WHEN Address like ''%HENDERSON,%'' THEN ''HENDERSON'' WHEN Address like ''%MESQUITE,%'' THEN ''MESQUITE'' WHEN Address like ''%BOULDER CITY,%'' THEN ''BOULDER CITY'' END ', N'city')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', N'LEFT(address, CHARINDEX('','', address)) ', N'address1')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'address2')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', N'Name', N'company')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', N'Phone', N'phone')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'phone2')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', N'County', N'county')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'curriculum_type')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'email')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', N'LEFT([Primary Contact Name], CHARINDEX('' '', [Primary Contact Name])) ', N'first_name')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'language')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', N'RIGHT([Primary Contact Name], LEN([Primary Contact Name]) - CHARINDEX('' '', [Primary Contact Name]))', N'last_name')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', N'Status', N'license_status')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', N'[First Issue Date]', N'license_issued')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'license_number')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'license_renewed')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', N'[Credential Type]', N'license_type')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'licensee_name')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'max_age')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'min_age')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'operator')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'provider_id')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'schedule')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', N'State', N'state')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'title')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'website_address')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', N'RIGHT(address, LEN(address) - CHARINDEX('', NV '', address) - 3)', N'zip')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource1', NULL, N'facility_type')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'[Accepts Subsidy]', N'accepts_financial_aid')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'[Ages Accepted 1] +  AA2 + AA3 +  AA4', N'ages_served')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'[Total Cap]', N'capacity')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'cast ( null as date)', N'certificate_expiration_date')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'city', N'city')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'address1', N'address1')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'address2', N'address2')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'company', N'company')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'phone', N'phone')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', NULL, N'phone2')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', NULL, N'county')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', NULL, N'curriculum_type')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'email', N'email')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'LEFT([Primary Caregiver], CHARINDEX('' '', [Primary Caregiver])) ', N'first_name')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', NULL, N'language')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'RIGHT([Primary Caregiver], LEN([Primary Caregiver]) - CHARINDEX('' '', [Primary Caregiver])) ', N'last_name')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', NULL, N'license_status')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'REPLACE([License Monitoring Since],''Monitoring since '','''')', N'license_issued')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'RIGHT([Type License], LEN([Type License]) - CHARINDEX(''-'', [Type License])-2)  ', N'license_number')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', NULL, N'license_renewed')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'LEFT([Type License], CHARINDEX(''-'', [Type License])-1) ', N'license_type')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', NULL, N'licensee_name')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'CASE 
	WHEN AA4 LIKE ''%Infants%'' THEN 1
	WHEN AA4 LIKE ''%Toddlers%'' THEN 2
	WHEN AA4 LIKE ''%Preschool%'' THEN 4
	WHEN AA4 LIKE ''%School-age%'' THEN 5
	WHEN AA3 LIKE ''%Infants%'' THEN 1
	WHEN AA3 LIKE ''%Toddlers%'' THEN 2
	WHEN AA3 LIKE ''%Preschool%'' THEN 4
	WHEN AA3 LIKE ''%School-age%'' THEN 5
	WHEN AA2 LIKE ''%Infants%'' THEN 1
	WHEN AA2 LIKE ''%Toddlers%'' THEN 2
	WHEN AA2 LIKE ''%Preschool%'' THEN 4
	WHEN AA2 LIKE ''%School-age%'' THEN 5
	WHEN [Ages Accepted 1] LIKE ''%Infants%'' THEN 1 
	WHEN [Ages Accepted 1] LIKE ''%Toddlers%'' THEN 2
	WHEN [Ages Accepted 1] LIKE ''%Preschool%'' THEN 4
	WHEN [Ages Accepted 1] LIKE ''%School-age%'' THEN 5
END', N'max_age')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'CASE WHEN [Ages Accepted 1] LIKE ''%Infants%'' THEN 0 
WHEN [Ages Accepted 1] LIKE ''%Toddlers%'' THEN 1 
WHEN [Ages Accepted 1] LIKE ''%Preschool%'' THEN 2
WHEN [Ages Accepted 1] LIKE ''%School-age%'' THEN 5
END', N'min_age')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', NULL, N'operator')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', NULL, N'provider_id')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'''Mon: '' + Mon + ''Tues: '' + Tues + ''Wed: '' + Wed + ''Thurs: '' + Thurs + ''Friday: '' + Friday + ''Sat: '' + Saturday + ''Sun: '' + Sunday', N'schedule')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'state', N'state')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', NULL, N'title')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', NULL, N'website_address')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', N'zip', N'zip')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource2', NULL, N'facility_type')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'accepts_financial_aid')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'IIF(Infant = ''Y'', ''Infant'', '''') + IIF(Toddler = ''Y'', ''Toddler'', '''') + IIF(Preschool = ''Y'', ''Preschool'', '''') + IIF(School = ''Y'', ''School'', '''') 
', N'ages_served')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'capacity', N'capacity')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'cast ( null as date)', N'certificate_expiration_date')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'city', N'city')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'address', N'address1')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'address2')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'[Operation Name]', N'company')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'phone', N'phone')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'phone2')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'county', N'county')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'curriculum_type')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'[Email Address]', N'email')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'first_name')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'language')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'last_name')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'Status', N'license_status')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'[Issue Date]', N'license_issued')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'license_number')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'license_renewed')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'type', N'license_type')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'licensee_name')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'max_age')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'min_age')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'operator')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'[Facility ID]', N'provider_id')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'schedule')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'state', N'state')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'title')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'website_address')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', N'zip', N'zip')
GO
INSERT [dbo].[mapping_lookup] ([file_name], [source], [target]) VALUES (N'TechnicalExerciseDataSource3', NULL, N'facility_type')
GO
