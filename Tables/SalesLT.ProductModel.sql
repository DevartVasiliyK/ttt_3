CREATE TABLE [SalesLT].[ProductModel] (
  [ProductModelID] [int] IDENTITY,
  [Name] [dbo].[Name] NOT NULL,
  [CatalogDescription] [xml] NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProductModel_rowguid] DEFAULT (newid()),
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductModel_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_ProductModel_ProductModelID] PRIMARY KEY CLUSTERED ([ProductModelID]),
  CONSTRAINT [AK_ProductModel_Name] UNIQUE ([Name]),
  CONSTRAINT [AK_ProductModel_rowguid] UNIQUE ([rowguid])
)
GO