openairinterface5

- 

```
cat /proc/cmdline
```
> Returns
```powershell
BOOT_IMAGE=(hd0,gpt2)/vmlinuz-5.14.0-362.18.1.el9_3.x86_64 root=/dev/mapper/rhel_meduse-root ro crashkernel=1G-4G:192M,4G-64G:256M,64G-:512M resume=/dev/mapper/rhel_meduse-swap rd.lvm.lv=rhel_meduse/root rd.lvm.lv=rhel_meduse/swap rhgb quiet skew_tick=1 tsc=reliable rcupdate.rcu_normal_after_boot=1 isolcpus=managed_irq,domain,0,2,4,6,8,10,12,14 intel_pstate=disable nosoftlockup
```

--

- [ ] Clone OAI in `(~/Developer)`

```
git clone git@gitlab.eurecom.fr:robert/openairinterface5g.git
```

- [ ] Build

```
cd ~/Developer/openairinterface5g/cmake_targets
```

```
./build_oai --phy_simulators
```
> Returns
```powershell
Will compile dlsim, ulsim, ...
OPENAIR_DIR    = /home/bricer/Developer/openairinterface5g
Running "cmake3 ../../.."
-- Ccache not found. Consider installing it for faster compilation. Command: sudo apt/dnf install ccache
-- Check if /opt/asn1c/bin/asn1c supports -gen-APER
-- Check if /opt/asn1c/bin/asn1c supports -no-gen-UPER
-- Check if /opt/asn1c/bin/asn1c supports -no-gen-JER
-- Check if /opt/asn1c/bin/asn1c supports -no-gen-BER
-- Check if /opt/asn1c/bin/asn1c supports -no-gen-OER
-- CMAKE_BUILD_TYPE is RelWithDebInfo
-- CPU architecture is x86_64
-- AVX512 intrinsics are ON
-- AVX2 intrinsics are ON
-- Selected E2AP_VERSION: E2AP_V2
-- Selected KPM Version: KPM_V2_03
-- No Support for Aerial
-- No Doxygen documentation requested
-- Configuring done
-- Generating done
-- Build files have been written to: /home/bricer/Developer/openairinterface5g/cmake_targets/ran_build/build
cd /home/bricer/Developer/openairinterface5g/cmake_targets/ran_build/build
Running "cmake3 --build .  --target dlsim ulsim ldpctest polartest smallblocktest nr_pbchsim nr_dlschsim nr_ulschsim nr_dlsim nr_ulsim nr_pucchsim nr_prachsim params_libconfig coding rfsimulator dfts -- -j28" 
Log file for compilation is being written to: /home/bricer/Developer/openairinterface5g/cmake_targets/log/all.txt
dlsim ulsim ldpctest polartest smallblocktest nr_pbchsim nr_dlschsim nr_ulschsim nr_dlsim nr_ulsim nr_pucchsim nr_prachsim params_libconfig coding rfsimulator dfts compiled
BUILD SHOULD BE SUCCESSFUL
```

- [ ] Run tests

* get to the build directory

```
cd ran_build/build
```


* run the tests with `sudo` privileges to retain `Thread` access

