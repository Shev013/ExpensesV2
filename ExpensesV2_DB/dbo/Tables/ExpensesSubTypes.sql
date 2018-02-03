CREATE TABLE [dbo].[ExpensesSubTypes] (
    [id]          INT           IDENTITY (1000, 1) NOT NULL,
    [Description] VARCHAR (150) NOT NULL,
    [idType]      INT           NOT NULL,
    [Active]      BIT           CONSTRAINT [DF_ExpensesSubTypes_Active] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_ExpensesSubTypes] PRIMARY KEY CLUSTERED ([id] ASC)
);

