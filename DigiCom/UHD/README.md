# UHD

Python USRP page https://files.ettus.com/manual/page_build_guide.html 

```
export PYTHONPATH=/usr/local/lib/python3.10/site-packages:$PYTHONPATH;
export UHD_HOME=/usr/local/share/uhd;
export UHD_IMAGES_DIR=$UHD_HOME/images
```

- [ ] [UHD Home Page](https://kb.ettus.com/UHD)
- [ ] [USRP Hardware Driver and USRP Manual](https://files.ettus.com/manual/page_uhd.html)

```
export UHD_HOME=/opt/local/share/uhd
```

Set a custom name
Run the following commands:

```
$UHD_HOME/utils/usrp_burn_mb_eeprom --args="serial=30C51C1" --values="name=lab1_xcvr"
```
> Returns:
```yaml
Creating USRP device from address: serial=30C51C1
[INFO] [UHD] Mac OS; Clang version 15.0.0 (clang-1500.0.40.1); Boost_107100; UHD_3.15.0.0-MacPorts-Release
[INFO] [B200] Detected Device: B200mini
[INFO] [B200] Operating over USB 3.
[INFO] [B200] Initialize CODEC control...
[INFO] [B200] Initialize Radio control...
[INFO] [B200] Performing register loopback test... 
[INFO] [B200] Register loopback test passed
[INFO] [B200] Setting master clock rate selection to 'automatic'.
[INFO] [B200] Asking for clock rate 16.000000 MHz... 
[INFO] [B200] Actually got clock rate 16.000000 MHz.

Fetching current settings from EEPROM...
    EEPROM ["name"] is "B200mini"

Setting EEPROM ["name"] to "lab1_xcvr"...
Power-cycle the USRP device for the changes to take effect.

Done
```

```
uhd_find_devices
```
> Returns:
```yaml
[INFO] [UHD] Mac OS; Clang version 15.0.0 (clang-1500.0.40.1); Boost_107100; UHD_3.15.0.0-MacPorts-Release
--------------------------------------------------
-- UHD Device 0
--------------------------------------------------
Device Address:
    serial: 30C51C1
    name: lab1_xcvr
    product: B200mini
    type: b200
```

  - [ ] [page_usrp_b200](https://files.ettus.com/manual/page_usrp_b200.html)
  
  - [ ] [page_identification](https://files.ettus.com/manual/page_identification.html)

```
uhd_find_devices
```
> Returns:
<pre>
[INFO] [UHD] Mac OS; Clang version 15.0.0 (clang-1500.0.40.1); Boost_107100; UHD_3.15.0.0-MacPorts-Release
[INFO] [B200] Loading firmware image: /opt/local/share/uhd/images/usrp_b200_fw.hex...
--------------------------------------------------
-- UHD Device 0
--------------------------------------------------
Device Address:
    serial: 30C51C1
    name: B200mini
    product: B200mini
    type: b200

</pre>

```
uhd_find_devices --args="serial=30C51C1"
```
> Returns
<pre>
[INFO] [UHD] Mac OS; Clang version 15.0.0 (clang-1500.0.40.1); Boost_107100; UHD_3.15.0.0-MacPorts-Release
--------------------------------------------------
-- UHD Device 0
--------------------------------------------------
Device Address:
    serial: 30C51C1
    name: B200mini
    product: B200mini
    type: b200
</pre>

- [ ] GPIO

```
$UHD_HOME/examples/gpio
```
> Returns:
```yaml
Creating the usrp device with: ...
[INFO] [UHD] Mac OS; Clang version 15.0.0 (clang-1500.0.40.1); Boost_107100; UHD_3.15.0.0-MacPorts-Release
[INFO] [B200] Detected Device: B200mini
[INFO] [B200] Loading FPGA image: /opt/local/share/uhd/images/usrp_b200mini_fpga.bin...
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
  Mboard 0: B200mini
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
```

<img src=images/IMG_0618.png width='50%' height='50%' > </img>

---

- [ ] [USRP B200 (Board Only)](https://www.ettus.com/all-products/ub200-kit/)
- [ ] [USRP B200 - Datasheet](https://www.ettus.com/wp-content/uploads/2019/01/b200-b210_spec_sheet.pdf)
  - 1 TX & 1 RX, Half or Full Duplex [AD9364]
  - [Xilinx Spartan 6 XC6SLX75 FPGA](https://www.xilinx.com/products/silicon-devices/fpga/spartan-6.html)
  - Up to 56 MHz of instantaneous bandwidth
  - USB Bus powered
  
  - RF coverage from 70 MHz – 6 GHz
  - GNU Radio, C++ and Python APIs
  - USB 3.0 SuperSpeed interface
  - Standard-B USB 3.0 connector
  - Flexible rate 12 bit ADC/DAC
  - Grounded mounting holes

- [ ] [AD9364: 1 x 1 RF Agile Transceiver](https://www.analog.com/en/products/ad9364.html)
- [ ] [AD9364: Datasheet](https://www.analog.com/media/en/technical-documentation/data-sheets/AD9364.pdf)
  - RF 1 × 1 transceiver with integrated 12-bit DACs and ADCs
  - Band: 70 MHz to 6.0 GHz
  - Supports TDD and FDD operation
  - Tunable channel bandwidth: <200 kHz to 56 MHz
  - Dual receivers: 6 differential or 12 single-ended inputs

# References

- [ ] Install [MacPorts](https://www.macports.org) for :apple:

- Download Ports binary [package](https://github.com/macports/macports-base/releases/download/v2.8.1/MacPorts-2.8.1-14-Sonoma.pkg)
- Installl the package
- Update the `~/.zshrc`  to include PATH linked to `/opt/local/bin` [(1)](https://superuser.com/questions/287713/sudo-port-command-not-found-after-installing-macports-on-snow-leopard)

#### :o: Installation

- [ ] [The Core Values of the Xilinx Spartan 6 XC6SLX75 FPGA](https://ebics.net/xilinx-spartan-6-xc6slx75/)

  - [ ] Install UHD on :apple: using [MacPorts](https://ports.macports.org/port/uhd/)
  
  ```
  sudo port install uhd
  ```
  > Returns:
```powershell
--->  Fetching archive for uhd
--->  Attempting to fetch uhd-3.15.0.0_7+docs+examples+libusb+manpages+manual+python310+python_api+test.darwin_23.arm64.tbz2 from https://packages.macports.org/uhd
--->  Attempting to fetch uhd-3.15.0.0_7+docs+examples+libusb+manpages+manual+python310+python_api+test.darwin_23.arm64.tbz2 from https://fra.de.packages.macports.org/uhd
--->  Attempting to fetch uhd-3.15.0.0_7+docs+examples+libusb+manpages+manual+python310+python_api+test.darwin_23.arm64.tbz2 from https://mse.uk.packages.macports.org/uhd
--->  Fetching distfiles for uhd
--->  Attempting to fetch uhd-3.15.0.0.tar.gz from https://distfiles.macports.org/uhd
--->  Verifying checksums for uhd                                                
--->  Extracting uhd
--->  Applying patches to uhd
--->  Configuring uhd
--->  Building uhd                                       
--->  Staging uhd into destroot                          
--->  Installing uhd @3.15.0.0_7+docs+examples+libusb+manpages+manual+python310+python_api+test
--->  Activating uhd @3.15.0.0_7+docs+examples+libusb+manpages+manual+python310+python_api+test
--->  Cleaning uhd
--->  Updating database of binaries
--->  Scanning binaries for linking errors
--->  No broken files found.
--->  No broken ports found.
--->  Some of the ports you installed have notes:
  db48 has the following notes:
    The Java and Tcl bindings are now provided by the db48-java and
    db48-tcl subports.
  libpsl has the following notes:
    libpsl API documentation is provided by the port 'libpsl-docs'.
  lzma has the following notes:
    The LZMA SDK program is installed as "lzma_alone", to avoid conflict with
    LZMA Utils
  py310-cython has the following notes:
    To make the Python 3.10 version of Cython the one that is run when you
    execute the commands without a version suffix, e.g. 'cython', run:
    
    port select --set cython cython310
  py310-docutils has the following notes:
    To make the Python 3.10 version of docutils the one that is run when you
    execute the commands without a version suffix, e.g. 'rst2man', run:
    
    port select --set docutils py310-docutils
  python310 has the following notes:
    To make this the default Python or Python 3 (i.e., the version run by the
    'python' or 'python3' commands), run one or both of:
    
        sudo port select --set python python310
        sudo port select --set python3 python310
  python311 has the following notes:
    To make this the default Python or Python 3 (i.e., the version run by the
    'python' or 'python3' commands), run one or both of:
    
        sudo port select --set python python311
        sudo port select --set python3 python311
```

  ```
  sudo port info uhd   
  ```
  > Returns:
```powershell
Password:
uhd @3.15.0.0_7 (science, comms)
Sub-ports:            uhd-39lts, uhd-devel
Variants:             debug, [+]docs, [+]examples, [+]libusb, [+]manpages, [+]manual, python27, [+]python310,
                      python35, python36, python37, python38, python39, [+]python_api, [+]test, universal

Description:          USRP Hardware Driver for Ettus Research Products: Provides the release version, which is
                      typically updated every month or so.
Homepage:             https://kb.ettus.com/UHD

Build Dependencies:   cmake, pkgconfig, doxygen
Library Dependencies: ncurses, python310, py310-mako, py310-requests, py310-six, libusb, py310-docutils, gzip,
                      py310-numpy, py310-pybind11, boost171
Conflicts with:       uhd-devel, uhd-39lts
Platforms:            darwin
License:              GPL-3+
Maintainers:          Email: michaelld@macports.org, GitHub: michaelld
```

# References

* MathWorks

- [ ] [Communications Toolbox Support Package for USRP Radio](https://www.mathworks.com/help/supportpkg/usrpradio/)
- [ ] [Wireless Testbench](https://www.mathworks.com/products/wireless-testbench.html)
