CREATE TABLE [SalesLT].[Customer]
(
[CustomerID] [int] NOT NULL IDENTITY(1, 1),
[NameStyle] [dbo].[NameStyle] NOT NULL CONSTRAINT [DF_Customer_NameStyle] DEFAULT ((0)),
[Title] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [dbo].[Name] NOT NULL,
[MiddleName] [dbo].[Name] NULL,
[LastName] [dbo].[Name] NOT NULL,
[Suffix] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompanyName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalesPerson] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [dbo].[Phone] NULL,
[PasswordHash] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PasswordSalt] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Customer_rowguid] DEFAULT (newid()),
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Customer_ModifiedDate] DEFAULT (getdate())
)
GO
ALTER TABLE [SalesLT].[Customer] ADD CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED  ([CustomerID])
GO
CREATE NONCLUSTERED INDEX [IX_Customer_EmailAddress] ON [SalesLT].[Customer] ([EmailAddress])
GO
ALTER TABLE [SalesLT].[Customer] ADD CONSTRAINT [AK_Customer_rowguid] UNIQUE NONCLUSTERED  ([rowguid])
GO
