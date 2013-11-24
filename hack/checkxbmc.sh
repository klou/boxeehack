# Note: To follow conventions of other flags in /data/etc, xbmc_found is "reverse boolean".
# 0 = false
# 1 = true
# Sleeps until LAUNCH flag exists, then wakes up, kills BOXEE, launches XBMC

LAUNCHXBMC=/data/etc/.launch_xbmc
LAUNCHBOXEE=/data/etc/.launch_boxee
FOUND=/data/etc/.xbmc_found

echo -n '0' > $FOUND

if [ -e $LAUNCHXBMC | -e $LAUNCHBOXEE ]
then
	rm $LAUNCHXBMC
	rm $LAUNCHBOXEE
fi

for m in /tmp/mnt/*; do
	if [ -f ${m}/xbmc.bin ] || [ -f ${m}/xbmc/xbmc.bin ]; then
		echo -n '1' > $FOUND
		while true
		do	
			# Sleep until LAUNCH exists
			while [ ! -e $LAUNCHXBMC || ! -e $LAUNCHBOXEE ]
			do
				sleep 5
			done

			if [ -e $LAUNCHXBMC ] # Kill Boxee
			then
				/etc/rc3.d/U94boxeehal stop
				/etc/rc3.d/U99boxee stop
				killall BoxeeHal
				killall BoxeeLauncher
				killall Boxee
				killall run_boxee.sh

				# Launch XBMC
				/data/hack/xbmc.sh &
				
				# Reset flag
				rm $LAUNCHXBMC
			else # [ -e $LAUNCHBOXEE ] # Launch Boxee
				export HOME=/data
				cd $HOME
				/etc/init.d/boxeehal start
				/etc/init.d/boxee start
			fi
			# Loop	
		done
	fi
done
