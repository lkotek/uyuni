-- created by Oraschemadoc Wed Dec 21 14:59:54 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE OR REPLACE TRIGGER "SPACEWALK"."RHN_ERRATA_KEYWORD_MOD_TRIG" 
before insert or update on rhnErrataKeyword
for each row
begin
	:new.modified := sysdate;
end rhn_errata_keyword_mod_trig;
ALTER TRIGGER "SPACEWALK"."RHN_ERRATA_KEYWORD_MOD_TRIG" ENABLE
 
/
