# Unalias everything so we don't have zombie alias
unalias -a

# Common Aliases
alias ll='ls -alh' # list all in list form, with human readable suffixes

# tmux aliases
# in order to alias commands withs parameters, make a function
alias tmuxl="tmux ls" # list sessions
tmuxn() { # new session
    tmux new -s $1
}
tmuxa() { # attach to session
    tmux a -t $2
}
tmuxk() { # kill session
    tmux kill-session -t $1
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
