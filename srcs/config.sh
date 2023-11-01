#!/bin/bash
# Get the IP address and write it to a file

# Define the network interface you want to get the IP address for
interface="enp0s31f6"  # Change this to your specific network interface

# Get the IP address using ifconfig and extract it
ip_address=$(ifconfig $interface | grep -oP 'inet \K[0-9.]+')

# Check if the IP address was found
if [ -n "$ip_address" ]; then
    echo "URL_SERVER=http://$ip_address" > ./srcs/.env.dev
    echo "IP address written to ./srcs/.env"
else
    echo "URL_SERVER=http://localhost" > ./srcs/.env.dev
    echo "IP address not found for interface $interface"
fi

