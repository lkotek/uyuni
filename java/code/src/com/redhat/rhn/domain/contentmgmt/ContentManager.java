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

package com.redhat.rhn.domain.contentmgmt;

import com.redhat.rhn.domain.user.User;

import java.util.Optional;

/**
 * Content Management functionality
 */
public class ContentManager {

    // forbid instantiation
    private ContentManager() { }

    /**
     * Create a Content Project
     *
     * @param label - the label
     * @param name - the name
     * @param description - the description
     * @param user - the creator
     * @return the created content project
     */
    public static ContentProject createContentProject(String label, String name, String description, User user) {
        return ContentProjectFactory.save(new ContentProject(label, name, description, user.getOrg()));
    }

    /**
     * Look up Content Project by label
     *
     * @param label - the label
     * @param user - the user
     * @return Optional with matching Content Project
     */
    public static Optional<ContentProject> lookupContentProject(String label, User user) {
        return ContentProjectFactory.lookupContentProjectByLabelAndOrg(label, user.getOrg());
    }

    /**
     * Update Content Project
     *
     * @param label - the label for lookup
     * @param newName - new name
     * @param newDesc - new description
     * @param user - the user
     * @throws com.redhat.rhn.domain.contentmgmt.ContentManagementException - if Content Project with given label is not
     * found
     * @return the updated Content Project
     */
    public static ContentProject updateContentProject(String label, Optional<String> newName, Optional<String> newDesc,
            User user) {
        return lookupContentProject(label, user)
                .map(cp -> {
                    newName.ifPresent(name -> cp.setName(name));
                    newDesc.ifPresent(desc -> cp.setDescription(desc));
                    return cp;
                })
                .orElseThrow(() ->
                        new ContentManagementException("Content Project with label " + label + " not found."));
    }

    /**
     * Remove Content Project
     *
     * @param label - the label
     * @param user - the user
     * @return the number of object affected
     */
    public static int removeContentProject(String label, User user) {
        Optional<ContentProject> contentProject = lookupContentProject(label, user);
        return contentProject.map(cp -> ContentProjectFactory.remove(cp)).orElse(0);
    }
}
