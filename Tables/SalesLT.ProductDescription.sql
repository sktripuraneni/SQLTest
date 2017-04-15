CREATE TABLE [SalesLT].[ProductDescription]
(
[ProductDescriptionID] [int] NOT NULL IDENTITY(1, 1),
[Description] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProductDescription_rowguid] DEFAULT (newid()),
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductDescription_ModifiedDate] DEFAULT (getdate())
)
GO
ALTER TABLE [SalesLT].[ProductDescription] ADD CONSTRAINT [PK_ProductDescription_ProductDescriptionID] PRIMARY KEY CLUSTERED  ([ProductDescriptionID])
GO
ALTER TABLE [SalesLT].[ProductDescription] ADD CONSTRAINT [AK_ProductDescription_rowguid] UNIQUE NONCLUSTERED  ([rowguid])
GO
