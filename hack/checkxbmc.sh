for m in /tmp/mnt/*; do
	if [ -f ${m}/xbmc.bin ] || [ -f ${m}/xbmc/xbmc.bin ]; then
		touch /data/etc/.xbmc_found
	else
		rm -f /data/etc/.xbmc_found
	fi
done

