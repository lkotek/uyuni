-- created by Oraschemadoc Wed Dec 21 14:59:46 2011
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE OR REPLACE FORCE VIEW "SPACEWALK"."RHNHWDEVICE" ("ID", "SERVER_ID", "CLASS", "BUS", "DETACHED", "DEVICE", "DRIVER", "DESCRIPTION", "VENDOR_ID", "DEVICE_ID", "SUBVENDOR_ID", "SUBDEVICE_ID", "PCITYPE") AS 
  select
	d.id,
	d.server_Id,
	d.class,
	d.bus,
	d.detached,
	d.device,
	d.driver,
	d.description,
	d.prop1,
	d.prop2,
	d.prop3,
	d.prop4,
	d.pcitype
from rhnDevice d
where d.class in ('AUDIO', 'MODEM', 'MOUSE', 'NETWORK',
	        'SCSI', 'OTHER', 'USB', 'VIDEO', 'CAPTURE',
		'SCANNER', 'TAPE', 'RAID', 'SOCKET')
 
/
