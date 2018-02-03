CREATE TABLE [dbo].[AccountsStatements] (
    [id]        INT             IDENTITY (1000, 1) NOT NULL,
    [idAccount] INT             NOT NULL,
    [Value]     DECIMAL (10, 2) NOT NULL,
    [month]     INT             NOT NULL,
    [year]      INT             NOT NULL,
    CONSTRAINT [PK_AccountsStatements] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_AccountsStatements_Accounts] FOREIGN KEY ([idAccount]) REFERENCES [dbo].[Accounts] ([id])
);

