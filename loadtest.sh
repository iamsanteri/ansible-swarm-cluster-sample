#!/bin/bash

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# Array of node IPs
NODES=(
    "37.27.208.198"
    "135.181.105.140"
    "95.217.132.32"
)

echo "Starting Docker Swarm load balance test..."

for node in "${NODES[@]}"; do
    echo -e "\n${GREEN}Testing node: $node${NC}"
    for i in {1..5}; do
        timestamp=$(date "+%H:%M:%S")
        response=$(curl -s "http://$node" | tr -d '\n' | sed -n 's/.*<p>Node ID: \([^<]*\)<\/p>.*/\1/p')
        
        if [ ! -z "$response" ]; then
            echo -e "[${BLUE}$timestamp${NC}] Request $i: Served by ${GREEN}$response${NC}"
        else
            echo -e "[${BLUE}$timestamp${NC}] Request $i: ${RED}Failed to get response${NC}"
        fi
        
        sleep 1
    done
done

echo -e "\nTest complete."
