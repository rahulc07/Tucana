# Tucana Linux, A LFS based distro

# Next Update
Tucana 2.0 is scheduled to release on Oct 31st... with new cross-compilers a brand new toolchain(glibc 2.36 gcc 12.2.0, binutils 2.39, clang 15.0.3) with multilib support, Gnome 43, Plasma 5.26,  Firefox 106, a modularized base package, and lib32 packages (maybe wine and steam but i'm not making any promises). Mercury will also be part of the fun, with mercury-reinstall and mercury-search for searching and reinstalling packages, as well as local package install support.  Almost every package in the repo is getting an update, I will be testing upgrading from 1.1 -> 2.0 but it might require some special sauce.  Mark the date on your calender, because this is gonna be big!


## Whats different?
This is based on Linux from scratch 11.1, yes that linux from scratch. Following that is a by the book yet minimal BLFS install, with any desktop or GUI you can wish for.  The /usr/share/doc folder is basically empty (like it is with a lot of my other projects) and it uses less than 2GB of space! (With xfce) and it obeys to standards

## Install????
Check the wiki on the top bar

# Package Manager
This distro uses the Mercury Package manager it is entirely coded in bash and basically just untars files for simplicity.  Making packages is as easy as DESTDIR installing into a folder and taring it (you can add a depends file).  

Mercury can be used on any system for any project involving packages with depends.  It is a lot easier to make packages and is fast but minimal.  If you just need a package manager for LFS, feel free to use it!
# The Package Mentality
This is a Semi-Stable distro, it will update every 6 months 1 month before ubuntu (along with new LFS stable releases).  But some packages will NOT be locked.  Mainly Firefox, Chromium, The Kernel (LTS is avalible) and Mesa.  Along with some others if features are added 

# Requesting Packages
File an issue requesting the package, I will get to it as soon as possible, if its a simple package, I will probably have binary avaliable the same day, if its more complex with many depends, it could take a little bit

# Why no updates?
With school starting soon, I might not be able to update Tucana as often, I will do my best and version 1.1 is basically finished at this point.  Once school starts I will be focusing my efforts towards Tucana-Build-Scripts (unreleased) which is a project to script the build of a Tucana system.  Without this updating will become a lot harder, especially since to support steam (lib32) and glibc 2.36 & binutils 2.39 will require a complete rebuild. 


_________________________________________________________________________________________________________________________________________________________

Future/Upcoming:
Yes, It is still on hold, just a place to document Ideas

Packages: NGINX, Docker, OpenVPN(2&3),Handbrake,Blender,virt-viewer,x11vnc,chromium,openjdk(8,16-18)

Repo Update Tars instead of downloading the whole repo, probably with a simple script to update your repo for you



