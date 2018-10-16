#!/bin/bash

FIREWALL_CERT=$1
cat $FIREWALL_CERT >> /etc/ssl/certs/ca-certificates.crt
