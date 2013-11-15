#!/bin/sh
if grep -q '1' /data/etc/.boot_to_xbmc_enabled
then
	/etc/rc3.d/U94boxeehal stop
	/etc/rc3.d/U99boxee stop
	killall BoxeeHal
	killall BoxeeLauncher
	killall Boxee
	killall run_boxee.sh
	mount -o bind /data/hack/xbmc.sh /opt/boxee/BoxeeLauncher
	break
fi