CREATE TABLE [dbo].[Accounts] (
    [id]             INT           IDENTITY (1000, 1) NOT NULL,
    [Description]    VARCHAR (100) NOT NULL,
    [idBank]         INT           NOT NULL,
    [CodCurrency]    VARCHAR (3)   NOT NULL,
    [CodAccountType] VARCHAR (1)   NULL,
    [Liquid]         BIT           CONSTRAINT [DF_Accounts_Liquid] DEFAULT ((1)) NULL,
    [idPerson]       INT           NULL,
    CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Accounts_AccountType] FOREIGN KEY ([CodAccountType]) REFERENCES [dbo].[AccountType] ([Cod]),
    CONSTRAINT [FK_Accounts_Banks] FOREIGN KEY ([idBank]) REFERENCES [dbo].[Banks] ([id]),
    CONSTRAINT [FK_Accounts_Currencies] FOREIGN KEY ([CodCurrency]) REFERENCES [dbo].[Currencies] ([Cod]),
    CONSTRAINT [FK_Accounts_Persons] FOREIGN KEY ([idPerson]) REFERENCES [dbo].[Persons] ([id])
);

