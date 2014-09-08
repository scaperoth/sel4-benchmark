##seL4 MicroKernel Build Test and Benchmarking
This repository will be used to test the seL4 microkernel. Source code can be found at the [seL4 website](seL4Home).

[seL4Home]: http://sel4.systems 

###Building a bootable USB
>For more general documentation on the seL4 microkernel, please visit the [seL4 website](seL4Home).    

The build used here uses syslinux to build a bootable USB stick. 

Assuming the flash drive is /dev/sdb and has a FAT partition at /dev/sdb1

```
install-mbr /dev/sdb   
syslinux --install /dev/sdb1   
mount /dev/sdb1 /mnt/sel4  
cp seL4test/images/sel4test-driver-image-ia32-pc99 /mnt/sel4/rootserver  
cp seL4test/images/kernel-ia32-pc99 /mnt/sel4/sel4kernel  
cat > /mnt/sel4/syslinux.cfg <<EOF  
SERIAL 0 115200  
DEFAULT seL4test  
LABEL seL4test  
	kernel mboot.c32  
    append sel4kernel --- rootserver  
EOF  
cp <your path to your syslinux folder install>/mboot.c32 /mnt/sel4/  
umount /mnt/sel4/  
```

The output will be to the serial port. 

>Note: be sure that your mboot.c32 file version is from the same version as the syslinux install on your machine.

Versions of syslinux can be found [here](syslinuxlibraries)

[syslinuxlibraries]: https://www.kernel.org/pub/linux/utils/boot/syslinux/