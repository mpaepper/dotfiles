#!/bin/bash

sudo dpkg-reconfigure resolvconf
#/etc/resolv.conf -> 127.0.0.1

sudo service network-manager restart
