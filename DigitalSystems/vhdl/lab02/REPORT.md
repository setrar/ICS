# REPORT

- [ ] Source binaries

```
. ~/Developer/ds/bin/source.sh
```

```
cd "$sim"
ghdl -a --std=08 --work=common "$ds/vhdl/common/rnd_pkg.vhd"
```

- [ ] Synthesizing

* Analyzing (can also use -a parameter)

```
ghdl analyse --std=08 "$ds/vhdl/lab02/sr.vhd" "$ds/vhdl/lab02/sr_sim.vhd"
```

* Running (can also use -r parameter)

```
ghdl run --std=08 sr_sim --vcd=sr_sim.vcd
```
> simulation finished @2019ns

- [ ] Visualizing

```
gtkwave sr_sim.vcd
```
> Returns
```powershell
GTKWave Analyzer v3.3.114 (w)1999-2023 BSI

[0] start time.
[2018000000] end time.
```

<img src=images/sr_sim.png width='' height='' > </img>


# References

- [ ] Eurecom Campus: Intel Linux

```
ghdl --version
```
> Returns
```powershell
GHDL 2.0.0-dev (1.0.0.r1017.ge58709ae) [Dunoon edition]
 Compiled with GNAT Version: Community 2021 (20210519-103)
 mcode code generator
Written by Tristan Gingold.

Copyright (C) 2003 - 2021 Tristan Gingold.
GHDL is free software, covered by the GNU General Public License.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

```
lsb_release  -a
```
> Returns 
```powershell
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 23.04
Release:	23.04
Codename:	lunar
```

- [ ] Personal Laptop: ARM MacOS (Sonoma)

```
ghdl --version
```
> Returns
```powershell
GHDL 4.0.0 (3.0.0.r912.gc0e7e1483) [Dunoon edition]
 Compiled with GNAT Version: Community 2019 (20190517-83)
 static elaboration, mcode code generator
Written by Tristan Gingold.

Copyright (C) 2003 - 2024 Tristan Gingold.
GHDL is free software, covered by the GNU General Public License.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

```
sw_vers
```
> Returns:
```powershell
ProductName:		macOS
ProductVersion:		14.4.1
BuildVersion:		23E224
```

