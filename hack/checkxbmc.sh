# Note: To follow conventions of other flags in /data/etc, xbmc_found is "reverse boolean".
# 0 = false
# 1 = true
# Sleeps until LAUNCH flag exists, then wakes up, kills BOXEE, launches XBMC

LAUNCH=/data/etc/.launch_xbmc
FOUND=/data/etc/.xbmc_found

echo -n '0' > $FOUND

if [ -e $LAUNCH ]
then
	rm $LAUNCH
fi
for m in /tmp/mnt/*; do
	if [ -f ${m}/xbmc.bin ] || [ -f ${m}/xbmc/xbmc.bin ]; then
		echo -n '1' > $FOUND
		
		# Sleep until LAUNCH exists
		while [ ! -e $LAUNCH ]
		do
			if (ps x | grep -q xbmc.bin)
			then
				kill -9 $$
			fi
			sleep 5
		done

		# Kill Boxee
		/etc/rc3.d/U94boxeehal stop
		/etc/rc3.d/U99boxee stop
		killall BoxeeHal
		killall BoxeeLauncher
		killall Boxee
		killall run_boxee.sh

		# Launch XBMC
		/data/hack/xbmc.sh &
	fi
done
