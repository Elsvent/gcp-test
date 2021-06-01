#!/bin/bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible --yes

git clone https://github.com/Elsvent/gcp-test.git
ansible-playbook /gcp-test/ansible/helloworld.yml
