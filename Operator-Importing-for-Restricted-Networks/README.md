This Ansible Playbook is for PoC purposes only, and can & will be written in a more finesse manner; 
For the purpose of PoC, it is definitely satisfying.

Two Important notes:
1. Required Packages - Run the following commands prior to running the playbook; 
2. The Ansible Playbook should be running with "sudo" due to elevated privilieges required to run some of the tasks.


```bash
sudo ansible-galaxy collection install community.crypto
sudo ansible-galaxy collection install containers.podman
sudo ansible-galaxy collection install community.general 
```
