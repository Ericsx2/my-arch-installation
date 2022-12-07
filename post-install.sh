#! /usr/bin/env bash

## Upadate repositories

sudo pacman -Syy

## Essentials packages

sudo pacman -S --noconfirm base base-devel git curl

## Programming packages

sudo pacman -S --noconfirm python phyton-pip nodejs npm rust go

## Installing yay

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

## Installing snapd

git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo systemctl enable --now snapd.apparmor
cd ..
rm -rf snapd


## Installing flatpak

sudo pacman -S --noconfirm flatpak

## Theme, Icons and cursors

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

## Browsers

yay -S --noconfirm chromium brave-bin

## Docker 

sudo pacman -S --noconfirm docker docker-compose
sudo systemctl --now enable docker.service

## Shell Commands Documentation

sudo pacman -S --noconfirm tldr

## Telegram desktop 

yay -S --noconfirm telegram-desktop

## Customizing shell

sudo pacman -S --noconfirm zsh

chsh -s $(which zsh)

## zsh plugins

# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

## zinit plugins

# zinit light zdharma/fast-syntax-highlighting
# zinit light zsh-users/zsh-autosuggestions
# zinit light zsh-users/zsh-completions
# zinit ice depth=1; zinit light romkatv/powerlevel10k

## Manually install before reboot

# snap install code --classic
# snap install discord
# snap install insomnia

