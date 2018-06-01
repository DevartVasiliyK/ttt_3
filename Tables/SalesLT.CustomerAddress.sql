CREATE TABLE [SalesLT].[CustomerAddress] (
  [CustomerID] [int] NOT NULL,
  [AddressID] [int] NOT NULL,
  [AddressType] [dbo].[Name] NOT NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_CustomerAddress_rowguid] DEFAULT (newid()),
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_CustomerAddress_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_CustomerAddress_CustomerID_AddressID] PRIMARY KEY CLUSTERED ([CustomerID], [AddressID]),
  CONSTRAINT [AK_CustomerAddress_rowguid] UNIQUE ([rowguid])
)
GO

ALTER TABLE [SalesLT].[CustomerAddress]
  ADD CONSTRAINT [FK_CustomerAddress_Address_AddressID] FOREIGN KEY ([AddressID]) REFERENCES [SalesLT].[Address] ([AddressID])
GO

ALTER TABLE [SalesLT].[CustomerAddress]
  ADD CONSTRAINT [FK_CustomerAddress_Customer_CustomerID] FOREIGN KEY ([CustomerID]) REFERENCES [SalesLT].[Customer] ([CustomerID])
GO