-- created by Oraschemadoc Wed Dec 21 14:59:15 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE UNIQUE INDEX "SPACEWALK"."RHN_CHANNELPROD_P_V_B_UQ" ON "SPACEWALK"."RHNCHANNELPRODUCT" ("PRODUCT", "VERSION", "BETA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 
/
