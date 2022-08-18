# Tucana Linux, A LFS based distro

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

