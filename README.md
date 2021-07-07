# My Mac

Repeatable Ansible roles and playbook for provisioning my MacBook

## Pre-requisites

* Xcode Command Line Tools: `xcode-select --install`
* Homebrew: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
* Git: `brew install git`
* Ansible: `brew install ansible` 

## Execute the playbook

* `mkdir ~/src`
* `cd ~/src `
* `git clone https://github.com/domaindrivendev/my-mac`
* `cd my-mac`
* `ansible-playbook local.yml`

## Customization ##

The playbook uses a number of defaulted variables that can be overriden at the command line. For example:

```
ansible-playbook local.yml --extra-vars "git_global_name=richie git_global_email=richie@myorg.com"
```

The following defaults can be overriden with this technique:
* [roles/git/defaults/main.yml](roles/git/defaults/main.yml)
* [roles/ruby/defaults/main.yml](roles/ruby/defaults/main.yml)
* [roles/nodejs/defaults/main.yml](roles/nodejs/defaults/main.yml)