```
sudo ./nr_ulsim -C 4 -m 25 -s 24 -z 4 -n 100 -P -q 1 -R 273 -r 273
```
> Returns
```powershell
We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for bricer: 
CMDLINE: "./nr_ulsim" "-C" "4" "-m" "25" "-s" "24" "-z" "4" "-n" "100" "-P" "-q" "1" "-R" "273" "-r" "273" 
[CONFIG] get parameters from cmdline [CONFIG] debug flags: 0x00400000
Initializing random number generator, seed 1565430748769092411
handling optarg C
handling optarg m
handling optarg s
Setting SNR0 to 24.000000
handling optarg z
handling optarg n
handling optarg P
handling optarg q
handling optarg R
handling optarg r
[CONFIG] log_config: 2/3 parameters successfully set 
[CONFIG] log_config: 50/50 parameters successfully set 
[CONFIG] log_config: 50/50 parameters successfully set 
[CONFIG] log_config: 16/16 parameters successfully set 
[CONFIG] log_config: 16/16 parameters successfully set 
log init done
create a thread for core -1
create a thread for core -1
create a thread for core -1
create a thread for core -1
DL frequency 3649140000: band 48, UL frequency 3649140000
[PHY]   Init: N_RB_DL 273, first_carrier_offset 2458, nb_prefix_samples 288,nb_prefix_samples0 352, ofdm_symbol_size 4096
[CONFIG] loader: 2/2 parameters successfully set 
[CONFIG] loader.dfts: 1/2 parameters successfully set 
shlib_path libdfts.so
[LOADER] library libdfts.so successfully loaded
[CONFIG] loader.ldpc: 1/2 parameters successfully set 
shlib_path libldpc.so
[LOADER] library libldpc.so successfully loaded
AWGN: ricean_factor 0.000000
[CONFIG] loader.dfts: 1/2 parameters successfully set 
shlib_path libdfts.so
[LOADER] library libdfts.so has been loaded previously, reloading function pointers
[LOADER] library libdfts.so successfully loaded
num dmrs sym 1
[ULSIM]: length_dmrs: 1, l_prime_mask: 1	number_dmrs_symbols: 1, mapping_type: 1 add_pos: 0 
[ULSIM]: CDM groups: 1, dmrs_config_type: 0, num_rbs: 273, nb_symb_sch: 12
[ULSIM]: MCS: 25, mod order: 8, code_rate: 8850

[ULSIM]: VALUE OF G: 301392, TBS: 262376
*****************************************
SNR 24.000000: n_errors (22/100,0/22,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (57311/30139200,12809/6630624,0/0,0/0)

SNR 24.000000: Channel BLER (2.200000e-01,0.000000e+00,-nan,-nan Channel BER (1.901544e-03,1.931794e-03,-nan,-nan) Avg round 1.22, Eff Rate 233514.6400 bits/slot, Eff Throughput 89.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1251.82 us (122 trials)
 Statistics std=123.97, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          375.21 us (122 trials)
    |__ ULSCH channel estimation time      152.48 us (122 trials)
    |__ RX PUSCH Initialization time        49.28 us (122 trials)
    |__ RX PUSCH Symbol Processing time    173.04 us (122 trials)

UE TX
|__ ULSCH total encoding time              295.55 us (122 trials)
    |__ ULSCH segmentation time             20.23 us (100 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.72 us (3904 trials)
    |__ ULSCH interleaving time              2.96 us (3904 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 24.200000: n_errors (16/100,0/16,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (53401/30139200,8731/4822272,0/0,0/0)

SNR 24.200000: Channel BLER (1.600000e-01,0.000000e+00,-nan,-nan Channel BER (1.771812e-03,1.810557e-03,-nan,-nan) Avg round 1.16, Eff Rate 241385.9200 bits/slot, Eff Throughput 92.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1246.83 us (116 trials)
 Statistics std=100.45, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          374.74 us (116 trials)
    |__ ULSCH channel estimation time      152.49 us (116 trials)
    |__ RX PUSCH Initialization time        49.04 us (116 trials)
    |__ RX PUSCH Symbol Processing time    172.79 us (116 trials)

UE TX
|__ ULSCH total encoding time              300.84 us (116 trials)
    |__ ULSCH segmentation time             20.27 us (200 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.72 us (3712 trials)
    |__ ULSCH interleaving time              2.96 us (3712 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 24.400000: n_errors (16/100,0/16,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (49051/30139200,8105/4822272,0/0,0/0)

SNR 24.400000: Channel BLER (1.600000e-01,0.000000e+00,-nan,-nan Channel BER (1.627482e-03,1.680743e-03,-nan,-nan) Avg round 1.16, Eff Rate 241385.9200 bits/slot, Eff Throughput 92.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1246.67 us (116 trials)
 Statistics std=94.65, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          374.46 us (116 trials)
    |__ ULSCH channel estimation time      152.27 us (116 trials)
    |__ RX PUSCH Initialization time        49.16 us (116 trials)
    |__ RX PUSCH Symbol Processing time    172.61 us (116 trials)

UE TX
|__ ULSCH total encoding time              300.90 us (116 trials)
    |__ ULSCH segmentation time             20.24 us (300 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.72 us (3712 trials)
    |__ ULSCH interleaving time              2.96 us (3712 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 24.600000: n_errors (10/100,0/10,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (45534/30139200,4745/3013920,0/0,0/0)

SNR 24.600000: Channel BLER (1.000000e-01,0.000000e+00,-nan,-nan Channel BER (1.510790e-03,1.574362e-03,-nan,-nan) Avg round 1.10, Eff Rate 249257.2000 bits/slot, Eff Throughput 95.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1244.20 us (110 trials)
 Statistics std=83.34, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          374.69 us (110 trials)
    |__ ULSCH channel estimation time      152.42 us (110 trials)
    |__ RX PUSCH Initialization time        49.07 us (110 trials)
    |__ RX PUSCH Symbol Processing time    172.79 us (110 trials)

UE TX
|__ ULSCH total encoding time              310.50 us (110 trials)
    |__ ULSCH segmentation time             20.24 us (400 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.73 us (3520 trials)
    |__ ULSCH interleaving time              2.96 us (3520 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 24.800000: n_errors (11/100,0/11,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (43242/30139200,4905/3315312,0/0,0/0)

SNR 24.800000: Channel BLER (1.100000e-01,0.000000e+00,-nan,-nan Channel BER (1.434743e-03,1.479499e-03,-nan,-nan) Avg round 1.11, Eff Rate 247945.3200 bits/slot, Eff Throughput 94.50, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1240.12 us (111 trials)
 Statistics std=90.06, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          374.12 us (111 trials)
    |__ ULSCH channel estimation time      152.27 us (111 trials)
    |__ RX PUSCH Initialization time        49.16 us (111 trials)
    |__ RX PUSCH Symbol Processing time    172.28 us (111 trials)

UE TX
|__ ULSCH total encoding time              308.74 us (111 trials)
    |__ ULSCH segmentation time             20.25 us (500 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.73 us (3552 trials)
    |__ ULSCH interleaving time              2.97 us (3552 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 25.000000: n_errors (11/100,0/11,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (40636/30139200,4584/3315312,0/0,0/0)

SNR 25.000000: Channel BLER (1.100000e-01,0.000000e+00,-nan,-nan Channel BER (1.348277e-03,1.382675e-03,-nan,-nan) Avg round 1.11, Eff Rate 247945.3200 bits/slot, Eff Throughput 94.50, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1246.36 us (111 trials)
 Statistics std=74.27, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          374.68 us (111 trials)
    |__ ULSCH channel estimation time      152.20 us (111 trials)
    |__ RX PUSCH Initialization time        49.06 us (111 trials)
    |__ RX PUSCH Symbol Processing time    173.01 us (111 trials)

UE TX
|__ ULSCH total encoding time              308.45 us (111 trials)
    |__ ULSCH segmentation time             20.25 us (600 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.73 us (3552 trials)
    |__ ULSCH interleaving time              2.96 us (3552 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 25.200000: n_errors (6/100,0/6,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (38750/30139200,2457/1808352,0/0,0/0)

SNR 25.200000: Channel BLER (6.000000e-02,0.000000e+00,-nan,-nan Channel BER (1.285701e-03,1.358696e-03,-nan,-nan) Avg round 1.06, Eff Rate 254504.7200 bits/slot, Eff Throughput 97.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1244.01 us (106 trials)
 Statistics std=61.95, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          374.03 us (106 trials)
    |__ ULSCH channel estimation time      152.30 us (106 trials)
    |__ RX PUSCH Initialization time        49.12 us (106 trials)
    |__ RX PUSCH Symbol Processing time    172.20 us (106 trials)

UE TX
|__ ULSCH total encoding time              317.37 us (106 trials)
    |__ ULSCH segmentation time             20.24 us (700 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.73 us (3392 trials)
    |__ ULSCH interleaving time              2.97 us (3392 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 25.400000: n_errors (2/100,0/2,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (37784/30139200,847/602784,0/0,0/0)

SNR 25.400000: Channel BLER (2.000000e-02,0.000000e+00,-nan,-nan Channel BER (1.253650e-03,1.405147e-03,-nan,-nan) Avg round 1.02, Eff Rate 259752.2400 bits/slot, Eff Throughput 99.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1245.45 us (102 trials)
 Statistics std=41.05, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          375.02 us (102 trials)
    |__ ULSCH channel estimation time      152.31 us (102 trials)
    |__ RX PUSCH Initialization time        49.22 us (102 trials)
    |__ RX PUSCH Symbol Processing time    173.08 us (102 trials)

UE TX
|__ ULSCH total encoding time              325.06 us (102 trials)
    |__ ULSCH segmentation time             20.23 us (800 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.75 us (3264 trials)
    |__ ULSCH interleaving time              2.98 us (3264 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 25.600000: n_errors (4/100,0/4,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (36083/30139200,1457/1205568,0/0,0/0)

SNR 25.600000: Channel BLER (4.000000e-02,0.000000e+00,-nan,-nan Channel BER (1.197212e-03,1.208559e-03,-nan,-nan) Avg round 1.04, Eff Rate 257128.4800 bits/slot, Eff Throughput 98.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1243.27 us (104 trials)
 Statistics std=56.47, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          374.75 us (104 trials)
    |__ ULSCH channel estimation time      152.24 us (104 trials)
    |__ RX PUSCH Initialization time        49.28 us (104 trials)
    |__ RX PUSCH Symbol Processing time    172.83 us (104 trials)

UE TX
|__ ULSCH total encoding time              321.14 us (104 trials)
    |__ ULSCH segmentation time             20.23 us (900 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.74 us (3328 trials)
    |__ ULSCH interleaving time              2.97 us (3328 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 25.800000: n_errors (6/100,0/6,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (34628/30139200,2048/1808352,0/0,0/0)

SNR 25.800000: Channel BLER (6.000000e-02,0.000000e+00,-nan,-nan Channel BER (1.148936e-03,1.132523e-03,-nan,-nan) Avg round 1.06, Eff Rate 254504.7200 bits/slot, Eff Throughput 97.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1241.67 us (106 trials)
 Statistics std=62.46, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          374.06 us (106 trials)
    |__ ULSCH channel estimation time      152.22 us (106 trials)
    |__ RX PUSCH Initialization time        49.22 us (106 trials)
    |__ RX PUSCH Symbol Processing time    172.21 us (106 trials)

UE TX
|__ ULSCH total encoding time              317.35 us (106 trials)
    |__ ULSCH segmentation time             20.23 us (1000 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.74 us (3392 trials)
    |__ ULSCH interleaving time              2.97 us (3392 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 26.000000: n_errors (7/100,0/7,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (32976/30139200,2341/2109744,0/0,0/0)

SNR 26.000000: Channel BLER (7.000000e-02,0.000000e+00,-nan,-nan Channel BER (1.094123e-03,1.109613e-03,-nan,-nan) Avg round 1.07, Eff Rate 253192.8400 bits/slot, Eff Throughput 96.50, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1240.46 us (107 trials)
 Statistics std=69.04, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          374.42 us (107 trials)
    |__ ULSCH channel estimation time      152.42 us (107 trials)
    |__ RX PUSCH Initialization time        49.00 us (107 trials)
    |__ RX PUSCH Symbol Processing time    172.60 us (107 trials)

UE TX
|__ ULSCH total encoding time              315.70 us (107 trials)
    |__ ULSCH segmentation time             20.22 us (1100 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.75 us (3424 trials)
    |__ ULSCH interleaving time              2.97 us (3424 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 26.200000: n_errors (5/100,0/5,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (33306/30139200,1589/1506960,0/0,0/0)

SNR 26.200000: Channel BLER (5.000000e-02,0.000000e+00,-nan,-nan Channel BER (1.105072e-03,1.054441e-03,-nan,-nan) Avg round 1.05, Eff Rate 255816.6000 bits/slot, Eff Throughput 97.50, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1242.85 us (105 trials)
 Statistics std=52.75, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          374.17 us (105 trials)
    |__ ULSCH channel estimation time      152.52 us (105 trials)
    |__ RX PUSCH Initialization time        49.17 us (105 trials)
    |__ RX PUSCH Symbol Processing time    172.09 us (105 trials)

UE TX
|__ ULSCH total encoding time              319.51 us (105 trials)
    |__ ULSCH segmentation time             20.23 us (1200 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.74 us (3360 trials)
    |__ ULSCH interleaving time              2.97 us (3360 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 26.400000: n_errors (5/100,0/5,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (32159/30139200,1712/1506960,0/0,0/0)

SNR 26.400000: Channel BLER (5.000000e-02,0.000000e+00,-nan,-nan Channel BER (1.067016e-03,1.136062e-03,-nan,-nan) Avg round 1.05, Eff Rate 255816.6000 bits/slot, Eff Throughput 97.50, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1240.46 us (105 trials)
 Statistics std=55.80, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          374.20 us (105 trials)
    |__ ULSCH channel estimation time      152.57 us (105 trials)
    |__ RX PUSCH Initialization time        49.18 us (105 trials)
    |__ RX PUSCH Symbol Processing time    172.07 us (105 trials)

UE TX
|__ ULSCH total encoding time              319.31 us (105 trials)
    |__ ULSCH segmentation time             20.22 us (1300 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.75 us (3360 trials)
    |__ ULSCH interleaving time              2.98 us (3360 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 26.600000: n_errors (3/100,0/3,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (31808/30139200,965/904176,0/0,0/0)

SNR 26.600000: Channel BLER (3.000000e-02,0.000000e+00,-nan,-nan Channel BER (1.055370e-03,1.067270e-03,-nan,-nan) Avg round 1.03, Eff Rate 258440.3600 bits/slot, Eff Throughput 98.50, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1241.58 us (103 trials)
 Statistics std=41.88, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          373.48 us (103 trials)
    |__ ULSCH channel estimation time      152.49 us (103 trials)
    |__ RX PUSCH Initialization time        49.11 us (103 trials)
    |__ RX PUSCH Symbol Processing time    171.48 us (103 trials)

UE TX
|__ ULSCH total encoding time              322.94 us (103 trials)
    |__ ULSCH segmentation time             20.23 us (1400 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.74 us (3296 trials)
    |__ ULSCH interleaving time              2.97 us (3296 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 26.800000: n_errors (4/100,0/4,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (31393/30139200,1243/1205568,0/0,0/0)

SNR 26.800000: Channel BLER (4.000000e-02,0.000000e+00,-nan,-nan Channel BER (1.041600e-03,1.031049e-03,-nan,-nan) Avg round 1.04, Eff Rate 257128.4800 bits/slot, Eff Throughput 98.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1237.82 us (104 trials)
 Statistics std=52.53, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          373.49 us (104 trials)
    |__ ULSCH channel estimation time      152.04 us (104 trials)
    |__ RX PUSCH Initialization time        49.24 us (104 trials)
    |__ RX PUSCH Symbol Processing time    171.81 us (104 trials)

UE TX
|__ ULSCH total encoding time              321.34 us (104 trials)
    |__ ULSCH segmentation time             20.23 us (1500 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.75 us (3328 trials)
    |__ ULSCH interleaving time              2.97 us (3328 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 27.000000: n_errors (1/100,0/1,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (30004/30139200,310/301392,0/0,0/0)

SNR 27.000000: Channel BLER (1.000000e-02,0.000000e+00,-nan,-nan Channel BER (9.955141e-04,1.028561e-03,-nan,-nan) Avg round 1.01, Eff Rate 261064.1200 bits/slot, Eff Throughput 99.50, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1239.96 us (101 trials)
 Statistics std=25.81, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          374.35 us (101 trials)
    |__ ULSCH channel estimation time      152.29 us (101 trials)
    |__ RX PUSCH Initialization time        49.13 us (101 trials)
    |__ RX PUSCH Symbol Processing time    172.53 us (101 trials)

UE TX
|__ ULSCH total encoding time              327.13 us (101 trials)
    |__ ULSCH segmentation time             20.23 us (1600 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.75 us (3232 trials)
    |__ ULSCH interleaving time              2.98 us (3232 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 27.200000: n_errors (0/100,0/0,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (30702/30139200,0/0,0/0,0/0)

SNR 27.200000: Channel BLER (0.000000e+00,-nan,-nan,-nan Channel BER (1.018673e-03,-nan,-nan,-nan) Avg round 1.00, Eff Rate 262376.0000 bits/slot, Eff Throughput 100.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           1240.39 us (100 trials)
 Statistics std=11.31, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          372.84 us (100 trials)
    |__ ULSCH channel estimation time      152.28 us (100 trials)
    |__ RX PUSCH Initialization time        49.16 us (100 trials)
    |__ RX PUSCH Symbol Processing time    171.01 us (100 trials)

UE TX
|__ ULSCH total encoding time              328.95 us (100 trials)
    |__ ULSCH segmentation time             20.23 us (1700 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.75 us (3200 trials)
    |__ ULSCH interleaving time              2.98 us (3200 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*************
PUSCH test OK
*************

Num RB:	273
Num symbols:	12
MCS:	25
DMRS config type:	0
DMRS add pos:	0
PUSCH mapping type:	1
DMRS length:	1
DMRS CDM gr w/o data:	1
```

