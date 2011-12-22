-- created by Oraschemadoc Wed Dec 21 14:59:20 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE INDEX "SPACEWALK"."RHN_DPROB_SAT_CLUSTER_ID_IDX" ON "SPACEWALK"."RHN_DEPLOYED_PROBE" ("SAT_CLUSTER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 
/
