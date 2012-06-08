#!/bin/bash

# Copyright 2012 Marcos Carraro
#
# This file is part of Linux Install Scripts.
# Linux Install Scripts is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# Linux Install Scripts is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with Linux Install Scripts. If not, see http://www.gnu.org/licenses/

# ----------------------------
# Verifica se o usuário é root
#
if [[ $EUID -ne 0 ]]; then
dialog --backtitle "Arredondador do Ubuntu 12.04" --title "ATENCAO" --msgbox "Voce deve se logar com o root para poder executar este software!" 10 60
exit 1
fi

#----------------------------
# Verifica conexao com a internet
#
ping -c 3 www.google.com.br &>/dev/null
if [[ $? != 0 ]]; then
       dialog --backtitle "Arredondador do Ubuntu 12.04" --title "ATENCAO" --msgbox "Voce nao esta conectado a internet!" 10 60
exit 1
fi

#------------------------------
dialog \
--backtitle "  Arredondador do Ubuntu 12.04   " \
--title "   Bem Vindo ao arredondador do Ubuntu 12.04   " \
--msgbox "  Vamos fazer algumas perguntas para que possamos melhorar sua experiencia com o linux" 10 60
[ $? -ne 0 ] && dialog --msgbox "Voce apertou ESC... Saindo do programa!" 10    60 && exit 1


#---------------------------
# PROGRAMAS PARA INSTALAR
#
while : ; do

    resposta=$(
      dialog --stdout               \
--backtitle "Arredondador do Ubuntu 12.04" \
--menu "Aplicativos disponiveis"  0 0 0                   \
1 "Atualizar Sistema" \
2 "Adiciona repositorio Medibuntu"  \
3 "Extras do Ubuntu"     \
4 "Multimidia"        \
5 "Compactados Descompactadores" \
6 "Google-Chrome" \
7 "RealPlayer" \
8 "Skype" \
9 "Ativar Unity 2d" \
10 "DEVEDE - Criador de DVDs" \
11 "Cheese - Webcam" \
12 "GUVcviewe - Webcam" \
0 "Sair"                )

# Apertou a tecla ESC
[ $? -ne 0 ] && dialog --msgbox "Voce apertou ESC... Saindo do programa!" 10    60 && break

    # De acordo com a opção escolhida, dispara programas
    case "$resposta" in

1)  apt-get update -y  && apt-get upgrade -y  && apt-get install -f -y ;;
         
2) sudo -E wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update ;;
        
3) apt-get install ubuntu-restricted-extras ttf-mscorefonts-installer -y ;;
        
4) apt-get install vlc non-free-codecs libdvdcss2 ffmpeg mencoder arista frei0r-plugins winff brasero-cdrkit openshot gaupol dvdrip sound-juicer gstreamer0.10-plugins-ugly gstreamer0.10-plugins-ffmpeg easytag furiusisomount bombono-dvd -y ;;

5) apt-get install arj lha p7zip p7zip-full p7zip-rar rar unrar unace-nonfree unp -y ;;
        
6) wget -P /tmp https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb  && dpkg -i /tmp/google-chrome-stable_current_i386.deb ;; 

7) wget -P /tmp  http://client-software.real.com/free/unix/RealPlayer11GOLD.deb  && dpkg -i /tmp/RealPlayer11GOLD.deb ;;

8) wget -P /tmp http://download.skype.com/linux/skype-ubuntu_2.2.0.35-1_i386.deb  && dpkg -i /tmp/skype-ubuntu_2.2.0.35-1_i386.deb ;;

9) sed -i "s/user-session=ubuntu/user-session=ubuntu-2d/g" /etc/lightdm/lightdm.conf ;;

10) apt-get install devede -y ;;

11) apt-get install cheese -y ;;

12) add-apt-repository ppa:pj-assis/ppa -y  && apt-get update  && apt-get install guvcview -y ;;

0) break ;;
    esac

done