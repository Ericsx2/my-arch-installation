# On Live CD

Enable parallel downloads

```sh
nano /etc/pacman.conf

#ParallelDownloads = 5
ParallelDownloads = 10
```

Set partitions

```sh
cfdisk

# 500M for efi
# 2g for Swap
# min 50G for root
# rest for home
```

Format partitions

```sh
mkfs.fat -F32 /dev/efi_partition
mkfs.ext4 /dev/root_partition
mkfs.ext4 /dev/home_partition
mkswap /dev/swap_partition
```

Enable Swap

```sh
swapon /dev/swap_partition
```

Mount file system

```sh
mount /dev/root_partition /mnt
mount --mkdir /dev/efi_partition /mnt/boot
mount --mkdir /dev/home_partition /mnt/home
```

Install the base packages

```sh
pacstrap -K /mnt base linux linux-firmware nano sudo
```

Generate fstab file

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

Enter in final system

```sh
arch-chroot /mnt
```

Set local time

```sh
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc
```

Set language

```sh
nano /etc/locale.gen

# en_US.UTF-8 UTF-8
en_US.UTF-8 UTF-8

locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
```

Define Hostname

```sh
echo eric-pc > /etc/hostname
```

Edit hosts file

```sh
nano /etc/hosts

127.0.0.1		localhost
::1			    localhost
127.0.0.1		archlinux

```

Recreate initramfs

```sh
mkinitcpio -P
```

Set root password

```sh
passwd
```

Add a user

```sh
useradd -mG wheel eric
```

Set user as sudo

```sh
EDITOR=nano visudo

# %wheel ALL=(ALL) ALL
%whell ALL=(ALL) ALL
```

Set user password

```sh
passwd eric
```

Install network essentials

```sh
pacman -S dosfstools os-prober mtools network-manager-applet networkmanager wpa_supplicant wireless_tools dialog iwd
```

Enable network manager service

```sh
systemctl enable NetworkManager
```

Install pipeware
```sh
pacman S pipewire pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire libpulse wireplumber
```

Enable pipeware-pulse service

```sh
systemctl enable pipeware-pulse
```

Install Limine Bootloader

```sh
pacman -S limine
```

Execute Limine
```sh
limine-install
```

Set arch entry

```sh
nano /boot/limini.conf

TIMEOUT=5
GRAPHICS=yes

:Arch Linux
    COMMENT=Inicia o Arch Linux
    PROTOCOL=linux
    KERNEL_PATH=boot:///vmlinuz-linux
    MODULE_PATH=boot:///initramfs-linux.img
    CMDLINE=root=UUID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX rw
```
> **Note** CMDLINE=root=UUID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX rw (lsblk -f to see uuid of patitions)

Exit chroot

```sh
exit
```

Unmount all points

```sh
umount -R /mnt
```

Reboot

```sh
reboot
```

# On installed os

Login as user
Get sudo permission

```sh
su -
```

Install video packages

```sh
sudo pacman -S xorg-server xorg-xinit xorg-apps mesa xf86-video-amdgpu

# if use virtual machines
# sudo pacman -S virtualbox-guest-utils
```

Install Clean Gnome

```sh
sudo pacman -S gnome gnome-terminal gdm
systemctl enable gdm
```

Install hyprland
```sh
sudo pacman -S sddm wayland xorg-xwayland qt5-wayland qt6-wayland xdg-desktop-portal-hyprland hyprland alacritty dolphin wofi waybar
systemctl enable sddm
```

Reboot system

```sh
reboot
```
