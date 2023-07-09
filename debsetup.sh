#!/bin/bash

##############################################
# Update apt
apt update
apt upgrade
##############################################


##############################################
# Install core packages
apt install -y sudo curl ufw openssh-server nano git
##############################################


##############################################
# Add user to sudo 
read -p "Enter username: " debusername
usermod -aG sudo $debusername
##############################################


##############################################
# Restart ssh service
systemctl restart sshd
##############################################


##############################################
# UFW Setup
ufw default deny incoming
ufw default allow outgoing

# Open local ssh
ufw allow from 192.168.1.0/24 to any port 22 proto tcp

# Open local web access
#ufw allow from 192.168.1.0/24 to any port 80 proto tcp

# Open local DNS
#ufw allow from 192.168.1.0/24 to any port 53 proto udp
#ufw allow from 192.168.1.0/24 to any port 53 proto tcp

# Pihole FTL
#ufw allow from 127.0.0.1 to any port 4711 proto tcp
#ufw allow from 127.0.0.0/8 to any port 4711 proto tcp

# Samba ports
ufw allow from 192.168.1.0/24 to any port 137 proto udp
ufw allow from 192.168.1.0/24 to any port 138 proto udp
ufw allow from 192.168.1.0/24 to any port 139 proto tcp
ufw allow from 192.168.1.0/24 to any port 445 proto tcp

#reload
ufw reload
ufw enable
##############################################
