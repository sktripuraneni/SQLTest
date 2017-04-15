CREATE TABLE [SalesLT].[ProductModelProductDescription]
(
[ProductModelID] [int] NOT NULL,
[ProductDescriptionID] [int] NOT NULL,
[Culture] [nchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProductModelProductDescription_rowguid] DEFAULT (newid()),
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductModelProductDescription_ModifiedDate] DEFAULT (getdate())
)
GO
ALTER TABLE [SalesLT].[ProductModelProductDescription] ADD CONSTRAINT [PK_ProductModelProductDescription_ProductModelID_ProductDescriptionID_Culture] PRIMARY KEY CLUSTERED  ([ProductModelID], [ProductDescriptionID], [Culture])
GO
ALTER TABLE [SalesLT].[ProductModelProductDescription] ADD CONSTRAINT [AK_ProductModelProductDescription_rowguid] UNIQUE NONCLUSTERED  ([rowguid])
GO
ALTER TABLE [SalesLT].[ProductModelProductDescription] ADD CONSTRAINT [FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID] FOREIGN KEY ([ProductDescriptionID]) REFERENCES [SalesLT].[ProductDescription] ([ProductDescriptionID])
GO
ALTER TABLE [SalesLT].[ProductModelProductDescription] ADD CONSTRAINT [FK_ProductModelProductDescription_ProductModel_ProductModelID] FOREIGN KEY ([ProductModelID]) REFERENCES [SalesLT].[ProductModel] ([ProductModelID])
GO
