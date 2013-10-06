#exec startlxde
#export DISPLAY="0.0";

DEFAULT_SESSION=openbox

case $1 in 

gnome) 

	exec gnome-session
	;;
openbox) 
	exec ck-launch-session dbus-launch openbox-session 
	;;
*)
	exec ck-launch-session dbus-launch openbox-session 
	;;
esac