#### Running with 12 cores (to match 12 symbols ??)


```
sudo ./nr_ulsim -C 12 -m 25 -s 24 -z 4 -n 100 -P -q 1 -R 273 -r 273
```
> Returns
```powershell
[sudo] password for bricer: 
CMDLINE: "./nr_ulsim" "-C" "12" "-m" "25" "-s" "24" "-z" "4" "-n" "100" "-P" "-q" "1" "-R" "273" "-r" "273" 
[CONFIG] get parameters from cmdline [CONFIG] debug flags: 0x00400000
Initializing random number generator, seed 14140659984681693360
handling optarg C
handling optarg m
handling optarg s
Setting SNR0 to 24.000000
handling optarg z
handling optarg n
handling optarg P
handling optarg q
handling optarg R
handling optarg r
[CONFIG] log_config: 2/3 parameters successfully set 
[CONFIG] log_config: 50/50 parameters successfully set 
[CONFIG] log_config: 50/50 parameters successfully set 
[CONFIG] log_config: 16/16 parameters successfully set 
[CONFIG] log_config: 16/16 parameters successfully set 
log init done
create a thread for core -1
create a thread for core -1
create a thread for core -1
create a thread for core -1
create a thread for core -1
create a thread for core -1
create a thread for core -1
create a thread for core -1
create a thread for core -1
create a thread for core -1
create a thread for core -1
create a thread for core -1
DL frequency 3649140000: band 48, UL frequency 3649140000
[PHY]   Init: N_RB_DL 273, first_carrier_offset 2458, nb_prefix_samples 288,nb_prefix_samples0 352, ofdm_symbol_size 4096
[CONFIG] loader: 2/2 parameters successfully set 
[CONFIG] loader.dfts: 1/2 parameters successfully set 
shlib_path libdfts.so
[LOADER] library libdfts.so successfully loaded
[CONFIG] loader.ldpc: 1/2 parameters successfully set 
shlib_path libldpc.so
[LOADER] library libldpc.so successfully loaded
AWGN: ricean_factor 0.000000
[CONFIG] loader.dfts: 1/2 parameters successfully set 
shlib_path libdfts.so
[LOADER] library libdfts.so has been loaded previously, reloading function pointers
[LOADER] library libdfts.so successfully loaded
num dmrs sym 1
[ULSIM]: length_dmrs: 1, l_prime_mask: 1	number_dmrs_symbols: 1, mapping_type: 1 add_pos: 0 
[ULSIM]: CDM groups: 1, dmrs_config_type: 0, num_rbs: 273, nb_symb_sch: 12
[ULSIM]: MCS: 25, mod order: 8, code_rate: 8850

[ULSIM]: VALUE OF G: 301392, TBS: 262376
*****************************************
SNR 24.000000: n_errors (13/100,0/13,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (77099/30139200,10056/3918096,0/0,0/0)

SNR 24.000000: Channel BLER (1.300000e-01,0.000000e+00,-nan,-nan Channel BER (2.558097e-03,2.566553e-03,-nan,-nan) Avg round 1.13, Eff Rate 245321.5600 bits/slot, Eff Throughput 93.50, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           697.89 us (113 trials)
 Statistics std=127.87, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          305.98 us (113 trials)
    |__ ULSCH channel estimation time      153.20 us (113 trials)
    |__ RX PUSCH Initialization time        49.86 us (113 trials)
    |__ RX PUSCH Symbol Processing time    102.40 us (113 trials)

UE TX
|__ ULSCH total encoding time              317.87 us (113 trials)
    |__ ULSCH segmentation time             20.22 us (100 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.76 us (3616 trials)
    |__ ULSCH interleaving time              3.02 us (3616 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 24.200000: n_errors (8/100,0/8,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (72971/30139200,5638/2411136,0/0,0/0)

SNR 24.200000: Channel BLER (8.000000e-02,0.000000e+00,-nan,-nan Channel BER (2.421133e-03,2.338317e-03,-nan,-nan) Avg round 1.08, Eff Rate 251880.9600 bits/slot, Eff Throughput 96.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           681.02 us (108 trials)
 Statistics std=30.15, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          302.75 us (108 trials)
    |__ ULSCH channel estimation time      152.95 us (108 trials)
    |__ RX PUSCH Initialization time        49.65 us (108 trials)
    |__ RX PUSCH Symbol Processing time     99.66 us (108 trials)

UE TX
|__ ULSCH total encoding time              320.91 us (108 trials)
    |__ ULSCH segmentation time             20.23 us (200 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.75 us (3456 trials)
    |__ ULSCH interleaving time              3.01 us (3456 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 24.400000: n_errors (8/100,0/8,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (69719/30139200,5393/2411136,0/0,0/0)

SNR 24.400000: Channel BLER (8.000000e-02,0.000000e+00,-nan,-nan Channel BER (2.313233e-03,2.236705e-03,-nan,-nan) Avg round 1.08, Eff Rate 251880.9600 bits/slot, Eff Throughput 96.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           679.55 us (108 trials)
 Statistics std=30.59, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          303.33 us (108 trials)
    |__ ULSCH channel estimation time      153.04 us (108 trials)
    |__ RX PUSCH Initialization time        49.55 us (108 trials)
    |__ RX PUSCH Symbol Processing time    100.26 us (108 trials)

UE TX
|__ ULSCH total encoding time              321.19 us (108 trials)
    |__ ULSCH segmentation time             20.25 us (300 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.75 us (3456 trials)
    |__ ULSCH interleaving time              3.02 us (3456 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 24.600000: n_errors (8/100,0/8,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (66256/30139200,5187/2411136,0/0,0/0)

SNR 24.600000: Channel BLER (8.000000e-02,0.000000e+00,-nan,-nan Channel BER (2.198333e-03,2.151268e-03,-nan,-nan) Avg round 1.08, Eff Rate 251880.9600 bits/slot, Eff Throughput 96.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           678.28 us (108 trials)
 Statistics std=29.63, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          302.83 us (108 trials)
    |__ ULSCH channel estimation time      152.90 us (108 trials)
    |__ RX PUSCH Initialization time        49.52 us (108 trials)
    |__ RX PUSCH Symbol Processing time     99.92 us (108 trials)

UE TX
|__ ULSCH total encoding time              321.33 us (108 trials)
    |__ ULSCH segmentation time             20.23 us (400 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.75 us (3456 trials)
    |__ ULSCH interleaving time              3.02 us (3456 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 24.800000: n_errors (2/100,0/2,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (63138/30139200,1186/602784,0/0,0/0)

SNR 24.800000: Channel BLER (2.000000e-02,0.000000e+00,-nan,-nan Channel BER (2.094880e-03,1.967537e-03,-nan,-nan) Avg round 1.02, Eff Rate 259752.2400 bits/slot, Eff Throughput 99.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           677.85 us (102 trials)
 Statistics std=17.77, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          302.41 us (102 trials)
    |__ ULSCH channel estimation time      152.90 us (102 trials)
    |__ RX PUSCH Initialization time        49.63 us (102 trials)
    |__ RX PUSCH Symbol Processing time     99.38 us (102 trials)

UE TX
|__ ULSCH total encoding time              333.01 us (102 trials)
    |__ ULSCH segmentation time             20.23 us (500 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.76 us (3264 trials)
    |__ ULSCH interleaving time              3.02 us (3264 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*****************************************
SNR 25.000000: n_errors (0/100,0/0,0/0,0/0) (negative CRC), false_positive 0/100, errors_scrambling (60946/30139200,0/0,0/0,0/0)

SNR 25.000000: Channel BLER (0.000000e+00,-nan,-nan,-nan Channel BER (2.022151e-03,-nan,-nan,-nan) Avg round 1.00, Eff Rate 262376.0000 bits/slot, Eff Throughput 100.00, TBS 262376 bits/slot
DMRS-PUSCH delay estimation: min 0, max 0, average 0.000000
*****************************************

gNB RX
Total PHY proc rx                           680.50 us (100 trials)
 Statistics std=7.04, median=0.00, q1=0.00, q3=0.00 µs (on 0 trials)
|__ RX PUSCH time                          302.35 us (100 trials)
    |__ ULSCH channel estimation time      152.92 us (100 trials)
    |__ RX PUSCH Initialization time        49.69 us (100 trials)
    |__ RX PUSCH Symbol Processing time     99.25 us (100 trials)

UE TX
|__ ULSCH total encoding time              337.16 us (100 trials)
    |__ ULSCH segmentation time             20.23 us (600 trials)
    |__ ULSCH LDPC encoder time              0.00 us (  1 trials)
    |__ ULSCH rate-matching time             0.76 us (3200 trials)
    |__ ULSCH interleaving time              3.02 us (3200 trials)
|__ RX SRS time                              0.00 us (  0 trials)
    |__ Generate SRS sequence time           0.00 us (  0 trials)
    |__ Get SRS signal time                  0.00 us (  0 trials)
    |__ SRS channel estimation time          0.00 us (  0 trials)
    |__ SRS timing advance estimation time   0.00 us (  0 trials)
    |__ SRS report TLV build time            0.00 us (  0 trials)
        |__ SRS beam report build time       0.00 us (  0 trials)
        |__ SRS IQ matrix build time         0.00 us (  0 trials)

*************
PUSCH test OK
*************

Num RB:	273
Num symbols:	12
MCS:	25
DMRS config type:	0
DMRS add pos:	0
PUSCH mapping type:	1
DMRS length:	1
DMRS CDM gr w/o data:	1
```


