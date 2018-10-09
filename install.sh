#!/usr/bin/env bash

apt-get update
apt-get install -y build-essential cowsay curl dkms dnsutils fonts-powerline git gitk htop libfortune-perl man mlocate module-assistant net-tools nmap powerline sudo tmux tree unzip vim zsh
if ! [ -L /home/vagrant/git/Pandemonium1986 ]; then
	mkdir -p /home/vagrant/git/Pandemonium1986
	cd  /home/vagrant/git/Pandemonium1986
	git clone https://github.com/Pandemonium1986/dotfiles
fi
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
