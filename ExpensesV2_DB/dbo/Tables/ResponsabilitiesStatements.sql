CREATE TABLE [dbo].[ResponsabilitiesStatements] (
    [id]                INT             IDENTITY (1000, 1) NOT NULL,
    [IdResponsabilitie] INT             NOT NULL,
    [Value]             DECIMAL (10, 2) NOT NULL,
    [month]             INT             NOT NULL,
    [year]              INT             NOT NULL,
    CONSTRAINT [FK_ResponsabilitiesStatements_Responsabilities] FOREIGN KEY ([IdResponsabilitie]) REFERENCES [dbo].[Responsabilities] ([id])
);

