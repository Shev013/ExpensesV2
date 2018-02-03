CREATE TABLE [dbo].[Income] (
    [id]           INT             IDENTITY (1000, 1) NOT NULL,
    [Type]         INT             NOT NULL,
    [RecordDate]   DATETIME        NOT NULL,
    [Person]       INT             NOT NULL,
    [Value]        DECIMAL (10, 2) NOT NULL,
    [Observations] VARCHAR (250)   NULL,
    [EntranceDate] DATETIME        NULL,
    [CodCurrency]  VARCHAR (3)     NOT NULL,
    CONSTRAINT [PK_Income] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Income_Currencies] FOREIGN KEY ([CodCurrency]) REFERENCES [dbo].[Currencies] ([Cod]),
    CONSTRAINT [FK_Income_IncomeTypes] FOREIGN KEY ([Type]) REFERENCES [dbo].[IncomeTypes] ([id]),
    CONSTRAINT [FK_Income_Persons] FOREIGN KEY ([Person]) REFERENCES [dbo].[Persons] ([id])
);

