# Important!!
This Ansible Playbook is for PoC purposes only, and can & will be written in a more finesse manner;
For the purpose of PoC, it is definitely satisfying.

# Before Running The Playbook
1. Install `oc` client: https://mirror.openshift.com/pub/openshift-v4/clients/ocp/
2. Login to your Openshift 4.x cluster with Cluster-Admin user
3. Access: https://console.redhat.com/openshift/install/pull-secret and download a pull-secret.json file to `/tmp/pull-secret.json`

Note! :+1: if you have logged in to openshift with sudo/root user - run this playbook with sudo, otherwise - run without.

