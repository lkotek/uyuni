package com.redhat.rhn.frontend.xmlrpc.serializer;

import com.redhat.rhn.domain.server.virtualhostmanager.VirtualHostManager;
import com.redhat.rhn.domain.server.virtualhostmanager.VirtualHostManagerFactory;
import com.redhat.rhn.frontend.xmlrpc.serializer.util.SerializerHelper;
import org.apache.commons.lang.StringUtils;
import redstone.xmlrpc.XmlRpcException;
import redstone.xmlrpc.XmlRpcSerializer;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

/**
 * Serializer for VirtualHostManager class.
 * The content of the "config" struct is dynamic.
 *
 * @xmlrpc.doc
 *  #struct("virtual host manager")
 *      #prop("string", "label")
 *      #prop("int", "org_id")
 *      #prop("string", "gatherer_module")
 *      #prop("struct", "configs")
 *  #struct_end()
 */
public class VirtualHostManagerSerializer extends RhnXmlRpcCustomSerializer {

    /**
     * {@inheritDoc}
     */
    @Override
    public Class getSupportedClass() {
        return VirtualHostManager.class;
    }

    @Override
    protected void doSerialize(Object obj, Writer output, XmlRpcSerializer serializer)
            throws XmlRpcException, IOException {
        VirtualHostManager manager = (VirtualHostManager) obj;
        SerializerHelper helper = new SerializerHelper(serializer);

        helper.add("label", manager.getLabel());
        helper.add("org_id", manager.getOrg().getId());
        helper.add("gatherer_module", manager.getGathererModule());
        helper.add("configs", generateConfigs(manager));

        helper.writeTo(output);
    }

    /**
     * Returns a map containing with Virtual Host Manager's configs and
     * username (if managers credentials exists).
     * @param manager - Virtual Host Manager
     */
    private Map<String, String> generateConfigs(VirtualHostManager manager) {
        Map<String, String> result = new HashMap<>();

        // fill user name if manager has credentials
        if (manager.getCredentials() != null &&
                !StringUtils.isEmpty(manager.getCredentials().getUsername())) {
            result.put(VirtualHostManagerFactory.CONFIG_USER,
                    manager.getCredentials().getUsername());
        }

        // fill configs map
        if (manager.getConfigs() != null) {
            manager.getConfigs().stream().forEach(
                config -> result.put(config.getParameter(), config.getValue())
            );
        }

        return result;
    }
}
