CREATE TABLE [dbo].[Pendings] (
    [id]            INT           IDENTITY (1000, 1) NOT NULL,
    [Description]   VARCHAR (250) NOT NULL,
    [CodCurrency]   VARCHAR (3)   NOT NULL,
    [IdPendingType] INT           NOT NULL,
    CONSTRAINT [PK_Pendings] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Pendings_PendingsType] FOREIGN KEY ([IdPendingType]) REFERENCES [dbo].[PendingsType] ([id])
);

