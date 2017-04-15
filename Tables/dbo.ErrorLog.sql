CREATE TABLE [dbo].[ErrorLog]
(
[ErrorLogID] [int] NOT NULL IDENTITY(1, 1),
[ErrorTime] [datetime] NOT NULL CONSTRAINT [DF_ErrorLog_ErrorTime] DEFAULT (getdate()),
[UserName] [sys].[sysname] NOT NULL,
[ErrorNumber] [int] NOT NULL,
[ErrorSeverity] [int] NULL,
[ErrorState] [int] NULL,
[ErrorProcedure] [nvarchar] (126) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorLine] [int] NULL,
[ErrorMessage] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
ALTER TABLE [dbo].[ErrorLog] ADD CONSTRAINT [PK_ErrorLog_ErrorLogID] PRIMARY KEY CLUSTERED  ([ErrorLogID])
GO
