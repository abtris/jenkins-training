# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.network :forwarded_port, guest: 8080, host: 8080
  # config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.network :public_network
  config.ssh.forward_agent = true
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    # vb.gui = true
  
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
end
