-- created by Oraschemadoc Wed Dec 21 14:59:11 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE UNIQUE INDEX "SPACEWALK"."RHN_ACTIONCR_AID_SID_CRID_UQ" ON "SPACEWALK"."RHNACTIONCONFIGREVISION" ("ACTION_ID", "SERVER_ID", "CONFIG_REVISION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 
/
