FROM dockerfile/elasticsearch
MAINTAINER Rick Peters <rick.peters@kadaster.nl>

# this image enhances the default elasticsearch image so it will function behind the kadaster proxy

# prepare apt-get to work behind a proxy
RUN echo "Acquire::http::Proxy \"http://www-proxy.cs.kadaster.nl:8082\";" > /etc/apt/apt.conf

# perform proxy settings
ENV http_proxy  www-proxy.cs.kadaster.nl:8082
ENV https_proxy www-proxy.cs.kadaster.nl:8082
ENV ftp_proxy   www-proxy.cs.kadaster.nl:8082
ENV no_proxy    127.0.0.1, localhost, .so.kadaster.nl, .cs.kadaster.nl

# proxy setting for JVM
ENV ES_JAVA_OPTS -Dhttp.proxyHost=www-proxy.cs.kadaster.nl -Dhttp.proxyPort=8082

# installing a plugin doesn't work since this is on the data volume
# and won't be persisted in the image
# installing the plugin has been moved to the preparenodes script
# by unzipping the marvel plugin in the correct location
#
# RUN /elasticsearch/bin/plugin -i elasticsearch/marvel/latest
