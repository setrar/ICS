# REPORT

- [ ] Source binaries

```
. ~/Developer/ds/bin/source.sh
```

- [ ] Change Environment

```
cd $sim
```


- [ ] Synthesizing

* Analyzing (can also use -a parameter)

```
ghdl analyse --std=08 $ds/vhdl/lab01/ct.vhd
```

```
ghdl analyse --std=08 $ds/vhdl/lab01/ct_sim.vhd
```

* Running (can also use -r parameter)
Note: Alternatively, when running on other `ghdl` environments i.e. Raspberry Pi (arm)  use `elab-run`

```
ghdl run --std=08 ct_sim --vcd=ct.vcd
```
> simulation finished @5ns

- [ ] Visualizing

```
gtkwave ct.vcd
```

<img src=images/gtkwave_output.png width='' height='' > </img>

### Logic synthesis

- [ ] Sourcing

```
. ~/Developer/ds/bin/source.sh
```


- [ ] Creating out of source environment

```
syn=/tmp/$USER/ds/ct
mkdir -p $syn
```


- [ ] Mapping

<img src=images/pmod-pinout.png width='50%' height='50%' > </img>


```json
# list of external ports: NAME { PIN IO_STANDARD }
array set ios {
	switch0  { G15 LVCMOS33 }
	wire_in  { V12 LVCMOS33 }
	wire_out { W16 LVCMOS33 }
	led[0]   { M14 LVCMOS33 }
	led[1]   { M15 LVCMOS33 }
	led[2]   { G14 LVCMOS33 }
	led[3]   { D18 LVCMOS33 }
}

```

- [ ] Synthesizing out of source tree


```
cd $syn
vivado -mode batch -source $ds/vhdl/lab01/ct.syn.tcl -notrace
```
> Returns
[vivado.log](.REPORTS/vivado.log)

```
SDCARD=/media/robert/6F3B-6E41
```


```
cd /packages/LabSoC/ds-files
cp uImage devicetree.dtb uramdisk.image.gz $SDCARD
```


```
cd $syn
cp $syn/boot.bin $SDCARD
```



# References

issues with keyboard

```
stty erase CTRL+V<backspace>
```

- [ ] [Hello world program](https://ghdl.github.io/ghdl/quick_start/simulation/hello/index.html)

```vhdl
--  Hello world program
use std.textio.all; -- Imports the standard textio package.

--  Defines a design entity, without any ports.
entity hello_world is
end hello_world;

architecture behaviour of hello_world is
begin
  process
    variable l : line;
  begin
    write (l, String'("Hello world!"));
    writeline (output, l);
    wait;
  end process;
end behaviour;
```

- [ ] Analyse

```
ghdl analyse  hello.vhdl 
```

- [ ] Elaborate

```
ghdl elaborate  hello_world
```

- [ ] Run

```
ghdl run  hello_world
```
> Hello world!

- [ ] [ghdl: Quick Start Guide](https://ghdl-rad.readthedocs.io/en/doc-addition/examples/quick_start/README.html)

GHDL is a compiler which translates VHDL files to machine code. Hence, the regular workflow is composed of three steps:

- Analysis [-a]: convert design units (VHDL sources) to an internal representation.
- Elaboration [-e]: generate executable machine code for a target module (top-level entity).
- Run [-r]: execute the design to test the behaviour, generate output/waveforms, etc.

- [ ] [Digilent Pmod R2R Sine Wave Generator](https://www.instructables.com/Digilent-Pmod-R2R-Sine-Wave-Generator/)

#### [Rust on Zynq](https://www.reddit.com/r/rust/comments/127wsw8/rust_on_zynq)

- [ ] [Bare-metal Rust on Zynq-7000](https://git.m-labs.hk/M-Labs/zynq-rs)
