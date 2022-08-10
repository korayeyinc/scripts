#!/usr/bin/env bash
#
# certgen.sh - a simple Bash script for generating self-signed certificates
#
# Usage:
#       $ ./certgen.sh
#


openssl req \
   -newkey rsa:2048 -nodes -keyout domain.key \
   -x509 -days 365 -out domain.crt


if [ -f 'domain.key' ] && [ -f 'domain.crt' ]; then
    echo '[info] Successfully generated "domain.key and domain.crt" certificate files!'
else
    echo '[info] Failed to create certificates!' && exit
fi
