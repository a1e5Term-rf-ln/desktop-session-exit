#!/usr/bin/env bash

GREEN='\033[32m'
YELLOW='\033[33m'
LCYAN='\033[1;36m'
NORMAL='\e[0m'

SH="desktop-session-exit"
echo -e "${GREEN}/usr/local/bin/$SH ...${NORMAL}"
echo ''

A1="${LCYAN}1${NORMAL}. ${YELLOW}Logout of the current session${NORMAL}	-l | l | --logout"
A2="${LCYAN}2${NORMAL}. ${YELLOW}Lock the current session${NORMAL}		-L | L | --lock"
A3="${LCYAN}3${NORMAL}. ${YELLOW}Set the machine into hibernate${NORMAL}	-H | H | --hibernate"
A4="${LCYAN}4${NORMAL}. ${YELLOW}Shutdown your machine${NORMAL}		-s | s | --shutdown"
A5="${LCYAN}5${NORMAL}. ${YELLOW}Set the machine into suspend${NORMAL}		-S | S | --suspend"
A6="${LCYAN}6${NORMAL}. ${YELLOW}Reboot your machine${NORMAL}			-r | r | --reboot"
A7="${LCYAN}7${NORMAL}. ${YELLOW}Restart the session${NORMAL}			-R | R | --restart"
A8="${LCYAN}8${NORMAL}. ${YELLOW}script exit${NORMAL}				any key"

ARR=("$A1" "$A2" "$A3" "$A4" "$A5" "$A6" "$A7" "$A8")

if command -v fzf >/dev/null 2>&1 ; then
	echo "Select the desired option:"
	CHOICE=$(printf "%s\n" "${ARR[@]}" | fzf --height 40% --reverse)
	CHOICE=$(echo "$CHOICE" | cut -c 1)

else
	for i in "${!ARR[@]}"; do
		echo -e "${ARR[i]}"
	done
	echo ''
	echo -e "${GREEN}Enter number, short option or long option (For example: 1 | -l | l | --logout):${NORMAL} "
	read CHOICE
fi

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
