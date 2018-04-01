# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Set vi mode for bash
set -o vi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
source ~/configs/colors.bash
source ~/configs/ps1.bash
source ~/configs/alias.bash
source ~/configs/git-prompt.sh
source ~/configs/functions.bash
source ~/configs/env_vars.bash

source /Users/akarneyeu/.rvm/scripts/rvm

SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
	eval `$SSHAGENT $SSHAGENTARGS`
	trap "kill $SSH_AGENT_PID" 0
fi
ssh-add

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
