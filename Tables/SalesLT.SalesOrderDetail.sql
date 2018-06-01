CREATE TABLE [SalesLT].[SalesOrderDetail] (
  [SalesOrderID] [int] NOT NULL,
  [SalesOrderDetailID] [int] IDENTITY,
  [OrderQty] [smallint] NOT NULL,
  [ProductID] [int] NOT NULL,
  [UnitPrice] [money] NOT NULL,
  [UnitPriceDiscount] [money] NOT NULL CONSTRAINT [DF_SalesOrderDetail_UnitPriceDiscount] DEFAULT (0.0),
  [LineTotal] AS (isnull(([UnitPrice]*((1.0)-[UnitPriceDiscount]))*[OrderQty],(0.0))),
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_SalesOrderDetail_rowguid] DEFAULT (newid()),
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_SalesOrderDetail_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID] PRIMARY KEY CLUSTERED ([SalesOrderID], [SalesOrderDetailID]),
  CONSTRAINT [AK_SalesOrderDetail_rowguid] UNIQUE ([rowguid])
)
GO

ALTER TABLE [SalesLT].[SalesOrderDetail] WITH NOCHECK
  ADD CONSTRAINT [CK_SalesOrderDetail_OrderQty] CHECK ([OrderQty]>(0))
GO

ALTER TABLE [SalesLT].[SalesOrderDetail] WITH NOCHECK
  ADD CONSTRAINT [CK_SalesOrderDetail_UnitPrice] CHECK ([UnitPrice]>=(0.00))
GO

ALTER TABLE [SalesLT].[SalesOrderDetail] WITH NOCHECK
  ADD CONSTRAINT [CK_SalesOrderDetail_UnitPriceDiscount] CHECK ([UnitPriceDiscount]>=(0.00))
GO

CREATE INDEX [IX_SalesOrderDetail_ProductID]
  ON [SalesLT].[SalesOrderDetail] ([ProductID])
GO

ALTER TABLE [SalesLT].[SalesOrderDetail]
  ADD CONSTRAINT [FK_SalesOrderDetail_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
GO

ALTER TABLE [SalesLT].[SalesOrderDetail]
  ADD CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID] FOREIGN KEY ([SalesOrderID]) REFERENCES [SalesLT].[SalesOrderHeader] ([SalesOrderID]) ON DELETE CASCADE
GO