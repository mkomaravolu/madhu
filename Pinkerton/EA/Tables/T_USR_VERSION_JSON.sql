﻿CREATE TABLE [EA].[T_USR_VERSION_JSON] (
    [USR_VERSION_JSON_ID] INT            IDENTITY (1, 1) NOT NULL,
    [USR_ID]              INT            NULL,
    [VERSION]             INT            NULL,
    [JSON]                NVARCHAR (MAX) NULL,
    [IS_DELETED]          BIT            NULL,
    [CREATE_DATE]         DATETIME       NULL,
    [CREATE_LOGIN_ID]     VARCHAR (255)  NULL,
    [UPDATE_DATE]         DATETIME       NULL,
    [UPDATE_LOGIN_ID]     VARCHAR (255)  NULL,
    CONSTRAINT [PK_USR_VERSION_JSON] PRIMARY KEY CLUSTERED ([USR_VERSION_JSON_ID] ASC),
    CONSTRAINT [FK_T_USR_VERSION_JSON_T_USR] FOREIGN KEY ([USR_ID]) REFERENCES [EA].[T_USR] ([USR_ID])
);
