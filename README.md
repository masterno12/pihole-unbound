# Use Pi-hole as a recursive DNS server solution with Unbound
This image is base on the official [Pi-Hole](https://hub.docker.com/r/pihole/pihole) image with a recursive flavour.

## Quick Start

1. Copy docker-compose.yml and update as needed.

```yaml
version: "3"

# More info at https://github.com/pi-hole/docker-pi-hole/ and https://docs.pi-hole.net/
# More info at https://github.com/masterno12/pihole-unbound
services:
  pihole:
    container_name: pihole
    image: masterno12/pihole-unbound:latest
    # For DHCP it is recommended to remove these ports and instead add: network_mode: "host"
    ports:
      - "53:53/tcp"
      - "53:53/udp"
      - "67:67/udp" # Only required if you are using Pi-hole as your DHCP server
      - "80:80/tcp"
    environment:
      TZ: 'America/Montreal'
      PIHOLE_DNS_: '127.0.0.1#5335'
      # WEBPASSWORD: 'set a secure password here or it will be random'
    # Volumes store your data between container upgrades
    volumes:
      - './etc-pihole:/etc/pihole'
      - './etc-dnsmasq.d:/etc/dnsmasq.d'    
    #   https://github.com/pi-hole/docker-pi-hole#note-on-capabilities
    cap_add:
      - NET_ADMIN # Required if you are using Pi-hole as your DHCP server, else not needed
    restart: unless-stopped
```

## Link
Docker Hub image page :
https://hub.docker.com/r/masterno12/pihole-unbound
