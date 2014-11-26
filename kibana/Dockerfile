FROM debian:jessie
MAINTAINER Rick Peters <rick.peters@kadaster.nl>

# prepare apt-get to work behind a proxy
RUN echo "Acquire::http::Proxy \"http://www-proxy.cs.kadaster.nl:8082\";" > /etc/apt/apt.conf

# perform proxy settings
ENV http_proxy  www-proxy.cs.kadaster.nl:8082
ENV https_proxy www-proxy.cs.kadaster.nl:8082
ENV ftp_proxy   www-proxy.cs.kadaster.nl:8082
ENV no_proxy    127.0.0.1, localhost, .so.kadaster.nl, .cs.kadaster.nl

RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y nginx-full wget

# get kibana package, ignore certificate checking due to proxy resigning§
RUN wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz --no-check-certificate -O /tmp/kibana.tar.gz && \
    tar zxf /tmp/kibana.tar.gz && mv kibana-3.1.2/* /usr/share/nginx/html

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD run.sh /usr/local/bin/run

EXPOSE 80

CMD ["/usr/local/bin/run"]
