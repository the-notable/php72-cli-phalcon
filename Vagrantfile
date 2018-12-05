# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/bionic64"

	# Forward ports to Apache and MySQL
    #config.vm.network "forwarded_port", guest: 8080, host: 8080

	config.vm.synced_folder "./", "/root", :owner => "root", :group => "root"

	config.vm.provision "shell", path: "provision_vagrant_env.sh"

  config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "8000"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
  end

  config.vm.provider "virtualbox" do |v|
          v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/root", "1"]
   end

end
