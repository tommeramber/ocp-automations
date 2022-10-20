export LOCAL_SECRET_JSON="/tmp/pull-secret.json"
export PRODUCT_REPO="openshift-release-dev"
export RELEASE_NAME="ocp-release"
export LOCAL_REGISTRY='myregistry:5000'
export OCP_RELEASE="4.6.43"
export LOCAL_REPOSITORY="ocp4/openshift-${OCP_RELEASE}"
export OCP_FINAL_DESIRED_RELEASE="4.8.24"
export ARCHITECTURE="x86_64"
#export REGISTRY_BASE_DIR="/tmp/myregistry/data"
export REGISTRY_BASE_DIR="/home/myregistry/data"

export HASH=`curl -s https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/${OCP_RELEASE}/release.txt | grep Digest | awk '{print $2}'`

export HASH_WITHOUT_SHA_PREFIX=`echo ${HASH} | awk -F':' '{print $2}'`

cd ${REGISTRY_BASE_DIR}
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCP_FINAL_DESIRED_RELEASE}/openshift-install-linux.tar.gz
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCP_FINAL_DESIRED_RELEASE}/openshift-client-linux.tar.gz

tar -xzf openshift-install-linux.tar.gz -C /usr/local/bin/
tar -xzf openshift-client-linux.tar.gz -C /usr/local/bin/

#echo -n 'dummy:dummy' | base64 -w0 == ZHVtbXk6ZHVtbXk=
`
jq '.auths += {"myregistry:5000": {"auth":"ZHVtbXk6ZHVtbXk="}}' /tmp/pull-secret.json >> /tmp/pull-secret.json

/usr/local/bin/oc adm release mirror --insecure=true -a ${LOCAL_SECRET_JSON} --from=quay.io/${PRODUCT_REPO}/${RELEASE_NAME}@${HASH} \
--to=${LOCAL_REGISTRY}/${LOCAL_REPOSITORY} \
--to-release-image=${LOCAL_REGISTRY}/${LOCAL_REPOSITORY}:${HASH_WITHOUT_SHA_PREFIX}


### In the internal network, run the opposite command for each OCP version:
/usr/local/bin/oc adm release mirror --insecure=true -a ${LOCAL_SECRET_JSON} --from=myregistry:5000/${LOCAL_REGISTRY}/${LOCAL_REPOSITORY}:${HASH_WITHOUT_SHA_PERFIX} \
--to=${LOCAL_REGISTRY}/${LOCAL_REPOSITORY} \
--to-release-image=${INTERNAL_REGISTRY}/${INTERNAL_REPOSITORY}:${HASH_WITHOUT_SHA_PREFIX}

## Command to run in internal Network
### Copy the oc & openshift-install binaries to the PATH env var
$ oc adm upgrade --force --allow-explicit-upgrade=true --allow-upgrade-with-warnings=true --to-image=quay.io/openshift-release@sha256:REALLY_LONG_HASH
