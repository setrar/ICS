#!/bin/sh

#root@ds> /media/sdcard/run-crypto.sh
#root@ds> devmem -h

# Reset and enable crypto engine
devmem 0x2C 32 3
devmem 0x2C 32 2


# populate key register
devmem 0x0 64 0x0123456789ABCDEF
devmem 0x8 64 0xFEDCBA9876543210


# populate plain text register
devmem 0x10 64 0x0123456789ABCDEF
devmem 0x18 64 0xFEDCBA9876543210


# Launch encryption: write in STATUS:
devmem 0x30 32 0x1

# Test status (should read 0x1)
sleep 1
devmem 0x30 32

# Read the value in custom register
devmem 0x34 64
devmem 0x3C 64
