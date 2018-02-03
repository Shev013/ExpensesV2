CREATE TABLE [dbo].[Persons] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Pessoas] PRIMARY KEY CLUSTERED ([id] ASC)
);

