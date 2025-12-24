#!/bin/bash

wget https://github.com/portainer/portainer/releases/download/2.21.5/portainer-2.21.5-linux-amd64.tar.gz

tar -xvf portainer-2.21.5-linux-amd64.tar.gz

rm -rf portainer-2.21.5-linux-amd64.tar.gz

echo "Starting Portainer..."
./portainer/portainer