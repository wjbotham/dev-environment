#!/bin/bash

echo "Configuring git"
su - vagrant -c "git config --global user.name '$1'"
su - vagrant -c "git config --global user.email '$2'"
su - vagrant -c "git config --global push.default current"
su - vagrant -c "git config --global core.editor 'vim'"
su - vagrant -c "git config --global core.excludesfile /home/vagrant/.gitignore_global"
