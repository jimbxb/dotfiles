```sh
git clone $URL $HOME/.cfg
alias dot-config='/usr/bin/git --git-dir=$HOME/.cfg/.git --work-tree=$HOME'
dot-config config --local status.showUntrackedFiles no
dot-config checkout
```
