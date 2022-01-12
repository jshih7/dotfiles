# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Make vim the default editor
#export VISUAL=vim
#export EDITOR="$VISUAL"

# User specific aliases and functions
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Unalias everything so we don't have zombie alias
unalias -a

# Common Aliases
alias ll='ls -l'
alias la='ls -la'

# tmux aliases
# in order to alias commands withs parameters, make a function
#alias tmux='~alejandro/local/bin/tmux -L jshih-tmux'
alias tmuxl="tmux ls"
tmuxn() {
    tmux new -s $1
}
tmuxa() {
    tmux a -t $1
}
tmuxk() {
    tmux kill-session -t $1
}
# split 4 panes 
tmuxs() {
    bash ~/my-scripts/workspace/tmux-setup.sh
}

# cannot do "watch jobs", so I made an alias
watchjobs() {
    while true; do
        clear
        echo "CURRENT BACKGROUND JOBS:"
        jobs
        sleep 2
    done
}
