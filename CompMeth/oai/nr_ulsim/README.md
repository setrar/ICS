# nr_ulsim

## Testing 

- 8 Antennas
- 8 Threads

### using `develop` branch 

- [ ] Switch to `develop` branch

```
git checkout develop
```

- [ ] Build with `--phy_simulators` option

```
sudo cmake_targets/build_oai --phy_simulators
```

- [ ] test and dump results in a file

```
sudo cmake_targets/ran_build/build/nr_ulsim -C 8 -m 25 -s 24 -z 8 -n 200 -P -q 1 -R 273 -r 273 > /tmp/oai/develop/perf.log
```

- [ ] Look for estimation time

```
grep "ULSCH channel estimation time" /tmp/oai/develop/perf.log
```
> Returns
```powershell
    |__ ULSCH channel estimation time      301.25 us (210 trials)
    |__ ULSCH channel estimation time      301.30 us (209 trials)
    |__ ULSCH channel estimation time      301.19 us (208 trials)
    |__ ULSCH channel estimation time      301.22 us (210 trials)
    |__ ULSCH channel estimation time      301.38 us (204 trials)
    |__ ULSCH channel estimation time      301.29 us (206 trials)
    |__ ULSCH channel estimation time      301.22 us (201 trials)
    |__ ULSCH channel estimation time      301.10 us (203 trials)
    |__ ULSCH channel estimation time      301.26 us (205 trials)
    |__ ULSCH channel estimation time      301.21 us (202 trials)
    |__ ULSCH channel estimation time      301.04 us (203 trials)
    |__ ULSCH channel estimation time      301.12 us (200 trials)
```


### using `dmrs_channel_estimation_parallelization` branch 

- [ ] Switch to `dmrs_channel_estimation_parallelization` branch

```
git checkout dmrs_channel_estimation_parallelization
```

- [ ] Build with `--phy_simulators` option

```
sudo cmake_targets/build_oai --phy_simulators
```

- [ ] test and dump results in a file

```
sudo cmake_targets/ran_build/build/nr_ulsim -C 8 -m 25 -s 24 -z 8 -n 200 -P -q 1 -R 273 -r 273 > /tmp/oai/dmrs/perf.log
```

- [ ] Look for estimation time

```
grep "ULSCH channel estimation time" /tmp/oai/dmrs/perf.log
```
> Returns:
```powershell
grep "ULSCH channel estimation time" /tmp/oai/dmrs/perf.log 
    |__ ULSCH channel estimation time      171.12 us (351 trials)
    |__ ULSCH channel estimation time      170.78 us (340 trials)
    |__ ULSCH channel estimation time      171.13 us (351 trials)
    |__ ULSCH channel estimation time      170.86 us (336 trials)
    |__ ULSCH channel estimation time      170.33 us (332 trials)
    |__ ULSCH channel estimation time      171.86 us (328 trials)
    |__ ULSCH channel estimation time      170.46 us (328 trials)
    |__ ULSCH channel estimation time      172.65 us (321 trials)
    |__ ULSCH channel estimation time      169.98 us (311 trials)
    |__ ULSCH channel estimation time      171.53 us (306 trials)
    |__ ULSCH channel estimation time      170.38 us (304 trials)
    |__ ULSCH channel estimation time      170.85 us (303 trials)
    |__ ULSCH channel estimation time      170.72 us (294 trials)
    |__ ULSCH channel estimation time      170.49 us (295 trials)
    |__ ULSCH channel estimation time      170.55 us (296 trials)
    |__ ULSCH channel estimation time      171.49 us (296 trials)
    |__ ULSCH channel estimation time      171.23 us (291 trials)
    |__ ULSCH channel estimation time      171.82 us (287 trials)
    |__ ULSCH channel estimation time      171.09 us (295 trials)
    |__ ULSCH channel estimation time      169.50 us (272 trials)
    |__ ULSCH channel estimation time      171.43 us (298 trials)
    |__ ULSCH channel estimation time      171.17 us (287 trials)
    |__ ULSCH channel estimation time      170.04 us (286 trials)
    |__ ULSCH channel estimation time      169.69 us (292 trials)
    |__ ULSCH channel estimation time      169.54 us (270 trials)
    |__ ULSCH channel estimation time      170.63 us (281 trials)
    |__ ULSCH channel estimation time      169.78 us (294 trials)
    |__ ULSCH channel estimation time      170.13 us (295 trials)
    |__ ULSCH channel estimation time      170.57 us (286 trials)
    |__ ULSCH channel estimation time      171.66 us (273 trials)
    |__ ULSCH channel estimation time      171.49 us (285 trials)
    |__ ULSCH channel estimation time      170.58 us (285 trials)
    |__ ULSCH channel estimation time      170.92 us (291 trials)
    |__ ULSCH channel estimation time      170.96 us (282 trials)
    |__ ULSCH channel estimation time      171.08 us (281 trials)
    |__ ULSCH channel estimation time      170.32 us (277 trials)
    |__ ULSCH channel estimation time      171.06 us (281 trials)
    |__ ULSCH channel estimation time      170.14 us (281 trials)
    |__ ULSCH channel estimation time      169.63 us (278 trials)
    |__ ULSCH channel estimation time      170.55 us (268 trials)
    |__ ULSCH channel estimation time      169.55 us (289 trials)
    |__ ULSCH channel estimation time      171.45 us (283 trials)
    |__ ULSCH channel estimation time      170.75 us (277 trials)
    |__ ULSCH channel estimation time      171.21 us (288 trials)
    |__ ULSCH channel estimation time      169.97 us (288 trials)
    |__ ULSCH channel estimation time      169.92 us (286 trials)
    |__ ULSCH channel estimation time      169.84 us (281 trials)
    |__ ULSCH channel estimation time      170.91 us (290 trials)
    |__ ULSCH channel estimation time      170.77 us (287 trials)
    |__ ULSCH channel estimation time      171.17 us (270 trials)
    |__ ULSCH channel estimation time      170.25 us (280 trials)
```

