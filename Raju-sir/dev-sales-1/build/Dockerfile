FROM --platform=linux/amd64  ubuntu/nginx:latest
RUN apt-get update && apt-get install -y vim
COPY index.html /var/www/html/index.html
ADD prestart.sh /prestart.sh
RUN chmod 765 /prestart.sh
ENTRYPOINT ["/bin/sh","-c"]
CMD ["/prestart.sh"]