#!/usr/bin/env bash
#
# This Bash script enables the user to block a list of ip addresses
# provided from a firewall blacklist file.
# Please see http://iplists.firehol.org/ for well-maintained blacklists.
#
# Usage:
#       $ ./iplist_deny.sh fireholl_level1.netset
#

filename="$1"

while read -r line; do
    name="$line"
    ufw deny from $line
done < "$filename"
