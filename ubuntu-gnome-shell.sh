#!/bin/bash

# Copyright 2012 Jerônimo Medina Madruga
#
# This file is part of Linux Install Scripts.
# Linux Install Scripts is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# Linux Install Scripts is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with Linux Install Scripts. If not, see http://www.gnu.org/licenses/

# Becoming root due to the use apt
sudo su

# Deactivate the gnome updater
sed -i 's/X-GNOME-Autostart-Delay=60/X-GNOME-Autostart-enabled=false/' /etc/xdg/autostart/update-notifier.desktop

# Add the Gnome 3 Team PPA
add-apt-repository ppa:gnome3-team/gnome3 -y

# Add the Gimp 2.8 PPA
add-apt-repository ppa:otto-kesselgulasch/gimp -y

# Add the Medibuntu Repository
wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update

# Getting the gnome-shell and making it the default in lightdm
apt-get install gnome-shell gnome-tweak-tool -y
/usr/lib/lightdm/lightdm-set-defaults --session gnome

# Installing development tools
apt-get install build-essential eclipse anjuta anjuta-extras quickly geany kompozer git-core git-gui git-doc -y

# Installing office and presentation tools
apt-get install gnucash openclipart libreoffice libreoffice-l10n-pt-br workrave pyroom qalculate tesseract-ocr tesseract-ocr-por ocrfeeder gscan2pdf calibre lyx zim impressive ttf-mscorefonts-installer -y

# Installing multimedia tools
apt-get install audacious non-free-codecs ubuntu-restricted-extras vlc libdvdcss2 arista frei0r-plugins audacity brasero-cdrkit openshot cheese bombono-dvd 

# Installing Audacity plugins
apt-get install vco-plugins tap-plugins swh-plugins rev-plugins omins mcp-plugins ladspa-sdk csladspa cmt caps blop blepvco amb-plugins -y

# Installing photo & images tools
apt-get install gimp gimp-gmic inkscape python-uniconvertor scribus blender shutter trimage pencil dia vym darktable -y

# Installing extraction tools
apt-get install arj lha p7zip p7zip-full p7zip-rar rar unrar unace-nonfree unp -y

# Installing system & network tools
apt-get install samba smbclient grdesktop screen htop filezilla ntfs-3g unetbootin unetbootin-translations ppa-purge gdebi keepassx bleachbit nautilus-open-terminal remmina dconf-tools gconf-editor hplip-cups python-gpgme testdisk -y

# Installing internet tools
apt-get install chromium-browser chromium-browser-l10n lynx midori msn-pecan xchat pidgin flashplugin-installer -y

# Updating all packages
apt-get dist-upgrade -y

# Cleaning up
apt-get clean; apt-get autoclean; apt-get autoremove -y
