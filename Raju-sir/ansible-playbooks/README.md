# Sample Ansible playbooks



- Run playbook for all webservers

```bash
ansible-playbook -i inventory install-nginx.yaml
```

- Run playbook for only one server

```bash
ansible-playbook -i inventory deploy-webapp.yaml --limt dev-sales-ec201
```
