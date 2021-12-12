#!/bin/bash

# prepare prerequisites
mkdir -p /tmp/myregistry/{auth,certs,data}
grep -q myregistry /etc/hosts || echo "127.0.0.1 myregistry quay.io" >> /etc/hosts
cp htpasswd /tmp/myregistry/auth
openssl req -newkey rsa:4096 -nodes -sha256 -keyout /tmp/myregistry/certs/domain.key -x509 -days 365 -out /tmp/myregistry/certs/domain.crt -subj "/CN=myregistry"

# start repository container
podman run --name myregistry -d -p 5000:5000 \
-e REGISTRY_AUTH="htpasswd" \
-e REGISTRY_AUTH_HTPASSWD_REALM="Registry" \
-e REGISTRY_HTTP_SECRET="ALongRandomSecretForRegistry" \
-e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
-e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/myregistry_crt.crt \
-e REGISTRY_HTTP_TLS_KEY=/certs/myregistry_key.pem \
-v /tmp/myregistry/data:/var/lib/registry:z \
-v /tmp/myregistry/auth:/auth:z \
-v /tmp/myregistry/certs:/certs:z \
image: docker.io/library/registry:2
