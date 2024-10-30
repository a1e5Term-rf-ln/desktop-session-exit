#!/usr/bin/env bash

#/usr/local/bin/desktop-session-exit
SH="desktop-session-exit"
echo "/usr/local/bin/$SH ..."
echo ''

A1='-l | l | --logout     Logout of the current session'
A2='-L | L | --lock       Lock the current session'
A3="-H | H | --hibernate  Set the machine into hibernate"
A4="-s | s | --shutdown   Shutdown your machine"
A5="-S | S | --suspend    Set the machine into suspend"
A6="-r | r | --reboot     Reboot your machine"
A7="-R | R | --restart    Restart the session"

ARR=("$A1" "$A2" "$A3" "$A4" "$A5" "$A6" "$A7")

#"2. -L | L | --lock       Lock the current session" "3. -H | H | --hibernate  Set the machine into hibernate" "4. -s | s | --shutdown   Shutdown your machine" "5. -S | S | --suspend    Set the machine into suspend" "6. -r | r | --reboot     Reboot your machine" "7. -R | R | --restart    Restart the session")

for i in "${!ARR[@]}"; do
	echo "$((i + 1)). ${ARR[i]}"
done

#read a

echo ''

# Читаем выбор пользователя
read -p "Введите номер, короткую опцию или длинню (Например: 1 | -l | l | --logout): " CHOICE
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
