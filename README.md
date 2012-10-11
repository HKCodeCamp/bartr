# Bartr

## Prerequiste

Please make sure you have following software installed before proceed.

- [VirtualBox 4.2.x](https://www.virtualbox.org/wiki/Downloads)
- ruby (preferbly via [rvm](https://rvm.io/rvm/install/))
- [vagrant](http://vagrantup.com/v1/docs/getting-started/index.html)
```
gem install vagrant
```

## Setup

1. Check out the project via git
```
git clone git://github.com/HKCodeCamp/bartr.git
```
2. In the root folder of the project, run following commands to install dependencies:  
```
gem install vagrant
```
3. Start Vagrant  
```
vagrant up
```
4. SSH into app folder in VM
```
vagrant ssh
```  
5. Install project dependencies  
```
bundle install
```
6. Startup the server:  
```
bundle exec foreman start
```

You can suspend the VM from your host machine via command:  
```
vagrant suspend
```

For more details:

- [Vagrant Get Started Guide](http://vagrantup.com/v1/docs/getting-started/index.html)
- [Bundler](http://gembundler.com/) - Application dependencies management
- [Foreman](http://blog.daviddollar.org/2011/05/06/introducing-foreman.html) - Process management

## Documents

- [Wiki](https://github.com/HKCodeCamp/bartr/wiki)

## Team Members

- [Chris](https://github.com/moming2k)
- [Vinci](https://github.com/vincicat)
- [Francis](https://github.com/siuying)
- [Daniel](https://github.com/dannemanne)
- [Stig](https://github.com/stigtsp)