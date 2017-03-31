#!/bin/bash
DIG=1; PRI=0; SEG=0; TER=0; 

clear
while (( $DIG != 0 )); do
 echo "Digite o salário"
 read DIG
 SAL=$DIG
 [ $SAL == $PRI ] &&  SAL=0
 [ $SAL == $SEG ] &&  SAL=0
 if (( $SAL > $PRI )); then
	TER=$SEG
	SEG=$PRI
	PRI=$SAL
 else
	if (( $SAL > $SEG )); then
		TER=$SEG
		SEG=$SAL
	else
	
		if (( $SAL >= $TER )); then
			TER=$SAL
		fi
	fi
 fi
done
echo "Os maiores salarios respectivamente são: $TER, $SEG e $PRI"
 
