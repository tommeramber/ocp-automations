# Important!!
This Ansible Playbook is for PoC purposes only, and can & will be written in a more finesse manner;
For the purpose of PoC, it is definitely satisfying.

# Before Running The Playbook
Make sure to access: https://console.redhat.com/openshift/install/pull-secret and download a pull-secret.json file to `/tmp/pull-secret.json`


## Please Note

1. Required Packages - Run the following commands prior to running the playbook;

```bash
sudo ansible-galaxy collection install community.crypto
sudo ansible-galaxy collection install containers.podman
sudo ansible-galaxy collection install community.general
```

2. The Ansible Playbook should be running with "sudo" due to elevated privilieges required to run some of the tasks.
```bash
sudo ansible-playbook playbook.yaml
```
