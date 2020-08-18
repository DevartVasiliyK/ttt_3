CREATE TABLE [dbo].[ErrorLog111] (
  [Demo.DemoSalesOrderHeaderSeed] [varchar](512) NULL,
  [column1] [varchar](50) NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', '??????', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog111'
GO