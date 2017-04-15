CREATE TABLE [SalesLT].[ProductModel]
(
[ProductModelID] [int] NOT NULL IDENTITY(1, 1),
[Name] [dbo].[Name] NOT NULL,
[CatalogDescription] [xml] NULL,
[rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProductModel_rowguid] DEFAULT (newid()),
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductModel_ModifiedDate] DEFAULT (getdate())
)
GO
ALTER TABLE [SalesLT].[ProductModel] ADD CONSTRAINT [PK_ProductModel_ProductModelID] PRIMARY KEY CLUSTERED  ([ProductModelID])
GO
ALTER TABLE [SalesLT].[ProductModel] ADD CONSTRAINT [AK_ProductModel_Name] UNIQUE NONCLUSTERED  ([Name])
GO
ALTER TABLE [SalesLT].[ProductModel] ADD CONSTRAINT [AK_ProductModel_rowguid] UNIQUE NONCLUSTERED  ([rowguid])
GO
