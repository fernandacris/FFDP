#!/bin/bash
USUARIO=vagrant
SENHA=vagrant
SAIR=Nao
while [ $SAIR != "SAI" ]; do
QNT=1
clear
echo 
echo Debian GNU/Linux 8 jessie tty1
while (( $QNT <= 5 )); do
 echo -n "jessie login: "
 read LOGIN
 echo -n "Password: "
 read -s  PASSW
 echo
if [ $LOGIN == $USUARIO ]; then
  if [ $PASSW == $SENHA ]; then	
	SAIR="SAI"
	QNT=6
  else
	sleep 2
	echo
	echo "Login incorrect"
  fi
else
	sleep 3
	echo
        echo "Login incorrect"
fi
let QNT=(QNT+1)
done
done
