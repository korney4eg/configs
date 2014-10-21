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


# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

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
#  Customize BASH PS1 prompt to show current GIT repository and branch.
#  by Mike Stewart - http://MediaDoneRight.com

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time24h="\t"
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"


# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better

export PS1=$IWhite$Time24h$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$BBlue$PathShort$Color_Off'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$Blue$PathShort$Color_Off'\$ "; \
fi)'
#if [ -e /usr/share/terminfo/x/xterm+256color ]; then
#        export TERM='xterm+256color'
#else
#        export TERM='xterm-color'
#fi
#set this value because navigation buttons does not work with 256 colored xterm
export TERM='xterm-color'



# free memory
alias free="free -m"

# system helpers
alias update="sudo aptitude update"
alias install="sudo aptitude install"
alias upgrade="sudo aptitude upgrade"
alias remove="sudo aptitude remove"
alias clean="sudo aptitude clean"
alias search="sudo aptitude search"
alias mounts="sudo mount -o umask=000 "
alias umounts="sudo umount"
#alias ipconf="sudo ifconfig"
# reload bash aliases
alias reload="source ~/.bashrc"
alias i="ifdown wlan0;ifup wlan0"
alias duh="du --max-depth=1 -k | sort -nr | cut -f2 | xargs -d '\n' du -sh"
alias ls='ls --color=always --group-directories-first'
alias ll='ls -lFG'
alias la='ls -A'
alias l='ls -CF'
#alias grep='grep —color=always' 
alias d='cd /mnt/d'
alias smount='sudo mount -o umask=000'
# Запись iso образа на DVD
alias dvdiso='growisofs -Z /dev/cdrom='
# Запись папки на DVD
alias dvdburn='growisofs -Z /dev/cdrom -J -jcharset koi8-r -r -hide-rr-moved -multi $* '
alias ifup='sudo ifup '
alias df='df -h'
alias ifdown='sudo ifdown '
alias reboot='sudo shutdown -r now '
alias rm='rm -i'
alias halt='sudo shutdown -h now'
alias hibernate='sudo pm-hibernate'
alias suspend='sudo pm-suspend'
#Experimental
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
export PATH=$PATH:~/bin/
#xrdb ~/.Xdefaults
alias sketchup="wine ~/.wine/drive_c/Program\ Files/SketchUp/SketchUp\ 2014/SketchUp.exe &"
