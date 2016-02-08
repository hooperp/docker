#!/bin/bash
set -e

service sshd start

ssh-keygen -t rsa -b 2048 -f /root/.ssh/id_rsa -N ''

mkdir -m 700 -p $HOME/.ssh

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfBrz3PpgD6eVrdR9ug6y6G0/FM2zvRDXUd3ficx7LN64COgzD/0O/OX6TG6SXmbbqTMoE2Hvv1E59cgGr6tLUlAoJrpUl2E/ZQEUPdBvbVJK2AHOZY7X7bq36mN7ovcfUK+FjYs9v22LFxe64b6U49r4U2QVe6lF7ltDcD6eTtXPlg4FIwCwt0EPPlOD6q/wqOsQpVigjFZb5iej0k9HT3qCqV4ZKD/1Yin60n78AXQLUsNGLq1jP7pVkYKZTTpP8GGawHI22qCcjZn2XgAQIys4/EabyCst/02rzOMjng2Lw1Y0ZxKzK1kejcJB8PnAE3+ZdoTU87vvSrd6OLn1l phooper0001@yahoo.com" >> /root/.ssh/authorized_keys

chmod 600 /root/.ssh/authorized_keys


if [ "$1" = 'tomcat' ]; then
    /opt/tomcat/bin/catalina.sh run
fi

exec $@
