# docker-squid-dnsmasq

 docker build -t "{tagname}" .
 
 docker run --rm -it -p 3128:3128 -e WANIP={TargetIP} {tagname}
 
 docker run --rm -d -p 3128:3128 -e WANIP={TargetIP} {tagname}
