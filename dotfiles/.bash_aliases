# .sh or shebang not appropriate for bash init files, so set shell-script mode

# ---------------------------------------------------------------------------
# Aliases and custom functions for the .bashrc
# ---------------------------------------------------------------------------
ORG_DIR=~/org/
TOKENS_FILE=~/tokens.sadie

# TODO: add aliases from laptop

# Core 1-3 letters
alias e='emacs'
alias g='git'
alias py='python'
alias ipy='ipython'
alias jl='julia'
alias c='clear'
alias x='exit'
alias org='cd ${ORG_DIR}'

# Colour whenever colouring is available
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && \
        eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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

# So I don't have to remember any of those pesky tar command options, though
# echo them too so I don't forget what they should be...
untar() {
    tar -xvf $1 && rm -r $1;
    echo "Successfully ran 'tar --extract --verbose --file ${1}' and" \
    "cleaned up."
}
untargz() {
    tar -zxvf $1 && rm -r $1 && echo \
    "Successfully ran 'tar --gzip --extract --verbose --file ${1}' and" \
    "cleaned up."
}

# Getting a security token from a local file when the cache has expired.
# Designed so first arg is the line of tokens file to grab the token at, else
# the token on the first line is returned by default.
grabtoken() {
    sed -n "${1:-1}"p "${TOKENS_FILE}"
}
