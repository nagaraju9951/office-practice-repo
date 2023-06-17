if [ "$1" = "prepare" ]; then
    ansible-playbook -i inventory nginx-prepare.yml
elif [ "$1" = "deploy" ]; then
    ansible-playbook -i inventory nginx-deploy.yml
elif [ "$1" = "docker-prepare" ]; then
    ansible-playbook -i inventory docker-prepare.yml
elif [ "$1" = "docker-deploy" ]; then
    ansible-playbook -i inventory docker-deploy.yml
else
    echo "Invalid argument. Please provide either 'prepare' or 'deploy'."
    exit 1
fi

