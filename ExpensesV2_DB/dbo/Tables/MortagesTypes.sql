CREATE TABLE [dbo].[MortagesTypes] (
    [id]          INT           IDENTITY (1000, 1) NOT NULL,
    [Description] VARCHAR (100) NOT NULL,
    [Active]      BIT           CONSTRAINT [DF_MortagesTypes_Active] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_MortagesTypes] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [MortagesTypes_Description_UNIQUE] UNIQUE NONCLUSTERED ([Description] ASC)
);

