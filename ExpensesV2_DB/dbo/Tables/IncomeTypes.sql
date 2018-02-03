CREATE TABLE [dbo].[IncomeTypes] (
    [id]          INT           IDENTITY (1000, 1) NOT NULL,
    [Description] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_IncomeTypes] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [IncomeTypes_Description_UNIQUE] UNIQUE NONCLUSTERED ([Description] ASC)
);

