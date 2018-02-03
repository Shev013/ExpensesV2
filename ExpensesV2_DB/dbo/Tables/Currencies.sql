CREATE TABLE [dbo].[Currencies] (
    [Cod]         VARCHAR (3)  NOT NULL,
    [Description] VARCHAR (20) NOT NULL,
    [Active]      BIT          NOT NULL,
    [Report]      BIT          NOT NULL,
    CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED ([Cod] ASC)
);

