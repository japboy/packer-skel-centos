packer-skel-centos
==================

My initial Packer skeleton with [CentOS 7.0 minimal](http://ftp.riken.jp/Linux/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-Minimal.iso).

Requirements
------------

* [VirtualBox](https://www.virtualbox.org/) v4.3.14 or later
* [Packer](http://www.packer.io/) v0.6.0 or later

Build
-----

```
packer build template.json
```

Note
----

CentOS 7.0 now use [Consistent Network Device Naming](http://en.wikipedia.org/wiki/Consistent_Network_Device_Naming) for its network devices. This cause side effects to Vagrant and will be resolved in next release of Vagrant (later than v1.6.3). Currently Vagrant users have to install a monkey patch plugin to avoid this bug:

```
vagrant plugin install vagrant-centos7_fix
```

* [vStone/vagrant-centos7_fix](https://github.com/vStone/vagrant-centos7_fix)

License
-------

Distributed under [Unlicense](http://unlicense.org/)
