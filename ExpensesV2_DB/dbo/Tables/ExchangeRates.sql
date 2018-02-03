CREATE TABLE [dbo].[ExchangeRates] (
    [id]    INT            IDENTITY (1, 1) NOT NULL,
    [to]    VARCHAR (3)    NOT NULL,
    [From]  VARCHAR (3)    NOT NULL,
    [Value] DECIMAL (8, 5) NOT NULL,
    [Month] INT            NOT NULL,
    [Year]  INT            NOT NULL,
    CONSTRAINT [PK_ExchangeRates] PRIMARY KEY CLUSTERED ([id] ASC)
);

