# ---------------------------------------------------------------------------
# Aliases and custom functions for the .bashrc
# ---------------------------------------------------------------------------
# TODO: add aliases from laptop

# Colour whenever colouring is available
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && \
        eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Core 1-3 letters
alias e='emacs'
alias g='git'
alias py='python'
alias ipy='ipython'

# Dir navigation: up
alias cdu='cd ..'
alias cduu='cd ..; cd ..'
alias cduuu='cd ..; cd ..; cd ..'

# Tweaked utilities
alias greph='history | grep'

# NOTE git sub-aliases (i.e. git X = git Y) are set up separately in
# .gitconfig file, so only define root alises (i.e. git X = Z).
alias glog='git glog'

# Change directory and then ls it
cdl() {
    cd "$@" && ls -Fa;
}

# Start-up and shut-down scripts and lock screen command
# Note: also have sup whcih is quicker to type than startmeup, but only alias
# shutmedown as full long name since that script is potentially detructive of
# processes so don't want to accidentally execute it.
alias startmeup='~/bin/startmeup'
alias sup='~/bin/startmeup'
alias shutmedown='~/bin/shutmedown'
alias lock='gnome-screensaver-command -l'