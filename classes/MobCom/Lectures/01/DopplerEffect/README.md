# Doppler Effect

The Doppler effect is a phenomenon observed when there is a relative motion between a source of waves (such as sound or light) and an observer. It results in a change in frequency (and consequently wavelength) of the waves perceived by the observer.

### Key Points:

1. **Sound Waves**:
   - When the source of sound is moving towards the observer, the sound waves are compressed, leading to a higher frequency (or pitch). This is why an approaching siren sounds higher in pitch.
   - Conversely, when the source is moving away from the observer, the sound waves are stretched, resulting in a lower frequency (or pitch). This is why a receding siren sounds lower in pitch.

2. **Light Waves**:
   - For light waves, a similar effect occurs. When a light source moves towards an observer, the light appears shifted towards the blue end of the spectrum (blue shift).
   - When the source moves away, the light appears shifted towards the red end of the spectrum (red shift).

3. **Applications**:
   - The Doppler effect has practical applications in various fields, including:
     - **Astronomy**: To determine the speed and direction of stars and galaxies.
     - **Radar and Sonar**: To measure the speed of moving objects, such as vehicles or submarines.
     - **Medical Imaging**: In Doppler ultrasound to assess blood flow in vessels.

4. **Formula**:
   - The observed frequency $f'$ can be calculated using the formula:
     $$f' = f \frac{v + v_o}{v + v_s}$$
     where:
     - $f$ = emitted frequency
     - $v$ = speed of the wave in the medium
     - $v_o$ = speed of the observer (positive if moving towards the source)
     - $v_s$ = speed of the source (positive if moving away from the observer)

### Summary:
The Doppler effect is a critical concept in wave physics that explains how the frequency of waves changes based on the relative motion between the source and the observer, with applications across various scientific fields.

## Doppler spread

`Doppler spread` refers to the broadening of frequency components of a signal due to the relative motion between a transmitter and a receiver, particularly in mobile communication environments. It occurs when there is a change in frequency of the received signal caused by the `Doppler effect`, especially in scenarios involving multiple paths (multipath propagation) and moving objects.

### Key Points:

1. **Definition**:
   - Doppler spread quantifies the range of frequencies that a signal can take on due to the relative motion of the transmitter and receiver. It is typically measured in Hertz (Hz).

2. **Causes**:
   - The spread occurs because:
     - The transmitter or receiver is in motion.
     - There are multiple reflecting surfaces that cause signals to take different paths to the receiver (multipath propagation).
   - Each path may have a different Doppler shift depending on the relative velocity, leading to a mix of frequencies at the receiver.

3. **Impact on Communication**:
   - **Inter-Symbol Interference (ISI)**: Doppler spread can cause symbols to interfere with one another, making it difficult to distinguish between them. This is particularly problematic in high-speed environments.
   - **Channel Capacity**: The effective bandwidth of the channel is affected, which can influence the data rates that can be achieved.

4. **Mathematical Representation**:
   - The Doppler spread can be characterized by the Doppler shift $f_D$, which is determined by:
     $$f_D = \frac{v}{\lambda}$$
     where:
     - $v$ = relative velocity between the transmitter and receiver
     - $\lambda$ = wavelength of the signal

5. **Applications**:
   - Understanding Doppler spread is crucial in designing wireless communication systems, especially for mobile environments such as cellular networks, satellite communications, and vehicular communications.

### Summary:
Doppler spread is an important phenomenon in mobile communication, affecting signal integrity and transmission quality due to the changes in frequency caused by relative motion and multipath propagation. It is a critical factor in the design and analysis of wireless communication systems.

# References

- [ ] [:tv: The Doppler Effect: what does motion do to waves?](https://www.youtube.com/watch?v=h4OnBYrbCjY)
- [ ] [Sinc Function](https://www.youtube.com/watch?v=9sd4DWragBg)
