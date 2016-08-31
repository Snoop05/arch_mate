#!/bin/bash

pkglist=( mate-common mate-backgrounds mate-desktop mate-icon-theme mate-icon-theme-faenza mate-menus mate-notification-daemon mate-polkit mate-system-monitor mate-user-guide libmatekbd libmatemixer libmateweather caja eom marco mate-media mate-panel mate-settings-daemon mate-terminal mate-themes mozo pluma atril caja-extensions-common engrampa mate-applets mate-control-center mate-power-manager mate-session-manager mate-utils python-caja mate-screensaver mate-user-share ) 

cd ~/arch_mate
git pull

for package in "${pkglist[@]}"
do
	cd $package
		makepkg -cCfs --noconfirm
		mv *.pkg.tar.xz ~/custom/
		cd ~/custom
		repo-add custom.db.tar.gz *.pkg.tar.xz 
		cd ~/arch_mate
		sudo pacman -Sy
done
