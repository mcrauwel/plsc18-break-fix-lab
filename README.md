# pl-break-fix-tutorial

## How to run

```
$ ansible-playbook -i hosts --key-file=~/.ssh/percona-live-admin-key.pem --ssh-extra-args='-o StrictHostKeyChecking=no'  configure.yaml
```
