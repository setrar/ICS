

#### Uncommment DEBUG_PUSCH for testing
//#define DEBUG_PUSCH 

#### Calculation
```c
int nr_pusch_channel_estimation(PHY_VARS_gNB *gNB,
                               unsigned char Ns,
                               int nl,
                               unsigned short p,
                               unsigned char symbol,
                               int ul_id,
                               unsigned short bwp_start_subcarrier,
                               nfapi_nr_pusch_pdu_t *pusch_pdu,
                               int *max_ch,
                               uint32_t *nvar)
```

per antenna processing,m which calculation should be applied? for:

- [ ] max_ch is returned as an integer pointer

Returns total sum of max_ch (per antennas)

- [ ] nvar is returned as an unsigned 32-bit integer pointer

Returns the nvar calculation:

total sum of noise_amp2 / total sum of nest_count (per antennas)

- [ ] delay is returned as a `delay_t *delay = &gNB->ulsch[ul_id].delay` structure

Currently: the last delay is returned when doing the last antenna estimation processing 

What would be the calculation to return one of the delays and store back to `gNB->ulsch[ul_id].delay`
