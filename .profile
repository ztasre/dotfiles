
#export GREP_COLOR="1;32"

alias ls='ls --color=auto'
alias ll='ls -lah'
alias emacs='emacs -nw'
alias spmacs='emacs'
alias grep='grep --color=auto'
alias df='df -H'
alias tmux='tmux -2'
alias agenda="gcalcli agenda"
alias info="info --vi-keys"
alias ev="easyeuler verify"
alias ec="easyeuler create"
alias config='git --git-dir=/home/andrei/src/dotfiles/ --work-tree=$HOME'

# minicube alias kvm vm drivers
#alias kubeup='minikube start --vm-driver=kvm'
umask u=rwx,g=rx,o=

# kubectl bash completions
#source <(kubectl completion bash)
#alias wifi-menu='wifi-menu;source <(minikube completion bash)'

#virtualenvwrapper setup
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
#export WORKON_HOME=~/.virtualenvs
#source /usr/bin/virtualenvwrapper.sh

# colored output for less
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'

#add a bin directory to ~ , and use below
#PATH=$PATH:$HOME/bin
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:.


PATH=$PATH:/home/andrei/src/js/learning/.node_modules/bin
PATH=/home/andrei/bin:$PATH
PATH=/home/andrei/bin/scripts:$PATH
PATH=$PATH:/home/andrei/.gem/ruby/2.4.0/bin

#setup for go
export GOPATH=~/.go
export PATH=~/.npm/bin:$PATH

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1=" \u@\h\`parse_git_branch\`-> "

# lightline for vim 
export TERM=xterm-256color

task
