#!/bin/bash
#script para gerenciar usuario;arquivos;diretorios;rede;dispositivos

#-------------------------------------------------------------------------
#----------------CRIA ARQUIVOS--------------------------------------------

CARQ(){
clear

USUARIO=$(dialog							\
		--stdout						\
		--title 'Usuário'					\
		--inputbox 'Digite o nome do seu usuário: '		\
		0 0)

#Criar arquivo
NOME=$(dialog								\
		--stdout						\
		--title 'Criar Arquivo'					\
		--inputbox 'Digite o nome do arquivo: '			\
		0 0)
> $NOME
#------------------------------------------------------------------------

dialog									\
		--title 'Parabéns'					\
		--msgbox 'Criado com sucesso!'				\
		0 0
GARQ
}
#------------------------------------------------------------------------
#--------------------APAGA ARQUIVOS--------------------------------------

AARQ(){
clear
USUARIO=$(dialog							\
		--stdout						\
		--title 'Usuário'					\
		--inputbox 'Digite o nome do seu usuário: '		\
		0 0)
rm -rf $NOME
dialog									\
		--title 'Parabéns'					\
		--msgbox 'Deletado com sucesso!'			\
		0 0
GARQ
}

#-----------------------------------------------------------------------
#------------------------RENOMEAR ARQUIVOS------------------------------

RARQ(){
clear
NOME=$(dialog					\
		--stdout			\
		--inputbox 'Digite um nome: '	\
		0 0)

LOCAL=$(dialog					\
		--stdout			\
		--inputbox 'Digite um local: '	\
		0 0)

NOVONOME=$(dialog				   \
		--stdout			   \
		--inputbox 'Digite um novo nome: ' \
		0 0)

mv $LOCAL/$NOME		mv $LOCAL/$NOVONOME

#---------------------------------------------------------

dialog						\
	--msgbox 'Renomeado com sucesso!' 	\
	0 0

RARQ
}

#------------------------LISTA ARQUIVOS--------------------------------

#LARQ(){
#NOME=$(dialog								\


#dialog									\
#		--title 'Listagem'					\
#		--msgbox 'Listado com sucesso!'				\
#		0 0		\
#clear
#dialog --yesno 'Listar arquivo'0 0 && echo 'Arquivo não encontrado: $NOME'\
#0 0

#ls -la $NOME
#echo "listado com sucesso"
#read -p "Pressione [enter] para finalizar" PPP
#GARQ
#}

#-------------------------------------------------------------------------
#------------------------------MOVER ARQUIVO------------------------------


#-------------------------------------------------------------------------
#---------------------CRIA DIRETORIOS-------------------------------------

CDIR(){
clear
read -p "Digite o nome do diretorio a ser criado: " NOME
USUARIO=$(dialog							\
		--stdout						\
		--title 'Usuário'					\
		--inputbox 'Digite o nome do seu usuário: '		\
		0 0)
mkdir $NOME
echo "Criado com sucesso"
read -p "Pressione [enter] para finalizar" PPP
GARQ
}
#-------------------------------------------------------------------------

#-------------------------------------------------------------------------
#------------------------SUB MENU ARQUIVOS--------------------------------
GARQ(){
#clear
#echo "
OPCAO=$(dialog							\
		--stdout					\
		--title 'Gerenciamento de arquivos'		\
		--menu 'Escolha uma opção: '			\
		0 0 0						\
		1 'Criar arquivo'				\
		2 'Apagar arquivo'				\
		3 'Renomear arquivo'				\
		4 'Listar arquivo'				\										\	
		5 'Mover arquivo'				\
		6 'Voltar')
#read -n 1 -p "Escolha uma opção: " OPCAO
case $OPCAO in
	1) CARQ ;;
	2) AARQ ;;
	3) RARQ ;;
	4) LARQ ;;
	5) MARQ ;;
	6) MENU	;;
	*) clear ; read -p "Opção invalida. Pressione enter para voltar." PPP ;;
esac
}
#----------------------------------------------------------------------------------
#---------------------MENU PRINCIPAL-----------------------------------------------

MENU(){
OPCAO=$(dialog						\
	--stdout 					\
	--title 'MENU'					\
	--menu 'Escolha uma opção do menu: '		\
	0 0 0						\
	1 'Gerenciar Arquivos'				\
	2 'Gerenciar Diretórios'			\
	3 'Gerenciar Usuarios'				\
	4 'Gerenciar Rede'				\
	5 'Gerenciar Dispositivos'			\
	6 'Gerenciar pacotes'				\
	7 'Sair')

case $OPCAO in
	1) GARQ ;;
	2) GDIR ;;
	3) GUSR ;;
	4) GRED ;;
	5) GDIS ;;
	6) GPAC ;;
	7) FIM	;;
	*) dialog --title 'Opção invalida.' --msgbox ' Pressione enter para voltar.' 0 0 ; MENU ;;
esac
}
#---------------------------------------------------------------------------------------------------
#------------------------------FIM------------------------------------------------------------------
FIM(){
clear
	echo "Até breve. volte sempre !"
	exit 0
}
#-----------------------------USUARIO E SENHA----------------------------
USER="a"
PASS="s"
USUARIO=$(dialog							\
		--stdout						\
		--title 'Usuário'					\
		--inputbox 'Digite o nome do seu usuário: '		\
		0 0)

SENHA=$(dialog								\
		--stdout						\
		--title 'Senha'						\
		--passwordbox ' Digite a sua senha: '			\
		0 0)
[ $USUARIO == $USER ] && [ $SENHA == $PASS ] && MENU || FIM
#-------------------------------------------------------------------------

