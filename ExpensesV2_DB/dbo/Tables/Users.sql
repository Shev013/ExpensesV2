CREATE TABLE [dbo].[Users] (
    [id]         INT           IDENTITY (1000, 1) NOT NULL,
    [username]   VARCHAR (50)  NOT NULL,
    [password]   VARCHAR (250) NOT NULL,
    [nivel]      INT           NOT NULL,
    [lastlogin]  DATETIME      NULL,
    [firstlogin] DATETIME      NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([id] ASC)
);

