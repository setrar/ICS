# ---------------------------------------------------- 
# --- Transmitter
# ---------------------------------------------------- 
using DigitalComm 
using Plots 
# --- Parameters 
snr		  = 20;
mcs		  = 16;
nbBits	  = 1024* Int(log2(mcs));
# --- Binary sequence generation 
bitSeq	  = genBitSequence(nbBits);
# --- QPSK mapping
qamSeq	  = bitMappingQAM(mcs,bitSeq);
# ---------------------------------------------------- 
# --- Channel  
# ---------------------------------------------------- 
#  --- AWGN
# Theoretical power is 1 (normalized constellation)
qamNoise,  = addNoise(qamSeq,snr,1);
# ----------------------------------------------------
# --- Rx Stage: SRRC
# ----------------------------------------------------
# --- Binary demapper
bitDec	= bitDemappingQAM(mcs,qamNoise);
# --- BER measure
ber	  = sum(xor.(bitDec,bitSeq)) /length(bitSeq);
# --- Display constellation 
plt	  = scatter(real(qamNoise),imag(qamNoise),label="Noisy");
scatter!(plt,real(qamSeq),imag(qamSeq),label="Ideal");
xlabel!("Real part");
ylabel!("Imag part");
display(plt);

# -- press enter to exit
println("press any key to exit")
readline()
