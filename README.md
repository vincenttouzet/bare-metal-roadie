# Bare Metal Roadie

This repository is a set of Ansible roles and tasks to help setup a new development machine.

Currently this is only tested with :

* Ubuntu 20.04
* Manjaro i3 20.1

## Installation

### Prerequisites For Debian / Ubuntu

First make sure you have python and pip installed.

```
sudo apt-get install python3-pip
```

and that your PATH is correct

```
echo PATH="\$PATH:\$HOME/.local/bin" >~/.bashrc && source ~/.bashrc
```

### Using installer

This package provides an installer:

```
curl -sS https://raw.githubusercontent.com/vincenttouzet/bare-metal-roadie/master/install.sh | sh -
```

## Roles

* [Git](roles/git/README.md)
* [OhMtZSH](roles/ohmyzsh/README.md)
