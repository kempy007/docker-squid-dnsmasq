# docker-squid-dnsmasq

Purpose of this container is to redirect all domain names to target IP and is used for testing and lab exercises, which is why dnsmasq and squid were used.

 docker build -t "{tagname}" .
 
 docker run --rm -it -p 3128:3128 -e WANIP={TargetIP} {tagname}
 
 docker run --rm -d -p 3128:3128 -e WANIP={TargetIP} {tagname}
