FROM alpine:latest

COPY entrypoint.sh /entrypoint.sh

RUN apk add --no-cache dnsmasq inotify-tools squid curl && \
        chown -R squid:squid /var/cache/squid && \
        chown -R squid:squid /var/log/squid && \
        chmod +x /entrypoint.sh && \
        squid -z && \
        rm -rf /var/cache/apk/*


#CMD ["dnsmasq", "-k", "-q"]

EXPOSE 3128

#ENTRYPOINT ["/usr/sbin/squid","-NYCd","1"]
#ENTRYPOINT ["/start-squid.sh"]

ENTRYPOINT ["/entrypoint.sh"]
