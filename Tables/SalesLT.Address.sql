CREATE TABLE [SalesLT].[Address]
(
[AddressID] [int] NOT NULL IDENTITY(1, 1),
[AddressLine1] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddressLine2] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StateProvince] [dbo].[Name] NOT NULL,
[CountryRegion] [dbo].[Name] NOT NULL,
[PostalCode] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Address_rowguid] DEFAULT (newid()),
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Address_ModifiedDate] DEFAULT (getdate())
)
GO
ALTER TABLE [SalesLT].[Address] ADD CONSTRAINT [PK_Address_AddressID] PRIMARY KEY CLUSTERED  ([AddressID])
GO
CREATE NONCLUSTERED INDEX [IX_Address_AddressLine1_AddressLine2_City_StateProvince_PostalCode_CountryRegion] ON [SalesLT].[Address] ([AddressLine1], [AddressLine2], [City], [StateProvince], [PostalCode], [CountryRegion])
GO
ALTER TABLE [SalesLT].[Address] ADD CONSTRAINT [AK_Address_rowguid] UNIQUE NONCLUSTERED  ([rowguid])
GO
CREATE NONCLUSTERED INDEX [IX_Address_StateProvince] ON [SalesLT].[Address] ([StateProvince])
GO
