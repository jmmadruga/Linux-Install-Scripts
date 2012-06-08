#!/bin/bash

# Copyright 2012 João Fracassi
#
# This file is part of Linux Install Scripts.
# Linux Install Scripts is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# Linux Install Scripts is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with Linux Install Scripts. If not, see http://www.gnu.org/licenses/

#Carrega os repositórios
apt-get update

#Dependências
apt-get install -f -y

#Extras do Ubuntu (codecs, flash, java, outros)
apt-get install ubuntu-restricted-extras -y

#Bibliotecas essenciais para o Ubuntu  
apt-get install build-essential -y

#Apetitude
apt-get install aptitude -y

#Fontes do Windows
apt-get install msttcorefonts -y

#Bibliotecas para assistir filmes em DVD
apt-get install w32codecs libdvdcss2 -y

#Player VLC
apt-get install vlc -y

#Repositorios Medibuntu
sudo -E wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update

#Codecs do Medibuntu
sudo apt-get install non-free-codecs libdvdcss2 faac faad ffmpeg ffmpeg2theora flac icedax id3v2 lame libflac++6 libjpeg-progs libmpeg3-1 mencoder mjpegtools mp3gain mpeg2dec mpeg3-utils mpegdemux mpg123 mpg321 regionset sox uudeview vorbis-tools x264 -y

#Compactadores
sudo apt-get install arj lha p7zip p7zip-full p7zip-rar rar unrar unace-nonfree -y

#Java 7
sudo add-apt-repository ppa:webupd8team/java && sudo apt-get update
sudo apt-get install oracle-jdk7-installer -y

#Wine
sudo add-apt-repository ppa:ubuntu-wine/ppa -y && sudo apt-get update
sudo apt-get install wine -y

#Biblioteca para arquitetura de 64-bits, para usar o Ubuntu
#sudo apt-get install ia32-libs libc6-i386 -y

#Samba
sudo apt-get install samba -y
sudo apt-get install smbclient -y

#Remote Desktop
sudo apt-get install rdesktop -y
sudo apt-get install grdesktop -y

#My Unity para gerenciamento da interface gráfica
sudo apt-add-repository ppa:myunity/ppa -y && sudo apt-get update
sudo apt-get install myunity