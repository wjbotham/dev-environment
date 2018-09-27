#!/bin/bash

echo "Modifying .bashrc to run ssh-agent on login"
cat use_agent_on_login.txt >> /home/vagrant/.bashrc

echo "echo \"If you need a key, use \\\`ssh-add ~/.ssh/KEY_NAME\\\` to give it to ssh-agent.\"" >> /home/vagrant/.bashrc
