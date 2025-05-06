#!/bin/bash 

syn=/tmp/$USER/ds/syn

SDCARD=/media/robert/6F3B-6E41

cd /packages/LabSoC/ds-files
cp uImage devicetree.dtb uramdisk.image.gz $SDCARD
cp $syn/boot.bin $SDCARD
cp $syn/run-crypto.sh $SDCARD
sync

