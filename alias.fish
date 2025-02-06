# get OS name
if [ "$(uname)" = "Darwin" ]
	set OS "OSX"
else
  set OS $(awk '/^ID=/' /etc/*-release | sed 's/^.*ID=//' | tr '[:upper:]' '[:lower:]')
end

set SUDO_CMD "sudo"

alias deploy_vervedea='ansible-playbook provision.yaml -e variables.yaml -i hosts.yaml'
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
function rmi --wraps rm --description 'alias rmi=rm -i'
    rm -i $argv
end
# function g
#   if [[ $# > 0 ]]; then
#     git $@
#   else
#     git status
#   fi
# end

function g --wraps git
    git $argv
end
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
# set EXA_COLORS "ur=11:uw=11:ux:11:lc=11:sn=11:uu=11:gu=11:di=34"
# export EXA_COLORS
alias ls='/bin/ls --color=auto'
alias ll='/bin/ls -l --color=auto'
# alias cat='bat'

#other aliases
alias rm='rm -i'

alias mounthdd='sudo /usr/local/bin/ntfs-3g /dev/disk2s1 /Volumes/NTFS -olocal -oallow_other'
alias umounthdd='sudo umount /Volumes/NTFS'

# Run tmux in 256 colors mode
alias tmux='tmux -2'

# VimR alias
alias vimr='vimr --nvim '
#-------------------------------------------------------------
# K8s
alias kdp="grc kubectl describe pod "
# complete  -c kubectl k
function k --wraps kubectl
    grc kubectl $argv
end
alias kx=kubectx



alias deploy_jekyll="docker run --name newblog -d --rm --volume=\"$HOME/projects/korney4eg.github.io:/srv/jekyll\" -p 4000:4000 -it jekyll/jekyll:4 jekyll serve --watch --drafts"
