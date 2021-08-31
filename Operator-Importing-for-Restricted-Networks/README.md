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

Make sure you follow the instractions in the following [README](roles/deploy-local-registry/tasks/README.md) before running the playbook.

Once you made sure that the variables in the `playbook.yaml` file are in corralation with your environment versions, run:
```bash
sudo ansible-playbook playbook.yaml
```
