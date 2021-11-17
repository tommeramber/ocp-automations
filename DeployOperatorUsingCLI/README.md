# Important!!
This Ansible Playbook is for PoC purposes only, and can & will be written in a more finesse manner;
For the purpose of PoC, it is definitely satisfying.

# Before Running The Playbook
1. Install `oc` client: https://mirror.openshift.com/pub/openshift-v4/clients/ocp/
2. Login to your Openshift 4.x cluster with Cluster-Admin user
3. Access: https://console.redhat.com/openshift/install/pull-secret and download a pull-secret.json file to `/tmp/pull-secret.json`

Note! :+1: if you have logged in to openshift with sudo/root user - run this playbook with sudo, otherwise - run without.
















2. Change Variables in the `playbook.yaml` file based on your required operator

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

