
# Run the system-wide support stuff
. $GLOBALAUTOSTART

# Programs to launch at startup
setxkbmap latam&
gconftool-2 --set /apps/gnome_settings_daemon/plugins/background/active --type bool False
nitrogen --restore&
xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &


# Programs that will run after Openbox has started
(sleep 2 && pypanel) &
#nautilus &
nitrogen --restore & 
volwheel &
#wicd-client &
conky&
skype&
#blueman-manager&
#guake &
