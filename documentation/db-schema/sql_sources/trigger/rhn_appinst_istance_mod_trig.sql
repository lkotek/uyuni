-- created by Oraschemadoc Wed Dec 21 14:59:52 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE OR REPLACE TRIGGER "SPACEWALK"."RHN_APPINST_ISTANCE_MOD_TRIG" 
before insert or update on rhnAppInstallInstance
for each row
begin
	:new.modified := sysdate;
end rhn_appinst_istance_mod_trig;
ALTER TRIGGER "SPACEWALK"."RHN_APPINST_ISTANCE_MOD_TRIG" ENABLE
 
/
