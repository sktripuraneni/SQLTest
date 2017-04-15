CREATE TABLE [SalesLT].[SalesOrderHeader]
(
[SalesOrderID] [int] NOT NULL CONSTRAINT [DF_SalesOrderHeader_OrderID] DEFAULT (NEXT VALUE FOR [SalesLT].[SalesOrderNumber]),
[RevisionNumber] [tinyint] NOT NULL CONSTRAINT [DF_SalesOrderHeader_RevisionNumber] DEFAULT ((0)),
[OrderDate] [datetime] NOT NULL CONSTRAINT [DF_SalesOrderHeader_OrderDate] DEFAULT (getdate()),
[DueDate] [datetime] NOT NULL,
[ShipDate] [datetime] NULL,
[Status] [tinyint] NOT NULL CONSTRAINT [DF_SalesOrderHeader_Status] DEFAULT ((1)),
[OnlineOrderFlag] [dbo].[Flag] NOT NULL CONSTRAINT [DF_SalesOrderHeader_OnlineOrderFlag] DEFAULT ((1)),
[SalesOrderNumber] AS (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID],(0)),N'*** ERROR ***')),
[PurchaseOrderNumber] [dbo].[OrderNumber] NULL,
[AccountNumber] [dbo].[AccountNumber] NULL,
[CustomerID] [int] NOT NULL,
[ShipToAddressID] [int] NULL,
[BillToAddressID] [int] NULL,
[ShipMethod] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreditCardApprovalCode] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubTotal] [money] NOT NULL CONSTRAINT [DF_SalesOrderHeader_SubTotal] DEFAULT ((0.00)),
[TaxAmt] [money] NOT NULL CONSTRAINT [DF_SalesOrderHeader_TaxAmt] DEFAULT ((0.00)),
[Freight] [money] NOT NULL CONSTRAINT [DF_SalesOrderHeader_Freight] DEFAULT ((0.00)),
[TotalDue] AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
[Comment] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_SalesOrderHeader_rowguid] DEFAULT (newid()),
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_SalesOrderHeader_ModifiedDate] DEFAULT (getdate())
)
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] ADD CONSTRAINT [CK_SalesOrderHeader_DueDate] CHECK (([DueDate]>=[OrderDate]))
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] ADD CONSTRAINT [CK_SalesOrderHeader_Freight] CHECK (([Freight]>=(0.00)))
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] ADD CONSTRAINT [CK_SalesOrderHeader_ShipDate] CHECK (([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL))
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] ADD CONSTRAINT [CK_SalesOrderHeader_Status] CHECK (([Status]>=(0) AND [Status]<=(8)))
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] ADD CONSTRAINT [CK_SalesOrderHeader_SubTotal] CHECK (([SubTotal]>=(0.00)))
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] ADD CONSTRAINT [CK_SalesOrderHeader_TaxAmt] CHECK (([TaxAmt]>=(0.00)))
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] ADD CONSTRAINT [PK_SalesOrderHeader_SalesOrderID] PRIMARY KEY CLUSTERED  ([SalesOrderID])
GO
CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_CustomerID] ON [SalesLT].[SalesOrderHeader] ([CustomerID])
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] ADD CONSTRAINT [AK_SalesOrderHeader_rowguid] UNIQUE NONCLUSTERED  ([rowguid])
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] ADD CONSTRAINT [AK_SalesOrderHeader_SalesOrderNumber] UNIQUE NONCLUSTERED  ([SalesOrderNumber])
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] ADD CONSTRAINT [FK_SalesOrderHeader_Address_BillTo_AddressID] FOREIGN KEY ([BillToAddressID]) REFERENCES [SalesLT].[Address] ([AddressID])
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] ADD CONSTRAINT [FK_SalesOrderHeader_Address_ShipTo_AddressID] FOREIGN KEY ([ShipToAddressID]) REFERENCES [SalesLT].[Address] ([AddressID])
GO
ALTER TABLE [SalesLT].[SalesOrderHeader] ADD CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID] FOREIGN KEY ([CustomerID]) REFERENCES [SalesLT].[Customer] ([CustomerID])
GO
