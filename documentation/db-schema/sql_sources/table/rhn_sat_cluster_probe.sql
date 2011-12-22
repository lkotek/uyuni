-- created by Oraschemadoc Wed Dec 21 14:59:06 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHN_SAT_CLUSTER_PROBE" 
   (	"PROBE_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"PROBE_TYPE" VARCHAR2(12) DEFAULT ('satcluster') NOT NULL ENABLE, 
	"SAT_CLUSTER_ID" NUMBER(12,0) NOT NULL ENABLE, 
	 CONSTRAINT "RHN_SCLPB_PROBE_TYPE_CK" CHECK (probe_type='satcluster') ENABLE, 
	 CONSTRAINT "RHN_SCLPB_PROBE_ID_PK" PRIMARY KEY ("PROBE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_SCLPB_PRB_RECID_PRB_TYP_FK" FOREIGN KEY ("PROBE_ID", "PROBE_TYPE")
	  REFERENCES "SPACEWALK"."RHN_PROBE" ("RECID", "PROBE_TYPE") ON DELETE CASCADE ENABLE, 
	 CONSTRAINT "RHN_SCLPB_SATCL_SAT_CL_ID_FK" FOREIGN KEY ("SAT_CLUSTER_ID")
	  REFERENCES "SPACEWALK"."RHN_SAT_CLUSTER" ("RECID") ON DELETE CASCADE ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
