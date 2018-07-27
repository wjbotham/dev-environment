#!/bin/bash

echo "Setting secure permissions on git private key"
chmod u=rw,go= /home/vagrant/.ssh/id_rsa
