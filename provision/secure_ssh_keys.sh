#!/bin/bash

echo "Setting secure permissions on ssh keys"
chmod u=rw,go= /home/vagrant/.ssh/id_rsa
chmod u=rw,go=r /home/vagrant/.ssh/id_rsa.pub
