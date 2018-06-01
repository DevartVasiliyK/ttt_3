CREATE TABLE [SalesLT].[Product] (
  [ProductID] [int] IDENTITY,
  [Name] [dbo].[Name] NOT NULL,
  [ProductNumber] [nvarchar](25) NOT NULL,
  [Color] [nvarchar](15) NULL,
  [StandardCost] [money] NOT NULL,
  [ListPrice] [money] NOT NULL,
  [Size] [nvarchar](5) NULL,
  [Weight] [decimal](8, 2) NULL,
  [ProductCategoryID] [int] NULL,
  [ProductModelID] [int] NULL,
  [SellStartDate] [datetime] NOT NULL,
  [SellEndDate] [datetime] NULL,
  [DiscontinuedDate] [datetime] NULL,
  [ThumbNailPhoto] [varbinary](max) NULL,
  [ThumbnailPhotoFileName] [nvarchar](50) NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Product_rowguid] DEFAULT (newid()),
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Product_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_Product_ProductID] PRIMARY KEY CLUSTERED ([ProductID]),
  CONSTRAINT [AK_Product_Name] UNIQUE ([Name]),
  CONSTRAINT [AK_Product_ProductNumber] UNIQUE ([ProductNumber]),
  CONSTRAINT [AK_Product_rowguid] UNIQUE ([rowguid])
)
GO

ALTER TABLE [SalesLT].[Product] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_ListPrice] CHECK ([ListPrice]>=(0.00))
GO

ALTER TABLE [SalesLT].[Product] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_SellEndDate] CHECK ([SellEndDate]>=[SellStartDate] OR [SellEndDate] IS NULL)
GO

ALTER TABLE [SalesLT].[Product] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_StandardCost] CHECK ([StandardCost]>=(0.00))
GO

ALTER TABLE [SalesLT].[Product] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_Weight] CHECK ([Weight]>(0.00))
GO

ALTER TABLE [SalesLT].[Product]
  ADD CONSTRAINT [FK_Product_ProductCategory_ProductCategoryID] FOREIGN KEY ([ProductCategoryID]) REFERENCES [SalesLT].[ProductCategory] ([ProductCategoryID])
GO

ALTER TABLE [SalesLT].[Product]
  ADD CONSTRAINT [FK_Product_ProductModel_ProductModelID] FOREIGN KEY ([ProductModelID]) REFERENCES [SalesLT].[ProductModel] ([ProductModelID])
GO