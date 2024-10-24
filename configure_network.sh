#!/bin/bash

# Check if dialog tool is installed
if ! command -v dialog &> /dev/null; then
    echo "The 'dialog' tool is not installed. Please install it using 'sudo apt install dialog'."
    exit 1
fi

# Function to apply netplan configuration
apply_netplan() {
    sudo netplan apply
    if [ $? -eq 0 ]; then
        dialog --msgbox "Network configuration applied successfully." 5 40
    else
        dialog --msgbox "Error applying network configuration." 5 40
    fi
}

# Function to delete existing netplans
delete_existing_netplans() {
    dialog --yesno "Do you want to delete all existing netplan configurations?" 7 50
    if [ $? -eq 0 ]; then
        sudo rm -f /etc/netplan/*.yaml
        dialog --msgbox "All existing netplan configurations have been deleted." 5 50
    fi
}

# Prompt user for network interface
INTERFACE=$(dialog --inputbox "Enter the network interface (e.g., ens18):" 8 40 3>&1 1>&2 2>&3)

if [ -z "$INTERFACE" ]; then
    dialog --msgbox "No interface selected. Exiting." 5 40
    exit 1
fi

# Main menu
while true; do
    CHOICE=$(dialog --clear --backtitle "Network Configuration" \
        --title "IP Configuration" \
        --menu "Select an option:" 15 50 5 \
        1 "Delete existing netplans" \
        2 "Use DHCP" \
        3 "Set static IP" \
        4 "Exit" \
        3>&1 1>&2 2>&3)

    case $CHOICE in
        1)
            delete_existing_netplans
            ;;
        2)
            # Write DHCP configuration
            echo -e "network:\n  version: 2\n  renderer: networkd\n  ethernets:\n    $INTERFACE:\n      dhcp4: true" | sudo tee /etc/netplan/01-netcfg.yaml > /dev/null

            apply_netplan
            ;;
        3)
            # Ask user for static IP details
            IP=$(dialog --inputbox "Enter static IP address (e.g., 192.168.1.100/24):" 8 40 3>&1 1>&2 2>&3)
            GATEWAY=$(dialog --inputbox "Enter gateway (e.g., 192.168.1.1):" 8 40 3>&1 1>&2 2>&3)
            DNS=$(dialog --inputbox "Enter DNS servers (e.g., 8.8.8.8,8.8.4.4):" 8 40 3>&1 1>&2 2>&3)

            # Write static configuration
            echo -e "network:\n  version: 2\n  renderer: networkd\n  ethernets:\n    $INTERFACE:\n      dhcp4: false\n      addresses:\n        - $IP\n      gateway4: $GATEWAY\n      nameservers:\n        addresses: [$DNS]" | sudo tee /etc/netplan/01-netcfg.yaml > /dev/null

            apply_netplan
            ;;
        4)
            break
            ;;
    esac
done

clear
