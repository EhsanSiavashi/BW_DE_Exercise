
CREATE TABLE [dbo].[staging](
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
	[facility_type] [varchar](500) NULL
) ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [IX_staging_phoneaddress1] ON [dbo].[staging]
(
	[phone] ASC,
	[address1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO