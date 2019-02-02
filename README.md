# Pandama

[![Vagrant Cloud](https://img.shields.io/badge/vagrant-pandama-lightgrey.svg)](https://app.vagrantup.com/pandemonium/boxes/pandama)
![](https://img.shields.io/github/release/Pandemonium1986/pandama.svg)
![](https://img.shields.io/github/repo-size/Pandemonium1986/pandama.svg)
![](https://img.shields.io/github/release-date/Pandemonium1986/pandama.svg)
![](https://img.shields.io/github/license/Pandemonium1986/pandama.svg)

Debian environment provided with my basic tools.  

## Getting Started

This project start/build a virtualbox vm from my debian base box [pandemonium/debvanilla](https://app.vagrantup.com/pandemonium/boxes/debvanilla).  
He is provided with ansible and shell provisioner wich available a fully environment with my basics tools.

### Prerequisites

-   [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - The only provider available.
-   [Vagrant](https://www.vagrantup.com/downloads.html) - To build and manage the box.

Install those Ansible role from galaxy (build only) :

```sh
ansible-galaxy install --force pandemonium1986.init,1.0.0
ansible-galaxy install --force pandemonium1986.ohmyzsh,0.1.0
ansible-galaxy install --force pandemonium1986.ansible,1.0.0
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

Simply initialize and up the box.

```sh
vagrant init pandemonium/pandama
vagrant up
```

If you want to access to the vm after 'up' use

```sh
vagrant ssh
```

## Building

If you want to build the box, you need to clone the git repository and be sure to have ansible and the galaxy roles installed.

```sh
git clone https://github.com/Pandemonium1986/pandama.git ~/git/Pandemonium1986/pandama
cd ~/git/Pandemonium1986/pandama
vagrant up
```

Before upload the box into the vagrant cloud :

```sh
vagrant ssh
sudo visudo # Be sure to add the pandemonium account
adu && adc && sudo apt autoremove
cat /dev/null ~/.ssh/known_hosts
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > ~/.ssh/authorized_keys  
history -c
# ctrl + d
```

## Built With

-   [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) - The provider used.

## Authors

-   **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
