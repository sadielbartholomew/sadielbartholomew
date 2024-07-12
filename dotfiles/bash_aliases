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
alias hs='ghci'  # haskell via Glasgow Haskell Compiler interpreter
alias hsc='ghc -o'  # compile haskell
alias c='clear'
alias x='exit'
alias org='cd ${ORG_DIR}'

# Colour whenever colouring is available
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && \
        eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=always'
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
    # (diff colouring dealt with below)
fi

# Always give a unified diff (with colour as above)
alias diff='diff -u --color=always'

# Dir navigation: up
alias cdu='cd ..'
alias cduu='cd ..; cd ..'
alias cduuu='cd ..; cd ..; cd ..'
alias cduuuu='cd ..; cd ..; cd ..; cd ..'

# Tweaked utilities
alias greph='history | grep'

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


# ---------------------------------------------------------------------------
# git-specific sub-aliases
#
# NOTE git sub-aliases (i.e. git X = git Y) are set up separately in
# .gitconfig file, so only define root alises (i.e. git X = Z).
# ---------------------------------------------------------------------------
alias glog='git glog'
alias ghist='history | cut -c 8- | grep git | sort | uniq -c | sort -n -r | head -n 15'

# Clone a pre-forked external project repo locally and set up remotes
# -> takes two arguments: the GH repo organisation and then the repo name,
# where there must not be an existing clone or dir of the same name in $PWD.
git_setup_clone() {
    git clone "https://github.com/sadielbartholomew/${2}.git";
    cd ${2} && git remote add upstream "https://github.com/${1}/${2}.git";
    echo -e "\nClone created with origin and upstream remotes:"
    git remote -v;
    cd
}

# Update local master to state of upstream and then push to update origin too
git_sync_masters() {
    git checkout master;
    git fetch upstream && git merge upstream/master &&
    git push origin HEAD && echo -e "\nDone: master branches synced."
}

# Create a new branch and change onto it
git_branchout() {
    git branch $1;
    git checkout $1;
    # git's branch-switch message is sufficient to imply success of function...
    git branch  # remind of all branches as well
}
