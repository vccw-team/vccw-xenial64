# Ubuntu/Xenial64 based box for the VCCW v3.x

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
$ vagrant box update
$ vagrant up
```

Run tests.

```
$ bundle install --path=vendor/bundle
$ bundle exec rake spec
```

Create a package.

```
$ vagrant package
```

Run with VCCW.

```
$ vagrant box add vccw-xenial64 package.box --force
```

Edit the `site.yml` in the VCCW v3 like following.

```
wp_box: vccw-xenial64
```

Then run provision.

```
$ vagrant up
```
