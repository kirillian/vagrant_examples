# leaderboard
## How to install
### Vagrant
Install vagrant if you don't have it:
http://docs.vagrantup.com/v2/installation/

### Clone the repo
```bash
git clone https://github.com/kirillian/network_grapher.git
cd network_grapher
```

### Create config files
```bash
cp vagrant.yml.example vagrant.yml
cp config/database.yml.example config/database.yml
```

Edit the two config files you just created and add the database password you want to use to line 5 in ```vagrant.yml``` and line 26 in ```database.yml```

### Generate Vagrant
**This step may take 30 minutes or more depending on how long it takes you to download all the necessary installers and build Ruby.**

You may need to install some vagrant plugins if you don't have them yet. The ```vagrant up``` step below should tell you the EXACT commands you need to install them.

```bash
vagrant up
```

### Log into the Vagrant Client
```bash
vagrant ssh
```

### Initialize the environment
```bash
bundle
rbenv rehash
rake db:create
rake db:schema:load
```

### Start the services
```bash
sudo service redis6379 start
bundle exec sidekiq -C config/sidekiq.yml
bundle exec sidekiq
rails s puma
```

### Development
You should be able to develop from either within the VM or from your Mac (or whichever laptop you are using) as the folder is shared between the VM and your host computer. You can reach the rails server by going to http://localhost:3000

