CREATE TABLE [dbo].[PendingsType] (
    [id]          INT          IDENTITY (1000, 1) NOT NULL,
    [Description] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_PendingsType] PRIMARY KEY CLUSTERED ([id] ASC)
);

