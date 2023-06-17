#!/bin/bash

if [ "$1" = "nginx-prepare" ]; then
    ansible-playbook -i inventory ngnix-prepare.yml
elif [ "$1" = "mginx-deploy" ]; then
    ansible-playbook -i inventory ngnix-deploy.yml
elif [ "$1" = "docker-prepare" ]; then
    ansible-playbook -i inventory docker-prepare.yml
elif [ "$1" = "docker-deploy" ]; then
    ansible-playbook -i inventory docker-deploy.yml
else
    echo "Invalid argument. Please provide either 'prepare' or 'deploy'."
    exit 1
fi
