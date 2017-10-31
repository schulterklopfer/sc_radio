FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y jackd1 jack-tools icecast2 darkice supercollider xvfb && \
    apt-get clean

COPY asoundrc /root/.asoundrc

COPY icecast.xml /etc/icecast2/icecast.xml
COPY darkice.cfg /etc/darkice.cfg

COPY startup.scd /root/.config/SuperCollider/startup.scd
COPY radio.sc /radio.sc

EXPOSE 8000

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["stream"]
