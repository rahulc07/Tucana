#!/bin/bash
echo "DEPRECATED"
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
mount --rbind /dev /mnt/dev
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
# Setup the systemd first boot procedure and files
sudo chroot /mnt /bin/bash -c "systemd-machine-id-setup && systemctl preset-all" 
echo "nameserver 1.1.1.1" > /mnt/etc/resolv.conf
sudo chroot /mnt /bin/bash -c "sudo make-ca -g --force"
sudo chroot /mnt /bin/bash -c "sudo pwconv"
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
read -r -p "Hostname: " hostname
echo "$hostname" > /mnt/etc/hostname
cat > /mnt/etc/hosts << "EOF"
# Begin /etc/hosts (network card version)

127.0.0.1 localhost.localdomain $hostname
::1 localhost

# End /etc/hosts (network card version)
EOF


sudo sed -i "s/HOSTNAME/$hostname/" /mnt/etc/hosts
echo "Creating Locales"
sudo chroot /mnt /bin/bash -c "mkdir -pv /usr/lib/locale
localedef -i POSIX -f UTF-8 C.UTF-8 2> /dev/null || true
localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
localedef -i de_DE -f ISO-8859-1 de_DE
localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
localedef -i de_DE -f UTF-8 de_DE.UTF-8
localedef -i el_GR -f ISO-8859-7 el_GR
localedef -i en_GB -f ISO-8859-1 en_GB
localedef -i en_GB -f UTF-8 en_GB.UTF-8
localedef -i en_HK -f ISO-8859-1 en_HK
localedef -i en_PH -f ISO-8859-1 en_PH
localedef -i en_US -f ISO-8859-1 en_US
localedef -i en_US -f UTF-8 en_US.UTF-8
localedef -i es_ES -f ISO-8859-15 es_ES@euro
localedef -i es_MX -f ISO-8859-1 es_MX
localedef -i fa_IR -f UTF-8 fa_IR
localedef -i fr_FR -f ISO-8859-1 fr_FR
localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
localedef -i is_IS -f ISO-8859-1 is_IS
localedef -i is_IS -f UTF-8 is_IS.UTF-8
localedef -i it_IT -f ISO-8859-1 it_IT
localedef -i it_IT -f ISO-8859-15 it_IT@euro
localedef -i it_IT -f UTF-8 it_IT.UTF-8
localedef -i ja_JP -f EUC-JP ja_JP
localedef -i ja_JP -f SHIFT_JIS ja_JP.SJIS 2> /dev/null || true
localedef -i ja_JP -f UTF-8 ja_JP.UTF-8
localedef -i nl_NL@euro -f ISO-8859-15 nl_NL@euro
localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R
localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
localedef -i se_NO -f UTF-8 se_NO.UTF-8
localedef -i ta_IN -f UTF-8 ta_IN.UTF-8
localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
localedef -i zh_CN -f GB18030 zh_CN.GB18030
localedef -i zh_HK -f BIG5-HKSCS zh_HK.BIG5-HKSCS
localedef -i zh_TW -f UTF-8 zh_TW.UTF-8"
# Removing base and adding base-update to the installed package list (prevents catastrophic overriding of the /etc/shadow /etc/passwd and other essential files
sed -i '1s/base/base-update/' /mnt/etc/installed_package
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




