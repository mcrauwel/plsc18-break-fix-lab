# pl-break-fix-tutorial

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
