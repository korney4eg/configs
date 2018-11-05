# get OS name
if [ "$(uname)" = "Darwin" ]
then
  OS="OSX"
else
  OS=$(awk '/^ID=/' /etc/*-release | sed 's/^.*ID=//' | tr '[:upper:]' '[:lower:]')
fi

SUDO_CMD="sudo"

if [ "$OS" = "OSX" ]
then
  # No need root permissions to install packages with sudo
  SUDO_CMD=""
  PACKMAN="brew"
elif [ "$OS" = "debian" ] || [ "$OS" = "ubuntu" ]
then
	PACKMAN='aptitude'
else
	PACKMAN='yum'
fi

alias deploy_vervedea='berks vendor cookbooks && knife zero converge "name:vervedea" --ssh-user root --override-runlist vervedea,locale,vervedea::ssl_cert,vervedea::site-crawler,vervedea::makvaz'
#=========================  A L I A S E S ============================

# aptitude aliases
alias update="$SUDO_CMD $PACKMAN update"
alias install="$SUDO_CMD $PACKMAN install"
alias upgrade="$SUDO_CMD $PACKMAN upgrade"
alias remove="$SUDO_CMD $PACKMAN remove"
alias clean="$SUDO_CMD $PACKMAN clean"
alias search="$SUDO_CMD $PACKMAN search"

#alias to enable user mount partitions (please check /etc/sudoers)
alias mounts="sudo mount -o umask=000 "
alias umounts="sudo umount"

# reload bash aliases
alias reload="source ~/.bashrc"

#useful network aliases
alias ifup='sudo ifup '
alias ifdown='sudo ifdown '
alias i="ifdown wlan0;ifup wlan0"

alias duh="du --max-depth=1 -k | sort -nr | cut -f2 | xargs -d '\n' du -sh"
alias df='df -h'

# free RAM
alias free="free -m"

#git aliases
alias gs='git status '
alias gu='git pull upstream '
alias gp='git push '
alias ga='git add '
alias gr='git rm '
alias gc='git commit '
alias gb='git branch '
alias gd='git diff '
alias gco='git checkout '

#ls aliases
alias ls='ls --color=always'
alias ll='ls -lFG'
alias la='ls -A'
alias l='ls -CF'

#alias grep='grep —color=always' 
alias reboot='sudo shutdown -r now '
alias halt='sudo shutdown -h now'
alias hibernate='sudo pm-hibernate'
alias suspend='sudo pm-suspend'

#other aliases
alias rm='rm -i'

alias mounthdd='sudo /usr/local/bin/ntfs-3g /dev/disk2s1 /Volumes/NTFS -olocal -oallow_other'
alias umounthdd='sudo umount /Volumes/NTFS'

# Run tmux in 256 colors mode
alias tmux='tmux -2'
#-------------------------------------------------------------
