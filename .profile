# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# GPG
alias gpg-kill=gpgconf --kill gpg-agent

# documents path
export ONEDRIVE_DOC=/mnt/c/Users/jb_xb/OneDrive/Documents/

# WYBE
fn-wybeinstall() {
    [[ `basename $PWD` == "wybe" ]] && (make; sudo make install) \
                                    || echo "Error installing Wybe"
}
alias wybeinstall="fn-wybeinstall"

fn-wyberun() {
    echo "Compiling $1"
    [[ $# -ge 2 ]] && echo "With arguments: ${@:2}"
    wybemk $1 ${@:2}
    [[ -x ./$1 && $? -eq 0 ]] && (echo "Attempting to run ./$1"; ./$1) || (echo "Cannot run ./$1")
}
alias wyberun="fn-wyberun"
