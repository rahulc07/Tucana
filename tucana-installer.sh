#!/bin/bash
echo "Welcome to the Tucana Installer"
sleep 1
sudo lsblk
read -r -p "EFI(1) or Legacy(2)? " efi
read -r -p "What drive do you want to install on, eg /dev/sda2 " drive
read -r -p "Would you like to format that drive? [Y/N] " format
case $format in
     Y | y)
     mkfs.ext4 $drive
 ;;
  *)
  "Not formatting, this could be dangerous, giving you 5 seconds to exit"
  sleep 5
 ;;
esac

if [[ $efi == 1 ]]; then
  read -r -p "What drive is the EFI Partition on?" efipart
  echo "Formatting"
  mkfs.vfat $efipart
else 
  read -r -p "What drive is the bootloader going to be on, eg /dev/sdb " bootlegacy
fi

echo "Mounting Drives"

if [[ ! -d /mnt ]]; then
  mkdir -p /mnt
fi

mount $drive /mnt

if [[ $efi == 1 ]]; then
 mkdir -p /mnt/boot/efi
 mount $efipart /mnt/boot/efi
fi

echo "Stopping before the point of no return"
read -r -p  "Would you like to continue, this WILL erase data [Y/N]" confirmation

if [[ $confirmation -ne "y" ]] || [[ $confirmation -ne "Y" ]]; then
  echo "Not continuing, it is safe to run this script again if you wish"
fi
 
echo "Getting Git Repo"
git clone https://github.com/xXTeraXx/Tucana.git
cd Tucana/mercury
read -r -p "Repo URL: " repourl
sed -i "s|REPO=.*|REPO=$repourl|" mercury-install
sed -i "s|REPO=.*|REPO=$repourl|" mercury-sync
sudo ./mercury-sync
sudo ./mercury-install base
 
echo "Generating fstab"
# Using su -c to avoid permission denied errors on some distros
su -c "genfstab -U /mnt > /mnt/etc/fstab"

echo "Bind Mounting temp filesystems"
mount --bind /dev /mnt/dev
mount --bind /proc /mnt/proc
mount --bind /sys /mnt/sys

if [[ $efi == 1 ]]; then
 mkdir -p /mnt/sys/firmware/efi/efivars
 mount --bind /sys/firmware/efi/efivars /mnt/sys/firmware/efi/efivars
fi

echo "Installing Kernel and Network Manager"
sudo chroot /mnt /bin/bash -c "passwd -d root"
sed -i "s|REPO=.*|REPO=$repourl|" /mnt/usr/bin/mercury-install
sed -i "s|REPO=.*|REPO=$repourl|" /mnt/usr/bin/mercury-sync
sed -i "s|REPO=.*|REPO=$repourl|" /mnt/usr/bin/mercury-update
sudo chroot /mnt /bin/bash -c "sudo mercury-sync && sudo mercury-install linux-tucana network-manager"
echo "Setting up the sudo user"
read -r -p "Username: " username
sudo chroot /mnt /bin/bash -c "sudo useradd -m $username && sudo gpasswd -a $username wheel"
sudo chroot /mnt /bin/bash -c "sudo passwd $username"
if [[ $efi == 1 ]]; then
  sudo chroot /mnt /bin/bash -c "grub-install --efi-directory=/boot/efi"
else
  sudo chroot /mnt /bin/bash -c "grub-install $bootlegacy --target=i386-pc"
fi
sudo chroot /mnt /bin/bash -c "sudo systemctl enable NetworkManager"
echo "All Done"

# Part 2 GUI Setup
read -r -p "Would you like to install a gui? [Y/n] " gui
case $gui in
     "" | Y | y)
     echo "Handing off to GUI Setup script"
     sudo /home/live/guisetup.sh
 ;;
  *)
 echo "Exiting"
 ;;
esac




