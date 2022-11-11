# Tucana Linux, A LFS based distro

# New package model after 2.0
Although the releases have only been every 3-4 months, I have been keeping my personal repo up to date with the newest packages.  From the release of Tucana 2.0 onwards, update tars will be released, these will be a set of packages that I have updated throughout the week, most will be untested and I cannot guarantee the same quality as a full release.  The repos will also have to be resigned maually (script included).  These tars could have updates, or even new packages.  A full release with all of these tars, plus a level of guarantee that the system will install properly and work.  These releases will NOT include isos, most should install with the same iso.


## Whats different?
This is based on Linux from scratch, yes that linux from scratch. Following that is a by the book yet minimal BLFS install, with any desktop or GUI you can wish for.  The /usr/share/doc folder is basically empty (like it is with a lot of my other projects) and it uses less than 2GB of space! (With xfce) and it obeys to standards

## Install????
Check the wiki on the top bar

# Package Manager
This distro uses the Mercury Package manager it is entirely coded in bash and basically just untars files for simplicity.  Making packages is as easy as DESTDIR installing into a folder and taring it (you can add a depends file).  

Mercury can be used on any system for any project involving packages with depends.  It is a lot easier to make packages and is fast but minimal.  If you just need a package manager for LFS, feel free to use it!
# The Package Mentality
This is a semi-stable partially rolling distro. What I mean by that is there will be a tar released every week to update the stable repo, these tars will contain the newest packages avaliable (Built with Tucana-Build-Scripts) and would essentially make Tucana rolling-release, although these are not guaranteed to function properly.  For those who do not want that, the Stable repo will always be avaliable, and updating from stable-stable and latest-beta-stable is guaranteed to function after Tucana 2.0. For updating, check the issues and the wiki to make sure that there aren't any special commands/scripts that need to be run before the update

# Requesting Packages
File an issue requesting the package, I will get to it as soon as possible, if its a simple package, I will probably have binary avaliable the same day, if its more complex with many depends, it could take a little bit

# Why no updates?
With school starting soon, I might not be able to update Tucana as often, I will do my best and version 1.1 is basically finished at this point.  Once school starts I will be focusing my efforts towards Tucana-Build-Scripts (unreleased) which is a project to script the build of a Tucana system.  Without this updating will become a lot harder, especially since to support steam (lib32) and glibc 2.36 & binutils 2.39 will require a complete rebuild. 


_________________________________________________________________________________________________________________________________________________________




