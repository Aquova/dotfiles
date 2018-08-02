if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -f ~/.ssh_aliases ]; then
    . ~/.ssh_aliases
fi

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin/pyls:$PATH

source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
export PS1="\[\e[35m\]\u\[\e[m\]\[\e[32m\][\[\e[m\]\[\e[32m\]\T\[\e[m\]\[\e[32m\]]\[\e[m\]:\[\e[33m\]\w\[\e[m\]\[\e[36m\]\$(__git_ps1)\[\e[m\]$ "
export CLICOLOR=1
