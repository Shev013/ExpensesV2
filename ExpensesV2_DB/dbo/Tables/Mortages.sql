CREATE TABLE [dbo].[Mortages] (
    [id]             BIGINT          IDENTITY (1000, 1) NOT NULL,
    [Euribor]        FLOAT (53)      NULL,
    [Spread]         FLOAT (53)      NULL,
    [RemainingValue] DECIMAL (10, 2) NULL,
    [Date]           DATETIME        NOT NULL,
    [payment]        DECIMAL (10, 2) NOT NULL,
    [IDSubType]      INT             NOT NULL,
    CONSTRAINT [PK_Euribor] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_MortagesSubTypes_Mortages] FOREIGN KEY ([IDSubType]) REFERENCES [dbo].[MortagesSubTypes] ([id])
);

