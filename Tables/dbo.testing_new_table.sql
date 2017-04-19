CREATE TABLE [dbo].[testing_new_table]
(
[col1] [int] NOT NULL,
[col2] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[col3] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [dbo].[testing_new_table] ADD CONSTRAINT [PK_testing_new_table] PRIMARY KEY CLUSTERED  ([col1])
GO
