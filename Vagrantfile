# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "rails"
  config.vm.box_url = "https://dl.dropbox.com/u/164404/box/precise64-ruby-postgresql-9.1.box"

  config.vm.network :hostonly, "10.10.10.10"
  config.vm.network :bridged

  config.vm.forward_port 5000, 5000
  config.vm.forward_port 5432, 5432

  config.vm.provision :shell, :inline => "sudo update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8"

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  # Disabled VirtualBox gui
  # config.vm.boot_mode = :gui
end
