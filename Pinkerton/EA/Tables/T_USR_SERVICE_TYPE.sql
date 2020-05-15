﻿CREATE TABLE [EA].[T_USR_SERVICE_TYPE] (
    [USR_SERVICE_TYPE_ID] INT           IDENTITY (1, 1) NOT NULL,
    [USR_ID]              INT           NULL,
    [SERVICE_ID]          INT           NULL,
    [SUB_SERVICE_ID]      INT           NULL,
    [IS_DELETED]          BIT           NULL,
    [CREATE_DATE]         DATETIME      NULL,
    [CREATE_LOGIN_ID]     VARCHAR (255) NULL,
    [UPDATE_DATE]         DATETIME      NULL,
    [UPDATE_LOGIN_ID]     VARCHAR (255) NULL,
    CONSTRAINT [PK_T_USR_SERVICE_TYPE] PRIMARY KEY CLUSTERED ([USR_SERVICE_TYPE_ID] ASC),
    CONSTRAINT [FK_T_USR_SERVICE_TYPE_T_USR] FOREIGN KEY ([USR_ID]) REFERENCES [EA].[T_USR] ([USR_ID])
);
