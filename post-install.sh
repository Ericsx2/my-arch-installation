# !/bin/bash

# Upadate repositories

sudo pacman -Syy

# Essentials packages

sudo pacman -S base base-devel git curl -y

# Programming packages

sudo pacman -S python phyton-pip nodejs npm rust go -y

# Customizing shell

sudo pacman -S zsh -y

chsh -s $which(zsh)

source ~/.bash_profile
source ~/.bashrc

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

echo 'zinit light zdharma/fast-syntax-highlighting' >> ~/.zshrc
echo 'zinit light zsh-users/zsh-autosuggestions' >> ~/.zshrc
echo 'zinit light zsh-users/zsh-completions' >> ~/.zshrc
echo 'zinit ice depth=1; zinit light romkatv/powerlevel10k' >> ~/.zshrc

source ~/.zshrc

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

sudo pacman -S flatpak -y

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


yay -S bibata-cursor-theme

# Browser

yay -S chromium brave-bin

# App launcher

yay -S ulauncher
