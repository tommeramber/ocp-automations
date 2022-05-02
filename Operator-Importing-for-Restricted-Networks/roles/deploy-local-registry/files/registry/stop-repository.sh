#!/bin/bash -l
podman stop myregistry
podman rm myregistry
rm -rf /tmp/myregistry
