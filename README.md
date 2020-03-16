# Midgar

[![Vagrant Cloud](https://img.shields.io/badge/vagrant-midgar-lightgrey.svg)](https://app.vagrantup.com/pandemonium/boxes/midgar)
![](https://img.shields.io/github/release/Pandemonium1986/midgar.svg)
![](https://img.shields.io/github/repo-size/Pandemonium1986/midgar.svg)
![](https://img.shields.io/github/release-date/Pandemonium1986/midgar.svg)
![](https://img.shields.io/github/license/Pandemonium1986/midgar.svg)

Debian environment provided with my basic tools.  

## Getting Started

This project start/build a virtualbox vm from my debian base box [pandemonium/mint1903](https://app.vagrantup.com/pandemonium/boxes/mint1903).  
He is provided with ansible and shell provisioner wich available a fully environment with my basics tools.


### Prerequisites

-   [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - The only provider available.
-   [Vagrant](https://www.vagrantup.com/downloads.html) - To build and manage the box.


You can read official documentation for installation instruction and read my cheatsheet.  

-   [VirtualBox cheatsheet](https://github.com/Pandemonium1986/cheatsheet/blob/master/Vagrant.md).  
-   [Vagrant cheatsheet](https://github.com/Pandemonium1986/cheatsheet/blob/master/VirtualBox.md).  

If you are on windows I strongly recommended you to read those links if you want to used the Wsl (Debian in my case). Otherwise use mintty or cmder for vagrant command execution.

-   [Wsl cheatsheet](https://github.com/Pandemonium1986/cheatsheet/blob/master/Wsl.md).  
-   [Manage and configure Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#set-wsl-launch-settings)  
-   [Chmod/Chown WSL Improvements](https://blogs.msdn.microsoft.com/commandline/2018/01/12/chmod-chown-wsl-improvements/)
-   [Vagrant and Wsl](https://www.vagrantup.com/docs/other/wsl.html)

### Installing

Simply initialize and up the box.  
Note pandama box is only available for debian environment. If you want to used the Linux mint environment please refer to "Building" section.

```sh
vagrant init pandemonium/midgar
vagrant up
```

If you want to access to the vm after 'up' use

```sh
vagrant ssh
```

## Building

If you want to build the boxes, you need to clone the git repository and be sure to have ansible installed.

```sh
git clone https://github.com/Pandemonium1986/midgar.git ~/git/Pandemonium1986/midgar
cd ~/git/Pandemonium1986/midgar
vagrant up
```

Or if you want to choose between pandama-mnt and pandama-deb  

```sh
git clone https://github.com/Pandemonium1986/pandama.git ~/git/Pandemonium1986/pandama
cd ~/git/Pandemonium1986/pandama
vagrant up pandama[-deb|-mnt]
```

## Update

Before upload the box into the vagrant cloud :

```sh
vagrant ssh pandama-deb

# Be sure to add the pandemonium account
sudo visudo
sudo su -

# Update box
./vagrant-update.sh
history -c # ctrl + d

# Hand over the insecure key
cat /dev/null > ~/.ssh/known_hosts
wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -O ~/.ssh/authorized_keys
history -c # ctrl + d
```

## Built With

-   [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) - The provider used.

## Authors

-   **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
