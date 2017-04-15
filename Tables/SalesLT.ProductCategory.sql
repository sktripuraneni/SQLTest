CREATE TABLE [SalesLT].[ProductCategory]
(
[ProductCategoryID] [int] NOT NULL IDENTITY(1, 1),
[ParentProductCategoryID] [int] NULL,
[Name] [dbo].[Name] NOT NULL,
[rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProductCategory_rowguid] DEFAULT (newid()),
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductCategory_ModifiedDate] DEFAULT (getdate())
)
GO
ALTER TABLE [SalesLT].[ProductCategory] ADD CONSTRAINT [PK_ProductCategory_ProductCategoryID] PRIMARY KEY CLUSTERED  ([ProductCategoryID])
GO
ALTER TABLE [SalesLT].[ProductCategory] ADD CONSTRAINT [AK_ProductCategory_Name] UNIQUE NONCLUSTERED  ([Name])
GO
ALTER TABLE [SalesLT].[ProductCategory] ADD CONSTRAINT [AK_ProductCategory_rowguid] UNIQUE NONCLUSTERED  ([rowguid])
GO
ALTER TABLE [SalesLT].[ProductCategory] ADD CONSTRAINT [FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID] FOREIGN KEY ([ParentProductCategoryID]) REFERENCES [SalesLT].[ProductCategory] ([ProductCategoryID])
GO
