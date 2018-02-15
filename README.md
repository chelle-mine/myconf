## Installing:
```
# clone into temporary directory first
git clone --separate-dir=$HOME/.myconf https://github.com/chelle-mine/myconf $HOME/myconf-tmp

# then delete temporary directory
rm -r $HOME/myconf-tmp/

# continue setting up
alias config="/usr/bin/git --git-dir=$HOME/.myconf --work-tree=$HOME"
config config status.showUntrackedFiles no
```
