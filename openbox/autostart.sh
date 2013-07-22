
# Run the system-wide support stuff
. $GLOBALAUTOSTART

# Programs to launch at startup
setxkbmap latam&
gconftool-2 --set /apps/gnome_settings_daemon/plugins/background/active --type bool False
nitrogen --restore&
xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &


#blueman-manager&
# Programs that will run after Openbox has started
(sleep 2 && fbpanel ) &
nitrogen --restore & 
conky&
skype&
pytyle&
tint2&
/usr/lib/notification-daemon-1.0/notification-daemon&
