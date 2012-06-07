#!/bin/bash

# Virar root antes de tudo :)
sudo su

# Aplicativos a remover
# apt-get purge gwibber* empathy* thunderbird* totem* rhythmbox* software-center* telepathy* -y

# Ativar o Unity 2d como padrão
sed -i 's/user-session=ubuntu/user-session=ubuntu-2d/g' /etc/lightdm/lightdm.conf

# Atualiza os repositórios
apt-get update

# Resolve problemas de dependências
apt-get install -f -y

# Adiciona o repositório do Medibuntu
sudo -E wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update

# Extras do Ubuntu (codecs, flash, java, outros)
apt-get install ubuntu-restricted-extras ttf-mscorefonts-installer -y

# Desenvolvimento
apt-get install build-essential geany spe kompozer quickly anjuta anjuta-extras git-core git-gui git-doc -y

# Escritório
apt-get install homebank openclipart libreoffice libreoffice-l10n-pt-br lo-menubar workrave pyroom qalculate tesseract-ocr tesseract-ocr-por ocrfeeder gscan2pdf gnucash calibre lyx impressive zim -y

# Multimidia
apt-get install audacious vlc non-free-codecs libdvdcss2 ffmpeg mencoder arista frei0r-plugins devede winff audacity brasero-cdrkit openshot gaupol dvdrip sound-juicer easytag furiusisomount cheese bombono-dvd -y

# Efeitos do Audacity
apt-get install vco-plugins tap-plugins swh-plugins rev-plugins omins mcp-plugins ladspa-sdk csladspa cmt caps blop blepvco amb-plugins -y

# Gráfico
apt-get install gimp gimp-gmic inkscape python-uniconvertor scribus blender shutter trimage pencil dia vym darktable -y

# GIMP 2.8
add-apt-repository ppa:otto-kesselgulasch/gimp && apt-get update && apt-get install gimp -y

# Compactadores e descompactadores
apt-get install arj lha p7zip p7zip-full p7zip-rar rar unrar unace-nonfree unp -y

# Suporte, Redes e Administração de sistemas
apt-get install samba smbclient grdesktop screen htop filezilla ntfs-3g unetbootin unetbootin-translations ppa-purge gdebi keepassx bleachbit nautilus-open-terminal remmina dconf-tools -y

# Internet
apt-get install chromium-browser chromium-browser-l10n lynx midori pidgin msn-pecan xchat flashplugin-installer -y

# CUPS
apt-get install hplip-cups -y

# Atualização do sistema para finalizar
apt-get dist-upgrade -y

# Limpeza do cache
apt-get clean && apt-get autoclean