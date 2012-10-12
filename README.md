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
4. SSH into VM
```
vagrant ssh
```  

## Setup inside VM

- In the VM, change to app folder:  

```
cd /vagrant
```

- Install project dependencies  

```
bundle install
```

- Create Database

```
sudo su postgres  

createdb bartr_test   

createdb bartr_development  

(Ctrl-d)  

```

- Setup App Setting  

  - Copy config/application.default.yml to config/application.yml and fill in proper keys

- Startup the server:  

```
bundle exec foreman start
```

Verified if everything setup properly by open browser (on your host machine) and enter http://10.10.10.10:5000.  
It should show the app website.

![](http://f.cl.ly/items/0D1O0v1h0f3J3J3V2Z2F/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7%202012-10-11%20%E4%B8%8B%E5%8D%8812.14.03.png)

If everything worked properly, you can press Ctrl-C to exit foreman.

You may suspend the VM from your host machine via command:  
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