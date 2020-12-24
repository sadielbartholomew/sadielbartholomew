# Customised prompt, incl. green smile or red frown indicating exit status:
PS1=' $(if [[ $? == 0 ]]; then echo "\[\e[01;92m\]:)"; else echo "\[\e[01;91m\]:("; fi) \[\e[37;40m\][\[\e[m\]\[\e[37;40m\]sades\[\e[m\]\[\e[31;40m\]@\[\e[m\]\[\e[31;40m\]\@\[\e[m\]\[\e[37;40m\]]\[\e[m\]\[\e[35;40m\]$(basename $PWD)\[\e[m\]\[\e[31;40m\]>\[\e[m\] '
