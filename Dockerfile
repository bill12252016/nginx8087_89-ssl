FROM ubuntu:16.04
MAINTAINER Gary Leong <gwleong@gmail.com>

RUN apt-get update -qq && \
    apt-get install -y -qq nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    apt-get update -qq && \
    apt-get install -qq -y pwgen wget curl git-core build-essential scons devscripts lintian dh-make \
    libpcre3 libpcre3-dev libboost-dev libboost-date-time-dev libboost-filesystem-dev \
    libboost-program-options-dev libboost-system-dev libboost-thread-dev \
    libpcap-dev libreadline-dev libssl-dev rng-tools 

CMD ["/usr/sbin/nginx"]

