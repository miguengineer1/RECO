#!/bin/bash

# Function to display network statistics
show_netstat() {
    echo "Displaying network statistics with netstat:"
    netstat -tuln
}

# Function to display network usage statistics
show_vnstat() {
    echo "Displaying network usage statistics with vnstat:"
    vnstat
}

# Function to display routing table
show_route() {
    echo "Displaying routing table with route:"
    route -n
}

# Function to display interface configuration
show_ifconfig() {
    echo "Displaying network interfaces with ifconfig:"
    ifconfig -a
}

# Function to display Ethernet device settings
show_ethtool() {
    echo "Displaying Ethernet device settings with ethtool:"
    ethtool eth0
}

# Main menu function
show_menu() {
    echo "Network Information Menu"
    echo "1. Show network statistics (netstat)"
    echo "2. Show network usage (vnstat)"
    echo "3. Show routing table (route)"
    echo "4. Show interface configuration (ifconfig)"
    echo "5. Show Ethernet device settings (ethtool)"
    echo "6. Exit"
    echo -n "Choose an option: "
}

# Main program loop
while true; do
    show_menu
    read -r choice
    case $choice in
        1) show_netstat ;;
        2) show_vnstat ;;
        3) show_route ;;
        4) show_ifconfig ;;
        5) show_ethtool ;;
        6) echo "Exiting..."; break ;;
        *) echo "Invalid option, please try again." ;;
    esac
    echo ""
done
