#!/bin/bash

echo "Changing login directory to /home/vagrant/workspace"
touch /home/vagrant/.bash_profile
if ! grep "cd /home/vagrant/workspace" /home/vagrant/.bash_profile
then
  echo "cd /home/vagrant/workspace" >> /home/vagrant/.bash_profile
fi
