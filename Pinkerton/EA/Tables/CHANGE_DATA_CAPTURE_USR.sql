﻿CREATE TABLE [EA].[CHANGE_DATA_CAPTURE_USR] (
    [DATA_CHANGE_ID] INT            IDENTITY (1, 1) NOT NULL,
    [CHANGE_DATE]    DATETIME       NULL,
    [USER_NAME]      VARCHAR (50)   NULL,
    [APPLICATION]    NVARCHAR (MAX) NULL,
    [TABLE_NAME]     VARCHAR (50)   NULL,
    [OPERATION]      CHAR (1)       NULL,
    [VERSION_ID]     NVARCHAR (MAX) NULL,
    [DESCRIPTION]    VARCHAR (MAX)  NULL,
    [COLUMN_NAME]    VARCHAR (MAX)  NULL,
    [OLDVALUE]       VARCHAR (50)   NULL,
    [NEWVALUE]       VARCHAR (50)   NULL
);

