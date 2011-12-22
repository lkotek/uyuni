-- created by Oraschemadoc Wed Dec 21 14:59:39 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE UNIQUE INDEX "SPACEWALK"."RHN_USGP_U_SG_P_UQ" ON "SPACEWALK"."RHNUSERSERVERGROUPPERMS" ("USER_ID", "SERVER_GROUP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 
/
