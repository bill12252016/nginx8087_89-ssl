FROM ubuntu:16.04
MAINTAINER Gary Leong <gwleong@gmail.com>

RUN apt-get update -qq > /dev/null && \
    apt-get install -qq -y nginx > /dev/null && \
    apt-get clean > /dev/null && \
    rm -rf /var/lib/apt/lists/*

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD sites-enabled/ /etc/nginx/sites-enabled/

#ADD app/ /app/
ADD snippets/ /etc/nginx/snippets/

RUN mkdir -p /etc/ssl/certs

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    apt-get update -qq > /dev/null && \
    apt-get install -qq -y pwgen wget curl git-core build-essential scons devscripts lintian dh-make \
    libpcre3 libpcre3-dev libboost-dev libboost-date-time-dev libboost-filesystem-dev \
    libboost-program-options-dev libboost-system-dev libboost-thread-dev \
    libpcap-dev libreadline-dev libssl-dev rng-tools > /dev/null 

RUN openssl req -newkey rsa:2048 -new -x509 -subj "/C=US/ST=California/L=SanFrancisco/O=Dis/CN=www.selfsigned.com" -days 1024 -nodes -out /etc/ssl/certs/nginx.crt -keyout /etc/ssl/certs/nginx.key && \
    bash -c 'cat /etc/ssl/certs/nginx.crt /etc/ssl/certs/nginx.key > /etc/ssl/certs/nginx.pem'

RUN openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

EXPOSE 8089 8087

#CMD ["nginx", "-g", "daemon off;"]
CMD ["/usr/sbin/nginx"]

