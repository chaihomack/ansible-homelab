## fast infrastructure description
That is isolated network for web application servers

#### Hosts description
Gateway:
  `DHCP server`
  `apt cacher`
  `Nginx load balancer` _(temportary removed)_ 

Two web application servers: 
  `currently without actual application, just a dummy index.html`

Database server:
  `postgreSQL database`

#### Main roles
nginx_docker _(temportary removed)_: 
  `launches nginx with web application inside a docker container`

app_db: 
    `Creates databases and tables for it`
    `Configures /etc/postgresql server parameters`
  
dhcp_srv: 
  `Configures dnsmasq DHCP server`
  
#### General purpose roles
user role:
  `currently there is only task for creating user with password and ssh`
  `public key in ~/.ssh on remote host by using admin account`

devpi_server:
  `something like apt cacher but for pip`

apt_proxy:
  `adds configuration for using apt cacher to apt.conf.d/99proxy`

zabbix_agent2 role:
  `installs and configures zabbix agent`

common role:
  `installs common packages, updates, upgrades the system` 
  `and managing reboots when necessary`

security role:
  `fail2ban, ssh and UFW configurations`


### dev note
remember to use devpi server for installing python modules via pip.
example: 
```shell
pip install -i http://192.168.56.1:3141/root/pypi --trusted-host 192.168.56.1 simplejson

remember about apt-cacher-ng on gateway
remember about docker registry that works like proxy to dockerhub on gateway 
```