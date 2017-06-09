#------------------------SUB MENU PACOTES----------------------------------------

GPAC(){
OPCAO=$(dialog						\
	--stdout					\
	--title " Gerenciamento de Pacote "		\
	--menu "Escolha abaixo"				\
	0 0 0						\
	1 "Instalar Pacote"				\
	2 "Remover Pacote"				\
	3 "Listar Pacote"				\
	4 "Atualizar Pacote"				\
	5 "Sair")

case $OPCAO in
	1) IPAC ;;
	2) RPAC ;;
	3) LPAC ;;
	4) APAC ;;
	5) MENU ;;
	*) dialog ; MENU ;;
	
esac

GPAC
}


#---------------------------------------------------------
#---------------------INSTALAR PACOTE---------------------

IPAC(){
INSTA=$( dialog						\
	--stdout					\
	--title " Instalação de pacote "		\
	--inputbox " Qual pacote deseja instalar? "	\
	0 0)
case $? in 1) GPAC ;; 255) GPAC ;; esac
IPAC2
}

IPAC2(){
	dialog						\
	--title " Instalando... "			\
	--infobox " Aguarde... "			\
	0 0
case $? in 1) GPAC ;; 255) GPAC ;; esac

	apt-get install $INSTA &> /dev/null 
	IPAC3

}

IPAC3(){
	dialog						\
	--title " Sucesso! "				\
	--msgbox "$INSTA Instalado com sucesso"		\
	0 0
	GPAC
}

#--------------------------------------------------------
#---------------------REMOVER PACOTE---------------------

RPAC(){
REM=$(dialog						\
	--stdout					\
	--title " Removendo Pacote "			\
	--inputbox "Qual pacote deseja remover?"	\
	0 0)
case $? in 1) GPAC ;; 255) GPAC ;; esac
REM2
}

REM2(){
	dialog						\
	--stdout					\
	--title " Removendo... "			\
	--infobox " Aguarde um instante... "		\
	0 0
case $? in 1) GPAC ;; 255) GPAC ;; esac

	apt-get remove $REM &> /dev/null 		\
	sleep 2
	REM3
}

REM3(){
	apt-get purge -y $REM &> /dev/null
	sleep 2
	REM4
}

REM4(){
	dialog						\
	--title " Sucesso! "				\
	--msgbox "$REM Removido com sucesso!"		\
	0 0
	GPAC

}

#--------------------------------------------------------
#----------------------LISTA PACOTE----------------------

LPAC(){
	apt list --installed > /tmp/aptlist.txt
	cat -n /tmp/aptlist.txt > /tmp/aptlist2.txt
	dialog						\
	--textbox /tmp/aptlist2.txt			\
	20  70
case $? in 1) GPAC ;; 255) GPAC ;; esac
GPAC
}

#-------------------------------------------------------
#---------------------ATUALIZAR PACOTE------------------

APAC(){
ATU=$(dialog --stdout					\
	--title " Atualizar Pacote "			\
	--yesno "Atualizar Pacote do sistema"		\
	0 0)
case $? in 1) GPAC ;; 255) GPAC ;; esac

ATU=$?
if [ $? == 0 ]; then

dialog 	--infobox "Aguarde um instante..." 0 0

apt-get update &> /dev/null

case $? in 1) GPAC ;; 255) GPAC ;; esac
	dialog						\
	--infobox "Atualizado com sucesso!"		\
	0 0
	sleep 2
	GPAC
else
GPAC
fi
}
