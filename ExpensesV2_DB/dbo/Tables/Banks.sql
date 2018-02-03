CREATE TABLE [dbo].[Banks] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [Short]       VARCHAR (4)   NOT NULL,
    [Description] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED ([id] ASC)
);

