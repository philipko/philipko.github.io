RancherOS Note
=======

Docs
----------

[RancherOS Documentation](https://rancher.com/docs/os/v1.x/en/)
[RancherOS github](https://github.com/rancher/os)


System Block
----------

![](https://rancher.com/docs/img/os/rancheroshowitworks.png)

cloud-config.yml example
----------

* sudo ros config validate -i cloud-config.yml
* sudo ros install -c cloud-config.yml -d /dev/sda

```
#cloud-config

rancher: rancheros
  network:
    interfaces:
      eth0:
        address: 10.68.69.92/24
        gateway: 10.68.69.1
        mtu: 1500
        dhcp: false
    dns:
      nameservers:
      - 1.1.1.1
      - 8.8.4.4

ssh_authorized_keys:
  - ssh-rsa <YOUR KEY>  

```


Commands
----------


```
udo system-docker ps

```

Install Proxmox, RancherOS, in a VM with Rancher 2.0 and Portainer
----------

[Install Proxmox, RancherOS, in a VM with Rancher 2.0 and Portainer](https://gist.github.com/mow4cash/a57e893fc640ccf3720e99fc6b3b879a)

