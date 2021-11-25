CREATE TABLE [HumanResources].[JobCandidate] (
  [JobCandidateID] [int] IDENTITY,
  [BusinessEntityID] [int] NULL,
  [Resume] [xml] (CONTENT HumanResources.HRResumeSchemaCollection) NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_JobCandidate_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_JobCandidate_JobCandidateID] PRIMARY KEY CLUSTERED ([JobCandidateID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_JobCandidate_BusinessEntityID_1]
  ON [HumanResources].[JobCandidate] ([BusinessEntityID])
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Resumes submitted to Human Resources by job applicants.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for JobCandidate records.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'JobCandidateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee identification number if applicant was hired. Foreign key to Employee.BusinessEntityID.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Resume in XML format.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'Resume'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'INDEX', N'IX_JobCandidate_BusinessEntityID_1'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'INDEX', N'PK_JobCandidate_JobCandidateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'CONSTRAINT', N'PK_JobCandidate_JobCandidateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'CONSTRAINT', N'DF_JobCandidate_ModifiedDate'
GO