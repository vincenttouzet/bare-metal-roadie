#!/bin/sh

PYTHON_BIN="/usr/bin/python"
PIP_BIN="/usr/bin/pip"
ANSIBLE_PLAYBOOK_BIN="/usr/bin/ansible-playbook"
# version of Bare metal roadie to checkout: Default to master
VERSION=${VERSION:-master}

echo ""
echo " Welcome the the Roadie Bare metal installer"
echo ""

echo -n "Check Python ... "
PYTHON_BIN=$(which python)
if [ ! $? -eq 0 ]; then
    # check for python 3
    PYTHON_BIN=$(which python3)
    if [ ! $? -eq 0 ]; then
        echo "KO"
        echo "ERROR: You need to have python installed."
        exit 1
    fi
fi
echo "OK"

echo -n "Checking pip ... "
PIP_BIN=$(which pip)
if [ ! $? -eq 0 ]; then
    PIP_BIN=$(which pip)
    if [ ! $? -eq 0 ]; then
        # check for pip3
        echo "KO"
        echo "ERROR: You need to have pip installed."
        exit 1
    fi
fi
echo "OK"

echo -n "Check Ansible ... "
ANSIBLE_PLAYBOOK_BIN=$(which ansible-playbook)
if [ ! $? -eq 0 ]; then
    echo "KO"
    echo "Installing ansible ... "
    $PYTHON_BIN -m pip install ansible
    ANSIBLE_PLAYBOOK_BIN=$(which ansible-playbook)
fi
echo "OK"

echo -n "Retrieving install playbook ... "
wget -q -O /tmp/bare-metal-roadie-install.yml https://raw.githubusercontent.com/vincenttouzet/bare-metal-roadie/$VERSION/install.yml
if [ ! $? -eq 0 ]; then
    echo "KO"
    echo "ERROR: Unable to fetch the install playbook"
    exit 1
fi
echo "OK"

echo "Installing Bare metal roadie ..."
echo "This will ask for a password in order to install required packages."
$ANSIBLE_PLAYBOOK_BIN --ask-become-pass -e "version=$VERSION" /tmp/bare-metal-roadie-install.yml
if [ ! $? -eq 0 ]; then
    echo "KO"
    echo "ERROR: Error during installation"
    exit 1
fi
echo "OK"
rm /tmp/bare-metal-roadie-install.yml

echo "Running Bare metal roadie"
cd ~/.bare-metal-roadie
$ANSIBLE_PLAYBOOK_BIN --ask-become-pass playbook.yml
