-- created by Oraschemadoc Wed Dec 21 14:59:56 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE OR REPLACE TRIGGER "SPACEWALK"."RHN_SERVER_GROUP_MOD_TRIG" 
before insert or update on rhnServerGroup
for each row
begin
        :new.modified := sysdate;
end;
ALTER TRIGGER "SPACEWALK"."RHN_SERVER_GROUP_MOD_TRIG" ENABLE
 
/
