# Various variables you might want for your PS1 prompt instead
Time24h="\t"
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# export PS1=$IBlack$Time24h$Color_Off'$(git branch &>/dev/null;\
# if [ $? -eq 0 ]; then \
#   echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
#   if [[ -z $(git status -s) ]]; then \
#     # @4 - Clean repository - nothing to commit
#     echo "'$BGreen'"$(__git_ps1 " (%s)"); \
#   else \
#     # @5 - Changes to working tree
#     echo "'$IRed'"$(__git_ps1 " {%s}"); \
#   fi) '$BBlue$PathShort$Color_Off'\$ "; \
# else \
#   # @2 - Prompt when not in GIT repo
#   echo " '$BBlue$PathShort$Color_Off'\$ "; \
# fi)'

# Show percentage of used disk space of the root partition
export GBT_CAR_CUSTOM_TEXT_CMD='echo $AWS_PROFILE'
# Display the car only if the percentage is above 90%
# export GBT_CAR_CUSTOM_DISPLAY_CMD="pwd| grep -q '/work/'"
export GBT_CARS='Status, Os, Hostname, Dir, Git,Custom, Sign'
export GBT_CARS='Status, Os, Hostname, Dir, Git, Sign'
export PS1='$(gbt $?)\n> '
export GBT_CAR_HOSTNAME_DISPLAY='0'
export GBT_CAR_DIR_DEPTH='2'
