# CEVA

## Multiple Access **MA** Comparison

Here’s a detailed comparison of **OFDMA**, **CDMA**, **FDMA**, and **TDMA**, the four major multiple access technologies in wireless communication:

---

### **Comparison Table**

| Feature                 | **OFDMA**                     | **CDMA**                       | **FDMA**                     | **TDMA**                     |
|-------------------------|-------------------------------|---------------------------------|------------------------------|------------------------------|
| **Resource Division**   | Frequency-time (subcarriers)  | Spreading codes                | Frequency bands              | Time slots                   |
| **Spectral Efficiency** | High                         | Moderate                       | Low                          | Moderate                     |
| **User Distinction**    | Subcarrier allocation         | Unique spreading codes         | Dedicated frequency          | Dedicated time slot          |
| **Synchronization**     | High                         | Moderate                       | Low                          | High                         |
| **Interference Handling**| Low (due to orthogonality)   | Moderate (depends on codes)    | High (adjacent channel interference) | Moderate                    |
| **Latency**             | Low                          | Moderate                       | High                         | Moderate                     |
| **Scalability**         | High                         | Moderate                       | Low                          | Moderate                     |
| **Complexity**          | High                         | High                           | Low                          | Moderate                     |
| **Applications**        | 4G LTE, 5G, Wi-Fi 6          | 2G/3G (IS-95, UMTS, CDMA2000)  | 1G analog, satellites        | GSM, DECT, legacy 2G systems |

---

### **Detailed Explanation**

#### **1. Orthogonal Frequency Division Multiple Access (OFDMA)**
- **How it Works**:
   - Divides the bandwidth into multiple orthogonal subcarriers.
   - Each user gets a subset of these subcarriers, dynamically assigned.
- **Strengths**:
   - High spectral efficiency and flexibility.
   - Excellent for broadband systems like **4G LTE**, **5G**, and **Wi-Fi 6**.
- **Weaknesses**:
   - Requires precise synchronization and complex receivers.

---

#### **2. Code Division Multiple Access (CDMA)**
- **How it Works**:
   - All users transmit over the same frequency band, distinguished by unique spreading codes.
- **Strengths**:
   - Robust to narrowband interference and jamming.
   - Soft handoff capability in cellular networks.
- **Weaknesses**:
   - Sensitive to near-far problems (requires power control).
   - Limited by code orthogonality in high-density networks.

---

#### **3. Frequency Division Multiple Access (FDMA)**
- **How it Works**:
   - Allocates distinct frequency bands to different users.
   - Each user transmits continuously on their assigned frequency.
- **Strengths**:
   - Simple implementation and low complexity.
   - No need for tight synchronization.
- **Weaknesses**:
   - Inefficient for bursty traffic as unused frequencies are wasted.
   - Limited scalability and low spectral efficiency.
- **Applications**:
   - Found in **1G analog systems** and some satellite communications.

---

#### **4. Time Division Multiple Access (TDMA)**
- **How it Works**:
   - Divides access by time. Each user is assigned a time slot within a single frequency channel.
- **Strengths**:
   - Simple scheduling and implementation.
   - Effective in low-data-rate environments.
- **Weaknesses**:
   - Requires precise time synchronization.
   - Inefficient for continuous data streams due to time slot limitations.
- **Applications**:
   - Widely used in **2G systems** like GSM, and in systems like **DECT** and some satellite communications.

---

### **Summary of Multiple Access**
| Access Technology | **Best For**                              | **Key Trade-Off**                |
|-------------------|------------------------------------------|----------------------------------|
| **OFDMA**         | High-bandwidth systems like 4G/5G/Wi-Fi  | High complexity and sync needs  |
| **CDMA**          | Cellular systems with low-interference   | Near-far problem and scalability |
| **FDMA**          | Legacy analog systems or satellites      | Low efficiency in modern systems |
| **TDMA**          | Low-data-rate systems (e.g., GSM)        | Time slot inefficiency for high data |

