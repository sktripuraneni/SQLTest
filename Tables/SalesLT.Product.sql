CREATE TABLE [SalesLT].[Product]
(
[ProductID] [int] NOT NULL IDENTITY(1, 1),
[Name] [dbo].[Name] NOT NULL,
[ProductNumber] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Color] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StandardCost] [money] NOT NULL,
[ListPrice] [money] NOT NULL,
[Size] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Weight] [decimal] (8, 2) NULL,
[ProductCategoryID] [int] NULL,
[ProductModelID] [int] NULL,
[SellStartDate] [datetime] NOT NULL,
[SellEndDate] [datetime] NULL,
[DiscontinuedDate] [datetime] NULL,
[ThumbNailPhoto] [varbinary] (max) NULL,
[ThumbnailPhotoFileName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Product_rowguid] DEFAULT (newid()),
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Product_ModifiedDate] DEFAULT (getdate())
)
GO
ALTER TABLE [SalesLT].[Product] WITH NOCHECK ADD CONSTRAINT [CK_Product_ListPrice] CHECK (([ListPrice]>=(0.00)))
GO
ALTER TABLE [SalesLT].[Product] WITH NOCHECK ADD CONSTRAINT [CK_Product_SellEndDate] CHECK (([SellEndDate]>=[SellStartDate] OR [SellEndDate] IS NULL))
GO
ALTER TABLE [SalesLT].[Product] WITH NOCHECK ADD CONSTRAINT [CK_Product_StandardCost] CHECK (([StandardCost]>=(0.00)))
GO
ALTER TABLE [SalesLT].[Product] WITH NOCHECK ADD CONSTRAINT [CK_Product_Weight] CHECK (([Weight]>(0.00)))
GO
ALTER TABLE [SalesLT].[Product] ADD CONSTRAINT [PK_Product_ProductID] PRIMARY KEY CLUSTERED  ([ProductID])
GO
ALTER TABLE [SalesLT].[Product] ADD CONSTRAINT [AK_Product_Name] UNIQUE NONCLUSTERED  ([Name])
GO
ALTER TABLE [SalesLT].[Product] ADD CONSTRAINT [AK_Product_ProductNumber] UNIQUE NONCLUSTERED  ([ProductNumber])
GO
ALTER TABLE [SalesLT].[Product] ADD CONSTRAINT [AK_Product_rowguid] UNIQUE NONCLUSTERED  ([rowguid])
GO
ALTER TABLE [SalesLT].[Product] ADD CONSTRAINT [FK_Product_ProductCategory_ProductCategoryID] FOREIGN KEY ([ProductCategoryID]) REFERENCES [SalesLT].[ProductCategory] ([ProductCategoryID])
GO
ALTER TABLE [SalesLT].[Product] ADD CONSTRAINT [FK_Product_ProductModel_ProductModelID] FOREIGN KEY ([ProductModelID]) REFERENCES [SalesLT].[ProductModel] ([ProductModelID])
GO
