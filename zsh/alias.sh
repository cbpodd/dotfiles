# Common Flags
alias la="ls -A"
alias ll="ls -lh"
alias lla="ll -A"

alias t="tree"
alias ta="t -a"
alias tl="t -lh"
alias tla="tl -a"

# Git
alias g="git"
alias ga="g add ."
alias gc="g commit -m"
alias gs="g status"
alias gpl="g pull"
alias gph="g push"
alias gb="g branch"
alias gch="g checkout"
alias gf="g fetch"
alias gr="g remote"
alias grao="gr add origin"

# Vim
alias v="vim"
alias gvim="gvim --remote-tab-silent"
alias gv="gvim"

# Common mistyping
alias sl=ls

# Overwrites of existing commands for better defaults
alias mv="mv -i"        # -i prompts before overwrite
alias mkdir="mkdir -p"  # -p makes parents dirs as needed
alias cp="cp -r"        # -r copies directories recursively
