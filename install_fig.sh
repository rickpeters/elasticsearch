export https_proxy="www-proxy.cs.kadaster.nl:8082"
curl -L --insecure https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` > /usr/local/bin/fig; chmod 755 /usr/local/bin/fig
