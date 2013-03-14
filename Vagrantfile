Vagrant::Config.run do |config|
  config.vm.provision :puppet do |puppet|
    config.vm.box = "lucid32"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "ngnix.pp"
  end

  config.vm.provision :puppet do |puppet|
    config.vm.box = "precise32"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "mysql.pp"
  end

  config.vm.forward_port 80, 3000
end