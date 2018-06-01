CREATE TABLE [SalesLT].[Customer] (
  [CustomerID] [int] IDENTITY,
  [NameStyle] [dbo].[NameStyle] NOT NULL CONSTRAINT [DF_Customer_NameStyle] DEFAULT (0),
  [Title] [nvarchar](8) NULL,
  [FirstName] [dbo].[Name] NOT NULL,
  [MiddleName] [dbo].[Name] NULL,
  [LastName] [dbo].[Name] NOT NULL,
  [Suffix] [nvarchar](10) NULL,
  [CompanyName] [nvarchar](128) NULL,
  [SalesPerson] [nvarchar](256) NULL,
  [EmailAddress] [nvarchar](50) NULL,
  [Phone] [dbo].[Phone] NULL,
  [PasswordHash] [varchar](128) NOT NULL,
  [PasswordSalt] [varchar](10) NOT NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Customer_rowguid] DEFAULT (newid()),
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Customer_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED ([CustomerID]),
  CONSTRAINT [AK_Customer_rowguid] UNIQUE ([rowguid])
)
GO

CREATE INDEX [IX_Customer_EmailAddress]
  ON [SalesLT].[Customer] ([EmailAddress])
GO