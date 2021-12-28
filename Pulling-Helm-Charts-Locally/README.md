# Important!!
This Ansible Playbook is for PoC purposes only, and can & will be written in a more finesse manner;
For the purpose of PoC, it is definitely satisfying.

# Prerequistis
1. [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
2. [Helm](https://helm.sh/docs/intro/install/)
3. [Podman](https://podman.io/getting-started/installation)

# Before Running The Playbook

```bash
ansible-galaxy collection install kubernetes.core
ansible-galaxy collection install containers.podman
```

The playbook will try installing `yq` for you, if you already have it installed on your machine, run the following command:

```bash
sed -ie '11d;12d' playbook.yaml
```

# HOW-TO Mini-Guide

I know I know, this Ansible Playbook isn't the most finess one (to say the least) but it works, and it's interactive, so you should know how to run it proparly.

First, you need to know which helm chart you want to pull locally. The operator will do the rest, including pulling & saving the required images that the chart relay on.

The first propmt you'll get: **"Enter the desired chart for pulling locally:"** . Write the desired chart name. e.g. - grafana-operator

Next , you're required to fill the URL of the chart you want. The output of the previous task includes all the releavnt URLs you can pick from, just copy-paste the one you want, without the quotes.

One last thing - **"Enter: <Chart>:<Version> for the chart you want"** . Again the output of the previous task will present you with all the different charts that this helm source provides, and all of their versions. Choose the one you want. The input should look like that: 
`bitnami/grafana-operator:1.5.5`

That's it. 

By the end, you'll have an tar.gz file that contains the chart itself and the containers it requires, compressed locally to tar.gz files as well.


[The following GIF shows the entire process](Animation.gif)
