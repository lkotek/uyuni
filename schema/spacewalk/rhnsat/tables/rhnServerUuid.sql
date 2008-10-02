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
-- ties rhn-applet uuid to rhnServer.id

create table
rhnServerUuid
(
        server_id       number
			constraint rhn_server_uuid_sid_nn not null
                        constraint rhn_server_uuid_sid_fk
				references rhnServer(id),
	uuid            varchar2(36)
	                constraint rhn_server_uuid_uuid_nn not null
)
	storage ( pctincrease 1 freelists 16 )
	enable row movement
	initrans 32;

create unique index rhn_server_uuid_sid_unq on
        rhnServerUuid(server_id)
	tablespace [[4m_tbs]]
	storage( pctincrease 1 freelists 16 )
	initrans 32;

create unique index rhn_serveruuid_uuid_sid_unq on
    rhnServerUUID ( uuid, server_id )
    tablespace [[4m_tbs]]
    storage( pctincrease 1 freelists 16 )
    initrans 32;


--
-- Revision 1.3  2004/11/24 22:56:35  cturner
-- revert ODC, apparently we have a "better" way of doing it
--
-- Revision 1.2  2004/11/24 20:33:46  cturner
-- FK to server should be on delete cascade
--
-- Revision 1.1  2004/04/02 18:28:41  bretm
-- bugzilla:  119871
--
-- rhnServer.id <--> rhn-applet uuid
--
--
