CREATE TABLE [dbo].[Responsabilities] (
    [id]                     INT           IDENTITY (1000, 1) NOT NULL,
    [Description]            VARCHAR (250) NOT NULL,
    [CodCurrency]            VARCHAR (3)   NOT NULL,
    [IdResponsabilitiesType] INT           NOT NULL,
    [Active]                 BIT           CONSTRAINT [DF_Responsabilities_Active] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Responsabilities] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Responsabilities_ResponsabilitiesType] FOREIGN KEY ([IdResponsabilitiesType]) REFERENCES [dbo].[ResponsabilitiesType] ([id])
);

