

```
export UHD_HOME=/opt/local/share/uhd
```

```
uhd_find_devices
```
> Returns
```powershell
[INFO] [UHD] Mac OS; Clang version 15.0.0 (clang-1500.0.40.1); Boost_107100; UHD_3.15.0.0-MacPorts-Release
[INFO] [B200] Loading firmware image: /opt/local/share/uhd/images/usrp_b200_fw.hex...
--------------------------------------------------
-- UHD Device 0
--------------------------------------------------
Device Address:
    serial: 31F59F4
    name: B205i
    product: B205mini
    type: b200
```

```
$UHD_HOME/examples/gpio
```
> Returns
```powershell
Creating the usrp device with: ...
[INFO] [UHD] Mac OS; Clang version 15.0.0 (clang-1500.0.40.1); Boost_107100; UHD_3.15.0.0-MacPorts-Release
[INFO] [B200] Detected Device: B205mini
[INFO] [B200] Loading FPGA image: /opt/local/share/uhd/images/usrp_b205mini_fpga.bin...
[INFO] [B200] Operating over USB 3.
[INFO] [B200] Initialize CODEC control...
[INFO] [B200] Initialize Radio control...
[INFO] [B200] Performing register loopback test... 
[INFO] [B200] Register loopback test passed
[INFO] [B200] Setting master clock rate selection to 'automatic'.
[INFO] [B200] Asking for clock rate 16.000000 MHz... 
[INFO] [B200] Actually got clock rate 16.000000 MHz.
Using Device: Single USRP:
  Device: B-Series Device
  Mboard 0: B205mini
  RX Channel: 0
    RX DSP: 0
    RX Dboard: A
    RX Subdev: FE-RX1
  TX Channel: 0
    TX DSP: 0
    TX Dboard: A
    TX Subdev: FE-TX1

Initial GPIO values:
       Bit  10  9  8  7  6  5  4  3  2  1  0
      CTRL:  1  1  1  1  1  1  1  1  1  1  1
       DDR:  0  0  0  0  0  0  0  0  0  0  0
    ATR_0X:  0  0  0  0  0  0  0  0  0  0  0
    ATR_RX:  0  0  0  0  0  0  0  0  0  0  0
    ATR_TX:  0  0  0  0  0  0  0  0  0  0  0
    ATR_XX:  0  0  0  0  0  0  0  0  0  0  0
       OUT:  0  0  0  0  0  0  0  0  0  0  0
  READBACK:  0  0  0  1  1  1  1  1  1  1  1

Configured GPIO values:
       Bit  10  9  8  7  6  5  4  3  2  1  0
      CTRL:  0  0  0  0  0  0  0  1  1  1  1
       DDR:  0  0  0  0  0  0  1  1  1  1  1
    ATR_0X:  0  0  0  0  0  0  0  0  0  0  1
    ATR_RX:  0  0  0  0  0  0  0  0  0  1  0
    ATR_TX:  0  0  0  0  0  0  0  0  1  0  0
    ATR_XX:  0  0  0  0  0  0  0  1  0  0  0
       OUT:  0  0  0  0  0  0  0  0  0  0  0
  READBACK:  0  0  0  1  1  1  0  0  0  0  1

[INFO] [B200] Asking for clock rate 32.000000 MHz... 
[INFO] [B200] Actually got clock rate 32.000000 MHz.

Testing mask...pass:
       Bit  10  9  8  7  6  5  4  3  2  1  0
      CTRL:  0  0  0  0  0  0  0  1  1  1  1
       DDR:  1  0  0  0  0  0  1  1  1  1  1
    ATR_0X:  0  0  0  0  0  0  0  0  0  0  1
    ATR_RX:  0  0  0  0  0  0  0  0  0  1  0
    ATR_TX:  0  0  0  0  0  0  0  0  1  0  0
    ATR_XX:  0  0  0  0  0  0  0  1  0  0  0
       OUT:  0  0  0  0  0  0  0  0  0  0  0
  READBACK:  0  0  0  1  1  1  0  0  0  0  1

Testing user controlled GPIO and ATR idle output...pass:
       Bit  10  9  8  7  6  5  4  3  2  1  0
      CTRL:  0  0  0  0  0  0  0  1  1  1  1
       DDR:  0  0  0  0  0  0  1  1  1  1  1
    ATR_0X:  0  0  0  0  0  0  0  0  0  0  1
    ATR_RX:  0  0  0  0  0  0  0  0  0  1  0
    ATR_TX:  0  0  0  0  0  0  0  0  1  0  0
    ATR_XX:  0  0  0  0  0  0  0  1  0  0  0
       OUT:  0  0  0  0  0  0  1  0  0  0  0
  READBACK:  0  0  0  1  1  1  1  0  0  0  1

Testing ATR RX output...pass:
       Bit  10  9  8  7  6  5  4  3  2  1  0
      CTRL:  0  0  0  0  0  0  0  1  1  1  1
       DDR:  0  0  0  0  0  0  1  1  1  1  1
    ATR_0X:  0  0  0  0  0  0  0  0  0  0  1
    ATR_RX:  0  0  0  0  0  0  0  0  0  1  0
    ATR_TX:  0  0  0  0  0  0  0  0  1  0  0
    ATR_XX:  0  0  0  0  0  0  0  1  0  0  0
       OUT:  0  0  0  0  0  0  0  0  0  0  0
  READBACK:  0  0  0  1  1  1  0  0  0  1  0

Testing ATR TX output...pass:
       Bit  10  9  8  7  6  5  4  3  2  1  0
      CTRL:  0  0  0  0  0  0  0  1  1  1  1
       DDR:  0  0  0  0  0  0  1  1  1  1  1
    ATR_0X:  0  0  0  0  0  0  0  0  0  0  1
    ATR_RX:  0  0  0  0  0  0  0  0  0  1  0
    ATR_TX:  0  0  0  0  0  0  0  0  1  0  0
    ATR_XX:  0  0  0  0  0  0  0  1  0  0  0
       OUT:  0  0  0  0  0  0  0  0  0  0  0
  READBACK:  0  0  0  1  1  1  0  0  1  0  0

Testing ATR full duplex output...pass:
       Bit  10  9  8  7  6  5  4  3  2  1  0
      CTRL:  0  0  0  0  0  0  0  1  1  1  1
       DDR:  0  0  0  0  0  0  1  1  1  1  1
    ATR_0X:  0  0  0  0  0  0  0  0  0  0  1
    ATR_RX:  0  0  0  0  0  0  0  0  0  1  0
    ATR_TX:  0  0  0  0  0  0  0  0  1  0  0
    ATR_XX:  0  0  0  0  0  0  0  1  0  0  0
       OUT:  0  0  0  0  0  0  0  0  0  0  0
  READBACK:  0  0  0  1  1  1  0  1  0  0  0

All tests passed!

Done!

U%    
```
