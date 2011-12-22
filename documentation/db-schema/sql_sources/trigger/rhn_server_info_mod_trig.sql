-- created by Oraschemadoc Wed Dec 21 14:59:56 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE OR REPLACE TRIGGER "SPACEWALK"."RHN_SERVER_INFO_MOD_TRIG" 
before insert or update on rhnServerInfo
for each row
begin
	if :new.checkin is NULL
	then
	        :new.checkin := sysdate;
	end if;
end;
ALTER TRIGGER "SPACEWALK"."RHN_SERVER_INFO_MOD_TRIG" ENABLE
 
/
