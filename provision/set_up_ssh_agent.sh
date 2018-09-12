#!/bin/bash

echo "Modifying .bashrc to run ssh-agent on login"
echo >> /home/vagrant/.bashrc
echo "eval \`ssh-agent\`" >> /home/vagrant/.bashrc
echo "ssh-add -l" >> /home/vagrant/.bashrc
echo "echo \"If you need a key, use \\\`ssh-add ~/.ssh/KEY_NAME\\\` to give it to ssh-agent.\"" >> /home/vagrant/.bashrc
echo "echo" >> /home/vagrant/.bashrc
echo "Modifying .bash_logout to kill ssh-agent on logout"
echo >> /home/vagrant/.bash_logout
echo "eval \`ssh-agent -k\`" >> /home/vagrant/.bash_logout
