! /usr/bin/env bash

# Upadate repositories
sudo pacman -Syy

## Essentials packages
sudo pacman -S --needed --noconfirm base-devel git curl

## Installing yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

## Installing flatpak
sudo pacman -S --needed  --noconfirm flatpak

## Docker
sudo pacman -S --needed  --noconfirm docker docker-compose
sudo systemctl --now enable docker.service

## Shell Commands Documentation
sudo pacman -S --needed  --noconfirm tldr

## Custom shell
sudo pacman -S --needed  --noconfirm fish
sudo pacman -S --needed  --noconfirm starship
mkdir -p ~/.config 
mv ./starship.toml ~/.config/
echo 'starship init fish | source' >> ~/.config/fish/config.fish

## Neovim
sudo pacman -S --needed  --noconfirm neovim

## Media
sudo pacman -S --needed  --noconfirm vlc

## Discord
sudo pacman -S --needed  --noconfirm discord

## Telegram desktop 
yay -S --noconfirm telegram-desktop

## Browsers
yay -S --noconfirm chromium brave-bin

## asdf version control
git clone https://aur.archlinux.org/asdf-vm.git
cd asdf-vm
makepkg -si
cd ..
rm -rf asdf-vm
echo 'source /opt/asdf-vm/asdf.fish' >> ~/.config/fish/config.fish

## Visual studio code
yay -S --noconfirm visual-studio-code-bin

## Desktop customization
#Theme
cd ~
git clone https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme
./install.sh --theme all
cd ~
rm -rf Orchis-theme

#Icons
git clone https://github.com/vinceliuice/Fluent-icon-theme.git
cd Fluent-icon-theme
./install.sh -a
cd ~
rm -rf Fluent-icon-theme

#Cursor
git clone https://github.com/vinceliuice/Vimix-cursors.git
cd Vimix-cursors
./install.sh
cd ~
rm -rf Vimix-cursors

## Isonmnia Rest Client

flatpak install -y rest.insomnia.Insomnia

## Install Nerd Fonts
cd ~
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
cd ~
rm -rf nerd-fonts

## Change shell
chsh -s /bin/fish
