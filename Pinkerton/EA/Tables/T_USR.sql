CREATE TABLE [EA].[T_USR] (
    [USR_ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [USR_CODE]                 VARCHAR (255)  NULL,
    [REQUEST_OFFICE_ID]        INT            NULL,
    [CLIENT_ID]                INT            NULL,
    [SERVICE_DESCRIPTION]      NVARCHAR (MAX) NULL,
    [USR_START_DATE]           DATETIME       NULL,
    [USR_END_DATE]             DATETIME       NULL,
    [REVIEWER_ID]              VARCHAR (255)  NULL,
    [REVIEWER_START_DATE]      DATETIME       NULL,
    [REVIEWER_END_DATE]        DATETIME       NULL,
    [REVIEWER_COMMENT]         VARCHAR (MAX)  NULL,
    [KEYWORDS]                 NVARCHAR (MAX) NULL,
    [USR_STATUS_ID]            INT            NULL,
    [IS_DELETED]               BIT            NULL,
    [CREATE_DATE]              DATETIME       NULL,
    [CREATE_LOGIN_ID]          VARCHAR (255)  NULL,
    [UPDATE_DATE]              DATETIME       NULL,
    [UPDATE_LOGIN_ID]          VARCHAR (255)  NULL,
    [SERVICE_TYPE_CATEGORY_ID] INT            NULL,
    [ASSET_TYPE]               INT            NULL,
    [ALERT_START_DATE]         DATETIME       NULL,
    [ALERT_END_DATE]           DATETIME       NULL,
    [OM_LOGIN_ID]              INT            NULL,
    [REQUESTING_DIRECTORY_ID]  INT            NULL,
    [USR_ATTACHMENTS_ID]       INT            NULL,
    CONSTRAINT [PK_T_USR] PRIMARY KEY CLUSTERED ([USR_ID] ASC),
    CONSTRAINT [FK_T_USR_L_CLIENT] FOREIGN KEY ([CLIENT_ID]) REFERENCES [EA].[L_CLIENT] ([CLIENT_ID]),
    CONSTRAINT [FK_T_USR_T_USR_ATTACHMENTS] FOREIGN KEY ([USR_ATTACHMENTS_ID]) REFERENCES [EA].[T_USR_ATTACHMENTS] ([USR_ATTACHMENTS_ID])
);




GO

  CREATE TRIGGER [EA].[trgUSRDataCHANGE]
  on [EA].[T_USR]
  AFTER Insert,Update
  NOT FOR REPLICATION 
  AS
DECLARE @OPERATION char(1)
 
  IF EXISTS ( SELECT * FROM DELETED)
SET @OPERATION ='U'
ELSE
  SET @OPERATION ='I'
  
  IF UPDATE(USR_ID)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'USR_ID',TU.USR_ID,TUR.USR_ID
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.USR_ID <>deleted.USR_ID
  -- Fetch USR category
  left outer join [EA].[T_USR] tu
  on deleted.USR_ID=tu.USR_ID
  join [EA].[T_USR] tur
  on inserted.USR_ID=tur.USR_ID

    IF UPDATE(USR_CODE)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'USR_CODE',INSERTED.USR_CODE,DELETED.USR_CODE
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.usr_CODE <>deleted.usr_CODE

   IF UPDATE(REQUEST_OFFICE_ID)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'REQUEST_OFFICE_ID',INSERTED.REQUEST_OFFICE_ID,DELETED.REQUEST_OFFICE_ID
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.REQUEST_OFFICE_ID <>deleted.REQUEST_OFFICE_ID
  
    IF UPDATE(SERVICE_DESCRIPTION)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'SERVICE_DESCRIPTION',INSERTED.SERVICE_DESCRIPTION,DELETED.SERVICE_DESCRIPTION
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.SERVICE_DESCRIPTION <>deleted.SERVICE_DESCRIPTION

    IF UPDATE(CLIENT_ID)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'CLIENT_ID',INSERTED.CLIENT_ID,DELETED.CLIENT_ID
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.CLIENT_ID <>deleted.CLIENT_ID

 IF UPDATE(USR_START_DATE)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'USR_START_DATE',INSERTED.USR_START_DATE,DELETED.USR_START_DATE
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.USR_START_DATE <>deleted.USR_START_DATE

   IF UPDATE(USR_END_DATE)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'USR_END_DATE',INSERTED.USR_END_DATE,DELETED.USR_END_DATE
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.USR_END_DATE <>deleted.USR_END_DATE

  IF UPDATE(OM_LOGIN_ID)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'OM_LOGIN_ID',INSERTED.OM_LOGIN_ID,DELETED.OM_LOGIN_ID
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.OM_LOGIN_ID <>deleted.OM_LOGIN_ID

IF UPDATE(REVIEWER_ID)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'REVIEWER_ID',INSERTED.REVIEWER_ID,DELETED.REVIEWER_ID
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.REVIEWER_ID <>deleted.REVIEWER_ID

  IF UPDATE(REVIEWER_START_DATE)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'REVIEWER_START_DATE',INSERTED.REVIEWER_START_DATE,DELETED.REVIEWER_START_DATE
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.REVIEWER_START_DATE <>deleted.REVIEWER_START_DATE

    IF UPDATE(REVIEWER_END_DATE)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'REVIEWER_END_DATE',INSERTED.REVIEWER_END_DATE,DELETED.REVIEWER_END_DATE
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.REVIEWER_END_DATE <>deleted.REVIEWER_END_DATE

      IF UPDATE(REVIEWER_COMMENT)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'REVIEWER_COMMENT',INSERTED.REVIEWER_COMMENT,DELETED.REVIEWER_COMMENT
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.REVIEWER_COMMENT <>deleted.REVIEWER_COMMENT

  IF UPDATE(KEYWORDS)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'KEYWORDS',INSERTED.KEYWORDS,DELETED.KEYWORDS
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.KEYWORDS <>deleted.KEYWORDS
   
     IF UPDATE(USR_STATUS_ID)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'USR_STATUS_ID',INSERTED.USR_STATUS_ID,DELETED.USR_STATUS_ID
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.usr_STATUS_ID <>deleted.usr_STATUS_ID

   IF UPDATE(IS_DELETED)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'IS_DELETED',INSERTED.IS_DELETED,DELETED.IS_DELETED
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.IS_DELETED <>deleted.IS_DELETED

    IF UPDATE(CREATE_DATE)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'CREATE_DATE',INSERTED.CREATE_DATE,DELETED.CREATE_DATE
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.CREATE_DATE <>deleted.CREATE_DATE

   IF UPDATE(CREATE_LOGIN_ID)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'CREATE_LOGIN_ID',INSERTED.CREATE_LOGIN_ID,DELETED.CREATE_LOGIN_ID
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.CREATE_LOGIN_ID <>deleted.CREATE_LOGIN_ID

   IF UPDATE(UPDATE_DATE)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'UPDATE_DATE',INSERTED.UPDATE_DATE,DELETED.UPDATE_DATE
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.UPDATE_DATE <>deleted.UPDATE_DATE

   IF UPDATE(UPDATE_LOGIN_ID)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'UPDATE_LOGIN_ID',INSERTED.UPDATE_LOGIN_ID,DELETED.UPDATE_LOGIN_ID
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.UPDATE_LOGIN_ID <>deleted.UPDATE_LOGIN_ID  

     IF UPDATE(REQUESTING_DIRECTORY_ID)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'REQUESTING_DIRECTORY_ID',INSERTED.REQUESTING_DIRECTORY_ID,DELETED.REQUESTING_DIRECTORY_ID
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.REQUESTING_DIRECTORY_ID <>deleted.REQUESTING_DIRECTORY_ID

   IF UPDATE(SERVICE_TYPE_CATEGORY_ID)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'SERVICE_TYPE_CATEGORY_ID',INSERTED.SERVICE_TYPE_CATEGORY_ID,DELETED.SERVICE_TYPE_CATEGORY_ID
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.SERVICE_TYPE_CATEGORY_ID <>deleted.SERVICE_TYPE_CATEGORY_ID

     IF UPDATE(ASSET_TYPE)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'ASSET_TYPE',INSERTED.ASSET_TYPE,DELETED.ASSET_TYPE
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.ASSET_TYPE <>deleted.ASSET_TYPE

    IF UPDATE(ALERT_START_DATE)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'ALERT_START_DATE',INSERTED.ALERT_START_DATE,DELETED.ALERT_START_DATE
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.ALERT_START_DATE <>deleted.ALERT_START_DATE

   IF UPDATE(ALERT_END_DATE)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'ALERT_END_DATE',INSERTED.ALERT_END_DATE,DELETED.ALERT_END_DATE
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.ALERT_END_DATE <>deleted.ALERT_END_DATE

  IF UPDATE(OM_LOGIN_ID)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'OM_LOGIN_ID',INSERTED.OM_LOGIN_ID,DELETED.OM_LOGIN_ID
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.OM_LOGIN_ID <>deleted.OM_LOGIN_ID

   IF UPDATE(USR_ATTACHMENTS_ID)
  INSERT EA.CHANGE_DATA_CAPTURE_USR
  (CHANGE_DATE,USER_NAME,Application,TABLE_NAME,OPERATION,VERSION_ID ,DESCRIPTION,[COLUMN_NAME],Oldvalue,newValue)
  select getdate(),suser_sname(),APP_NAME(),'[EA].[T_USR]',@OPERATION,
  inserted.USR_ID,inserted.USR_CODE,'USR_ATTACHMENTS_ID',INSERTED.USR_ATTACHMENTS_ID,DELETED.USR_ATTACHMENTS_ID
  from inserted
  left outer join deleted on Inserted.USR_ID=deleted.USR_ID
  and Inserted.USR_ATTACHMENTS_ID <>deleted.USR_ATTACHMENTS_ID

