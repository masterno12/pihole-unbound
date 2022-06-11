From pihole/pihole:latest

RUN apt-get update && apt-get install -y unbound

 COPY pi-hole.conf /etc/unbound/unbound.conf.d/