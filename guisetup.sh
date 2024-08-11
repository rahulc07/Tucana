#!/bin/bash
echo "1) GNOME 46"
echo "2) Plasma 6.1.4"
echo "3) XFCE 4"
echo "4) Cinnamon"
echo "5) IceWM"
echo "6) twm, with xterm and xclock"
read -r -p "Pick a GUI, [1-6] " de
case $de in
   '3')
 sudo chroot /mnt /bin/bash -c "sudo mercury-sync"
 sudo chroot /mnt /bin/bash -c "mercury-install xorg lightdm xfce4 xfce4-terminal xfce4-whiskermenu-plugin gvfs gedit file-roller"
 sudo chroot /mnt /bin/bash -c "systemctl enable lightdm"
  ;;
   '2')
  sudo chroot /mnt /bin/bash -c "sudo mercury-sync"
  sudo chroot /mnt /bin/bash -c "mercury-install sddm plasma-desktop-full"
  sudo chroot /mnt /bin/bash -c "systemctl enable sddm"
   ;;
   '1')
  sudo chroot /mnt /bin/bash -c "sudo mercury-sync"
  sudo chroot /mnt /bin/bash -c "mercury-install gnome gdm gedit gvfs xorg flatpak"
  sudo chroot /mnt /bin/bash -c "systemctl enable gdm"
   ;;
   '4')
  echo "Installing with gnome-terminal"
  sleep 1
  sudo chroot /mnt /bin/bash -c "sudo mercury-sync"
  sudo chroot /mnt /bin/bash -c "sudo mercury-install lightdm cinnamon gnome-terminal gnome-backgrounds"
  sudo chroot /mnt /bin/bash -c "sudo systemctl enable lightdm"
   ;;
   '5')
  echo "Installing with xterm and lightdm"
  sleep 1 
  sudo chroot /mnt /bin/bash -c "sudo mercury-install lightdm icewm xterm xorg"
  sudo chroot /mnt /bin/bash -c "sudo systemctl enable lightdm"
   ;;
   '6')
  echo "Installing with xterm and xclock, use startx to start"
  sleep 2
  sudo chroot /mnt /bin/bash -c "sudo mercury-install twm xterm xorg"
   ;;
esac 
echo "1) Firefox"
echo "2) Chromium (Flatpak)"
echo "3) Brave (Flatpak)"
read -r -p "Pick a Browser, type n for none n/[1-3] " browser
case $browser in
    '1')
  sudo chroot /mnt /bin/bash -c "sudo mercury-sync"
  sudo chroot /mnt /bin/bash -c "sudo mercury-install firefox"
   ;;
    '2') 
  echo "Warning Flatpak Support is sometimes broken"
  sleep 2 
  sudo chroot /mnt /bin/bash -c "sudo mercury-sync"
  sudo chroot /mnt /bin/bash -c "sudo mercury-install flatpak"
  sudo chroot /mnt /bin/bash -c "flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"
  echo "If the above command errored out, CTRL+C NOW! to exit, look on the Github wiki for info on how to fix it, the inital DE setup should've finished"
  sudo chroot /mnt /bin/bash -c "flatpak install flathub org.chromium.Chromium"
   ;;
   '3')
  echo "Warning Flatpak Support is sometimes broken"
  sleep 2 
  sudo chroot /mnt /bin/bash -c "sudo mercury-sync"
  sudo chroot /mnt /bin/bash -c "sudo mercury-install flatpak"
  sudo chroot /mnt /bin/bash -c "flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"
  echo "If the above command errored out, CTRL+C NOW! to exit, look on the Github wiki for info on how to fix it, the inital DE setup should've finished"
  sudo chroot /mnt /bin/bash -c "flatpak install flathub com.brave.Browser"
   ;;
   
   *)
   :
  ;;
esac
echo "All Done with GUI setup, you can theme or install more apps later"
# Not yet
#echo "Once you are finsihed with customization, configs, and user setup, export your config using tucana-export-config or even build your own iso with tucana-build-iso"
#echo "Configs can be machine specific so automated setup can be achieved, or universal (Partition setup and bootloader setup required)"
#echo "Reboot whenever you feel like it!"
   
  
  

