CREATE TABLE [dbo].[ErrorLog1] (
  [DueDate] [datetime2] NULL,
  [CustomerID] [int] NULL,
  [SalesPersonID] [int] NULL,
  [BillToAddressID] [int] NULL,
  [ShipToAddressID] [int] NULL,
  [ShipMethodID] [int] NULL,
  [LocalID] [int] NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', '????????????', 'SCHEMA', N'dbo', 'TABLE', N'ErrorLog1'
GO