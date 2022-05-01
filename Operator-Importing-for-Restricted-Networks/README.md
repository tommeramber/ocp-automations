# Before Running The Playbook
1. Make sure to access: https://console.redhat.com/openshift/install/pull-secret and download a pull-secret.json file to `/tmp/pull-secret.json`

2. Change Variables in the `playbook.yaml` file based on your required operator:
	1. index_image - Choose one of the following: redhat-operator/certified-operator/community-operator
	2. index_image_version - cluster major version (with v prefix)
	> e.g: v4.8
	3. required_operator - Operator name (partial ok)
	> e.g: local/local-storage/local-storage-operator

## Please Note

1. Required Packages - Run the following commands prior to running the playbook:

```bash
sudo ansible-galaxy collection install community.crypto
sudo ansible-galaxy collection install containers.podman
sudo ansible-galaxy collection install community.general
```

2. The Ansible Playbook should be running with "sudo" due to elevated privilieges required to run some of the tasks:
```bash
sudo ansible-playbook playbook.yaml
```

3. The ansible-playbook will create a tar.gz file, copy it to your restricted network:
---
## Post-running
1. Un-tar the tar.gz file
```bash
tar xzvf OPERATOR_NAME-VERSION.tar.gz
```

2. Start the local repository on a server which contains the podman package:
```bash
bash data/repository/start-repository.sh
```

3. Change the placeholer at imageContentSourcePolicy.yaml, catalogSource.yaml, run.sh from MY_REGISTRY:5000 to your internal image registry URL:
```bash
cd data
sed -i 's/MY_REGISTRY:5000/INTERNAL_REGISTRY:PORT/' imageContentSourcePolicy.yaml catalogSource.yaml run.sh
```
> Change INTERNAL_REGISTRY:PORT to your intenal registry.

4. Push the images to your internal registry:
```bash
sudo bash run.sh
```

5. Add the operator to Openshift:
```bash
oc apply -f imageContentSourcePolicy.yaml
oc apply -f catalogSource.yaml
```
> On openshift environments older than 4.7, imageContentSourcePolicy updates will resault in nodes rollout so wait until they finish oc the catalogSource udpate.
