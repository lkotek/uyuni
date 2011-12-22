-- created by Oraschemadoc Wed Dec 21 14:58:37 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNERRATATMP" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"ADVISORY" VARCHAR2(100) NOT NULL ENABLE, 
	"ADVISORY_TYPE" VARCHAR2(32) NOT NULL ENABLE, 
	"ADVISORY_NAME" VARCHAR2(100) NOT NULL ENABLE, 
	"ADVISORY_REL" NUMBER NOT NULL ENABLE, 
	"PRODUCT" VARCHAR2(64), 
	"DESCRIPTION" VARCHAR2(4000), 
	"SYNOPSIS" VARCHAR2(4000), 
	"TOPIC" VARCHAR2(4000), 
	"SOLUTION" VARCHAR2(4000), 
	"ISSUE_DATE" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"UPDATE_DATE" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"REFERS_TO" VARCHAR2(4000), 
	"NOTES" VARCHAR2(4000), 
	"ORG_ID" NUMBER, 
	"LOCALLY_MODIFIED" CHAR(1), 
	"ERRATA_FROM" VARCHAR2(127), 
	"CREATED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"MODIFIED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"LAST_MODIFIED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	 CONSTRAINT "RHN_ERRATATMP_ADV_TYPE_CK" CHECK (advisory_type in ('Bug Fix Advisory',
				                            'Product Enhancement Advisory',
							    'Security Advisory')) ENABLE, 
	 CONSTRAINT "RHN_ERRATATMP_LM_CK" CHECK (locally_modified in ('Y','N')) ENABLE, 
	 CONSTRAINT "RHN_ERRATATMP_ID_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_ERRATATMP_OID_FK" FOREIGN KEY ("ORG_ID")
	  REFERENCES "SPACEWALK"."WEB_CUSTOMER" ("ID") ON DELETE CASCADE ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
