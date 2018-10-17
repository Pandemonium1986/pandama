#!/usr/bin/env bash
###########################################
### Pandama : Vagrant Shell provisioner ###
###########################################

#####################
# Apt configuration #
#####################

#-- Install mandatory packages
apt-get update
apt-get install -y \
	build-essential \
	curl \
	cowsay \
	dkms \
	dnsutils \
	fonts-powerline \
	htop \
	libfortune-perl \
	man \
	mlocate \
	module-assistant\
	net-tools \
	nmap \
	powerline \
	sudo \
	tree \
	unzip \
	vim

#-- Docker
apt-get install -y \
	apt-transport-https \
	ca-certificates \
	gnupg2 \
	software-properties-common

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
# ---------------------------------------------------------------------------- #

########################
# Custom configuration #
########################

if  [ ! -d /home/vagrant/.oh-my-zsh ]; then
	su - vagrant -c 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
fi

if  [ ! -d /home/vagrant/git/Pandemonium1986/dotfiles ]; then
	su - vagrant -c 'mkdir -p /home/vagrant/git/Pandemonium1986'
	cd  /home/vagrant/git/Pandemonium1986
	su - vagrant -c 'git clone https://github.com/Pandemonium1986/dotfiles'
fi
