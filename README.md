# dotfiles

Some of the highlights of my dotfiles setup:
  * The home folder is mapped to be under version control and a special alias (config) is used to add files
  * Therefore, you don't need to use symlinks or anything similar and you can just add new dot files as they appear
  * I use a bash script called 'notes' to handle all my work notes:
    * It opens with fuzzy search (fzf) to be able to search all the note files by name and shows the preview of the file with the best match on the right side.
    * When you press enter, your $EDITOR is opened to edit the file. 
    * When you exit the $EDITOR, you are back in the fuzzy search to find the next file to edit.
    * Enter a non-existing name and Enter to write a new note to that file name.
    * You can run "notes -s" to search not by the note titles but rather by all the note contents. In that case, the preview shows the 5 lines before and after the best match of the best matching file. Enter brings you to an edit view.
  * I use xmonad as a tiling window manager -> Check out https://github.com/mpaepper/xmonad-config
  * When you are in a git repository in the terminal, the awesome https://github.com/magicmonty/bash-git-prompt is used

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
