# Pandama

[![Vagrant Cloud](https://img.shields.io/badge/vagrant-pandama-lightgrey.svg)](https://app.vagrantup.com/pandemonium/boxes/pandama)
![](https://img.shields.io/github/release/Pandemonium1986/pandama.svg)
![](https://img.shields.io/github/repo-size/Pandemonium1986/pandama.svg)
![](https://img.shields.io/github/release-date/Pandemonium1986/pandama.svg)
![](https://img.shields.io/github/license/Pandemonium1986/pandama.svg)

Debian environment provided with my basic tools.  

## Getting Started

This project start a virtualbox vm from my debian base box [pandemonium/debvanilla](https://app.vagrantup.com/pandemonium/boxes/debvanilla) base box.  
He is provided with ansible and shell provisioner wich available a fully environment with my basics tools.

### Prerequisites

Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).  
Install [Vagrant](https://www.vagrantup.com/downloads.html).  
Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)  

Install Ansible Role from galaxy :

```sh
ansible-galaxy install --force pandemonium1986.init,0.1.1
ansible-galaxy install --force pandemonium1986.ohmyzsh,0.1.0
ansible-galaxy install --force geerlingguy.docker,2.5.2
```

You can read official documentation for installation instruction and read my cheatsheet.  

-   [VirtualBox cheatsheet](https://github.com/Pandemonium1986/cheatsheet/blob/master/Vagrant.md).  
-   [Vagrant cheatsheet](https://github.com/Pandemonium1986/cheatsheet/blob/master/VirtualBox.md).  

If you are on windows I strongly recommended you to read those links if you want to used the Wsl (Debian in my case). Otherwise use mintty or cmder for vagrant command execution.

-   [Wsl cheatsheet](https://github.com/Pandemonium1986/cheatsheet/blob/master/Wsl.md).  
-   [Manage and configure Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#set-wsl-launch-settings)  
-   [Chmod/Chown WSL Improvements](https://blogs.msdn.microsoft.com/commandline/2018/01/12/chmod-chown-wsl-improvements/)
-   [Vagrant and Wsl](https://www.vagrantup.com/docs/other/wsl.html)

### Installing

Simply clone repository and use `vagrant up` command.

```sh
git clone https://github.com/Pandemonium1986/pandama.git ~/git/Pandemonium1986/pandama
cd ~/git/Pandemonium1986/pandama
vagrant up
```

If you want to access to the vm after 'up' use

```sh
vagrant ssh
```

## Authors

-   **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
