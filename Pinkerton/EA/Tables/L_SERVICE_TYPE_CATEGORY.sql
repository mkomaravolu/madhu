﻿CREATE TABLE [EA].[L_SERVICE_TYPE_CATEGORY] (
    [SERVICE_TYPE_CATEGORY_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [SERVICE_TYPE_ID]            INT           NULL,
    [SERVICE_TYPE_CATEGORY_NAME] VARCHAR (255) NULL,
    [IS_DELETED]                 BIT           NULL,
    [CREATE_DATE]                DATETIME      NULL,
    [CREATE_LOGIN_ID]            VARCHAR (255) NULL,
    [UPDATE_DATE]                DATETIME      NULL,
    [UPDATE_LOGIN_ID]            VARCHAR (255) NULL,
    CONSTRAINT [PK_L_SERVICE_TYPE_CATEGORY] PRIMARY KEY CLUSTERED ([SERVICE_TYPE_CATEGORY_ID] ASC),
    CONSTRAINT [FK_L_SERVICE_TYPE_CATEGORY_L_SERVICE_TYPE] FOREIGN KEY ([SERVICE_TYPE_ID]) REFERENCES [EA].[L_SERVICE_TYPE] ([SERVICE_TYPE_ID])
);
