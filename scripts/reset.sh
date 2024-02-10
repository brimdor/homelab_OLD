#!/bin/bash

docker stop files_http_1 files_dnsmasq_1
docker rm files_http_1 files_dnsmasq_1
docker image prune -a --force

sudo rm -Rf ~/.terraform.d

cd ~
sudo rm -Rf homelab