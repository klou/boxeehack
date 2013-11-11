echo '0' > /data/etc/.xbmc_found
for m in /tmp/mnt/*; do
	if [ -f ${m}/xbmc.bin ] || [ -f ${m}/xbmc/xbmc.bin ]; then
		echo '1' > /data/etc/.xbmc_found
	fi
done