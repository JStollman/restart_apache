#!/bin/bash

CONFIG="$1"
COMMAND="$2"

if [ "$#" -ne 2 ]
then
    echo "$0 requires two paramters {virtual-host} {restart|reload}"
    exit 1
fi

cd /etc/apache2/sites-available

# Disable a vhost configuration
sudo a2dissite "$CONFIG"
sudo systemctl "$COMMAND" apache2

## Enaple vhost configuration
sudo a2ensite "$CONFIG"
sudo systemctl "$COMMAND" apache2
