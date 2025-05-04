# [Gqrx](https://gqrx.dk/)


## &#x1F52D; Launching Gqrx on MacOS &#x1F34E;


- [ ] Set the environment UHD variables

```
export UHD_HOME=/opt/local/share/uhd;
export UHD_IMAGES_DIR=$UHD_HOME/images
```

- [ ] Launch Gqrx at the command line

```
/Applications/Gqrx.app/Contents/MacOS/gqrx 
```
> Returns:
```yaml

gr-osmosdr 0.2.0.0 (0.2.0) gnuradio 3.10.7.0
built-in source types: file rtl rtl_tcp uhd hackrf bladerf rfspace airspy airspyhf soapy redpitaya 
Resampling audio 96000 -> 48000
PortAudio V19.7.0-devel, revision 147dd722548358763a8b649b3e4b41dfffbcfbb6 (version 1246976)
Number of audio devices: 3
  0:  MacBook Pro Microphone  I:1  O:0
  1:  MacBook Pro Speakers  I:0  O:2
  2:  Microsoft Teams Audio  I:2  O:2
Using default audio device
BandPlanFile is /Users/valiha/.config/gqrx/bandplan.csv
BookmarksFile is /Users/valiha/.config/gqrx/bookmarks.csv
PortAudio V19.7.0-devel, revision 147dd722548358763a8b649b3e4b41dfffbcfbb6 (version 1246976)
Number of audio devices: 3
  0:  MacBook Pro Microphone  I:1  O:0
  1:  MacBook Pro Speakers  I:0  O:2
  2:  Microsoft Teams Audio  I:2  O:2
[INFO] [UHD] Mac OS; Clang version 14.0.0 (clang-1400.0.29.202); Boost_108200; UHD_4.5.0.HEAD-0-g471af98f
[WARNING] SoapySSDPEndpoint failed join group udp://[ff02::c]:1900 on en0
  setsockopt(IPV6_MULTICAST_IF, 2a01:e0a:3f3:fd30:85a:6b90:978f:e97b) [49: Can't assign requested address]
[WARNING] SoapySSDPEndpoint failed join group udp://[ff02::c]:1900 on en0
  setsockopt(IPV6_MULTICAST_IF, 2a01:e0a:3f3:fd30:9d96:423f:af40:dd5c) [49: Can't assign requested address]
gr-osmosdr 0.2.0.0 (0.2.0) gnuradio 3.10.7.0
built-in source types: file rtl rtl_tcp uhd hackrf bladerf rfspace airspy airspyhf soapy redpitaya 
[INFO] [B200] Detected Device: B200mini
[INFO] [B200] Operating over USB 3.
[INFO] [B200] Initialize CODEC control...
[INFO] [B200] Initialize Radio control...
[INFO] [B200] Performing register loopback test... 
[INFO] [B200] Register loopback test passed
[INFO] [B200] Setting master clock rate selection to 'automatic'.
[INFO] [B200] Asking for clock rate 16.000000 MHz... 
[INFO] [B200] Actually got clock rate 16.000000 MHz.
-- Using subdev spec 'A:A'.
[INFO] [B200] Asking for clock rate 32.000000 MHz... 
[INFO] [B200] Actually got clock rate 32.000000 MHz.
PortAudio V19.7.0-devel, revision 147dd722548358763a8b649b3e4b41dfffbcfbb6 (version 1246976)
Number of audio devices: 3
  0:  MacBook Pro Microphone  I:1  O:0
  1:  MacBook Pro Speakers  I:0  O:2
  2:  Microsoft Teams Audio  I:2  O:2
Using default audio device
[WARNING] [AD936X] The requested bandwidth 0 MHz is out of range (0.2 - 56 MHz).
The bandwidth has been forced to 0.2 MHz.
2023-11-30 12:12:21.621 gqrx[6910:8635102] WARNING: Secure coding is not enabled for restorable state! Enable secure coding by implementing NSApplicationDelegate.applicationSupportsSecureRestorableState: and returning YES.
```

- [ ] The Applications should recognize the UHD device

<img src=images/Gqrx_device.png width='75%' height='75%' />


## &#x2B55; Install Gqrx

- [ ] [Gqrx SDR](https://gqrx.dk/)

```
brew install --cask gqrx
```


