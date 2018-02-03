CREATE TABLE [dbo].[PendingsStatements] (
    [id]        INT             IDENTITY (1000, 1) NOT NULL,
    [IdPending] INT             NOT NULL,
    [Value]     DECIMAL (10, 2) NOT NULL,
    [month]     INT             NOT NULL,
    [year]      INT             NOT NULL,
    CONSTRAINT [PK_PendingsStatements] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_PendingsStatements_Pendings] FOREIGN KEY ([IdPending]) REFERENCES [dbo].[Pendings] ([id])
);

