#! /usr/bin/env bash

# Upadate repositories

sudo pacman -Syy

# Essentials packages

sudo pacman -S --noconfirm base base-devel git curl

# Programming packages

sudo pacman -S --noconfirm python phyton-pip nodejs npm rust go

# Installing yay

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Installing snapd

git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo systemctl enable --now snapd.apparmor
cd ..
rm -rf snapd


# Installing flatpak

sudo pacman -S --noconfirm flatpak

# Theme, Icons and cursors

cd
git clone https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme
./install.sh --theme all
cd ..
rm -rf Orchis-theme

git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd Tela-icon-theme
./install.sh -a
cd ..
rm -rf Tela-icon-theme


yay -S --noconfirm bibata-cursor-theme

# Browser

yay -S --noconfirm chromium brave-bin
