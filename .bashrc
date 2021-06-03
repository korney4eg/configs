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
complete -C '/usr/local/bin/aws_completer' aws

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /Users/aliaksei.karneyeu/projects/z/z.sh ] && . /Users/aliaksei.karneyeu/projects/z/z.sh
shopt -s histappend
PROMPT_COMMAND="history -a;history -c;history -r;$PROMPT_COMMAND"
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
ssh-add ~/.ssh/my_rsa


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/mysql@5.5/bin:$PATH"
source <(kubectl completion bash)
