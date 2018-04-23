# pl-break-fix-tutorial

This repo contains the scripts for setting up the machines used in the Percona Live 2018: [MySQL break/fix tutorial]( https://www.percona.com/live/18/sessions/mysql-breakfix-lab).


## How to run

I have updated the lab to run in a vagrant environment so it can be tested on a local machine.

Requirements
- vagrant (tested on version 1.9.4) - https://www.vagrantup.com/
- virtualbox (tested on version 5.1.26) - https://www.virtualbox.org/


This command will fire up the virtual machine and start provisioning it

```
vagrant up
```

If for some reason the provisioning is stopped you can use this command to continue:
```
vagrant provision
```

If you want to clean up the environment run:
```
vagrant destroy
```

## How to use the machine

To connect to the virtual machine you can use:
```
vagrant ssh
```

This will connect to the machine as the `vagrant` user.

To run commands from the first part of the presention you will need to use the `root` user, to change to that you can use:
```
sudo su - root
```

To run the commands from the replication part of the tutorial you need to use the `demo-user` user, to change to that user you can use:
```
sudo su - demo-user
```
