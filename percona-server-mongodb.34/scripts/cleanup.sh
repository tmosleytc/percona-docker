#!/bin/bash -eux

# Uninstall Ansible and related tools.
pip uninstall -y ansible
pip uninstall -y cffi
pip uninstall -y pip setuptools
rm -rf /usr/local/bin/ansible*
apt-get -y remove --purge python-pip python-dev python-setuptools libssl-dev libffi-dev

# Apt cleanup.
apt-get -y autoremove
apt-get update

# Clean up tmp
rm -rf /tmp/*
rm -rf /var/lib/apt/lists/*
