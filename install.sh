#!/bin/bash
PKG_MGR_CMD="sudo pacman -S "

function install_bspwm() {
	echo "* Installing bspwm"
	yaourt -S bspwm 
}

function configure_bspwm() {
	echo "* Installing bspwm"
	mkdir -p $HOME/.config/bspwm
	cp wm/bspwm/bspwmrc $HOME/.config/bspwm/
	mkdir -p $HOME/.config/sxhkd/
	cp wm/bspwm/sxhkdrc $HOME/.config/sxhkd/
	chmod +x $HOME/.config/sxhkd/sxhkdrc
}

function configure_xorg() {
	echo "* Configuring Xorg"
	cp xorg/xinitrc $HOME/.xinitrc
	cp xorg/Xdefaults $HOME/.Xdefaults
}
function configure_vim() {
	echo "* Configuring vimrc"
	cp vim/vimrc $HOME/.vimrc
	echo "* Configuring vim color molokai"
	mkdir -p $HOME/.vim/colors/
	cp vim/molokai/colors/molokai.vim $HOME/.vim/colors/ 
}

function configure_bash() {
	echo "* Configuring bashrc"
	cp bash/bashrc $HOME/.bashrc
}


for thing in $@; do
	case "$thing" in
		"vim") configure_vim
		;;
		"bash") configure_bash
		;;
		*) configure_xorg
		install_bspwm
		configure_bspwm
		configure_vim
		;;
	esac

done
