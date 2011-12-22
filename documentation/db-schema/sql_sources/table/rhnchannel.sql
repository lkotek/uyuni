-- created by Oraschemadoc Wed Dec 21 14:58:29 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNCHANNEL" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"PARENT_CHANNEL" NUMBER, 
	"ORG_ID" NUMBER, 
	"CHANNEL_ARCH_ID" NUMBER NOT NULL ENABLE, 
	"LABEL" VARCHAR2(128) NOT NULL ENABLE, 
	"BASEDIR" VARCHAR2(256) NOT NULL ENABLE, 
	"NAME" VARCHAR2(256) NOT NULL ENABLE, 
	"SUMMARY" VARCHAR2(500) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(4000), 
	"PRODUCT_NAME_ID" NUMBER, 
	"GPG_KEY_URL" VARCHAR2(256), 
	"GPG_KEY_ID" VARCHAR2(14), 
	"GPG_KEY_FP" VARCHAR2(50), 
	"END_OF_LIFE" DATE, 
	"CHECKSUM_TYPE_ID" NUMBER, 
	"RECEIVING_UPDATES" CHAR(1) DEFAULT ('Y') NOT NULL ENABLE, 
	"LAST_MODIFIED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"LAST_SYNCED" DATE, 
	"CHANNEL_PRODUCT_ID" NUMBER, 
	"CHANNEL_ACCESS" VARCHAR2(10) DEFAULT ('private'), 
	"MAINT_NAME" VARCHAR2(128), 
	"MAINT_EMAIL" VARCHAR2(128), 
	"MAINT_PHONE" VARCHAR2(128), 
	"SUPPORT_POLICY" VARCHAR2(256), 
	"CREATED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"MODIFIED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	 CONSTRAINT "RHN_CHANNEL_RU_CK" CHECK (receiving_updates in ('Y', 'N')) ENABLE, 
	 CONSTRAINT "RHN_CHANNEL_ID_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_CHANNEL_PARENT_CH_FK" FOREIGN KEY ("PARENT_CHANNEL")
	  REFERENCES "SPACEWALK"."RHNCHANNEL" ("ID") ENABLE, 
	 CONSTRAINT "RHN_CHANNEL_ORG_FK" FOREIGN KEY ("ORG_ID")
	  REFERENCES "SPACEWALK"."WEB_CUSTOMER" ("ID") ENABLE, 
	 CONSTRAINT "RHN_CHANNEL_CAID_FK" FOREIGN KEY ("CHANNEL_ARCH_ID")
	  REFERENCES "SPACEWALK"."RHNCHANNELARCH" ("ID") ENABLE, 
	 CONSTRAINT "RHN_CHANNEL_PRODUCT_NAME_CH_FK" FOREIGN KEY ("PRODUCT_NAME_ID")
	  REFERENCES "SPACEWALK"."RHNPRODUCTNAME" ("ID") ENABLE, 
	 CONSTRAINT "RHN_CHANNEL_CHECKSUM_FK" FOREIGN KEY ("CHECKSUM_TYPE_ID")
	  REFERENCES "SPACEWALK"."RHNCHECKSUMTYPE" ("ID") ENABLE, 
	 CONSTRAINT "RHN_CHANNEL_CPID_FK" FOREIGN KEY ("CHANNEL_PRODUCT_ID")
	  REFERENCES "SPACEWALK"."RHNCHANNELPRODUCT" ("ID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/
