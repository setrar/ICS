# Wifi Connect


```
export UHD_IMAGES_DIR=/opt/local/share/uhd/images
```

```
jupyter lab
```

<img src=images/WIFI-card-status-free.png width='50%' height='50%' > </img>

<img src=images/WIFI-card-status-huawei.png width='50%' height='50%' > </img>

# References

- [ ] [Wi-Fi Channels, Frequencies, Bands & Bandwidths](https://www.electronics-notes.com/articles/connectivity/wifi-ieee-802-11/channels-frequencies-bands-bandwidth.php)

The table given below provides the frequencies for the total of fourteen 802.11 Wi-Fi channels that are available around the globe. Not all of these channels are available for Wi-Fi installations in all countries.

***2.4 GHz Wi-Fi channel frequencies***

Often WiFi routers are set to channel 6 as the default, and therefore the set of channels 1, 6 and 11 is possibly the most widely used.
 
| CHANNEL NUMBER | LOWER FREQUENCY MHZ | CENTER FREQUENCY MHZ | UPPER FREQUENCY MHZ |
|-|-|-|-|
| 1	| 2401	| 2412	| 2423 |
| 2	| 2406	| 2417	| 2428 |
| 3	| 2411	| 2422	| 2433 |
| 4	| 2416	| 2427	| 2438 |
| 5	| 2421	| 2432	| 2443 |
| 6	| 2426	| 2437	| 2448 |
| 7	| 2431	| 2442	| 2453 |
| 8	| 2436	| 2447	| 2458 |
| 9	| 2441	| 2452	| 2463 |
| 10	| 2446	| 2457	| 2468 |
| 11	| 2451	| 2462	| 2473 |
| 12	| 2456	| 2467	| 2478 |
| 13	| 2461	| 2472	| 2483 |
| 14	| 2473	| 2484	| 2495 |

***5 GHz WiFi channels & frequencies***

| CHANNEL NUMBER	| FREQUENCY MHZ	| EUROPE (ETSI)	| NORTH AMERICA (FCC)	| JAPAN |
|-----|-------|---------------------|-----|-----------|
| 60	| 5300	| Indoors / DFS / TPC	| DFS	| DFS / TPC | 
| 64	| 5320	| Indoors / DFS / TPC	| DFS	| DFS / TPC | 
| 100	| 5500	| DFS / TPC	| DFS	| DFS / TPC | 
| 104	| 5520	| DFS / TPC	| DFS	| DFS / TPC | 
| 108	| 5540	| DFS / TPC	| DFS	| DFS / TPC | 
| 112	| 5560	| DFS / TPC	| DFS	| DFS / TPC | 
| 116	| 5580	| DFS / TPC	| DFS	| DFS / TPC | 
| 120	| 5600	| DFS / TPC	| No Access	| DFS / TPC |


- [ ] [Detecting the wifi signal power spectrum using USRP and Simulnik](https://www.mathworks.com/matlabcentral/answers/197123-detecting-the-wifi-signal-power-spectrum-using-usrp-and-simulnik)

You can tune it to a particular center frequency for a given channel.

USRP B210 offers 56 MHz of IBW in 1x1 configuration. In a 2x2 configuration it can offer upto 30 MHz of IBW., which may not be enough given the channel BW is 22 MHz. Its best to write your own spectrum estimation code and use MATLABs user defined blocks within Simulink to plot and estimate the signal BW. ADC sample rate (max) is 61.44 MSps.

# References

- [ ] [wlanLLTF](https://www.mathworks.com/help/wlan/ref/wlanlltf.html)

```
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I en0        
     agrCtlRSSI: -55
     agrExtRSSI: 0
    agrCtlNoise: -93
    agrExtNoise: 0
          state: running
        op mode: station 
     lastTxRate: 573
        maxRate: 300
lastAssocStatus: 0
    802.11 auth: open
      link auth: wpa2
          BSSID:
           SSID: e******oam
            MCS: 11
  guardInterval: 800
            NSS: 2
        channel: 132,1
```
