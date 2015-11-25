#!/bin/bash

set -o errexit

chmod 777 /var/cache/apt-cacher-ng
service apt-cacher-ng start
tail -f /var/log/apt-cacher-ng/*
