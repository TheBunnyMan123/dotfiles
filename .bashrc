# Automatic tmux
test -z "$TMUX" && (tmux attach || tmux new-session)

# Prompt command
prompt() {
  if [[ $COLORTERM =~ ^(truecolor|24bit)$ ]]
  then
    # True color version using catppuccino macchiato
    PEACH=\\[\\033[38\;2\;245\;169\;127m\\]
    TEXT=\\[\\033[38\;2\;202\;211\;245m\\]
    SAPPHIRE=\\[\\033[38\;2\;125\;196\;228m\\]
    RED=\\[\\033[38\;2\;237\;135\;150m\\]
    BOLD=\\[\\033[1m\\]
    RESETANSI=\\[\\033[0m\\]
    PS1="$RESETANSI$PEACH$USER$RESETANSI$TEXT$BOLD@$RESETANSI$PEACH$HOSTNAME$TEXT$BOLD:$RESETANSI $SAPPHIRE$PWD\n$RED$BOLD> $RESETANSI"
  else
    # Simple custom prompt
    GREEN=\\[\\033[32m\\]
    WHITE=\\[\\033[37m\\]
    CYAN=\\[\\033[36m\\]                                                                                                                                                                                                                   
    MAGENTABOLD=\\[\\033[35\;1m\\]                                                                                                                                                                                                         
    BOLD=\\[\\033[1m\\]                                                                                                                                                                                                                    

    RESETANSI=\\[\\033[0m\\]                                                                                                                                                                                                               
    PS1="$RESETANSI$GREEN$USER$RESETANSI$BOLD@$RESETANSI$GREEN$HOSTNAME$RESETANSI$BOLD:$RESETANSI $CYAN$PWD\n$MAGENTABOLD> $RESETANSI"
  fi
}

# Set prompt command
PROMPT_COMMAND=prompt

# GNU Coreutil config
alias ls="ls -p -F --color\=auto"
alias grep="grep --color\=auto"
