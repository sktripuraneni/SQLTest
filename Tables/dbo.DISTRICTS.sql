CREATE TABLE [dbo].[DISTRICTS]
(
[distid] [int] NOT NULL,
[distcode] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[distname] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [dbo].[DISTRICTS] ADD CONSTRAINT [PK_DISTRICTS] PRIMARY KEY CLUSTERED  ([distid])
GO
