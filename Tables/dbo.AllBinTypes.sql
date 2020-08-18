CREATE TABLE [dbo].[AllBinTypes] (
  [pk_int] [int] NOT NULL,
  [binary] [binary](1) NULL,
  [binary(1234)] [binary](1234) NULL,
  [varbinary] [varbinary](1) NULL,
  [varbinary(max)] [varbinary](max) NULL,
  [image] [image] NULL,
  [xml] [xml] NULL,
  [sql_variant] [sql_variant] NULL,
  [sysname] [sysname] NULL,
  [uniqueidentifier] [uniqueidentifier] NULL,
  [binary varying] [varbinary](1) NULL,
  PRIMARY KEY CLUSTERED ([pk_int])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO