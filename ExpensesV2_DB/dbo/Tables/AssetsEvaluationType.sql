CREATE TABLE [dbo].[AssetsEvaluationType] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (250) NOT NULL,
    CONSTRAINT [PK_AssetsEvaluationType] PRIMARY KEY CLUSTERED ([id] ASC)
);

