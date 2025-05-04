# UHD Bindings

## UHD_HOME

```
export UHD_HOME=/opt/local/share/uhd 
```


```
(@v1.9) pkg> add UHDBindings
```
> Returns:
```julia
    Updating registry at `~/.julia/registries/General.toml`
   Resolving package versions...
   Installed boost_jll ────────────── v1.76.0+1
   Installed libusb_jll ───────────── v1.0.26+0
   Installed USRPHardwareDriver_jll ─ v4.1.0+1
   Installed UHDBindings ──────────── v0.5.0
  Downloaded artifact: boost
  Downloaded artifact: USRPHardwareDriver
  Downloaded artifact: libusb
    Updating `~/.julia/environments/v1.9/Project.toml`
  [4d90b16f] + UHDBindings v0.5.0
    Updating `~/.julia/environments/v1.9/Manifest.toml`
  [4d90b16f] + UHDBindings v0.5.0
  [e339f254] + USRPHardwareDriver_jll v4.1.0+1
⌅ [28df3c45] + boost_jll v1.76.0+1
  [a877fdc9] + libusb_jll v1.0.26+0
        Info Packages marked with ⌅ have new versions available but compatibility constraints restrict them from upgrading. To see why use `status --outdated -m`
Precompiling project...
  4 dependencies successfully precompiled in 8 seconds. 552 already precompiled. 7 skipped during auto due to previous errors.
```

```
julia src/setup.jl
```
> Returns:
```julia
[INFO] [UHD] Mac OS; Clang version 12.0.0 (/home/mose/.julia/dev/BinaryBuilderBase/deps/downloads/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc); Boost_107600; UHD_4.1.0.HEAD-0-g6bd0be9c
[WARNING] [B200] EnvironmentError: IOError: Could not find path for image: usrp_b200_fw.hex

Using images directory: <no images directory located>

Set the environment variable 'UHD_IMAGES_DIR' appropriately or follow the below instructions to download the images package.

Please run:

 "/Users/valiha/.julia/artifacts/3fe605e4baef88b8af8c0fed9cb532390084eb7d/lib/uhd/utils/uhd_images_downloader.py"
ERROR: LoadError: Unable to create the UHD device. No attached UHD device found.
Stacktrace:
 [1] error(s::String)
   @ Base ./error.jl:35
 [2] macro expansion
   @ ~/.julia/packages/UHDBindings/l94hn/src/Bindings.jl:30 [inlined]
 [3] openUHD(carrierFreq::Float64, samplingRate::Float64, gain::Float64; args::String, channels::Vector{Int64}, antennas::Dict{Symbol, Vector{String}}, cpu_format::String, otw_format::String, subdev::String, nbAntennaRx::Int64, nbAntennaTx::Int64, bypassStreamer::Bool)
   @ UHDBindings ~/.julia/packages/UHDBindings/l94hn/src/UHDBindings.jl:141
 [4] openUHD(carrierFreq::Float64, samplingRate::Float64, gain::Float64)
   @ UHDBindings ~/.julia/packages/UHDBindings/l94hn/src/UHDBindings.jl:135
 [5] main()
   @ Main ~/Developer/DigiCom/UHD/bindings/setup.jl:17
 [6] top-level scope
   @ ~/Developer/DigiCom/UHD/bindings/setup.jl:26
in expression starting at /Users/valiha/Developer/DigiCom/UHD/bindings/setup.jl:26
```

```
find $UHD_HOME -name "usrp_b200_fw.hex"
```
> /opt/local/share/uhd/images/usrp_b200_fw.hex

```
export UHD_IMAGES_DIR=$UHD_HOME/images
```

```
julia src/setup.jl
```
> Returns:
```julia
[INFO] [UHD] Mac OS; Clang version 12.0.0 (/home/mose/.julia/dev/BinaryBuilderBase/deps/downloads/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc); Boost_107600; UHD_4.1.0.HEAD-0-g6bd0be9c
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
┌Rx Warning: Effective carrier frequency is 867.9999999999992 MHz and not 868.0 MHz
┌Tx Warning: Effective carrier frequency is 867.9999999999992 MHz and not 868.0 MHz
┌Rx: Current UHD Configuration in Rx mode
| Carrier Frequency: 868.000 MHz
| Sampling Frequency: 16.000 MHz
└  Rx Gain: 30.00 dB
┌Tx: Current UHD Configuration in Tx mode
| Carrier Frequency: 868.000 MHz
| Sampling Frequency: 16.000 MHz
└  Tx Gain: 30.00 dB

[ Info: USRP device is now closed.
```

```
julia src/setup.jl
```
> Returns
```julia
The latest version of Julia in the `release` channel is 1.10.1+0.aarch64.apple.darwin14. You currently have `1.10.0+0.aarch64.apple.darwin14` installed. Run:

  juliaup update

to install Julia 1.10.1+0.aarch64.apple.darwin14 and update the `release` channel to that version.
[INFO] [UHD] Mac OS; Clang version 12.0.0 (/home/mose/.julia/dev/BinaryBuilderBase/deps/downloads/llvm-project.git d28af7c654d8db0b68c175db5ce212d74fb5e9bc); Boost_107600; UHD_4.1.0.HEAD-0-g6bd0be9c
[INFO] [B200] Loading firmware image: /opt/local/share/uhd/images/usrp_b200_fw.hex...
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
┌Rx Warning: Effective carrier frequency is 867.9999999999992 MHz and not 868.0 MHz
┌Tx Warning: Effective carrier frequency is 867.9999999999992 MHz and not 868.0 MHz
┌Rx: Current UHD Configuration in Rx mode
| Carrier Frequency: 868.000 MHz
| Sampling Frequency: 16.000 MHz
└  Rx Gain: 30.00 dB
┌Tx: Current UHD Configuration in Tx mode
| Carrier Frequency: 868.000 MHz
| Sampling Frequency: 16.000 MHz
└  Tx Gain: 30.00 dB

[ Info: USRP device is now closed.
```

```
NOW=`date "+%Y%m%d%H%M%S"`
```

```
$UHD_HOME/examples/benchmark_rate --rx_rate 56e6 --tx_rate 56e6 > logs/benchmark-$NOW.log 2>logs/benchmark-errors-$NOW.log
```

# References

- [ ] [UHDBindings.jl](https://docs.juliahub.com/UHDBindings) started by [Robin GERZAGUET](https://perso.univ-rennes1.fr/robin.gerzaguet/)
- [ ] [UHDBindings.jl: Julia C bindings for UHD to monitor USRP devices.](https://github.com/JuliaTelecom/UHDBindings.jl)
- [ ] [JuliaTelecom: Julia packages for Telecommunications](https://github.com/JuliaTelecom)
- [ ] [DigitalComm.jl: Julia module for digital communication tools.](https://github.com/JuliaTelecom/DigitalComm.jl)
- [ ] [ettus.com: Getting Started with UHD and C++](https://kb.ettus.com/Getting_Started_with_UHD_and_C%2B%2B)
