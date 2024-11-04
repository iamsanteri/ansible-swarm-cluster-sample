#!/bin/bash

# Define the hosts
HOSTS=("37.27.208.198" "135.181.105.140" "95.217.132.32")

# Loop through each host and update the known_hosts file
for HOST in "${HOSTS[@]}"; do
    echo "Updating known_hosts for $HOST"
    ssh-keygen -R $HOST
    ssh-keyscan -H $HOST >> ~/.ssh/known_hosts
done
