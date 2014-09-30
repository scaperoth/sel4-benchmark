##seL4 MicroKernel Build Test and Benchmarking
This repository will be used to test the seL4 microkernel. Source code can be found at the [seL4 website](seL4Home).

The best way to make use of seL4 is to download it from [their website](seL4Home). Once downloaded you can follow the steps laid out here if you'd like to have a similar envioronment. For the configuration, you can simply copy the config files. 

[seL4Home]: http://sel4.systems 

###Building a bootable USB
>For more general documentation on the seL4 microkernel, please visit the [seL4 website](seL4Home).    

The build used here uses syslinux to build a bootable USB stick. 

Assuming the flash drive is /dev/sdb and has a FAT partition at /dev/sdb1

```
install-mbr /dev/sdb   
syslinux --install /dev/sdb1   
mount /dev/sdb1 /mnt/sel4  
cp sel4test/images/sel4test-driver-image-ia32-pc99 /mnt/sel4/rootserver  
cp sel4test/images/kernel-ia32-pc99 /mnt/sel4/sel4kernel  
cat > /mnt/sel4/syslinux.cfg <<EOF  
SERIAL 0 115200  
DEFAULT seL4test  
LABEL seL4test  
	kernel mboot.c32  
    append sel4kernel --- rootserver  
EOF  
cp sel4source/mboot.c32 /mnt/sel4/  
umount /mnt/sel4/  
```

The output will be to the serial port. 

>Note: be sure that your mboot.c32 file version is from the same version as the syslinux install on your machine.

Versions of syslinux can be found [here](syslinuxlibraries) 

[syslinuxlibraries]: https://www.kernel.org/pub/linux/utils/boot/syslinux/

###Booting Using Qemu

Once you install [Qemu](qemu) you can run the provided test image (after unpacking the file) by executing
```
qemu-system-i386 -serial stdio sel4.img
```
[qemu]: http://en.wikibooks.org/wiki/QEMU/Installing_QEMU

###NOTES

*CODE LOCATIONS*

code for tests are found in apps/sel4test-tests/src/<testname>.c

the code that actually runs the test is found in libs/libsel4test/

*TIMER*

the timer mechanism or rdtsc requires that you include both:

```
#include <platsupport/arch/tsc.h>
#include <utils/time.h>
```

then call it using the ```rdtsc_pure()``` function if you would like a direct reading of the register

*TESTING*

To run your custom tests and no others (that you should `DEFINE()` for in the desired test) set a regular expression in the menuconfig under libraries -> printing library. This regular expression should be such that it will account for all your tests. For example, the tests here were all labeled CUSTOM### (the # represents some arbitrary number). The regular expression used to pull in all of these tests was simply "CUSTOM".

*CHANGES*

commented out in stage/ia32/pc99/include/vka/object.h 
and libs/libsel4vka/include/vka/object.h

~ line 49

```
//fprintf(stderr, "Failed to allocate object of size %lu, error %d\n", BIT(size_bits), error); 
```

commented out lines in ./libs/libsel4test/src/test.c

~ line 63 
~ line 94

messages to draw xml output.

commented out lines in /apps/sel4test-tests/src/main.c to remove clutter

removed backwards test run in libs/libsel4test/src/test.c on line ~ 210