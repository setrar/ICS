# Math Analysis

---

[TOC]

---


The session's paper, *"From Torch to Projector: Fundamental Tradeoff of Integrated Sensing and Communications (ISAC)"*, examines the mathematical tradeoffs and performance limits between sensing and communications within a unified framework. Below is a comprehensive mathematical flow that organizes the key concepts and equations from such a paper.

---

### **1. Problem Setup**
- ISAC aims to balance the dual objectives of **communication** and **sensing** within a single system, leveraging shared resources like spectrum, hardware, and waveforms.

#### **Key Parameters:**
- Communication rate ($R$)
- Sensing distortion ($D$)
- Joint resource allocation $\mathbf{P}$ (e.g., power, bandwidth)
- Tradeoff weights $\alpha, \beta$ to balance communication and sensing.

---

### **2. Capacity-Distortion Tradeoff**
The first step is to understand the tradeoff between achieving a high communication rate and minimizing sensing distortion:

$$
C(D) = \sup_{p(x|s): \mathbb{E}[d(S, \hat{S})] \leq D} I(X; Y)
$$

- **$C(D)$**: Maximum achievable communication rate for a given sensing distortion $D$.
- **$I(X; Y)$**: Mutual information between transmitted ($X$) and received ($Y$) signals, quantifying communication capacity.
- **$d(S, \hat{S})$**: Distortion metric between true state $S$ and estimated state $\hat{S}$.
- **Objective**: Minimize distortion while maintaining a high communication rate.

---

### **3. Sensing Accuracy: Cramer-Rao Bound (CRB)**
For the sensing task, the **Cramer-Rao Bound (CRB)** defines the fundamental limit on the variance of unbiased estimators:

$$
\text{Var}(\hat{S}) \geq \frac{1}{\mathbb{E}\left[\left(\frac{\partial \log p(Y|S)}{\partial S}\right)^2\right]}
$$

- **CRB**: Lower bound on sensing accuracy.
- **Likelihood $p(Y|S)$**: Models the relationship between the environment ($S$) and observed signal ($Y$).
- **Objective**: Maximize sensing accuracy by reducing the bound on $\text{Var}(\hat{S})$.

---

### **4. Joint Optimization of ISAC**
To balance communication and sensing, a joint optimization problem is formulated:

$$
\max_{\mathbf{P}} \quad \alpha R + \beta \frac{1}{D}, \quad \text{subject to constraints on power, bandwidth, and hardware.}
$$

- **$\alpha, \beta$**: Weights prioritizing communication rate ($R$) and inverse sensing distortion ($1/D$).
- **Resource Allocation $\mathbf{P}$**: Power and bandwidth are shared between sensing and communication.
- **Constraints**:
  - Total power $P_{\text{total}}$: $P_s + P_c \leq P_{\text{total}}$.
  - Bandwidth $B_{\text{total}}$: $B_s + B_c \leq B_{\text{total}}$.

---

### **5. Signal Model**
The received signal combines both sensing and communication components:

$$
y(t) = h_s(t) s(t) + h_c(t) x(t) + n(t)
$$

- **$h_s(t)$**: Channel response for sensing signal $s(t)$.
- **$h_c(t)$**: Channel response for communication signal $x(t)$.
- **$n(t)$**: Noise.
- **Objective**: Jointly decode $x(t)$ for communication and analyze $s(t)$ for sensing.

---

### **6. Tradeoff Boundaries**
The feasible performance region is defined by a **Pareto-optimal boundary**:

$$
\mathcal{R}(R, D) = \{(R, D) \mid R \leq C(D), \ D \geq \text{CRB}(R)\}
$$

- Defines the achievable region of communication rates and sensing accuracy.
- Pareto-optimality ensures that improving one metric necessarily degrades the other.

---

### **7. Practical Design: Projector Metaphor**
The "projector metaphor" introduces a practical design methodology:

- Sensing is akin to projecting light for environmental awareness.
- Communication is like directing focused light beams for data delivery.
- The shape and power distribution of the shared waveform are optimized to fulfill both tasks.

---

### **8. Waveform Design**
Optimal waveform design balances spectral and spatial power allocation:

$$
s(t) = \sum_{i} \sqrt{P_i} \phi_i(t), \quad x(t) = \sum_{j} \sqrt{P_j} \psi_j(t)
$$

- $\phi_i(t)$, $\psi_j(t)$: Orthogonal waveform components for sensing and communication.
- **Objective**: Allocate power $P_i$, $P_j$ to maximize joint performance.

---

