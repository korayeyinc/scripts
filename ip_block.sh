#!/usr/bin/env bash

filename="$1"

while read -r line; do
    name="$line"
    iptables -A INPUT -s $line -j DROP
done < "$filename"
