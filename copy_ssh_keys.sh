#!/bin/bash

# Define the path to your hosts file
HOSTS_FILE="hosts"

# Extract the IP addresses from the hosts file
HOSTS=$(grep -Eo 'ansible_host=[0-9.]*' $HOSTS_FILE | cut -d '=' -f 2)

# Loop through each host and copy the SSH key
for HOST in $HOSTS; do
    echo "Copying SSH key to $HOST"
    ssh-copy-id -o StrictHostKeyChecking=no ansible@$HOST
done
