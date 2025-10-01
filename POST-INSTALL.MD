# Core applications

### Install base packages
```sh
  pacman -S base-devel git curl
```

### Install AUR helper
```sh
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
```

### Install docker
```sh
  sudo pacman -S --needed  --noconfirm docker docker-compose
  sudo systemctl --now enable docker.service
  sudo systemctl enable containerd.service
```

### Docker configuration
```sh
  sudo groupadd docker
  sudo usermod -aG docker $USER
```

### Custom shell
```sh
  sudo pacman -S --needed  --noconfirm zsh
  sudo pacman -S --needed  --noconfirm starship

  chsh -s /bin/zsh
```

### Hyprland enhance packages (optional)
  ##### Notifications
  * mako
  ##### Screenshot
  * grim
  * slurp
  * swappy
  ##### brightness and audio controls
  * brightnessctl
  * pavucontorl
  * pamixer
  ##### Wallpaper
  * swww
  * hyprpaper
  ##### Clipboard
  * wl-clipboard
  * cliphist
  ##### ScreenLock
  * swaylock
  * waylock

### Miscellaneous packages (optional)
```sh
  ## Shell Commands Documentation
  sudo pacman -S --needed  --noconfirm tldr
  ## Neovim
  sudo pacman -S --needed  --noconfirm neovim
  ## Media
  sudo pacman -S --needed  --noconfirm vlc
  ## Discord
  sudo pacman -S --needed  --noconfirm discord
  ## Telegram desktop 
  sudo pacman -S --needed  --noconfirm telegram-desktop
  ## Flatpak
  sudo pacman -S --needed  --noconfirm flatpak
```

### AUR
```sh
  ## asdf-vm
  yay -S asdf-vm
  ## Microsoft Edge
  yay -S microsoft-edge-stable-bin
  ## Visual Studio Code
  yay -S  visual-studio-code-bin
```

SDDM theme
https://github.com/Keyitdev/sddm-astronaut-theme

