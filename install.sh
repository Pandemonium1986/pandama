#!/usr/bin/env bash
###########################################
### Pandama : Vagrant Shell provisioner ###
###########################################

#-- Environment Variables
VAGRANT_USER="vagrant"

#####################
# Apt configuration #
#####################

#-- Install mandatory packages
apt-get update
apt-get install -y \
	apt-transport-https \
	build-essential \
	ca-certificates \
	curl \
	cowsay \
	dkms \
	dnsutils \
	fonts-powerline \
	gnupg2 \
	htop \
	libfortune-perl \
	man \
	mlocate \
	module-assistant\
	net-tools \
	nmap \
	powerline \
	software-properties-common \
	sudo \
	tree \
	unzip \
	vim

#-- Configuring the external source list.
if [ ! -f /etc/apt/sources.list.d/backports.list ]; then
	echo "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/backports.list
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	add-apt-repository \
	   "deb [arch=amd64] https://download.docker.com/linux/debian \
	   $(lsb_release -cs) \
	   stable"
fi
apt-get update

#-- Backports
apt-get -t stretch-backports install -y \
	ansible \
	curl \
	git \
	gitk \
	tmux \
	zsh

#-- Docker
apt-get install -y docker-ce
groupadd docker
usermod -aG docker $VAGRANT_USER
systemctl enable docker
# ---------------------------------------------------------------------------- #

########################
# Custom configuration #
########################

if  [ ! -d /home/$VAGRANT_USER/.oh-my-zsh ]; then
	if  [ -f /bin/zsh ]; then
		chsh -s /bin/zsh $VAGRANT_USER
		su - $VAGRANT_USER -c 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
		su - $VAGRANT_USER -c 'git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions'
		su - $VAGRANT_USER -c 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting'
	fi
fi

if  [ ! -d /home/$VAGRANT_USER/.tmuxifier ]; then
	if  [ -f /usr/bin/tmux ]; then
		su - $VAGRANT_USER -c 'git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier'
	fi
fi

if  [ ! -d /home/$VAGRANT_USER/git/Pandemonium1986/dotfiles ]; then
	su - $VAGRANT_USER -c 'git clone https://github.com/Pandemonium1986/dotfiles ~/git/Pandemonium1986/dotfiles'
	su - $VAGRANT_USER -c '~/git/Pandemonium1986/dotfiles/install.sh all'
fi