In modern systems, **OFDMA** dominates due to its flexibility, efficiency, and support for high-capacity networks.

Yes, in addition to **OFDMA**, **CDMA**, **FDMA**, and **TDMA**, several other multiple access technologies are used in modern and emerging wireless communication systems. Here's a look at some notable ones:

---

### Summary of Additional Techniques
| Technique | **Primary Use Case** | **Advantages** | **Challenges** |
|-----------|-----------------------|----------------|----------------|
| **SDMA**  | Massive MIMO, 5G      | High capacity via spatial reuse | Advanced antennas needed |
| **NOMA**  | IoT, 5G               | Higher spectral efficiency     | Complex receiver design |
| **SCMA**  | Future 5G systems     | Overload capability            | Codebook design |
| **PDMA**  | Dense IoT networks    | Flexibility, robustness        | Pattern complexity |
| **Cognitive Radio** | Dynamic spectrum access | Spectrum efficiency | Spectrum sensing |
| **ALOHA/CSMA** | Low-traffic IoT   | Simple, scalable               | Collision inefficiency |
| **Hybrid** | 5G and beyond        | Combined benefits              | Complexity |

These emerging and hybrid multiple access techniques address the challenges of increasing connectivity and data demands in modern networks, especially in **5G**, **IoT**, and **beyond-5G** applications.

## **OFDM** and **OFDMA**

The primary difference between **OFDM (Orthogonal Frequency Division Multiplexing)** and **OFDMA (Orthogonal Frequency Division Multiple Access)** lies in how the available resources (subcarriers) are allocated and used:

---

### **1. Definition**
- **OFDM**:
  - A modulation scheme where the entire bandwidth is divided into multiple orthogonal subcarriers.
  - All subcarriers are used by a **single user** at a time.
- **OFDMA**:
  - A multiple access technique that extends OFDM by allowing multiple users to share the subcarriers.
  - Subcarriers are dynamically divided among multiple users simultaneously.

---

### **2. User Access**
- **OFDM**:
  - Designed for **single-user** communication.
  - All subcarriers are utilized for one user at a time.
- **OFDMA**:
  - Designed for **multi-user** communication.
  - Subcarriers are allocated to different users, enabling simultaneous access.

---

### **3. Resource Allocation**
- **OFDM**:
  - No dynamic resource allocation; the entire frequency band is used by one user.
- **OFDMA**:
  - Supports dynamic allocation of subcarriers, time slots, and power to different users based on their requirements.

---

### **4. Applications**
- **OFDM**:
  - Primarily used in point-to-point communication systems such as:
    - Wi-Fi (802.11a/g/n/ac).
    - Digital Video Broadcasting (DVB-T, DVB-C).
- **OFDMA**:
  - Primarily used in point-to-multipoint systems such as:
    - 4G LTE.
    - 5G NR.
    - Wi-Fi 6 (802.11ax).

---

### **5. Latency**
- **OFDM**:
  - Higher latency for multi-user scenarios as each user must take turns using the entire bandwidth.
- **OFDMA**:
  - Lower latency since multiple users can transmit simultaneously on separate subcarriers.

---

### **6. Complexity**
- **OFDM**:
  - Less complex, as it deals with one user and all subcarriers.
- **OFDMA**:
  - More complex due to the need for dynamic resource allocation, synchronization, and interference management among multiple users.

---

### **7. Efficiency**
- **OFDM**:
  - Less efficient in multi-user environments because only one user can use the resources at a time.
- **OFDMA**:
  - More efficient in multi-user environments because it enables simultaneous access for multiple users.

---

### **Comparison Table**

| Feature                | **OFDM**                     | **OFDMA**                     |
|------------------------|------------------------------|-------------------------------|
| **Primary Use**         | Single-user communication    | Multi-user communication      |
| **Resource Allocation** | Entire bandwidth for one user| Subcarriers shared by users   |
| **Latency**             | Higher (multi-user)          | Lower (multi-user)            |
| **Applications**        | Wi-Fi (legacy), DVB          | 4G LTE, 5G NR, Wi-Fi 6        |
| **Efficiency**          | Low for multi-user scenarios | High for multi-user scenarios |
| **Complexity**          | Lower                       | Higher                        |

