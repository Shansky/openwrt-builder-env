openwrt-builder-env
===================

Building environment for openwrt

Default it's prepared for virtualbox provider in vagrant. Machine params - cpu: 2 memory: 2048


Working directory is under /opt/
------------------
```sh
vagrant@default:~$ ls /opt/
attitude_adjustment
```
if you want you can update svn repository using ```svn up```
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
I chose MIPS Malta CoreLV board (qemu) as the TARGET. I also choose Big Endian as my target platform is a Big Endian MIPS(AR71xx). (step: ```make menuconfig```)
```sh
some/path/to/this/repo/openwrt-builder-env$ qemu-system-mips -kernel openwrt-malta-be-vmlinux.elf -nographic -m 64
```
To get off QEMU use CTRL-A c and type ```quit```
