#!/bin/bash

# Function to check if a specific port is open and identify the service
check_port() {
    local port=$1
    echo "Checking port $port..."

    # Check if the port is open using netstat
    if nmap -p $port 127.0.0.1 > /dev/null 2>&1; then
        # Get the service name associated with the port
        service_name=$(nmap -p $port 127.0.0.1 -oG - | grep "Ports")
        echo "Port $port is open."
        if [ -n "$service_name" ]; then
            echo "Service running on port $port: $service_name"
        else
            echo "No service information available for port $port."
        fi
    else
        echo "Port $port is not open."
    fi
}

# Main script
echo "Enter the port number you want to check:"
read -r port_number

# Call the function to check the specified port
check_port "$port_number"
