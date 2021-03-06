﻿CREATE TABLE [EA].[L_COUNTRY] (
    [COUNTRY_ID]      INT           IDENTITY (1, 1) NOT NULL,
    [COUNTRY_NAME]    VARCHAR (255) NULL,
    [IS_DELETED]      BIT           NULL,
    [CREATE_DATE]     DATETIME      NULL,
    [CREATE_LOGIN_ID] VARCHAR (255) NULL,
    [UPDATE_DATE]     DATETIME      NULL,
    [UPDATE_LOGIN_ID] VARCHAR (255) NULL,
    CONSTRAINT [PK_L_COUNTRY] PRIMARY KEY CLUSTERED ([COUNTRY_ID] ASC)
);

