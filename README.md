# dotfiles

## Setup
```bash
git init --bare $HOME/.cfg
git clone --bare https://github.com/mpaepper/dotfiles $HOME/.cfg
config checkout # Configure the config alias before, see below
```

## Configuration
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
```

## Usage
```bash
config status
config add .gitconfig
config commit -m 'Add gitconfig'
config push
```
## Credits
The setup is taken from https://news.ycombinator.com/item?id=11071754
