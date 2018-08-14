#!/bin/bash
cd /etc/apache2/sites-available

# Disable a vhost configuration
sudo a2dissite *
sudo systemctl restart apache2

## Enaple vhost configuration
sudo a2ensite *
sudo systemctl restart apache2
