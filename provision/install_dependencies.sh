#!/bin/bash

apt-get update

echo "Installing dependencies for development"
apt-get install -y git vim

echo "Installing dependencies for Fabric deployment"
apt-get install -y python2.7 python-pip
pip install fabric==1.13.2
pip install boto==2.48.0
