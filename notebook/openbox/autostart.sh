# Run the system-wide support stuff
	$GLOBALAUTOSTART

# Programs to launch at startup
#setxkbmap latam&
setxkbmap us altgr-intl&
gconftool-2 --set /apps/gnome_settings_daemon/plugins/background/active --type bool False


# Programs that will run after Openbox has started
#(sleep 2 && pypanel) &
(sleep 2 && fbpanel ) &
#xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &
nitrogen --restore &
conky&
skype&
tint2&
pytyle&
#wicd-client &
#blueman-applet&
/usr/lib/notification-daemon-1.0/notification-daemon&

#/usr/lib/notification-daemon-1.0/notification-daemon
