## Linux Practice
<details>
<summary> File Management</summary>
    <br/>
    
**Read/Write files and folders**
```bash
ls
ls -ltr
ll
mkdir helloworld
cd helloworld
touch README.md
touch sample.txt
vi sample.txt
```
**Read content of files**
```bash
cat README.txt 
more README.txt 
tail -f README.txt
tail -100f README.txt
tail -10f README.txt
```
**Copy fiels and directories**
```bash
# Copy a file to other directory
cp sample.txt Documents
# Copy a directory to other directory
cp -r logs Documents
```
**Crate a copy of fiels and directories**
```bash
# Create a copy of file
cp sample.txt sample_v2.txt
# Create a copy of directory
cp -r logs logs_bkp
```
**Move files and directories to other location**
```bash
# Move a fileto other location
mv sample.txt Documents
# Move a directory to other location
mv logs Documents
```
**Rename fiels and directories**
```bash
# Rename a file
mv sample.txt important.txt
# Rename a directory
mv logs logs_bkp
```
**Find a file**
```bash
find ./ -name sample.txt
locate sample.txt
```
**List of file names containing a given text**
```bash
find ./ -type f -exec grep -l "Apache License" {} \; 
```
**List the files older than 7 days**
```bash
find /var/log/nginx -type f -mtime +7 -exec ls -ltr {} \;
```
**List the files older than 2 hours**
```bash
find /var/log/nginx -type f -mmin +120 -exec ls -ltr {} \;
```
**Move 7 days old files to another directory**
```bash
find /var/log/nginx/ -mtime +7 -name "*.log" -exec mv "{}" /var/log/nginx_backup/ \;',
```
**Compress 7 days old files**
```bash
find /var/log/nginx/ -mtime +7 -name "*.log" -exec gzip "{}" \;',
```
**Delete 7 days old files**
```bash
find /var/log/nginx/ -mtime +7 -name "*.log" -exec rm "{}" \;',
```
**Compress the files that were genereated before 01-March-2023**

```bash
touch -t 202303010000 /tmp/2023-Mar-01-0000
find /var/log/nginx -type f ! -newer /tmp/2023-Mar-01-0000 | xargs gzip
```
**Remove files that were genereated before 01-Jan-2023**
```bash
touch -t 202301010000 /tmp/2023-Jan-01-0000
find /var/log/nginx -type f ! -newer /tmp/2023-Jan-01-0000 | xargs rm
```
</details>

<details>
<summary>User Management</summary>
    <br/> 
    
**Create Linux User with home directory**

```bash
sudo useradd -s /bin/bash -d /home/nag -m nag
```
**Set password for nag**

```bash
sudo passwd nag
```
**Delete nag user**

```bash
sudo userdel nag
```

**Enable root user password login**
```bash
#!/bin/bash
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo service sshd restart
sudo sudo su -
echo 'root:mankdhur567Q' | chpasswd
```
</details>

<details>
<summary>Access Management</summary>
     <br/>
 
**Connect to remote server**
 
```bash 
ssh -i "test-ec2.pem" ubuntu@ec2-18-208-248-114.compute-1.amazonaws.com
```
</details>

<details>
<summary>Configuration Management</summary>
 <br/>
 
**Install Nginx Webserver and deploy Index.html**
 
```bash 
sudo apt update
sudo apt upgrade -y
sudo apt install nginx -y
cd /var/www/html/
touch index.html
sudo vi index.html
sudo systemctl restart nginx
sudo systemctl status nginx
```

**Configure Hostname**
```bash
#!/bin/bash
sudo hostnamectl set-hostname myappserver01 --static
sudo hostnamectl set-hostname myappserver01 --transient
sudo echo -e "preserve_hostname: true" >> /etc/cloud/cloud.cfg
sudo systemctl reboot
``` 

**Configure Jenkins Agent**
```bash
sudo apt update 
sudo apt upgrade -y 
sudo apt install default-jdk -y
sudo mkdir -p /opt/jenkins
sudo chmod 777 /opt/jenkins/
curl -sO https://deploy.cloudavise.com/jnlpJars/agent.jar
java -jar agent.jar -jnlpUrl https://deploy.cloudavise.com/manage/computer/t060%2Drunner/jenkins-agent.jnlp -secret <yoursecret> -workDir "/opt/jenkins"
nohup java -jar agent.jar -jnlpUrl https://deploy.cloudavise.com/manage/computer/t060%2Drunner/jenkins-agent.jnlp -secret <yoursecret> -workDir "/opt/jenkins" &
ls -ltr
tail -f nohup.out 
```
</details>

