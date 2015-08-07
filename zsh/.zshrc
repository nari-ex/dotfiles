export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# general
#umask 002
export LANG=ja_JP.UTF-8
#export EDITOR=vim
export KCODE=u
setopt auto_pushd
setopt correct
setopt magic_equal_subst
setopt prompt_subst
setopt notify
setopt equals
#autoload -U compinit; compinit
setopt auto_list
setopt auto_menu 
setopt auto_cd
setopt list_packed
setopt list_types
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt MULTIOS

# glob
setopt extended_glob
unsetopt caseglob

# history
zle -la history-incremental-pattern-search-backward && bindkey "^r" history-incremental-pattern-search-backward
zle -la history-incremental-pattern-search-forward  && bindkey "^s" history-incremental-pattern-search-forward
autoload history-search-end
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks  
setopt hist_save_no_dups
setopt hist_no_store
setopt EXTENDED_HISTORY
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
function history-all { history -E 1 }


# visual
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
autoload -U colors; colors
#setopt ALWAYS_LAST_PROMPT
#setopt CDABLE_VARS
#setopt AUTO_PARAM_SLASH

## prompt
#source ~/.zshrc.sh
#ZSH_THEME_GIT_PROMPT_PREFIX=""
#ZSH_THEME_GIT_PROMPT_SUFFIX=")"
#ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
#ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
#ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{● %G%}"
#ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖ %G%}"
#ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚ %G%}"
#ZSH_THEME_GIT_PROMPT_BEHIND="%{↓ %G%}"
#ZSH_THEME_GIT_PROMPT_AHEAD="%{↑ %G%}"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{… %G%}"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔ %G%}"
#PROMPT='🍚  %b$(git_super_status) '
#GIT_PROMPT_EXECUTABLE="haskell"
#ZSH_THEME_GIT_PROMPT_CACHE="true"

# path
export COREUTILS_PATH="/usr/local/opt/coreutils/libexec/gnubin"
export MYSQL_PATH="/usr/local/mysql/bin"
export NPM_PATH="/usr/local/share/npm/bin"
export SBIN_PATH="/usr/local/sbin"
export PATH="$COREUTILS_PATH:$MYSQL_PATH:$NPM_PATH:$SBIN_PATH:$PATH"

# alias
alias tmux="tmux -2 -u"
alias top="top -ocpu -s5"
alias ql="qlmanage -p"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias sl="ls"
alias ll="ls -AlF"
alias la="ls -A"
alias l="ls -CF"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias vmstat="vm_stat"
alias g="git"
alias g-addremove='git add .; git ls-files --deleted | while read FILE; do git rm $FILE; done'
alias add-envrc='echo "export PATH=\$HOME/.bin:\$PATH" > .envrc; direnv allow'

# env
export MYSQL_PREFIX="/usr/local/mysql"
export TERM="xterm-256color"
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s"
eval $(gdircolors ~/.dir_colors -b)

# gem and rbenv
eval "$(rbenv init - zsh)"


# virtualenv
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
source /usr/local/bin/virtualenvwrapper_lazy.sh
workon py27

# tmux
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

# git
GIT_PS1_SHOWDIRTYSTATE=true

# go
if [ -x "$(which go)" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# boot2docker
eval "$(boot2docker shellinit)"

# direnv
eval "$(direnv hook zsh)"
