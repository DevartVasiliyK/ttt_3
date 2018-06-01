CREATE TABLE [SalesLT].[Address] (
  [AddressID] [int] IDENTITY,
  [AddressLine1] [nvarchar](60) NOT NULL,
  [AddressLine2] [nvarchar](60) NULL,
  [City] [nvarchar](30) NOT NULL,
  [StateProvince] [dbo].[Name] NOT NULL,
  [CountryRegion] [dbo].[Name] NOT NULL,
  [PostalCode] [nvarchar](15) NOT NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Address_rowguid] DEFAULT (newid()),
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Address_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_Address_AddressID] PRIMARY KEY CLUSTERED ([AddressID]),
  CONSTRAINT [AK_Address_rowguid] UNIQUE ([rowguid])
)
GO

CREATE INDEX [IX_Address_AddressLine1_AddressLine2_City_StateProvince_PostalCode_CountryRegion]
  ON [SalesLT].[Address] ([AddressLine1], [AddressLine2], [City], [StateProvince], [PostalCode], [CountryRegion])
GO

CREATE INDEX [IX_Address_StateProvince]
  ON [SalesLT].[Address] ([StateProvince])
GO