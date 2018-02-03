CREATE TABLE [dbo].[Expenses] (
    [id]           INT             IDENTITY (1000, 1) NOT NULL,
    [Description]  VARCHAR (255)   NOT NULL,
    [ExpenseDate]  DATETIME        NOT NULL,
    [RecordDate]   DATETIME        CONSTRAINT [DF_Expenses_RecordDate] DEFAULT (getdate()) NOT NULL,
    [SubType]      INT             NOT NULL,
    [Value]        DECIMAL (10, 2) NOT NULL,
    [Observations] VARCHAR (255)   NULL,
    [Asset]        INT             NULL,
    [codCurrency]  VARCHAR (3)     NOT NULL,
    CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Expenses_Assets] FOREIGN KEY ([Asset]) REFERENCES [dbo].[Assets] ([id]),
    CONSTRAINT [FK_Expenses_Currencies] FOREIGN KEY ([codCurrency]) REFERENCES [dbo].[Currencies] ([Cod]),
    CONSTRAINT [FK_Expenses_ExpensesSubTypes] FOREIGN KEY ([SubType]) REFERENCES [dbo].[ExpensesSubTypes] ([id])
);

