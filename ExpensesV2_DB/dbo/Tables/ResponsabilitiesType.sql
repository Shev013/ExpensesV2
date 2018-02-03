CREATE TABLE [dbo].[ResponsabilitiesType] (
    [id]          INT           IDENTITY (1000, 1) NOT NULL,
    [Description] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_ResponsabilitiesType] PRIMARY KEY CLUSTERED ([id] ASC)
);

