-- created by Oraschemadoc Wed Dec 21 14:59:54 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE OR REPLACE TRIGGER "SPACEWALK"."RHN_ERRATATMP_MOD_TRIG" 
before insert or update on rhnerratatmp
for each row
begin
        :new.modified := sysdate;
        :new.last_modified := sysdate;
end;
ALTER TRIGGER "SPACEWALK"."RHN_ERRATATMP_MOD_TRIG" ENABLE
 
/
