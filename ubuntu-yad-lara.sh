#!/bin/bash
# ----------------------------
#
#  yad --version  0.17.1.1
# Verifica se o usuário é root
#

t=0;
while [ $t -lt 100 ];
do t=$[t+1];
echo $t;sleep .1;
done\
| yad --title="System" --progress --text "Carregando o Sistema..." 



if [[ $EUID -ne 0 ]]; then
yad --title="AVISO" \  --text="Execute usando o comando  ' sudo '  para executar este software! "  --button=gtk-ok:0  
exit 1
fi

#----------------------------
# Verifica conexao com a internet
#
ping -c 3 www.google.com.br &>/dev/null
if [[ $? != 0 ]]; then

yad --title="AVISO" \  --text=" Voce nao esta conectado a internet! "  --button=gtk-ok:0
exit 1
fi

[ $? -ne 0 ] && yad --text="Voce apertou ESC... Saindo do programa!" --button=gtk-ok:0 && exit 1

yad --title="Arredondador do Ubuntu 12.04"      \
 --text="Vamos fazer algumas perguntas para que possamos melhorar sua experiencia com o linux "  --button=gtk-ok:0



#---------------------------
# PROGRAMAS PARA INSTALAR
# Contribuição por Raimundo Alves Portela
# Para menus, sempre uso o --list, e uma ótuma opção, 
# visto que permite ao usuário acionar uma única opção:
# - clicando 2 vezes em cima
# - dando enter no teclado
# - selecionando e depois clicando em um botao de acao
#---------



while resposta=$(yad --list --title='Arredondador do Ubuntu 12.04' --width=400 --height=500 \
        --column='opcao':TEXT --column='Opções':TEXT --hide-column=1 --print-column=1 \
        --button='_Sair':1 --button='_Acessar Opção':0 --separator='' \
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
        0 "Sair" )
do


# Apertou a tecla ESC
[ $? -ne 0 ] && yad --text="Voce apertou ESC... Saindo do programa!" --button=gtk-ok:0 && break

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
