# Base box for the Ubuntu/Xenial64

## What's installed

* Apache
* MySQL
* PHP 7
* Ruby 2.3
* Node.js 6.5

## How to create a box

Install vagrant-vbguest.

```
$ vagrant plugin install vagrant-vbguest
```

Provision.

```
$ vagrant up
```

Run tests.

```
$ bundle install --path=vendor/bundle
$ bundle exec rake spec
```

Optimization

```
$ ssh -p 2222 -o 'StrictHostKeyChecking no' -i ~/.vagrant.d/insecure_private_key ubuntu@127.0.0.1 "bash /vagrant/clear.sh"
```

Create a package.

```
$ vagrant package --vagrantfile Vagrantfile.dist
```
