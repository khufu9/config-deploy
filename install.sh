#!/bin/bash
PKG_MGR_CMD="sudo pacman -S "

function install_bspwm() {
	echo "* Installing bspwm"
	yaourt -S bspwm 
}

function configure_bspwm() {
	echo "* Installing bspwm"
	mkdir $HOME/.config/bspwm
	cp wm/bspwm/bspwmrc $HOME/.config/bspwm/
	mkdir $HOME/.config/sxhkd/
	cp wm/bspwm/sxhkd $HOME/.config/sxhkd/sxhkdrc
	chmod +x $HOME/.config/sxhkd/sxhkdrc
}

function configure_xorg() {
	echo "* Configuring Xorg"
	cp xorg/xinitrc $HOME/.xinitrc
	cp xorg/Xdefaults $HOME/.Xdefaults
}

configure_xorg
install_bspwm
configure_bspwm
