﻿CREATE TABLE [EA].[T_USR_ALERT_CERTAINTY] (
    [USR_ALERT_CERTAINTY_ID] INT           IDENTITY (1, 1) NOT NULL,
    [USR_ID]                 INT           NULL,
    [CERTAINTY_REF_CODE]     VARCHAR (255) NULL,
    [IS_DELETED]             BIT           NULL,
    [CREATE_DATE]            DATETIME      NULL,
    [CREATE_LOGIN_ID]        VARCHAR (255) NULL,
    [UPDATE_DATE]            DATETIME      NULL,
    [UPDATE_LOGIN_ID]        VARCHAR (255) NULL,
    CONSTRAINT [PK_T_USR_ALERT_CERTAINTY] PRIMARY KEY CLUSTERED ([USR_ALERT_CERTAINTY_ID] ASC),
    CONSTRAINT [FK_T_USR_ALERT_CERTAINTY_T_USR] FOREIGN KEY ([USR_ID]) REFERENCES [EA].[T_USR] ([USR_ID])
);

