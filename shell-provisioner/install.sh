#!/usr/bin/env bash
###########################################
### Pandama : Vagrant Shell provisioner ###
###########################################

#-- Environment Variables
VAGRANT_USER="pandemonium"

########################
# Custom configuration #
########################
usermod -aG docker $VAGRANT_USER

if  [ ! -d /home/$VAGRANT_USER/.tmuxifier ]; then
	if  [ -f /usr/bin/tmux ]; then
		su - $VAGRANT_USER -c 'git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier'
	fi
fi

if  [ ! -d /home/$VAGRANT_USER/git/Pandemonium1986/dotfiles ]; then
	su - $VAGRANT_USER -c 'git clone https://github.com/Pandemonium1986/dotfiles ~/git/Pandemonium1986/dotfiles'
	su - $VAGRANT_USER -c '~/git/Pandemonium1986/dotfiles/install.sh all'
fi
