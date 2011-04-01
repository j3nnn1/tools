
# Run the system-wide support stuff
. $GLOBALAUTOSTART

# Programs to launch at startup
nitrogen --restore&
xcompmgr -c -t-5 -l-5 -r4.2 -o.55 &


# Programs that will run after Openbox has started
(sleep 2 && pypanel) &
nautilus &
volwheel &
wicd-client &
conky&
#blueman-manager&
#guake &