# References


```
./nr_ulsim -h
```
> Returns
```powershell
CMDLINE: "./nr_ulsim" "-h" 
[CONFIG] get parameters from cmdline [CONFIG] debug flags: 0x00500000
Initializing random number generator, seed 2897035051185183220
./nr_ulsim: option requires an argument -- 'h'
handling optarg ?
./nr_ulsim -h(elp)
-a ULSCH starting symbol
-b ULSCH number of symbols
-c RNTI
-d Introduce delay in terms of number of samples
-e To simulate MSG3 configuration
-f Input file to read from
-g Channel model configuration. Arguments list: Number of arguments = 3, {Channel model: [A] TDLA30, [B] TDLB100, [C] TDLC300}, {Correlation: [l] Low, [m] Medium, [h] High}, {Maximum Doppler shift} e.g. -g A,l,10
-h This message
-i Change channel estimation technique. Arguments list: Number of arguments=2, Frequency domain {0:Linear interpolation, 1:PRB based averaging}, Time domain {0:Estimates of last DMRS symbol, 1:Average of DMRS symbols}. e.g. -i 1,0
-k 3/4 sampling
-m MCS value
-n Number of trials to simulate
-o ldpc offload flag
-p Use extended prefix mode
-q MCS table
-r Number of allocated resource blocks for PUSCH
-s Starting SNR, runs from SNR0 to SNR0 + 10 dB if ending SNR isn't given
-S Ending SNR, runs from SNR0 to SNR1
-t Acceptable effective throughput (in percentage)
-u Set the numerology
-v Set the max rounds
-w Start PRB for PUSCH
-y Number of TX antennas used at UE
-z Number of RX antennas used at gNB
-C Specify the number of threads for the simulation
-E {SRS: [0] Disabled, [1] Enabled} e.g. -E 1
-F Input filename (.txt format) for RX conformance testing
-G Offset of samples to read from file (0 default)
-H Slot number
-I Maximum LDPC decoder iterations
-L <log level, 0(errors), 1(warning), 2(info) 3(debug) 4 (trace)>
-M Use limited buffer rate-matching
-P Print ULSCH performances
-Q If -F used, read parameters from file
-R Maximum number of available resorce blocks (N_RB_DL)
-T Enable PTRS, arguments list: Number of arguments=2 L_PTRS{0,1,2} K_PTRS{2,4}, e.g. -T 0,2 
-U Change DMRS Config, arguments list: Number of arguments=4, DMRS Mapping Type{0=A,1=B}, DMRS AddPos{0:3}, DMRS Config Type{1,2}, Number of CDM groups without data{1,2,3} e.g. -U 0,2,0,1 
-W Num of layer for PUSCH
-X Output filename (.csv format) for stats
-Z If -Z is used, SC-FDMA or transform precoding is enabled in Uplink
```


