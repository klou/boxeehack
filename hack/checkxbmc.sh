# Note: To follow conventions of other flags in /data/etc, this is "reverse boolean".
# 0 = false
# 1 = true
echo -n '0' > /data/etc/.xbmc_found
for m in /tmp/mnt/*; do
	if [ -f ${m}/xbmc.bin ] || [ -f ${m}/xbmc/xbmc.bin ]; then
		echo -n '1' > /data/etc/.xbmc_found
	fi
done
