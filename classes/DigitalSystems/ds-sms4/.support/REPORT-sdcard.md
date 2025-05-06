

```
ds_sms4=$HOME/Developer/ds-sms4
syn=/tmp/$USER/ds/syn
mkdir -p $syn
cd $syn
vivado -mode batch -source ${ds_sms4}/vhdl/project/crypto.syn.tcl -notrace
```


- [ ] Synthesis

```
cd $syn
cp /packages/LabSoC/ds-files/fsbl.elf .
cp /packages/LabSoC/ds-files/u-boot.elf .
bootgen -w -image ${ds_sms4}/vhdl/boot.bif -o boot.bin
cp ${ds_sms4}/bin/run-crypto.sh .
```


Mount the micro SD card on a computer and define a shell variable that points to it:

```
SDCARD=/media/robert/6F3B-6E41
```


If your micro SD card does not yet contain the software components of the DigitalSystems reference design, prepare it:


```
cd /packages/LabSoC/ds-files
cp uImage devicetree.dtb uramdisk.image.gz $SDCARD
```


Copy the new boot image to the micro SD card:

```
cp $syn/boot.bin $SDCARD
cp $syn/run-crypto.sh $SDCARD
sync
```


## Interact

```
picocom -b115200 /dev/ttyUSB1
```

```
devmem -h
```

```
/media/sdcard/run-crypto.sh
```

- [ ] devmem 

* Reset and enable crypto engine

- write in control register 44: devmem 0x4000002C 32 3
- write in control register : devmem 0x4000002C 32 2

* populate key register

- write in K : devmem 0x40000000 64 0x0123456789ABCDEF 
- write in K : devmem 0x4000000f 64 0xFEDCBA9876543210

* populate plain text register

- write in ICB : devmem 0x40000010 64 0x0123456789ABCDEF 
- write in ICB : devmem 0x4000001f 64 0xFEDCBA9876543210

* Launch encryption

- write in STATUS: devmem 0x40000030 32 0x1

* Test status (should read 0x1)

- read in STATUS: devmem 0x40000030 32 

* Read the value

- read in custom register : devmem 0x40000034 64
- read in custom register : devmem 0x40000043 64



# References

- [ ] [lab09](https://gitlab.eurecom.fr/renaud.pacalet/ds/-/tree/master/vhdl/lab09)
