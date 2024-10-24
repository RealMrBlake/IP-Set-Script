# Network Configuration Script

This script allows you to configure network interfaces on an Ubuntu server using netplan. You can choose between DHCP and static IP configurations and optionally delete existing netplan configurations.

## Prerequisites

- Ensure that the `dialog` tool is installed on your system:
  
```bash
sudo apt install dialog
