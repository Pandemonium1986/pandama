Vagrant.require_version ">= 2.2.4"

Vagrant.configure("2") do |config|

  # Global configuration
  config.vm.box_check_update = true
  config.vm.communicator = "ssh"
  config.vm.graceful_halt_timeout = 60

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--audio", "none"]
    vb.customize ["modifyvm", :id, "--boot1", "dvd"]
    vb.customize ["modifyvm", :id, "--boot2", "disk"]
    vb.customize ["modifyvm", :id, "--boot3", "none"]
    vb.customize ["modifyvm", :id, "--boot4", "none"]
    vb.customize ["modifyvm", :id, "--groups", "/Vagrant"]
    vb.customize ["modifyvm", :id, "--vram", "64"]
    vb.gui = false
    vb.linked_clone = false
    vb.memory = "1024"
  end

  # Provisioning configuration
  config.vm.provision "ansible", run: "always" do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.config_file = "ansible-provisioner/ansible.cfg"
    ansible.galaxy_role_file = "ansible-provisioner/requirements.yml"
    ansible.playbook = "ansible-provisioner/pandama.yml"
    ansible.host_vars = {
      "pandama-mnt" => {
        "ansible_python_interpreter" => "/usr/bin/python3",
        "ansible_distribution" => "Ubuntu",
        "ansible_distribution_version" => "Ubuntu.18"
      }
    }
  end

  config.vm.provision "bootstrap", type: "shell", run: "once" do |s|
    s.path = "shell-provisioner/install.sh"
  end

  # Debian box
  config.vm.define "pandama-deb" do |deb|
    deb.vm.box = "pandemonium/debvanilla"
    deb.vm.box_version = ">= 1.3.0"
    deb.vm.hostname = "pandama-deb"
    deb.vm.network "private_network", ip: "192.168.66.30"
    deb.vm.post_up_message = "Starting pandama-deb"
    deb.vm.provider :virtualbox do |vb|
      vb.name = "pandama-deb"
      vb.customize ["modifyvm", :id, "--description", "
#################
### pandama-deb ###
#################
Pandemonium Vagrant Box
Debian 9.8.0 provisionnée avec le playbook pandama.
---------------------------------------------------"]
    end
  end

  # Linux Mint box
  config.vm.define "pandama-mnt" do |mnt|
    mnt.vm.box = "pandemonium/mntvanilla"
    mnt.vm.box_version = ">= 1.0.1"
    mnt.vm.hostname = "pandama-mnt"
    mnt.vm.network "private_network", ip: "192.168.66.31"
    mnt.vm.post_up_message = "Starting pandama-mnt"
    mnt.vm.provider :virtualbox do |vb|
      vb.cpus = 2
      vb.memory = "4096"
      vb.name = "pandama-mnt"
      vb.customize ["modifyvm", :id, "--description", "
#################
### pandama-mnt ###
#################
Pandemonium Vagrant Box
Linux Mint 19.1 provisionnée avec le playbook pandama.
------------------------------------------------------"]
    end
  end

end
