--
-- Copyright (c) 2008 Red Hat, Inc.
--
-- This software is licensed to you under the GNU General Public License,
-- version 2 (GPLv2). There is NO WARRANTY for this software, express or
-- implied, including the implied warranties of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
-- along with this software; if not, see
-- http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
-- 
-- Red Hat trademarks are not licensed under GPLv2. No permission is
-- granted to use or replicate Red Hat trademarks that are incorporated
-- in this software or its documentation. 
--
--
--
--

create or replace function
lookup_cf_state(
	label_in in varchar2
) return number deterministic
is
	state_id number;
begin
	select	id
	into	state_id
	from	rhnConfigFileState
	where	label = label_in;

	return state_id;
end;
/
show errors

--
--
-- Revision 1.1  2003/11/09 17:37:27  pjones
-- bugzilla: 109083 -- lookup the state of a config file
--
