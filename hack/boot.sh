#!/bin/sh
sh /data/hack/cleanup.sh &
sh /data/hack/skin.sh &
sh /data/hack/cache.sh &
sh /data/hack/splash.sh &
sh /data/hack/visualiser.sh &
sh /data/hack/subtitles.sh &
sh /data/hack/logo.sh &
sh /data/hack/apps.sh &
sh /data/hack/network.sh &
sh /data/hack/telnet.sh &
sh /data/hack/ftp.sh &
sh /data/hack/plugins.sh &
sh /data/hack/checkxbmc.sh &
if [ -e /data/etc/.xbmc_found]; then
	sh /data/hack/xbmclauncher.sh &
fi
