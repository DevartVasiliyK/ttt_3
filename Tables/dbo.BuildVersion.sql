CREATE TABLE [dbo].[BuildVersion] (
  [SystemInformationID] [tinyint] IDENTITY,
  [Database Version] [nvarchar](25) NOT NULL,
  [VersionDate] [datetime] NOT NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_BuildVersion_ModifiedDate] DEFAULT (getdate()),
  PRIMARY KEY CLUSTERED ([SystemInformationID])
)
GO