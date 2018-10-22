# Pandama

Debian environment provided with my basic tools.  

## Getting Started

This project start a virtualbox vm from the official debian/stretch64 vagrant box.  
He is provided with simple shell provisioner wich available a fully environment with my basics tools.

### Prerequisites

Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).  
Install [Vagrant](https://www.vagrantup.com/downloads.html).  

You can read official documentation for installation instruction or read my cheatsheet.  

-   [VirtualBox cheatsheet](https://github.com/Pandemonium1986/cheatsheet/blob/master/Vagrant.md).  
-   [Vagrant cheatsheet](https://github.com/Pandemonium1986/cheatsheet/blob/master/VirtualBox.md).  

If you are on windows I recommended to use mintty or cmder for vagrant command execution.

### Installing

Simply clone repository and use `vagrant up` command.

    git clone https://github.com/Pandemonium1986/pandama.git ~/git/Pandemonium1986/pandama
    cd ~/git/Pandemonium1986/pandama
    vagrant up

If you want to access to the vm after 'up' use

    vagrant ssh

## Authors

-   **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
