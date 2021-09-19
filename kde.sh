#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector -c Brazil -a 6 --sort rate --save /etc/pacman.d/mirrorlist

git clone https://aur.archlinux.org/pikaur.git
cd pikaur/
makepkg -si --noconfirm

sudo pacman -S --noconfirm xorg sddm plasma kde-applications firefox simplescreenrecorder obs-studio vlc papirus-icon-theme kdenlive materia-kde

sudo flatpak install -y spotify

sudo systemctl enable sddm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
reboot