CREATE TABLE [dbo].[BuildVersion]
(
[SystemInformationID] [tinyint] NOT NULL IDENTITY(1, 1),
[Database Version] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VersionDate] [datetime] NOT NULL,
[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_BuildVersion_ModifiedDate] DEFAULT (getdate())
)
GO
ALTER TABLE [dbo].[BuildVersion] ADD CONSTRAINT [PK__BuildVer__35E58ECA55970560] PRIMARY KEY CLUSTERED  ([SystemInformationID])
GO
