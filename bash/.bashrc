umask 002

# set PATH
COREUTILS_PATH="/usr/local/opt/coreutils/libexec/gnubin"
MYSQL_PATH="/usr/local/mysql/bin"
NPM_PATH="/usr/local/share/npm/bin"
SBIN_PATH="/usr/local/sbin"
export PATH="$COREUTILS_PATH:$MYSQL_PATH:$NPM_PATH:$SBIN_PATH:$PATH"

# set command alias
alias tmux="tmux -2 -u"
alias top="top -ocpu -s5"
alias ql="qlmanage -p"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
alias ccgl="gcc $1 -framework GLUT -framework OpenGL -lm -lpthread"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias ll="ls -AlF"
alias la="ls -A"
alias l="ls -CF"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias vmstat="vm_stat"
alias g="git"
alias g-addremove='git add .; git ls-files --deleted | while read FILE; do git rm $FILE; done'

export MYSQL_PREFIX="/usr/local/mysql"
export TERM="xterm-256color"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:ignorespace


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s histappend
[ "${BASH_VERSINFO[0]}" -ge 4 ] && shopt -s autocd
[ "${BASH_VERSINFO[0]}" -ge 4 ] && shopt -s dirspell
[ "${BASH_VERSINFO[0]}" -ge 4 ] && shopt -s cdspell 
[ "${BASH_VERSINFO[0]}" -ge 4 ] && shopt -s globstar


# make less more friendly for non-text input files, see lesspipe(1)
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s"

# set color
eval `gdircolors ~/.dir_colors -b`

# gem and rbenv
source "/usr/local/Cellar/rbenv/0.4.0/libexec/../completions/rbenv.bash"
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"

# virtualenv
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
source /usr/local/bin/virtualenvwrapper_lazy.sh

rbenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
    rehash|shell)
      eval `rbenv "sh-$command" "$@"`;;
    *)
      command rbenv "$command" "$@";;
  esac
}

#function gem(){
#  gem $*
#  if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
#  then
#    rbenv rehash
#    rehash
#  fi
#}

# Attache tmux
if ( ! test $TMUX ) && ( ! expr $TERM : "^screen" > /dev/null ) && which tmux > /dev/null; then
  if ( tmux has-session > /dev/null 2>&1  ); then
    session=`tmux list-sessions | cut -d : -f 1`
    #if [ -n "$session" ]; then
    #  echo "Attache tmux session $session."
    #  tmux attach-session -t $session
    #else
    #  echo "Session has been already attached."
    #  tmux list-sessions
    #fi
  else
    echo "Create new tmux session."
    tmux
  fi
fi

source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# mkvirtualenv -p .pythonz/pythons/CPython-2.7.8/bin/python py278
workon v2.7.6

$(boot2docker shellinit)


# for go lang
if [ -x "$(which go)" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

export DOCKER_CERT_PATH=/Users/nari/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

eval "$(direnv hook bash)"