```
./build_oai --phy_simulators
```
> Returns
```
...
cd ~/Developer/openairinterface5g/cmake_targets/ran_build/build
Running "cmake3 --build .  --target dlsim ulsim ldpctest polartest smallblocktest nr_pbchsim nr_dlschsim nr_ulschsim nr_dlsim nr_ulsim nr_pucchsim nr_prachsim params_libconfig coding rfsimulator dfts -- -j28" 
Log file for compilation is being written to: /home/bricer/Developer/openairinterface5g/cmake_targets/log/all.txt
dlsim ulsim ldpctest polartest smallblocktest nr_pbchsim nr_dlschsim nr_ulschsim nr_dlsim nr_ulsim nr_pucchsim nr_prachsim params_libconfig coding rfsimulator dfts compiled
BUILD SHOULD BE SUCCESSFUL
```

```
cd ran_build/build
```


```
./nr_ulsim -C 4 -m 25 -s 24 -z 4 -n 100 -P -q 1 -R 273 -r 273
```
> Returns
```powershell
CMDLINE: "./nr_ulsim" "-C" "4" "-m" "25" "-s" "24" "-z" "4" "-n" "100" "-P" "-q" "1" "-R" "273" "-r" "273"
[CONFIG] get parameters from cmdline [CONFIG] debug flags: 0x00400000
Initializing random number generator, seed 13837415079507951325
handling optarg C
handling optarg m
handling optarg s
Setting SNR0 to 24.000000
handling optarg z
handling optarg n
handling optarg P
handling optarg q
handling optarg R
handling optarg r
[CONFIG] log_config: 2/3 parameters successfully set
[CONFIG] log_config: 50/50 parameters successfully set
[CONFIG] log_config: 50/50 parameters successfully set
[CONFIG] log_config: 16/16 parameters successfully set
[CONFIG] log_config: 16/16 parameters successfully set
log init done
create a thread for core -1
Assertion (ret == 0) failed!
In threadCreate() /home/bricer/Developer/openairinterface5g/common/utils/system.c:266
Error in pthread_create(): ret: 1, errno: 0
Exiting execution
Exiting at: /home/bricer/Developer/openairinterface5g/common/utils/system.c:266 threadCreate(), _Assert_Exit_
```

