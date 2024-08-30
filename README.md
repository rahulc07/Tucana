A Linux Distro Built For Customization


## Whats different?
Tucana is an ultra customizable distro built entirely from scratch. Tucana, unlike many Linux From Scratch or other from scratch distros, is binary based and has a fully fleshed out lib32 toolchain allowing for Steam and wine to run natively.  The main selling point is the ease of customization and redistribution. With Tucana you can host your own repos, have custom patched packages and in the end bundle it up into a neat ISO that is easy to distribute, or not do any of those! The Repos are super easy to host and add too (check the wiki), so you can add theming packages, personalized/patched packages or whatever your heart desires, with infinite possibilites no one can tell you what you can or cannot do! Once you finish use [tucana-iso](https://github.com/rahulc07/tucana-iso) to generate an ISO for your customizations and distribute it.

Essentially Tucana is a Build-Kit where you can share you customizations with anyone who will look at them, think of it like a mega version of your dotfiles but with the ability to customize and build you own packages if you need a kernel patch, non-free software, or if you want to build a purpose built distro like [Minecraft OS](https:/github.com/rahulc07/mcos)


## Acknowledgements

Thanks to Oregon State University's Open Source Lab for our first repository mirror @ https://ftp2.osuosl.org/pub/tucana-linux

Please check Tucana Build Scripts for more acknowledgements.
Hopefully many more are to come
# Schedule
Tucana is on a January June/July Release schedule with periodic 'point' updates throughout.  Tucana-Build-Scripts however is rolling and will always be up to date, so if you need the latest and greatest build the packages from there using Tucana-Autobuild or Tucana-Build-Scripts


## Sub Repos
Tucana is split into multiple different sub-repositories, each focusing on a different part of the Tucana experience.  This main repo (xXTeraXx/Tucana) is focused on the releases, the mercury package manager and the wiki.  Here are the others in order of importance

Tucana-Build-Scripts: https://github.com/rahulc07/Tucana-Build-Scripts  
Tucana-Autobuild (The update checker and autobuilder): https://github.com/rahulc07/Tucana-Autobuild  
Tucana-ISO Generator: https://github.com/rahulc07/tucana-iso  
Tucana's Calamares Configs (need the patch in patches): https://github.com/rahulc07/calamares-configs
Cross Compilers Build Scripts: https://github.com/rahulc07/cross-sh-tucana


## Install????
Check the wiki on the top bar

# Package Manager
This distro uses the Mercury Package manager it is entirely coded in bash and basically just untars files for simplicity.  Making packages is as easy as DESTDIR installing into a folder and taring it (you can add a depends file).  

Mercury can be used on any system for any project involving packages with depends.  It is a lot easier to make packages and is fast but minimal.  If you just need a package manager for LFS, feel free to use it!
# The Package Mentality
This is a semi-stable partially rolling distro. What this means is that there will be a tar released every 1-2 weeks to update the stable repo, these tars will contain the newest packages avaliable (Built with Tucana-Build-Scripts) and would essentially make Tucana rolling-release, although these are not guaranteed to function properly.  For those who want a more stable system, the Stable repo will always be avaliable, and updating from stable-stable and latest-beta-stable is guaranteed to function. For updating, check the issues and the wiki to make sure that there aren't any special commands/scripts that need to be run before the update.  Stable releases will come out every 3-4 months

# Requesting Packages
File an issue requesting the package, I will get to it as soon as possible, if its a simple package, I will probably have binary avaliable the same day, if its more complex with many depends, it could take a little bit


# Contributing
I am always looking for contibuters, if you want to contribute in any way (graphic design, repo-hosting, building new packages) file an issue or a PR on Tucana-Build-Scripts (https://github.com/xXTeraXx/Tucana-Build-Scripts) 
_________________________________________________________________________________________________________________________________________________________




