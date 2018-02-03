CREATE TABLE [dbo].[Assets] (
    [id]          INT           IDENTITY (1000, 1) NOT NULL,
    [Description] VARCHAR (250) NOT NULL,
    [CodCurrency] VARCHAR (3)   NOT NULL,
    [IdAssetType] INT           NOT NULL,
    [Active]      BIT           CONSTRAINT [DF_Assets_Active] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Assets] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Assets_AssetsType] FOREIGN KEY ([IdAssetType]) REFERENCES [dbo].[AssetsType] ([id])
);