### **9. Numerical Results**
Simulation results validate the theory, showing:
- Pareto-optimal tradeoffs between $R$ and $D$.
- Design insights for resource allocation under practical constraints.

---

### **Summary**
The paper provides a mathematical framework for:
1. Quantifying the tradeoffs between communication and sensing.
2. Establishing fundamental performance bounds (capacity, CRB).
3. Optimizing resource allocation for dual functionality.
4. Proposing practical waveform designs to achieve ISAC goals.

---


Here’s a comparative table of **Sensing** and **Communications** metrics with **mathematical expressions** included for **Detection**, **Estimation**, and **Recognition**:

|              | **Sensing Metrics**     | |  **Communication Metrics** |
|---------------------------|----|-|-|
| **Detection**            | - **Detection probability**: $P_D = \mathrm{Pr}( \mathcal{H}_1 \| \mathcal{H}_1)$ <br> <hr> - **False alarm probability**: $P_{FA} = \mathrm{Pr}( \mathcal{H}_1 \| \mathcal{H}_0)$  | **Efficiency** | - **S**pectral **E**fficiency (**SE**) <br> <hr> - **E**nergy **E**fficiency (**EE**) |
| **Estimation**           | - **Mean Squared Error (MSE)**: $\epsilon_{\theta} = \left( \mathbb{E}\left(\theta - \hat{\theta})^2\right) \right)$ <br> <hr> - **Cramer-Rao Bound (CRB)**: $\text{var}(\hat{\theta}) \geq \frac{1}{- \mathbb{E}\left(\frac{\partial^2 \ln p(\mathbb{y}_R;\theta)}{\partial \theta^2}\right)}$ $\triangleq \text{CRB}({\hat{\theta}})$ |  **Robustness** | - **B**it **E**rror **R**ate (**BER**) <br> <hr> - **S**ymbol **E**rror **R**ate (**SER**) <hr> - **F**rame **E**rror **R**ate (**FER**) 
| **Recognition**          | - **Recognition Accuracy**                           |


---

### **Row-Specific Details with Mathematics**

#### **1. Detection**
- **Sensing**:
  - $P_D$ measures how well a sensing system (e.g., radar) detects a target.
  - $P_{FA}$ evaluates how often false detections occur in the absence of a target.
  - Signal-to-noise ratio (SNR) defines the quality of the received signal for detection.
- **Communication**:
  - $P_{DR}$: Measures the fraction of successfully delivered packets.
  - BER quantifies errors introduced in transmitted data.

#### **2. Estimation**
- **Sensing**:
  - MSE represents the average squared error between the estimated parameter ($\hat{S}$) and the true value ($S$).
  - CRB defines the lower bound for estimation accuracy based on the likelihood function $p(Y|S)$.
  - Resolution in sensing depends on bandwidth ($B$) and aperture size ($D$).
- **Communication**:
  - SINR is a key metric for evaluating signal quality in communication systems.
  - Data rate ($R$) depends on SINR and bandwidth ($B$).

#### **3. Recognition**
- **Sensing**:
  - Recognition systems often rely on supervised learning models to classify patterns or objects based on feature sets.
  - Accuracy and F1-score evaluate performance in terms of true positives (TP), false positives (FP), true negatives (TN), and false negatives (FN).
- **Communication**:
  - Recognition involves decoding signals accurately and maximizing throughput while minimizing latency.

---

This table highlights the parallels and distinctions in metrics for sensing and communication systems across detection, estimation, and recognition tasks, incorporating relevant mathematical expressions. Let me know if furtherdetails or derivations are needed!


## Model

#### **Signal Model**

$Y_c = H_c X + Z_c, \quad Y_s = H_s(\eta) X + Z_s$

#### **Parameters**
- $H_c, H_s$: communication and sensing channels
- $\eta$: sensing parameters, e.g., angle, range, velocity, $\eta \sim p_\eta(\eta)$
- $X$: ISAC signal, $X \sim p_X(X)$
- $R_X = T^{-1} XX^H $: sample covariance matrix
- $ \tilde{R}_X = \mathbb{E}(R_X) $: statistical covariance matrix

# References

[通信感知一体化 通信和传感 ISAC 毫米波 SDR JRC2LS O-RAN JCR 雷达和通信频谱 无线通信 URSI GASS | 稜研科技](https://www.bilibili.com/video/BV1Ap4y1T7Qi/?vd_source=c58eb5d1b326451a0e647408aae60568)

[\[IEEE ComSoc-SPS ISAC Webinar 3rd season\] 6th Prof. Fan Liu](https://www.bilibili.com/video/BV12s4y1h7D7/?vd_source=c58eb5d1b326451a0e647408aae60568)