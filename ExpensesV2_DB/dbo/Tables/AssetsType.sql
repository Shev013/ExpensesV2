CREATE TABLE [dbo].[AssetsType] (
    [id]          INT          IDENTITY (1000, 1) NOT NULL,
    [Description] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_AssetsType] PRIMARY KEY CLUSTERED ([id] ASC)
);