---

# References

The command line you've shared invokes the `nr_ulsim` utility with several options that configure its behavior for a specific simulation scenario. Here's a breakdown of each argument and what it configures based on the provided help output:

```bash
./nr_ulsim -C 4 -m 25 -s 24 -z 4 -n 100 -P -q 1 -R 273 -r 273
```

- **`-C 4`**: Specifies the number of threads for the simulation. This setting tells the simulator to use 4 threads, which likely enables parallel processing to speed up the simulation.

- **`-m 25`**: Sets the MCS (Modulation and Coding Scheme) value to 25. The MCS value directly influences the throughput and robustness of the data transmission, affecting how data is encoded and modulated.

- **`-s 24`**: Sets the starting SNR (Signal-to-Noise Ratio) to 24 dB. SNR is a measure of signal quality compared to background noise. An SNR of 24 dB indicates a relatively clear signal, which impacts the performance and results of the simulation.

- **`-z 4`**: Specifies the number of RX (receive) antennas used at the gNB (gNodeB, which is the base station in 5G terminology). Using 4 antennas can improve the reception quality through techniques like MIMO (Multiple Input Multiple Output).

- **`-n 100`**: Sets the number of trials to simulate to 100. This parameter dictates how many iterations of the simulation will be run, which can help in averaging results to mitigate randomness and provide a more stable outcome.

- **`-P`**: This flag is used to print ULSCH (uplink shared channel) performances. It likely triggers the output of performance metrics or results related to the ULSCH, which can include throughput statistics, error rates, etc.

- **`-q 1`**: Sets the MCS table to 1. This could refer to a specific predefined set of MCS values tailored for certain conditions or specifications within the simulation framework.

- **`-R 273`**: Sets the maximum number of available resource blocks (N_RB_DL) to 273. Resource blocks are the basic units of radio resources in LTE and NR (New Radio) systems, comprising a certain number of subcarriers over a millisecond timespan. 

- **`-r 273`**: Specifies the number of allocated resource blocks for PUSCH (Physical Uplink Shared Channel) to 273. This setting controls how much of the available uplink spectrum is used for the simulation.

### Summary
This command configures a complex simulation of an uplink scenario in a 5G network using the nr_ulsim utility. It utilizes multiple threads for efficiency, employs a specific modulation and coding scheme, and tests under a high-quality signal condition with multiple receive antennas. The simulation is repeated over 100 trials to ensure statistical reliability and focuses on the performance of the uplink shared channel under these conditions.

# References

- [ ] [Using SIMD for Parallel Processing in Rust](https://nrempel.com/using-simd-for-parallel-processing-in-rust)
