# kevthanewversi's dotfiles
# Getting Started
* Clone the repo
* Move it to your home directory `mv -R dotfiles ~/`
* Run symlink shell script `bash symlink.sh`  to create symlinks to your dotfiles
* Open vim and run `:so ~/.vimrc` which will set up my *awesome* vim configs for you
* Navigate into your ~/.vim/bundle dir > `cd  ~/.vim/bundle` then run the following commands to setup maktaba, vundle and Glaive:
  * `git clone git@github.com:google/vim-maktaba.git`
  * `git clone https://github.com/gmarik/Vundle.vim.git`
  * `git clone git@github.com:google/vim-codefmt.git`
  * `git clone git@github.com:google/vim-glaive.git`
* Open vi and run the command PlugInstall to install the plugins

* Good to go now :)
