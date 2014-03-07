# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  # config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.network :public_network
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    #vb.gui = true
  
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize [
        "modifyvm", :id, 
        "--memory", "2048",
        "--name", "jenkins-vagrant",
        "--cpus", "2"
    ]
  end  
  
  
  
  config.vm.define :master do |master|
    master.vm.hostname = "master.vm"
    master.vm.network :forwarded_port, guest: 8080, host: 8080
    master.vm.network :private_network, ip: "33.33.33.10"
    master.vm.provision :shell, :path => "install.sh"
  end

  config.vm.define :slave do |slave|
    slave.vm.hostname = "slave.vm"
    slave.vm.network :private_network, ip: "33.33.33.20"
    slave.vm.provision :shell, :path => "install-slave.sh"    
  end
  
  
end
