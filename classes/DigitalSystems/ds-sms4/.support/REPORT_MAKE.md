# REPORT


### Compiling with AXI

- [ ] Source Home

```
DS_HOME=~/Developer/ds-sms4
```

- [ ] Source binaries

```
. $DS_HOME/bin/source.sh
```

```
cd "$sim"
```


- [ ] Make `$sim`

```
sim=/tmp/$USER/ds/vsim
mkdir -p $sim
cd $sim
```

```
vcom -2008 +acc -work common $ds/vhdl/common/axi_pkg.vhd $ds/vhdl/common/rnd_pkg.vhd $ds/vhdl/common/utils_pkg.vhd
vcom -2008 +acc $ds/vhdl/lab02/sr.vhd
vcom -2008 +acc $ds/vhdl/lab03/timer.vhd
vcom -2008 +acc $ds/vhdl/lab05/edge.vhd
vcom -2008 +acc $ds/vhdl/lab06/counter.vhd
```

```
vcom -2008 +acc $ds/vhdl/lab08/dht11_ctrl.vhd
vcom -2008 +acc $ds/vhdl/lab09/dht11_ctrl_axi_wrapper.vhd $ds/vhdl/lab09/dht11_ctrl_axi_wrapper_sim.vhd
vsim -voptargs="+acc" dht11_ctrl_axi_wrapper_sim
```



### Compiling indivual files

---

- [ ] Source Home

```
DS_HOME=~/Developer/ds-sms4
```

- [ ] Source binaries

```
. $DS_HOME/bin/source.sh
```

```
cd "$sim"
```



### Compiling when using `Makefile`


#### ***Using GHDL***

```
make crypto_bench SIM=ghdl
```

- [ ] Clean the project

```
make clean SIM=ghdl
```
> rm -rf /tmp/valiha/ds-sms4/ghdl

```
make crypto_bench SIM=ghdl GUI=no
```
> Returns
```powershell
mkdir -p /tmp/valiha/ds-sms4/ghdl
/Applications/Xcode.app/Contents/Developer/usr/bin/make --no-print-directory -C /tmp/valiha/ds-sms4/ghdl -f /Users/valiha/Developer/ds-sms4/Makefile crypto_bench PASS=run
[COM]   vhdl/crypto/crypto_pkg.vhd                         -> work
ghdl -a --std=08 -frelaxed --work=work  /Users/valiha/Developer/ds-sms4/vhdl/crypto/crypto_pkg.vhd
touch crypto_pkg
[COM]   vhdl/crypto/crypto_engine.vhd                      -> work
ghdl -a --std=08 -frelaxed --work=work  /Users/valiha/Developer/ds-sms4/vhdl/crypto/crypto_engine.vhd
touch crypto_engine
[COM]   vhdl/crypto/crypto_tests.vhd                       -> work
ghdl -a --std=08 -frelaxed --work=work  /Users/valiha/Developer/ds-sms4/vhdl/crypto/crypto_tests.vhd
touch crypto_tests
[COM]   vhdl/crypto/crypto_bench.vhd                       -> work
ghdl -a --std=08 -frelaxed --work=work  /Users/valiha/Developer/ds-sms4/vhdl/crypto/crypto_bench.vhd
touch crypto_bench
```


# References

- [ ] Compile

```
make crypto_bench
```

- [ ] Using ModelSim

Make sure `ModelSim` is on your path

```
export PATH=$PATH:/packages/LabSoC/Mentor/Modelsim/bin
```

- [ ] Run the simulation

```
make crypto_bench.sim
```

