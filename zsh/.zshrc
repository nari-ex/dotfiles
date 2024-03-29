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
_cache_hosts=(`fgrep 'Host ' ~/.ssh/config | awk '{print $2}' | sort`)
autoload -U compinit
compinit

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
export MYSQL_PATH="/opt/homebrew/opt/mysql@5.7/bin"
export NPM_PATH="/usr/local/share/npm/bin"
export SBIN_PATH="/usr/local/sbin"
export PATH="$COREUTILS_PATH:$MYSQL_PATH:$NPM_PATH:$SBIN_PATH:$PATH"
export PATH="$NPM_PATH:$SBIN_PATH:$PATH"

# alias
alias top="top -ocpu -s5"
alias ql="qlmanage -p"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
alias ls="gls --color=auto"
alias grep="ggrep --color=auto"
alias fgrep="gfgrep --color=auto"
alias egrep="gegrep --color=auto"
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
alias less="less -R"
alias tsh-login="tsh --proxy teleport.sre.aws.topot.al login --user=nari-ex"
alias aws-sso-login="AWS_PROFILE=topotal-sre aws sso login"

# env
export MYSQL_PREFIX="/opt/homebrew/opt/mysql@5.7"
export TERM="xterm-256color"
export LESSOPEN="|/opt/homebrew/bin/src-hilite-lesspipe.sh %s"
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

# golang
if [ -x "$(which go)" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

function peco-src () {
  local base_dir=$(git config ghq.root)
  local selected_dir=${base_dir}/$(ghq list | peco --query "${LBUFFER}")
  if [ -n "${selected_dir}" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

eval "$(gh completion -s zsh)"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# direnv
# eval "$(direnv hook zsh)"

# gpg-agent
AGENT_SOCK=$(gpgconf --list-dirs | grep agent-socket | cut -d : -f 2)
if [[ ! -S $AGENT_SOCK ]]; then
  gpg-agent --daemon --use-standard-socket &>/dev/null
fi
export GPG_TTY=$(tty)

# iTerm2
function iterm2prof() {
  echo -e "\033]50;SetProfile=$1\a"
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# virtualenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

# node
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# gogole cloud sdk
if [ -f '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi
