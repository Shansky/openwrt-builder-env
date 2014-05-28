openwrt-builder-env
===================

Building environment for openwrt

Default it's prepared for virtualbox provider in vagrant. Default machine params - cpus: 2 memory: 2048


Working directory is under /opt/
------------------
```sh
vagrant@default:~$ ls /opt/
attitude_adjustment
```
if you want you can update svn repository using ```svn up``` under repository directory.
Make magic
------------------
```sh
vagrant@default:/opt/attitude_adjustment$ make package/symlinks
vagrant@default:/opt/attitude_adjustment$ make menuconfig
vagrant@default:/opt/attitude_adjustment$ make -j2
```
Make effects
------------------
```sh
vagrant@default:/opt/attitude_adjustment$ cd bin/malta/
vagrant@default:/opt/attitude_adjustment/bin/malta$ ls
md5sums  openwrt-malta-be-vmlinux.elf  packages
```

Move effects to host system
------------------
```sh
vagrant@default:/opt/attitude_adjustment/bin/malta$ cp openwrt-malta-be-vmlinux.elf /vagrant/
```

Testing using QEMU
------------------
I chose MIPS Malta CoreLV board (qemu) as the TARGET. I also chose Big Endian as my target platform is a Big Endian MIPS(AR71xx). (step: ```make menuconfig```)
```sh
somepathunderhost/openwrt-builder-env$ qemu-system-mips -kernel openwrt-malta-be-vmlinux.elf -nographic -m 64
```
To get off QEMU use CTRL-A c and using command ```quit```

More about
------------------
[Vagrant](http://www.vagrantup.com/)

[Building OpenWRT](http://www.thepowerbase.com/2012/01/openwrt-build-guide-start-to-finish/)

[OpenWRT under QEMU](http://fosiao.com/content/running-openwrt-under-qemu)
[OpenWRT under QEMU and freebsd](http://grenville.wordpress.com/2013/01/06/openwrt-under-qemu-on-freebsd/)

[Linux mips with QEMU](http://www.linux-mips.org/wiki/QEMU)
[Manuals for QEMU](http://wiki.qemu.org/Manual)