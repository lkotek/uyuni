/**
 * Copyright (c) 2009--2012 Red Hat, Inc.
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

package com.redhat.rhn.frontend.action.renderers;

import com.redhat.rhn.common.conf.ConfigDefaults;
import com.redhat.rhn.domain.user.User;
import com.redhat.rhn.frontend.listview.PageControl;

import com.suse.manager.webui.services.SaltService;

import javax.servlet.http.HttpServletRequest;

/**
 * Renders YourRhn fragment for tasks
 *
 * @version $Rev$
 */
public class TasksRenderer extends BaseFragmentRenderer {

    private static final String TASKS = "tasks";

    /**
     * {@inheritDoc}
     */
    protected void render(User user, PageControl pc, HttpServletRequest request) {
        request.setAttribute(TASKS, Boolean.TRUE);
        request.setAttribute("documentation", ConfigDefaults.get().isDocAvailable());
        request.setAttribute("amountOfMinions",
                SaltService.INSTANCE.getKeys().getUnacceptedMinions().size());
        RendererHelper.setTableStyle(request, null);
    }

    /**
     * {@inheritDoc}
     */
    protected String getPageUrl() {
        return "/WEB-INF/pages/common/fragments/yourrhn/tasks.jsp";
    }

}
