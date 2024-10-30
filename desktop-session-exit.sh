
#/usr/local/bin/desktop-session-exit
SH="desktop-session-exit"
echo "$SH ..."
echo ''
echo "1. -l | --logout     Logout of the current session"
echo "2. -L | --lock       Lock the current session"
echo "3. -H | --hibernate  Set the machine into hibernate"
echo "4. -s | --shutdown   Shutdown your machine"
echo "5. -S | --suspend    Set the machine into suspend"
echo "6. -r | --reboot     Reboot your machine"
echo "7. -R | --restart    Restart the session"
echo ''
# Читаем выбор пользователя
read -p "Введите номер, короткую опцию или длинню (1 | -l | --logout): " CHOICE
echo
case $CHOICE in
	1 | -l | --logout)
		$SH -l
		;;
	2 | -L | --lock)
		$SH -L
		;;
	3 | -H | --hibernate)
	    $SH -H
	    ;;
	4 | -s | --shutdown)
		$SH -s
		;;
	5 | -S | --suspend)
		$SH -S
		;;
	6 | -r | --reboot)
		$SH -6
		;;
	7 | -R | --Restart)
		$SH -R
		;;
	8 | h | --help)
		help
		;;
	*)
		exit
		;;
esac
