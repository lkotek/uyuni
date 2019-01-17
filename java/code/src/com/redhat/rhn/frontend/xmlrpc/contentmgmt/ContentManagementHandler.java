/**
 * Copyright (c) 2019 SUSE LLC
 *
 * This software is licensed to you under the GNU General Public License,
 * version 2 (GPLv2). There is NO WARRANTY for this software, express or
 * implied, including the implied warranties of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
 * along with this software; if not, see
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
 *
 * Red Hat trademarks are not licensed under GPLv2. No permission is
 * granted to use or replicate Red Hat trademarks that are incorporated
 * in this software or its documentation.
 */

package com.redhat.rhn.frontend.xmlrpc.contentmgmt;

import com.redhat.rhn.domain.contentmgmt.ContentManager;
import com.redhat.rhn.domain.contentmgmt.ContentProject;
import com.redhat.rhn.domain.user.User;
import com.redhat.rhn.frontend.xmlrpc.BaseHandler;

import static java.util.Optional.ofNullable;

/**
 * Content Management XMLRPC handler
 */
public class ContentManagementHandler extends BaseHandler {

    /**
     * Look up Content Project
     *
     * @param loggedInUser - the logged in user
     * @param label - the label
     * @return the Content Project with given label
     *
     * @xmlrpc.doc Look up Content Project with given label
     * @xmlrpc.param #session_key()
     * @xmlrpc.param #param("string", "label")
     * @xmlrpc.returntype $ContentProjectSerializer
     */
    public ContentProject lookupContentProject(User loggedInUser, String label) {
        return ContentManager.lookupContentProject(label, loggedInUser).orElse(null);
    }

    /**
     * Create Content Project
     *
     * @param loggedInUser - the logged in user
     * @param label - the label
     * @param name - the name
     * @param description - the description
     * @return the created Content Project
     *
     * @xmlrpc.doc Create Content Project
     * @xmlrpc.param #session_key()
     * @xmlrpc.param #param("string", "label")
     * @xmlrpc.param #param("string", "name")
     * @xmlrpc.param #param("string", "description")
     * @xmlrpc.returntype $ContentProjectSerializer
     */
    public ContentProject createContentProject(User loggedInUser, String label, String name, String description) {
        return ContentManager.createContentProject(label, name, description, loggedInUser);
    }

    /**
     * Update Content Project
     *
     * @param loggedInUser - the logged in user
     * @param label - the new label
     * @param name - the new name
     * @param description - the new description
     * @return the updated Content Project
     *
     * @xmlrpc.doc Update Content Project with given label
     * @xmlrpc.param #session_key()
     * @xmlrpc.param #param("string", "label")
     * @xmlrpc.param #param("string", "name")
     * @xmlrpc.param #param("string", "description")
     * @xmlrpc.returntype $ContentProjectSerializer
     */
    public ContentProject updateContentProject(User loggedInUser, String label, String name, String description) {
        return ContentManager.updateContentProject(label, ofNullable(name), ofNullable(description), loggedInUser);
    }

    /**
     * Remove the Content Project
     *
     * @param loggedInUser - the logged in user
     * @param label - the label
     * @return the number of deleted objects
     *
     * @xmlrpc.doc Look up the Content Project with given label
     * @xmlrpc.param #session_key()
     * @xmlrpc.param #param("string", "label")
     * @xmlrpc.param #param("string", "name")
     * @xmlrpc.param #param("string", "description")
     * @xmlrpc.returntype int - the number of deleted objects
     */
    public int deleteContentProject(User loggedInUser, String label) {
        return ContentManager.removeContentProject(label, loggedInUser);
    }
}
