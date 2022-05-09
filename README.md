# Tucana Linux a Linux Distro made for PROS and Beginners 

## Whats different?
This is based on Linux from scratch 11.1, yes that linux from scratch. Following that is a by the book yet minimal BLFS install, with any desktop or GUI you can wish for.  The /usr/share/doc folder is basically empty (like it is with a lot of my other projects) and it uses less than 2GB of space! (With a xfce) and it obeys to standards

# Package Manager
This distro uses the Mercury Package manager (WIP not released yet) it is entirely coded in bash and basically just untars files for simplicity.  Making packages is as easy as DESTDIR installing into a folder and taring it (you can add a depends file).  

# The Package Mentality
This is a STABLE distro, it will update every 6 months 1 month before ubuntu (along with new LFS stable releases).  But some packages will NOT be locked.  Mainly Firefox, Chromium, The Kernel (LTS is avalible) and Mesa.  

# MAJOR WIP
I will release whatever I have right now including my build script for the packages.  At the end I hope for a console and GUI based livecd that can be used to install it.  Right now, the LFS.tar.xz contains the full system, chroot in and install grub (efi is supported) and whatever packages you want just untar them in / (yes I know its dangerous but it works, if you want a safe option untar them somewhere else and do a cp -rp to /)  there is a depend file with most of the majpr depends

