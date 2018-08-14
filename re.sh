#!/bin/bash

CONFIG="$1"
COMMAND="$2"

if [ "$#" -ne 2 ]
then
    echo "$0 requires two paramters {virtual-host} {restart|reload}"
    exit 1
fi

# reload is allowed
if [ "$COMMAND" == "reload" ] || [ "$COMMAND" == "restart" ]
then
    # Move the current execution state to the proper directory
    cd /etc/apache2/sites-available

    # Disable a vhost configuration
    sudo a2dissite "$CONFIG"
    sudo systemctl "$COMMAND" apache2

    ## Enaple vhost configuration
    sudo a2ensite "$CONFIG"
    sudo systemctl "$COMMAND" apache2
else
    echo "ERROR: $COMMAND is not a vailid systemctl command {restart|reload}"
    exit 1
fi