# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
# Добавляем цвета

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
#PS1="\[\033[\u@\h:\w\$ "
#PS1="\[\033[\033[1;31;40m\u@\h:\w\033[0;34;40m]\033[0;32;40m $\033[0;32;0m\] "
PS1='\[\033[1;30m\]\t-\[\033[1;31m\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\]:\w $\[\033[0m\]'


# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/bin/python /usr/lib/command-not-found -- $1
                   return $?
		else
		   return 127
		fi
	}
fi
#alias wc3='cd "/mnt/d/games/Warcraft III"/" && wine w3l.exe'
#alias aptitude = 'sudo aptitude'
#alias shutdown ="sudo shutdown"
#alias reboot = 'sudo reboot'

# free memory
alias free="free -m"

# system helpers
alias update="sudo aptitude update"
alias install="sudo aptitude install"
alias upgrade="sudo aptitude update ; sudo aptitude upgrade"
alias remove="sudo aptitude remove"
alias clean="sudo aptitude clean"
alias search="sudo aptitude search"
alias mounts="sudo mount -o umask=000 "
alias umounts="sudo umount"
#alias ipconf="sudo ifconfig"
# reload bash aliases
alias reload="source ~/.bashrc"

alias duh="du --max-depth=1 -k | sort -nr | cut -f2 | xargs -d '\n' du -sh"
alias ls='ls --color=always --group-directories-first'
alias ll='ls -laFG'
alias la='ls -A'
alias l='ls -CF'
alias grp='grep —color=always' 
alias todo='yagtd -c /home/korney/todo.txt'
alias d='cd /mnt/d'
alias smount='sudo mount -o umask=000'
# Запись iso образа на DVD
alias dvdiso='growisofs -Z /dev/cdrom='
# Запись папки на DVD
alias dvdburn='growisofs -Z /dev/cdrom -J -jcharset koi8-r -r -hide-rr-moved -multi $* '
alias ifup='sudo ifup '
alias ifdown='sudo ifdown '
alias ifconfig ='sudo ifconfig'
alias reboot='sudo shutdown -r now '
alias rm='rm -i'
alias halt='sudo shutdown -h now'
#Experimental
alias 1c="rdesktop sk-srv1.dvrdns.org -u korneev -d sk -g 1280x768 -a 16 -b -z &"
alias xterm="xterm -fa Monaco -fs 14 -fg white -bg black &"
#alias place="du d/Downloads/* -sk | sort -g| awk '{print \$1/1024 \" MB\",\"\t\"\$2}'"

function space
{
	if [ "x$1" == "x" ]; then 
		put="."
	else
		put=$1
	fi
	if [ -d $put ]; then 
		put=$put/*
	fi
	du $put -s | sort -g| awk '{print $1/1024 " MB","\t"$2}'
}
function wcd
{
$HOME/bin/wcd.exec $*
. $HOME/bin/wcd.go
}
#w3m -dump_source http://www.onelinerz.net/random-one-liners/1/ | awk ' /.*<div id=\"oneliner_[0-9].*/ {while (! /\/div/ ) { gsub("\n", ""); getline; }; gsub (/<[^>][^>]*>/, "", $0); print $0}'
function weather
{
	echo -e "\033[1;32m "
	links -nolist -dump http://wap.gismeteo.ru/wap2/towns/26702.wap2 |  sed -n '6,11p;29,32p;32q'

}
#files=(/usr/share/cowsay/cows/*);cowsay -f `printf "%s\n" "${files[RANDOM % ${#files}]}"` "`fortune`"
function todos
{
	echo -e "\033[1;31mСрочно !!!"
	echo " "
	sed -e '/C:100/ d' todo.txt |sed -n -e '/\!NOW/ p'| sed  -e 's/\([^@]*\).*/\1/'  
	echo -e "\033[1;32m "
	sed -e '/C:100/ d' todo.txt |sed -n -e '/\!NOW/ !p'| sed  -e 's/\([^@]*\).*/\1/'  

	sed -e '/C:100/ d' todo.txt |sed -n -e '/\!NOW/ p'| sed  -e 's/\([^@]*\).*/\1/'   > /mnt/d/docs/todo.txt
	echo " ">> /mnt/d/docs/todo.txt
	sed -e '/C:100/ d' todo.txt |sed -n -e '/\!NOW/ !p'| sed  -e 's/\([^@]*\).*/\1/' >> /mnt/d/docs/todo.txt
	echo " "
}
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export HISTCONTROL=ignoredups
export EDITOR= vim
#xrdb ~/.Xdefaults
