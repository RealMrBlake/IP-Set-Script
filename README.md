Hier ist die aktualisierte README-Datei mit einem detaillierten Abschnitt zur Nutzung des Skripts:

```markdown
# Network Configuration Script

This script allows you to configure network interfaces on an Ubuntu server using netplan. You can choose between DHCP and static IP configurations and optionally delete existing netplan configurations.

## Prerequisites

- Ensure that the `dialog` tool is installed on your system:

  ```bash
  sudo apt install dialog
  ```

## Installation

1. Clone the repository or download the script to your local machine.

2. Make the script executable:

   ```bash
   chmod +x configure_network.sh
   ```

## Usage

1. Run the script:

   ```bash
   ./configure_network.sh
   ```

2. **Select Network Interface**: You will be prompted to enter the name of the network interface you wish to configure (e.g., `ens18`).

3. **Main Menu Options**:
   - **Delete Existing Netplans**: Choose this option if you want to remove all existing netplan configurations.
   - **Use DHCP**: Select this to configure the interface to use DHCP for automatic IP address assignment.
   - **Set Static IP**: Enter the static IP address, gateway, and DNS servers when prompted to configure the interface with a static IP.
   - **Exit**: Exit the script.

4. Follow the on-screen instructions for each option you select.

## Features

- **Delete Existing Netplans**: Optionally remove all existing netplan configurations.
- **DHCP Configuration**: Set your network interface to use DHCP.
- **Static IP Configuration**: Manually set a static IP address, gateway, and DNS servers.

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License.
```

In dieser README-Datei wird der Abschnitt "Usage" detailliert beschrieben, wie das Skript verwendet wird, einschließlich der Schritte zur Auswahl der Netzwerkschnittstelle und der verfügbaren Menüoptionen. Dies sollte den Benutzern helfen, das Skript effizient zu nutzen.
