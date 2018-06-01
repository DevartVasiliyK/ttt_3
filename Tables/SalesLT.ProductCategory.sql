CREATE TABLE [SalesLT].[ProductCategory] (
  [ProductCategoryID] [int] IDENTITY,
  [ParentProductCategoryID] [int] NULL,
  [Name] [dbo].[Name] NOT NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProductCategory_rowguid] DEFAULT (newid()),
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductCategory_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_ProductCategory_ProductCategoryID] PRIMARY KEY CLUSTERED ([ProductCategoryID]),
  CONSTRAINT [AK_ProductCategory_Name] UNIQUE ([Name]),
  CONSTRAINT [AK_ProductCategory_rowguid] UNIQUE ([rowguid])
)
GO

ALTER TABLE [SalesLT].[ProductCategory]
  ADD CONSTRAINT [FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID] FOREIGN KEY ([ParentProductCategoryID]) REFERENCES [SalesLT].[ProductCategory] ([ProductCategoryID])
GO