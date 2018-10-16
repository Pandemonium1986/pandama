#!/usr/bin/env bash
#############################################
##   Pandama : Vagrant Shell provisioner   ##
#############################################

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

#-- Configure external source list.
echo "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/backports.list
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
apt-get update

#-- Backpos
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

if ! [ -L /home/vagrant/git/Pandemonium1986 ]; then
	mkdir -p /home/vagrant/git/Pandemonium1986
	cd  /home/vagrant/git/Pandemonium1986
	git clone https://github.com/Pandemonium1986/dotfiles
fi
