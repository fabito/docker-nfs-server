#!/bin/bash

set -e

mounts="${@}"

for mnt in "${mounts[@]}"; do
  src=$(echo $mnt | awk -F':' '{ print $1 }')
  echo "$src *(rw,all_squash,insecure)" >> /etc/exports
done

exec runsvdir /etc/sv