the "-C" is the number of cores/threads to use.

 -m is the MCS 

 -q1 means 256QAM codebook (see q equals to 2

 -R Max Resource Block  

 -r means 273 RB (resource blocks) 

 -z 4 receive Antennas got up to 8

 -n 100 (trials)

 -P output (std output) -P 1 (goes to Matlab files)

The "-P" gives benchmarking output. I will explain when you try.and -q the codebook.  so mcs > 19 means 256QAM, 14-19 is 64QAM. -q0 is the 64QAM codebook. -z is the number of receive antennas and -n is the number of trials to run.
11:18
if you run with -n1 you get some MATLAB .m files with internal signals from the MODEM (like the llrs, the channel compensated outputs and the raw RX signals in time and frequency.

---


```
git clone git@gitlab.eurecom.fr:oai/openairinterface5g.git
```

```
cd openairinterface5g/cmake_targets
./build_oai --ninja -I 
./build_oai --ninja -P
```


### Coding 


- Polar Code

~/Developer/openairinterface5g/openair1/PHY/CODING
less ./nrPolar_tools/nr_polar_decoding_tools.c

```c
void computeBeta(const t_nrPolar_params *pp,decoder_node_t *node) {

```

- ListCRC

```
./polartest -s -10
Initializing random number generator, seed 16810622875026781604
testArrayLength 1 realArrayLength 2
SNR -10.000000
...
```

```
./polartest -q
Initializing random number generator, seed 6947532659631140661
testArrayLength 1 realArrayLength 2
SNR -20.000000
[ListSize=8] SNR= -20.000, BLER= 1.000000, BER= 1.000000000, t_Encoder=    2.826us, t_Decoder=    3.434us
SNR -19.500000
[ListSize=8] SNR= -19.500, BLER= 1.000000, BER= 1.000000000, t_Encoder=    2.770us, t_Decoder=    3.376us
SNR -19.000000
[ListSize=8] SNR= -19.000, BLER= 1.000000, BER= 1.000000000, t_Encoder=    2.753us, t_Decoder=    3.340us
SNR -18.500000
[ListSize=8] SNR= -18.500, BLER= 1.000000, BER= 1.000000000, t_Encoder=    2.744us, t_Decoder=    3.311us
SNR -18.000000
[ListSize=8] SNR= -18.000, BLER= 1.000000, BER= 1.000000000, t_Encoder=    2.738us, t_Decoder=    3.288us
SNR -17.500000
[ListSize=8] SNR= -17.500, BLER= 1.000000, BER= 1.000000000, t_Encoder=    2.735us, t_Decoder=    3.266us
SNR -17.000000
[ListSize=8] SNR= -17.000, BLER= 1.000000, BER= 1.000000000, t_Encoder=    2.732us, t_Decoder=    3.248us
SNR -16.500000
[ListSize=8] SNR= -16.500, BLER= 1.000000, BER= 1.000000000, t_Encoder=    2.730us, t_Decoder=    3.232us
SNR -16.000000
[ListSize=8] SNR= -16.000, BLER= 1.000000, BER= 1.000000000, t_Encoder=    2.728us, t_Decoder=    3.217us
SNR -15.500000
[ListSize=8] SNR= -15.500, BLER= 1.000000, BER= 1.000000000, t_Encoder=    2.727us, t_Decoder=    3.203us
SNR -15.000000
[ListSize=8] SNR= -15.000, BLER= 1.000000, BER= 1.000000000, t_Encoder=    2.726us, t_Decoder=    3.191us
SNR -14.500000
[ListSize=8] SNR= -14.500, BLER= 1.000000, BER= 1.000000000, t_Encoder=    2.725us, t_Decoder=    3.180us
SNR -14.000000
[ListSize=8] SNR= -14.000, BLER= 1.000000, BER= 1.000000000, t_Encoder=    2.724us, t_Decoder=    3.171us
SNR -13.500000
[ListSize=8] SNR= -13.500, BLER= 0.999000, BER= 0.999000000, t_Encoder=    2.723us, t_Decoder=    3.163us
SNR -13.000000
[ListSize=8] SNR= -13.000, BLER= 0.999000, BER= 0.999000000, t_Encoder=    2.723us, t_Decoder=    3.156us
SNR -12.500000
[ListSize=8] SNR= -12.500, BLER= 0.996000, BER= 0.996000000, t_Encoder=    2.722us, t_Decoder=    3.150us
SNR -12.000000
[ListSize=8] SNR= -12.000, BLER= 0.989000, BER= 0.989000000, t_Encoder=    2.722us, t_Decoder=    3.144us
SNR -11.500000
[ListSize=8] SNR= -11.500, BLER= 0.975000, BER= 0.975000000, t_Encoder=    2.721us, t_Decoder=    3.139us
SNR -11.000000
[ListSize=8] SNR= -11.000, BLER= 0.964000, BER= 0.964000000, t_Encoder=    2.721us, t_Decoder=    3.134us
SNR -10.500000
[ListSize=8] SNR= -10.500, BLER= 0.913000, BER= 0.913000000, t_Encoder=    2.721us, t_Decoder=    3.130us
SNR -10.000000
[ListSize=8] SNR= -10.000, BLER= 0.828000, BER= 0.828000000, t_Encoder=    2.721us, t_Decoder=    3.126us
SNR -9.500000
[ListSize=8] SNR=  -9.500, BLER= 0.706000, BER= 0.706000000, t_Encoder=    2.720us, t_Decoder=    3.122us
SNR -9.000000
[ListSize=8] SNR=  -9.000, BLER= 0.615000, BER= 0.615000000, t_Encoder=    2.720us, t_Decoder=    3.119us
SNR -8.500000
[ListSize=8] SNR=  -8.500, BLER= 0.455000, BER= 0.455000000, t_Encoder=    2.720us, t_Decoder=    3.116us
SNR -8.000000
[ListSize=8] SNR=  -8.000, BLER= 0.297000, BER= 0.297000000, t_Encoder=    2.719us, t_Decoder=    3.113us
SNR -7.500000
[ListSize=8] SNR=  -7.500, BLER= 0.159000, BER= 0.159000000, t_Encoder=    2.719us, t_Decoder=    3.111us
SNR -7.000000
[ListSize=8] SNR=  -7.000, BLER= 0.071000, BER= 0.071000000, t_Encoder=    2.719us, t_Decoder=    3.109us
SNR -6.500000
[ListSize=8] SNR=  -6.500, BLER= 0.026000, BER= 0.026000000, t_Encoder=    2.719us, t_Decoder=    3.106us
SNR -6.000000
[ListSize=8] SNR=  -6.000, BLER= 0.012000, BER= 0.012000000, t_Encoder=    2.719us, t_Decoder=    3.104us
SNR -5.500000
[ListSize=8] SNR=  -5.500, BLER= 0.001000, BER= 0.001000000, t_Encoder=    2.719us, t_Decoder=    3.103us
SNR -5.000000
[ListSize=8] SNR=  -5.000, BLER= 0.000000, BER= 0.000000000, t_Encoder=    2.719us, t_Decoder=    3.101us
                          Name                      Total                 Per Trials                 Num Trials                 CPU_F_GHz 2.993147
                 polar_encoder:            2.718 us;           31000;           5.243 us;
                 polar_decoder:            3.101 us;           31000;           6.092 us;
```

# References

- [ ] [How To Install Ubuntu 22.10 On M1 or M2 Mac || RUN NEW Ubuntu On ANY Mac W/ Apple Silicon Using UTM](https://www.youtube.com/watch?v=O19mv1pe76M&t=0s)
- [ ] [oaiworkshop/summerworkshop2023/Repository](https://gitlab.eurecom.fr/oaiworkshop/summerworkshop2023/-/tree/main/ran)
