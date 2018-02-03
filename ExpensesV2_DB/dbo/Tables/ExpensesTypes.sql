CREATE TABLE [dbo].[ExpensesTypes] (
    [id]          INT           IDENTITY (1000, 1) NOT NULL,
    [Description] VARCHAR (100) NOT NULL,
    [Active]      BIT           CONSTRAINT [DF_ExpensesTypes_Active] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_ExpensesTypes] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [ExpensesTypes_Description_UNIQUE] UNIQUE NONCLUSTERED ([Description] ASC)
);

