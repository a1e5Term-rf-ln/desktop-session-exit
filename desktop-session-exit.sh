
/usr/local/bin/desktop-session-exit
SH="desktop-session-exit"

echo "$SH ..."
echo "1. -l | --logout     Logout of the current session"
echo "2. -L | --lock       Lock the current session"
echo "3. -h | --hibernate  Set the machine into hibernate"
echo "4. -s | --shutdown   Shutdown your machine"
echo "5. -S | --suspend    Set the machine into suspend"
echo "6. -r | --reboot     Reboot your machine"
echo "7. -R | --restart    Restart the session"

# Читаем выбор пользователя
read -p "Введите номер, короткую опцию или длинню (1 | -l | --logout): " CHOICE

case $CHOICE in
	-l|--logout)
		$desktop_session_logout
		;;
	-L|--lock)
		xlock
		;;
	h|--help)
		help
		;;
	#-H|--hibernate)
	#    sudo pm-hibernate
	#    ;;
	-s|--shutdown)
		if [ -e /etc/live/config/save-persist -o -e /live/config/persist-save.conf ] && which persist-config &> /dev/null; then
			sudo persist-config --shutdown --command poweroff
		else
			sync
			#sudo chvt 1#this causes exit to reappear on halt
			sudo poweroff
		fi
		;;
	-S|--suspend)
		sudo pm-suspend
		;;
	-r|--reboot)
		if [ -e /etc/live/config/save-persist -o -e /live/config/persist-save.conf ] && which persist-config &> /dev/null; then
			sudo persist-config --shutdown --command reboot
		else
			sync
			#sudo chvt 1#this causes exit to reappear on reboot
			sudo reboot
		fi
		;;
	-R|--Restart)
		$desktop_session_restart
		;;
	*)
		if [ "$DISPLAY" ]; then
			$desktop_session_exit_gui &
			exit
		else
			echo "$1 Not an option"
			help;
		fi
		;;
esac


case
	1
	Lock Screen 
	desktop-session-exit -L
	
	2
	Restart Session 
	desktop-session-exit -R

	3
	Reboot 
	desktop-session-exit -r

	4
	Log Out 
	desktop-session-exit -l

	5
	Suspend 
	desktop-session-exit -S

	6
	Shutdown 
	desktop-session-exit -s
	
