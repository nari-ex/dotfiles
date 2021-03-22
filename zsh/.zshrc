# zsh-completions
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
PROMPT=\$vcs_info_msg_0_'➜ '
zstyle ':completion:*' list-colors "${LS_COLORS}"


# general
export PATH=/usr/local/opt/openssl/bin:$PATH:$HOME/bin:/usr/local/bin
export LANG=ja_JP.UTF-8
export KCODE=u
setopt auto_pushd
setopt correct
setopt magic_equal_subst
setopt prompt_subst
setopt notify
setopt equals
setopt auto_list
setopt auto_menu
setopt auto_cd
setopt list_packed
setopt list_types
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt MULTIOS
unset SSH_AUTH_SOCK
setopt nonomatch

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
autoload -U colors; colors

# path
export COREUTILS_PATH="/usr/local/opt/coreutils/libexec/gnubin"
export MYSQL_PATH="/usr/local/opt/mysql@5.7/bin"
export NPM_PATH="/usr/local/share/npm/bin"
export SBIN_PATH="/usr/local/sbin"
export PATH="$COREUTILS_PATH:$MYSQL_PATH:$NPM_PATH:$SBIN_PATH:$PATH"
export PATH="$NPM_PATH:$SBIN_PATH:$PATH"

# alias
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
alias vim=code

# env
export MYSQL_PREFIX="/usr/local/opt/mysql@5.7"
export TERM="xterm-256color"
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s"
eval $(gdircolors ~/.dir_colors -b)

# tmux
if ( ! test $TMUX ) && ( ! expr $TERM : "^screen" > /dev/null ) && which tmux > /dev/null; then
  if ( tmux has-session > /dev/null 2>&1  ); then
    session=`tmux list-sessions | cut -d : -f 1`
  else
    echo "Create new tmux session."
    tmux
  fi
fi

# go
#if [ -x "$(which go)" ]; then
#  export GOROOT=`go env GOROOT`
#  export GOPATH=$HOME/go
#  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
#fi

# direnv
#eval "$(direnv hook zsh)"

# gem and rbenv
eval "$(rbenv init - zsh)"

# gpg
GPG_TTY=$(tty)
SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
export GPG_TTY SSH_AUTH_SOCK
if [ ! -e ${SSH_AUTH_SOCK} ]; then
  eval $(gpg-agent --daemon)
fi

# iTerm2
function iterm2prof() {
  echo -e "\033]50;SetProfile=$1\a"
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# virtualenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
#    eval "$(pyenv virtualenv-init -)"
fi

#eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/takamura/tmp/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/takamura/tmp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/takamura/tmp/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/takamura/tmp/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(gh completion -s zsh)"
