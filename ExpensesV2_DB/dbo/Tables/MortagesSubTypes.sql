CREATE TABLE [dbo].[MortagesSubTypes] (
    [id]           INT             IDENTITY (1000, 1) NOT NULL,
    [Description]  VARCHAR (150)   NOT NULL,
    [idType]       INT             NOT NULL,
    [Active]       BIT             CONSTRAINT [DF_MortagesSubTypes_Active] DEFAULT ((1)) NOT NULL,
    [InicialValue] DECIMAL (10, 2) NULL,
    [Base]         BIT             CONSTRAINT [DF_MortagesSubTypes_Base] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_MortagesSubTypes] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_MortagesSubTypes_MortagesTypes] FOREIGN KEY ([idType]) REFERENCES [dbo].[MortagesTypes] ([id])
);

