#!/bin/bash

# Atualiza os repositórios
apt-get update

# Resolve problemas de dependências
apt-get install -f -y

# Adiciona o repositório do Medibuntu
sudo -E wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update

# Extras do Ubuntu (codecs, flash, java, outros)
apt-get install ubuntu-restricted-extras -y

# Desenvolvimento
apt-get install build-essential geany spe kompozer quickly anjuta anjuta-extras -y

# Escritório
apt-get install ttf-mscorefonts-installer homebank openclipart libreoffice libreoffice-l10n-pt-br workrave pyroom qalculate tesseract-ocr tesseract-ocr-por ocrfeeder gscan2pdf gnucash lo-menubar calibre focuswriter lyx impressive zim -y

# Multimidia
apt-get install audacious vlc non-free-codecs w32codecs libdvdcss2 ffmpeg mencoder arista frei0r-plugins devede winff audacity brasero-cdrkit openshot gaupol dvdrip sound-juicer gstreamer0.10-plugins-ugly gstreamer0.10-plugins-ffmpeg easytag furiusisomount cheese bombono-dvd -y

# Efeitos do Audacity
apt-get install vco-plugins tap-plugins swh-plugins rev-plugins omins mcp-plugins ladspa-sdk csladspa cmt caps blop blepvco amb-plugins -y

# Gráfico
apt-get install gimp gimp-gmic inkscape python-uniconvertor scribus blender shutter trimage pencil dia vym darktable -y

# GIMP 2.8
add-apt-repository ppa:otto-kesselgulasch/gimp && apt-get update && apt-get install gimp

# Compactadores e descompactadores
apt-get install arj lha p7zip p7zip-full p7zip-rar rar unrar unace-nonfree unp -y

# Suporte, Redes e Administração de sistemas
apt-get install samba smbclient grdesktop screen htop filezilla ntfs-3g unetbootin unetbootin-translations ppa-purge gdebi keepassx bleachbit nautilus-open-terminal remmina dconf-tools -y

# Internet
apt-get install chromium-browser chromium-browser-l10n lynx midori pidgin msn-pecan xchat flashplugin-installer -y

# CUPS
apt-get install hplip-cups -y

# Aplicativos a remover

apt-get purge gwibber* empathy* thunderbird*