## AWS CLI


<details>
<summary>CLI Commands</summary>
    <br/> 
    
**Store AWS credentials in command line**

```bash
aws configure
```
(or)
    
**Export AWS credentials in command line**
```bash
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-east-1
```

 **Describe EC2 Instances**
```bash
aws ec2 describe-instances
```
**List S3 Buckets**
```bash
aws s3 ls
```
**Create an S3 Bucket**

```bash
aws s3api create-bucket --bucket test-bucket-948489282 --region us-east-1
```
**Delete an S3 Bucket**
```bash
aws s3api delete-bucket --bucket test-bucket-948489282 --region us-east-1
```
**Create an EC2 Instance**
```bash
aws ec2 run-instances --image-id ami-007855ac798b5175e --count 1 --instance-type t2.micro --key-name test-ec2 
```
**Delete an EC2 Instance**
```bash
aws ec2 terminate-instances --instance-ids i-394jd83kdujd83jdh7
```
**Copy files to s3 bucket**

```bash 
aws s3api create-bucket --bucket raju-us-east-1-demos3 --region us-east-1
aws s3 cp nginx.log s3://raju-us-east-1-demos3/ec2data/
aws s3 cp nginx.log s3://raju-us-east-1-demos3
```
**Copy folders to s3 bucket**

```bash   
aws s3 cp --recursive logs s3://raju-us-east-1-demos3
```
:bulb: Refer [AWS Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html) for more details
</details>

## Docker

<details>
<summary>CLI Commands</summary>
 <br/>
 
**Manager Docker Images and Containers**
 
```bash
docker images
docker pull nginx
docker images
docker run --name docker-nginx -p 80:80 nginx
docker run --name docker-nginx -p 80:80 -d nginx
docker ps -a 
docker rm 15748c592407 22f7a8be6d72 7a31e0f8f07a 9cefe4632514
docker run --name docker-nginx -p 80:80 -d nginx
docker ps -a
docker run --name test-nginx -p 8000:80 -d nginx
docker run --name dev-nginx -p 8001:80 -d nginx
docker run --name prod-nginx -p 8005:80 -d nginx
docker exec -it test-nginx /bin/bash
docker stop docker-nginx test-nginx dev-nginx myapp mydevapp
docker stop prod-nginx
docker rm mydevapp myapp prod-nginx dev-nginx test-nginx docker-nginx
docker images
docker rmi 806f89a70ff8 263083118061 080ed0ed8312 e499797894d5
docker run hello-world
docker logs hello-world 
```
    
**Create Docker swarm cluster in master node**

```bash
docker swarm init
```

**Join worker nodes to Docker swarm cluster**

```bash
docker swarm join --token SWMTKN-1-2hyn8v3qytkz23vlsd9or92n9843ugyjy45qhqoknmibj9599c-bo27ga0u57qql3jijku4i5m09 10.7.2.102:2377
```

**Create and manage services in Docker swarm cluster**

```bash
docker node ls
docker service create   --name blue-service   --publish published=8081,target=8080  --replicas 6 ynraju4/srv-blue:6
docker ps
docker service rm green-service
docker ps
docker service scale green-service=4
```
</details>

## Ansible

<details>
<summary>CLI Commands</summary>
 <br/>
 
 **Validate SSH for all servers in one group**
```bash    
ansible -i inventory all -m ping
```  
 **Validate SSH for one server in one group**
```bash    
ansible -i inventory webservers -m ping --limit webserver01
```  
 **Run Ansible playbook for all servers in one group**
```bash    
ansible-playbook -i inventory install-docker.yaml
```  
 **Run Ansible playbook for one server in one group**
```bash    
ansible-playbook -i inventory install-docker.yaml --limit webserver01
```  
 
**Encrypt files with ansible-vault**
```bash    
ansible-vault encrypt --vault-id $HOME/.secrets/vault_id dev-sales-ssh.pem
ansible-vault decrypt --vault-id $HOME/.secrets/vault_id dev-sales-ssh.pem
```  
</details>
