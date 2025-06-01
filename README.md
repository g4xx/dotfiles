In order to restore dotfiles:

<code>git clone --bare https://github.com/g4xx/dotfiles/ $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
dotfiles submodule update --init --recursive
dotfiles config --local status.showUntrackedFiles no
</code>

After that it is recommended to change the github remote to ssh version (to be able to login with ssh key)
<code>
dotfiles remote set-url origin git@github.com:g4xx/dotfiles.git
dotfiles push --set-upstream origin master 
</code>
