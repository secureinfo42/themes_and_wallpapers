#!/bin/sh

PATH=/opt/homebrew/opt/grep/libexec/gnubin:/bin:/usr/bin:/usr/local/bin:/opt/homebrew/bin:/opt/local/bin:/Users/operator/.iterm2

function f_title_binary() {
	c=1
	l=27
	r=("⡏" "⡗" "⡧" "⣇" "⣸" "⢼" "⢺" "⢹" "⡟" "⡯" "⡷" "⣗" "⣧" "⣼" "⣺" "⢾" "⢽" "⢻" "⡿" "⣷" "⣯" "⣟" "⢿" "⣻" "⣽" "⣾" "⢿" "⣿")
	figlet -f binary "$1"|head -c 64|tr "\n" " "|tr " " "2"|grep -Po '[012]'|while read i ; do
		if [ "$i" == "2" ] ; then
			s=$s" "
		else
			s=$s$i
		fi
		c=$(( (c+1) % $l ))
		printf "\r[%s] %s" "${r[$c]}"  "$s"
		sleep .03
	done
}

function f_title() {
	clear
	echo
	figlet -f "$1" "$2"|sed -r 's/(^.)/  \1/g'
	echo "——————————————————————————————————————————————————————————————————————"
}

S=2

OS="ARCH LINUX"
f_title future "$OS"
imgcat *Arch.png
f_title_binary "$OS"

OS="KALI LINUX"
f_title graffiti "$OS"
imgcat *Kali.png
f_title_binary "$OS"

OS="WINDOWS 11"
f_title mono9 "$OS"
imgcat *Win*.png
f_title_binary "$OS"

clear
OS="UBUNTU"
f_title cricket "$OS"
imgcat *Ubuntu.png
f_title_binary "$OS"

clear
OS="MACOS"
f_title mono9 "$OS"
imgcat *Darwin.png
f_title_binary "$OS"


