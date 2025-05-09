In order to restore dotfiles:

<code>git clone --bare https://github.com/g4xx/dotfiles/ $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
dotfiles submodule update --init --recursive
dotfiles config --local status.showUntrackedFiles no
</code>
