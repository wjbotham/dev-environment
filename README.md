1. Install VirtualBox: https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant: https://www.vagrantup.com/downloads
3. Run `vagrant up` in the root of this repo.

I use a file `OpenDevEnvironment.bat` with the following contents as a shortcut:
```
C:\cygwin64\bin\mintty.exe -i /Cygwin-Terminal.ico /bin/bash -l -c "cd /cygdrive/PATH/TO/dev-environment; if [[ $(vagrant status | grep running) ]]; then echo 'The workshop is running.'; else echo 'The workshop is not running. Starting now.'; vagrant up; fi; echo 'Logging in.'; vagrant ssh"
```
