#
# ~/.bashrc
#

export EDITOR=nvim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$HOME/bin:$PATH"

copy_last_cmd_output() {
  # Get the last real command from in-memory history
  local last_cmd=$(history 1 | sed 's/^[ ]*[0-9]\+[ ]*//')

  # Capture output
  local tmpfile=$(mktemp)
  eval "$last_cmd" > "$tmpfile" 2>&1

  # Copy to clipboard
  wl-copy < "$tmpfile"
  rm -f "$tmpfile"
}

bind -x '"\C-y": copy_last_cmd_output'











export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

fastfetch
