#!/bin/bash

if [ "$1" = "prepare" ]; then
    ansible-playbook -i inventory ngnix-prepare.yml
elif [ "$1" = "deploy" ]; then
    ansible-playbook -i inventory ngnix-deploy.yml
else
    echo "Invalid argument. Please provide either 'prepare' or 'deploy'."
    exit 1
fi
