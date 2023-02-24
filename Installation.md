# On Live CD

Load keys

```sh
loadkeys br-abnt2
```

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
# rest for system
```

Format partitions

```sh
mkfs.fat -F32 /dev/efi_partition
mkfs.ext4 /dev/file_system_partition
mkswap /dev/swap_partition
```

Enable Swap

```sh
swapon /dev/swap_partition
```

Mount file system

```sh
mount /dev/file_system_partition /mnt
mount --mkdir /dev/efi_partition /mnt/boot
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

Set default keymap

```sh
echo KEYMAP=br-abnt2 > /etc/vconsole.conf
```

Define Hostname

```sh
echo archlinux > /etc/hostname
```

Edit hosts file

```sh
nano /etc/hosts

127.0.0.1		localhost
::1			localhost
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
pacman -S dosfstools os-prober mtools network-manager-applet networkmanager wpa_supplicant wireless_tools dialog
```

Enable network manager service

```sh
systemctl enable NetworkManager
```

Install systemd Bootloader

```sh
bootctl --path=/boot install
```

Set arch entry

```sh
nano /boot/loader/entries/arch.conf

title	Arch Linux
linux	/vmlinux-linux
initrd	/initramfs-linux.img
options root=/dev/file_system_partition rw
```

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

Reboot system

```sh
reboot
```

Exec post-install.sh

```sh
sudo chmod +x post-install.sh
./post-install.sh
```

Reboot system

```sh
reboot
```
