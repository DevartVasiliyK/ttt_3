CREATE TABLE [SalesLT].[ProductDescription] (
  [ProductDescriptionID] [int] IDENTITY,
  [Description] [nvarchar](400) NOT NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProductDescription_rowguid] DEFAULT (newid()),
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductDescription_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_ProductDescription_ProductDescriptionID] PRIMARY KEY CLUSTERED ([ProductDescriptionID]),
  CONSTRAINT [AK_ProductDescription_rowguid] UNIQUE ([rowguid])
)
GO