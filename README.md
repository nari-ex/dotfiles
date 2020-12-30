# Dotfile and iTerm configration files

### Create Symlinks

```
cd /path/to/workdir
ln -sf $PWD/git/.gitconfig ~/
ln -sf $PWD/git/.gitignore ~/
ln -sf $PWD/zsh/.dir_colors ~/
ln -sf $PWD/zsh/.zshrc ~/
ln -sf $PWD/direnv/.bin ~/
ln -sf $PWD/tmux/.tmux.conf ~/
ln -sf $PWD/vim/.vimrc ~/
ln -sf $PWD/vim/.vim ~/
mkdir -p ~/.config
ln -f $PWD/python/.config/flake8 ~/.config
```

### Installation

```
brew install zsh-completions
curl -L https://raw.github.com/felixr/docker-zsh-completion/master/_docker > /usr/local/share/zsh-completions/_docker
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
```
