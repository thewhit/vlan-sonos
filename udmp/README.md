# Unifi Dream Machine Pro

https://nerdygeek.uk/2020/06/09/a-tip-for-sonos-and-unifi-udm-pro-users/

`podman run --rm -it --network=host -e OPTS="--verbose --noMDNS" -e INTERFACES="br2 br20" docker.io/scyto/multicast-relay`

`podman run -d --restart=always --network=host -e OPTS="--noMDNS" -e INTERFACES="br2 br20" docker.io/scyto/multicast-relay`


On boot: https://github.com/unifi-utilities/unifios-utilities/tree/main/on-boot-script
