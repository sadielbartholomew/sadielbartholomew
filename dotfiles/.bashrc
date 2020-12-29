# ---------------------------------------------------------------------------
# General shell config
# ---------------------------------------------------------------------------

export VISUAL=emacs
export EDITOR=emacs

# Set emacs key-bindings for the command line
set -o emacs

# Check window size after each command and, if necessary, update
# values of LINES and COLUMNS.
shopt -s checkwinsize

# ---------------------------------------------------------------------------
# Customised prompt
# ---------------------------------------------------------------------------

# Construction of the PS1 prompt by parts:

# 0) Formatting components for construction of the PS1
#    Separator
sep="\[\e[m\]"
#    Colours
red="\[\e[31;40m\]"
blue="\[\e[35;40m\]"
white="\[\e[37;40m\]"

# 1) Exit status indicator
pass_int="92"  # green
pass_par=")"   # results in smile
fail_int="91"  # red
fail_par="("   # results in frown
int='$(if [[ $? == 0 ]]; then echo ${pass_int}; else echo ${fail_int}; fi)'
par='$(if [[ $? == 0 ]]; then echo ${pass_par}; else echo ${fail_par}; fi)'
exit_code_indicator="\[\e[01;${int}m\]:${par}"

# 2) Time
# Note: \t is time command was run in '24-hour HH:MM:SS format' (preferred)
time_indicator="${white}[${sep}${white}${sep}${red}\t${sep}${white}${white}]"

# 3) Current directory name (without path)
current_dir='$(basename $PWD)'  # need this eval'd first else first persists
dirname_indicator="${sep}${blue}${current_dir}${sep}"

# Putting it all together
PS1="${exit_code_indicator}${time_indicator}${dirname_indicator}${red}>${sep}"

# ---------------------------------------------------------------------------
# Define aliases and functions as custom commands
# ---------------------------------------------------------------------------

# ... they are defined in a dedicated file, so export it to access them
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# ---------------------------------------------------------------------------
# CLI command history
# ---------------------------------------------------------------------------

# Append to, rather than overwriting, history
shopt -s histappend

HISTCONTROL=ignorespace  # don't ignore duplicates though
# Save a much larger amount of history for use and analysis, giving a warning
# when it is getting quite large with a message advising to save and clear it.
# TODO: log rotate the history for continuous analysis.
export HISTSIZE=10000
export HISTFILESIZE=50000

# ---------------------------------------------------------------------------
# Conda
# ---------------------------------------------------------------------------

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sadie/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sadie/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sadie/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sadie/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Environment to activate by default in shell (can deactivate case-by-case)
conda activate cf-env

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------

# Julia
export PATH="$PATH:$HOME/julia-1.5.2/bin"

# ---------------------------------------------------------------------------
# Output formatting (cat, pager, etc.)
# ---------------------------------------------------------------------------

# A bat is better than a cat: use bat to colour cat, pager and man outputs
export BAT_THEME="1337"
alias cat='bat --paging=never'

export PAGER=less
alias less='bat'  # uses ${PAGER} but colours it, so get a coloured 'less'

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# ----------------------------------------------------------------------
# Project-specific: ES-DOC shell initialisation
# ----------------------------------------------------------------------
# Set the deployment mode.
### export OPAL_MODE=test
# Activate devops shell.
### source $HOME/devops/opal/activate
