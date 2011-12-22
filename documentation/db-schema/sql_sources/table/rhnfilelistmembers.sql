-- created by Oraschemadoc Wed Dec 21 14:58:38 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNFILELISTMEMBERS" 
   (	"FILE_LIST_ID" NUMBER NOT NULL ENABLE, 
	"CONFIG_FILE_NAME_ID" NUMBER NOT NULL ENABLE, 
	"CREATED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"MODIFIED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	 CONSTRAINT "RHN_FLMEMBERS_FLID_FK" FOREIGN KEY ("FILE_LIST_ID")
	  REFERENCES "SPACEWALK"."RHNFILELIST" ("ID") ON DELETE CASCADE ENABLE, 
	 CONSTRAINT "RHN_FLMEMBERS_CFNID_FK" FOREIGN KEY ("CONFIG_FILE_NAME_ID")
	  REFERENCES "SPACEWALK"."RHNCONFIGFILENAME" ("ID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