---

### **Summary**
- **OFDM** is a **modulation technique** designed for single-user systems, where all subcarriers are dedicated to one user.
- **OFDMA** is a **multiple access technique** that builds on OFDM, enabling efficient resource sharing among multiple users in modern communication systems like **4G LTE**, **5G**, and **Wi-Fi 6**.

## **coding rate**

The **coding rate** is the ratio of useful data to total transmitted data, expressed as $R = \frac{k}{n}$, where $k$ is the number of information bits and $n$ is the total bits (information + redundancy). 

### **Wi-Fi 6 Coding Rates**:
- Coding rates vary based on the Modulation and Coding Scheme (MCS):
  - $\frac{1}{2}$: High redundancy, robust (e.g., BPSK, QPSK).
  - $\frac{3}{4}, \frac{5}{6}$: Less redundancy, high throughput (e.g., 64-QAM, 1024-QAM).

### **Trade-offs**:
- **Higher Coding Rate (e.g., $\frac{5}{6}$)**: Faster data, less error protection, needs good channel conditions.
- **Lower Coding Rate (e.g., $\frac{1}{2}$)**: Slower data, better error correction, suitable for poor conditions.

Wi-Fi 6 dynamically adapts the coding rate based on channel quality for optimal performance.

## **Coherence time** (used for BeamForming)

**Coherence time** is the time duration over which a wireless communication channel can be considered time-invariant or stable, meaning the channel's characteristics (such as amplitude and phase) remain relatively constant. It is a key parameter in wireless communication systems for assessing channel variability due to motion or changing environments.

---

### **Definition**
Coherence time ($T_c$) is inversely related to the **Doppler spread** ($f_D$), which is caused by relative motion between the transmitter and receiver or changes in the environment:

$T_c \approx \frac{1}{f_D}$

Where:
- $T_c$: Coherence time (seconds).
- $f_D$: Doppler spread (Hz), the range of frequency shifts caused by motion.

---

### **Key Factors Affecting Coherence Time**
1. **Relative Speed**:
   - Higher relative speed between transmitter and receiver → Higher Doppler spread → Shorter coherence time.
2. **Carrier Frequency**:
   - Higher frequencies are more affected by Doppler shift → Shorter coherence time.
3. **Environment**:
   - Urban environments with multipath propagation typically result in shorter coherence times due to rapid signal fluctuations.

---

### **Implications**
- **Fast Fading**:
   - Occurs when $T_c$ is very short, and the channel changes rapidly compared to the signal's symbol duration.
   - Communication systems need to adapt dynamically, e.g., using equalization or error correction.
- **Slow Fading**:
   - Occurs when $T_c$ is long, and the channel remains relatively stable over many symbols.

---

### **Rule of Thumb**
- Coherence time is typically approximated as:

$T_c \approx \frac{0.423}{f_D}$

Where $f_D = v \cdot \frac{f_c}{c}$:
- $v$: Relative speed (m/s).
- $f_c$: Carrier frequency (Hz).
- $c$: Speed of light ($3 \times 10^8 \, \text{m/s}$).

---

### **Applications**
- **Design of Communication Systems**:
   - Adaptive modulation and coding.
   - Channel estimation and tracking.
   - Time diversity techniques.
- **5G and Beyond**:
   - Essential for systems operating at higher frequencies (e.g., mmWave) where $T_c$ is shorter.

---

### **Example**
- At $f_c = 2 \, \text{GHz}$ with $v = 30 \, \text{m/s}$ (108 km/h):
  - $f_D = v \cdot \frac{f_c}{c} = 30 \cdot \frac{2 \times 10^9}{3 \times 10^8} = 200 \, \text{Hz}$
  - $T_c \approx \frac{0.423}{200} \approx 2.1 \, \text{ms}$

