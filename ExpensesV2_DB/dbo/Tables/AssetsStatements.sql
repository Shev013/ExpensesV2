CREATE TABLE [dbo].[AssetsStatements] (
    [id]                    INT             IDENTITY (1000, 1) NOT NULL,
    [IdAsset]               INT             NOT NULL,
    [Value]                 DECIMAL (10, 2) NOT NULL,
    [month]                 INT             NOT NULL,
    [year]                  INT             NOT NULL,
    [idAssetEvaluationType] INT             NOT NULL,
    CONSTRAINT [PK_AssetsStatements] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_AssetsStatements_Assets] FOREIGN KEY ([IdAsset]) REFERENCES [dbo].[Assets] ([id])
);

