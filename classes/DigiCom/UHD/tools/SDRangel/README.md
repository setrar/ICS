# SDRangle

### Using an UHD Device &#x1F4DF;

- [ ] Add environment variables to locate the UHD images for FPGA Flashing

```zsh
export UHD_HOME=/opt/local/share/uhd; \
export UHD_IMAGES_DIR=$UHD_HOME/images
```

- [ ] Run SDRangel

```
SDRangel
```
> Returns
```powershell
[INFO] [UHD] Mac OS; Clang version 15.0.0 (clang-1500.0.40.1); Boost_107100; UHD_3.15.0.0-MacPorts-Release
[INFO] [B200] Loading firmware image: /opt/local/share/uhd/images/usrp_b200_fw.hex...
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
[INFO] [B200] Detected Device: B200mini
[INFO] [B200] Operating over USB 3.
[INFO] [B200] Initialize CODEC control...
[INFO] [B200] Initialize Radio control...
[INFO] [B200] Performing register loopback test... 
[INFO] [B200] Register loopback test passed
[INFO] [B200] Setting master clock rate selection to 'automatic'.
[INFO] [B200] Asking for clock rate 16.000000 MHz... 
[INFO] [B200] Actually got clock rate 16.000000 MHz.
2023-12-10 09:32:51.001 (W) MainCore::positionError:  0
2023-12-10 09:32:51.003 (W) "The operation couldn’t be completed. (kCLErrorDomain error 1.)"
2023-12-10 09:32:51.021 (W) MainCore::positionUpdateTimeout: GPS signal lost
2023-12-10 09:32:51.563 (I) WebAPIServer::start: starting web API server at http://:8091
2023-12-10 09:33:26.927 (W) libpng warning: iCCP: known incorrect sRGB profile
2023-12-10 09:33:26.927 (W) libpng warning: iCCP: too many profiles
[INFO] [B200] Detected Device: B200mini
[INFO] [B200] Operating over USB 3.
[INFO] [B200] Initialize CODEC control...
[INFO] [B200] Initialize Radio control...
[INFO] [B200] Performing register loopback test... 
[INFO] [B200] Register loopback test passed
[INFO] [B200] Setting master clock rate selection to 'automatic'.
[INFO] [B200] Asking for clock rate 16.000000 MHz... 
[INFO] [B200] Actually got clock rate 16.000000 MHz.
[INFO] [MULTI_USRP] Setting master clock rate selection to 'manual'.
[INFO] [B200] Asking for clock rate 0.220000 MHz... 
[INFO] [B200] Actually got clock rate 0.220000 MHz.
[INFO] [B200] Asking for clock rate 61.440000 MHz... 
[INFO] [B200] Actually got clock rate 61.440000 MHz.
```

- [ ] Create a workspace

Device Name: "serial": "type=b200,name=lab1_xcvr,serial=30C51C1,product=B200mini",

| | | |
|-|-|-|
| <img src=images/SDRangel-add-device.png width='' height='' ></img> | <img src=images/SDRangel-select-device.png width='' height='' ></img> | <img src=images/SDRangle-uspr-ws.png width='' height='' ></img> |

##### WebAPI http://localhost:8091

| | |
|-|-|
| <img src=images/SDRangle-portal.png width='' height=''> </img> | <img src=images/SDRangle-Swagger.png width='' height=''> </img> |

```
curl -X GET "http://localhost:8091/sdrangel" -H  "accept: application/json" | jq '.'
```
> Returns
```json
{
  "appname": "SDRangel",
  "architecture": "arm64",
  "devicesetlist": {
    "deviceSets": [
      {
        "channelcount": 0,
        "samplingDevice": {
          "bandwidth": 3000000,
          "centerFrequency": 435000000,
          "deviceNbStreams": 1,
          "deviceStreamIndex": 0,
          "direction": 0,
          "hwType": "USRP",
          "index": 0,
          "sequence": 0,
          "serial": "type=b200,name=lab1_xcvr,serial=30C51C1,product=B200mini",
          "state": "idle"
        }
      }
    ],
    "devicesetcount": 1,
    "devicesetfocus": 0
  },
  "dspRxBits": 24,
  "dspTxBits": 16,
  "featureset": {
    "featurecount": 0
  },
  "logging": {
    "consoleLevel": "debug",
    "dumpToFile": 0
  },
  "os": "macOS 14.1",
  "pid": 69812,
  "qtVersion": "5.15.11",
  "version": "7.13.0"
}
```

- [ ] 	&#x1F4E6; Install on Apple &#x1F34E;

```zsh
sudo port install SDRangel
```

```
which SDRangel
```
<pre>
/opt/local/bin/SDRangel
MainSettings::MainSettings: settings file: format: 0 location: ~/Library/Preferences/com.f4exb.SDRangel.plist
</pre>

# References

- [ ] [SDRangel.org](https://www.sdrangel.org/)
