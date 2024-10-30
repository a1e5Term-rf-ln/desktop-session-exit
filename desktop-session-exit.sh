


echo введите номер
read

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
	
