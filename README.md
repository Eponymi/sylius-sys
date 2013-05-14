DevOps tools for getting up and running with Sylius.

Requirements
------------
  - Vagrant >= 1.1
  - bundler gem
  - librarian-chef gem

Usage
-----
**NOTE:** this package is designed to be used with the sylius-conductor repo. If you'd just like to build the machine, you can still do that.
  - clone the repo
  - run `bundle`
  - run `librarian-chef install`
  - run `vagrant up dev`
  - visit the ip assigned in `Projectvars` in your browser
