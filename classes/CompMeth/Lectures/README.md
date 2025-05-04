https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/executables/nr-ru.c?ref_type=heads

https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/executables/nr-gnb.c?ref_type=heads

https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/executables/nr-gnb.c?ref_type=heads#L177

- [ ] [rx_func](https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/executables/nr-gnb.c?ref_type=heads#L206)

- [ ] [phy_procedures_gNB_uespec_RX](https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/executables/nr-gnb.c?ref_type=heads#L262)
- PUCCH
- PUSCH
- SRS

call to MAC Layer

```c
gNB->if_inst->NR_UL_indication(&gNB->UL_INFO);
```


- [ ] [RU](https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/openair1/SCHED_NR/nr_ru_procedures.c?ref_type=heads#L264)

- [ ] [](https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/openair1/PHY/NR_TRANSPORT/nr_ulsch_decoding.c?ref_type=heads)

- [ ] [phy_procedures_nr_gNB](https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/openair1/SCHED_NR/phy_procedures_nr_gNB.c?ref_type=heads#L752)

- [ ] [LLR](https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/openair1/PHY/NR_TRANSPORT/nr_ulsch_llr_computation.c?ref_type=heads)

- [ ] [NR_TRANSPORT](https://gitlab.eurecom.fr/oai/openairinterface5g/-/tree/develop/openair1/PHY/NR_TRANSPORT?ref_type=heads)

- [ ] [nr_fill_ulsch](https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/openair1/PHY/NR_TRANSPORT/nr_ulsch.c?ref_type=heads#L61)
Guts of OAI to the FAPI

- [ ] [Channel Estimation](https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/openair1/PHY/NR_TRANSPORT/nr_ulsch_demodulation.c?ref_type=heads#L1468)

```c
        nr_pusch_channel_estimation(gNB,
                                    slot,
                                    get_dmrs_port(nl,rel15_ul->dmrs_ports),
                                    symbol,
                                    ulsch_id,
                                    bwp_start_subcarrier,
                                    rel15_ul,
                                    &max_ch,
                                    &nvar_tmp);
```

```c
      // measure the SNR from the channel estimation
      nr_gnb_measurements(gNB, 
                          &gNB->ulsch[ulsch_id], 
                          pusch_vars, 
                          symbol, 
                          rel15_ul->nrOfLayers);
```

```c
        for (int aatx = 0; aatx < rel15_ul->nrOfLayers; aatx++) {
          pusch_vars->ulsch_power[aarx] += signal_energy_nodc(
              &pusch_vars->ul_ch_estimates[aatx * gNB->frame_parms.nb_antennas_rx + aarx][symbol * frame_parms->ofdm_symbol_size],
              rel15_ul->rb_size * 12);
        }
```

- [ ] [Channel Scaling](https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/openair1/PHY/NR_TRANSPORT/nr_ulsch_demodulation.c#L1616)


- [ ] [nr_pusch_symbol_processing](https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/openair1/PHY/NR_TRANSPORT/nr_ulsch_demodulation.c#L1391)

- [ ] [](https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/openair1/PHY/NR_TRANSPORT/nr_ulsch_demodulation.c#L1261)


- [ ] [nr_ulsch_channel_compensation](https://gitlab.eurecom.fr/oai/openairinterface5g/-/blob/develop/openair1/PHY/NR_TRANSPORT/nr_ulsch_demodulation.c#L468)

```math
\rho = P12
```

```c
for (int i = 0; i < buffer_length >> 3; i++)  // Dividing by 8
      {
        xmmp0  = simde_mm256_madd_epi16(chF_256[i], rxF_256[i]);
       // xmmp0 contains real part of 8 consecutive outputs (32-bit) of conj(H_m[i])*R_m[i]
 

...
}
```

- [ ] [Intel® Intrinsics Guide ](https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html#text=_mm256_madd_epi16&ig_expand=4200)

```c
FOR j := 0 to 7
	i := j*32
	dst[i+31:i] := SignExtend32(a[i+31:i+16]*b[i+31:i+16]) + SignExtend32(a[i+15:i]*b[i+15:i])
ENDFOR
dst[MAX:256] := 0
```

# References

- [ ] [GNU Radio with a Rusty FPGA Experiment building FPGA accelerated blocks with Rust bindings](https://www.youtube.com/watch?v=TUDkKxAdeWk)

* [Still use SIMD](https://www.youtube.com/watch?v=TUDkKxAdeWk&t=563s)