This means the channel will remain stable for approximately 2.1 milliseconds.

---

### **Summary**
Coherence time quantifies how long a channel remains stable. Shorter $T_c$ (high motion, high frequency) requires faster channel adaptation, while longer $T_c$ allows for simpler communication strategies.

## **Coherence bandwidth**

**Coherence bandwidth ($B_c$)** is the frequency range over which the channel's response remains constant. It is inversely related to the **delay spread ($\tau$)**:

$B_c \approx \frac{1}{\tau}$

---

### **Key Points**:
- **Flat fading**: Signal bandwidth $W \leq B_c$ → Channel behaves uniformly across frequencies.
- **Frequency-selective fading**: Signal bandwidth $W > B_c$ → Channel varies across frequencies.
- Used to design systems like **OFDM** by ensuring subcarrier spacing fits within $B_c$.

---

### **Examples**:
- Indoor ($\tau \sim 1 \, \mu s$): $B_c \approx 1 \, \text{MHz}$.
- Urban ($\tau \sim 10 \, \mu s$): $B_c \approx 100 \, \text{kHz}$.

---

### **Comparison with Coherence Time**:
| **Aspect**           | **Coherence Bandwidth**    | **Coherence Time**         |
|-----------------------|----------------------------|----------------------------|
| **Depends on**        | Delay spread ($\tau$)    | Doppler spread ($f_D$)   |
| **Unit**             | Hertz (Hz)                | Seconds (s)               |
| **Applications**     | Frequency stability       | Time stability            |

### **Purpose**:
Helps design systems for stable signal transmission in multipath environments.

The **relationship between degrees of freedom (DoF)** and the **number of nulls** lies in how the available DoF can be allocated to either **enhance the signal** in desired directions or **cancel the signal** in undesired ones. Here's the key insight:

---

## **Degree of Freedom**

### **Relationship Between Degrees of Freedom and Nulls**
- The **number of nulls** that can be formed is equal to:
  $
  \text{Number of Nulls} = \text{Degrees of Freedom (DoF)} - 1
  $
- This relationship holds because:
  - One degree of freedom is always used to form the **main beam** (the desired signal direction).
  - The remaining DoF can be used to create nulls to cancel interference or jamming signals in undesired directions.

---

### **Key Points**
1. **Degrees of Freedom (DoF)**:
   - Determined by the number of antennas (\(N\)) in a system.
   - $\text{DoF} = N$ for a single antenna array.
   - $\text{DoF} = \min(N_t, N_r)$ for MIMO systems (\(N_t\): Transmitter antennas, \(N_r\): Receiver antennas).

2. **Null Formation**:
   - Each null requires one degree of freedom.
   - With \(N\) antennas, you can form \(N-1\) nulls.

---

### **Example**
- **8 Antennas**:
  - Degrees of Freedom = $8$.
  - Main Beam = 1 DoF.
  - Remaining $8 - 1 = 7$ DoF can be used to create nulls.
  - Thus, **7 nulls** can be formed.

---

### **Trade-offs**
- **Beamforming vs. Nulling**:
  - More DoF spent on nulling leaves fewer DoF for improving the main beam (e.g., increasing gain or shaping the beam).
- **Spatial Multiplexing vs. Nulling**:
  - In multi-user MIMO, some DoF may be allocated to serve multiple users, reducing the number of nulls that can be formed.

---

### **Practical Applications**
1. **Interference Mitigation**:
   - Use nulls to cancel interference from specific directions.
2. **Multi-User MIMO**:
   - Balance DoF between serving multiple users and nulling interference.
3. **Beamforming Optimization**:
   - Adjust nulls and beam direction to maximize signal quality for the intended user while minimizing interference.

---

### **Summary**
The **number of nulls** is directly related to the **degrees of freedom** by the formula $\text{Nulls} = \text{DoF} - 1$. With \(N\) antennas, you can form one main beam and up to \(N-1\) nulls, providing flexibility in signal optimization and interference management.
