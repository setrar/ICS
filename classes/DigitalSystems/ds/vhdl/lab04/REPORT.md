# REPORT

- [ ] Source binaries

```
. ~/Developer/ds/bin/source.sh
```

```
cd "$sim"
ghdl analyze --std=08 --work=common "$ds/vhdl/common/rnd_pkg.vhd"
```

- [ ] Analyzing (can also use -a parameter)

```
ghdl analyze --std=08 $ds/vhdl/lab02/sr.vhd \
                      $ds/vhdl/lab03/timer.vhd \
                      $ds/vhdl/lab04/lb.vhd \
                      $ds/vhdl/lab04/lb_sim.vhd 
```

- [ ]  Running (can also use -r parameter)

```
ghdl run --std=08 lb_sim --vcd=lb_sim.vcd
```
> simulation finished @102642857564fs

- [ ] Visualizing

```
gtkwave lb_sim.vcd
```
> Returns
```powershell

GTKWave Analyzer v3.4.0 (w)1999-2022 BSI

[0] start time.
[102571429392] end time.
```

<img src=images/lb_sim.png width='' height='' > </img>


### Synthesizing

- [ ] Making sure the `lb.syn.tcl` file is update accordingly

```
$ds/vhdl/lab04/lb.syn.tcl
```

- [ ] Prepare the `synth` environment

```
ds=/homes/$USER/Developer/ds
syn=/tmp/$USER/ds/syn
mkdir -p "$syn"
```

- [ ] Synthesize using the `lab` equipment

- Allowing to make sure that all `binaries` and appropriate `licences` are available

```
cd "$syn"
vivado -mode batch -source "$ds/vhdl/lab04/lb.syn.tcl" -notrace
```

- [ ] Copy the first (fsbl.elf) and second (u-boot.elf) stage software boot loaders

```
cd $syn
cp /packages/LabSoC/ds-files/fsbl.elf .
cp /packages/LabSoC/ds-files/u-boot.elf .
```

- [ ] Use `bootgen` utility and the `$ds/vhdl/lab01/boot.bif` provided configuration script:

```
bootgen -w -image $ds/vhdl/lab04/boot.bif -o boot.bin
```
> 
```powershell
****** Bootgen v2023.2
  **** Build date : Oct 11 2023-12:50:27
    ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
    ** Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.


[INFO]   : Bootimage generated successfully
```

- copy to SDCARD

```
SDCARD=/media/robert/6F3B-6E41
cd /packages/LabSoC/ds-files
cp uImage devicetree.dtb uramdisk.image.gz "$SDCARD"
cp "$syn/boot.bin" "$SDCARD"
sync
```

##### Running

| $\sigma$ | $\lambda$ |
|-|-|
| <img src=images/lab04.png width='' height='' ></img> | <img src=images/lab04_closeup.png width='' height='' ></img> |


# References

- [ ] Synthesizing though `SSH` gateway

- add the `ssh-key` to the `ssh-agent` list

```
ssh-add ~/.ssh/me_myself@eurecom.fr
```
> Returns
```powershell
Identity added: /Users/valiha/.ssh/me_myself@eurecom.fr (me_myself@saipal.eurecom.fr)
```

```
ssh me_myself@ssh.eurecom.fr
```
> Returns
```powershell
(me_myself@ssh.eurecom.fr) Duo two-factor login for me_myself

Enter a passcode or select one of the following options:

 1. Duo Push to +XX X XX XX X4 83

Passcode or option (1-1): 1
Success. Logging you in...
Success. Logging you in...
|-----------------------------------------------------------------|
| This system is for the use of authorized users only.            |
| Individuals using this computer system without authority, or in |
| excess of their authority, are subject to having all of their   |
| activities on this system monitored and recorded by system      |
| personnel.                                                      |
|                                                                 |
| In the course of monitoring individuals improperly using this   |
| system, or in the course of system maintenance, the activities  |
| of authorized users may also be monitored.                      |
|                                                                 |
| Anyone using this system expressly consents to such monitoring  |
| and is advised that if such monitoring reveals possible         |
| evidence of criminal activity, system personnel may provide the |
| evidence of such monitoring to law enforcement officials.       |
|-----------------------------------------------------------------|

Register this system with Red Hat Insights: insights-client --register
Create an account or view all your systems at https://red.ht/insights-dashboard
SSH host key: SHA256:mlRUiVNONONONONONONONONONONONONDCkJR7bu48JQ boogie.eurecom.fr (RSA)
SSH host key: SHA256:35jGdANONONONONONONONONONNONONONONONObFm9cM boogie.eurecom.fr (ECDSA)
SSH host key: SHA256:QINONONONONONONONONONNOeBrNs1/hqOR0plP+xhng boogie.eurecom.fr (ED25519)

VMware, Inc. VMware Virtual Platform [VMware7,1]

Last login: Fri Mar 29 19:55:00 2024 from 10.0.0.106
```

- [ ] connect to any Ubuntu Boxes having `vivavo` installed on through the jumphost `boogie.eurecom.fr`

```
ssh me_myself@saipal.eurecom.fr
```
> Returns
```powershell
Welcome to Ubuntu 23.04 (GNU/Linux 6.2.0-39-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

6 updates can be applied immediately.
To see these additional updates run: apt list --upgradable


1 updates could not be installed automatically. For more details,
see /var/log/unattended-upgrades/unattended-upgrades.log
Last login: Thu Jun  6 11:54:01 2024 from 10.10.20.74
```

##### Remote copy 

- [ ] Prepare the files to be copied

```
mkdir scopy
cp /packages/LabSoC/ds-files/*mage* scopy
cp /packages/LabSoC/ds-files/devicetree.dtb scopy
cp "$syn/boot.bin" scopy
```

- [ ] Compress the files

```
tar zcvf scopy.tar.gz scopy
```
> Returns
```
scopy/
scopy/devicetree.dtb
scopy/uramdisk.image.gz
scopy/uImage
scopy/boot.bin
```

- [ ] Logout and return to jumphost

```
^D
```
> Returns
```
logout
Connection to megantic.eurecom.fr closed.
```

- [ ] copy file from `megantic` to jumphost

```
scp robert@megantic.eurecom.fr:/tmp/robert/ds/syn/scopy.tar.gz .
```
> scopy.tar.gz                                                                                       100%   21MB 106.7MB/s   

- [ ] Logout from jumphost

```
^D
```
> Returns
```
logout
Connection to ssh.eurecom.fr closed.
```

- [ ] copy file from jumphost

```
scp robert@ssh.eurecom.fr:scopy.tar.gz .
```
> Returns
```powershell
(robert@ssh.eurecom.fr) Duo two-factor login for robert

Enter a passcode or select one of the following options:

 1. Duo Push to +XX X XX XX X4 83

Passcode or option (1-1): 1
Success. Logging you in...
scopy.tar.gz                                                                                       100%   21MB  20.2MB/s   00:01
```

- [ ] decompress files

```
tar zxvf scopy.tar.gz 
```
> Returns
```powershell
x scopy/
x scopy/devicetree.dtb
x scopy/uramdisk.image.gz
x scopy/uImage
x scopy/boot.bin
```

- [ ] Copy files to `NO NAME` MicroSD

```
cp scopy/* /Volumes/NO\ NAME
```


<img src=images/scopy-mac.png width='' height='' > </img>
