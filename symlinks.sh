#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc vim zshrc codeblocks irssi synaptic symlinks.sh bash_aliases gitconfig"    # list of files/folders to symlink in homedir

########## Functions


install_bash (){
	# Test to see if zshell is installed.  If it is:
if [ -f /bin/bash -o -f /usr/bin/bash ]; then
	echo "You already have bash installed. Will now clone .bashrc from GitHub if not present"
    # Clone my .bashrc repository from GitHub only if it isn't already present
    if [[ ! -d $dir/.bashrc/ ]]; then
        git clone http://github.com/kevthanewversi/dotfiles/bashrc.git
    fi
    # Set the default shell to bash if it isn't currently set to bash
    if [[ ! $(echo $SHELL) == $(which bash) ]]; then
        chsh -s $(which bash)
    fi
else
    # If bash isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install bash and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install bash
            install_bash
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt-get install bash
            install_bash
        fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install bash, then re-run this script!"
        exit
    fi
fi

}

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
	echo "You already have zsh installed. Will now clone oh-my-zsh from GitHub if not present"
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install zsh
            install_zsh
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt-get install zsh
            install_zsh
        fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}


########## Creation of symlinks

create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

########### Shell installation

echo "Would you like to install bash or zsh?"
read -p  "1. bash  2. zsh  3. I'm good   " shell




case $shell in 
1)

install_bash
;;

2)

install_zsh
;;

3)

exit ;;

* ) 
echo "Enter either 1,2 or 3"
exit 2

esac




