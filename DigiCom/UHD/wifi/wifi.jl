using UHDBindings
using Plots

# ---------------------------------------------------- 
# --- Physical layer and RF parameters 
# ---------------------------------------------------- 
carrierFreq	  = 5.329e9; 	# --- The carrier frequency (Hz)	
samplingRate  =  30.72e6;  # --- Targeted bandwidth (Hz)
rxGain		  =  30.0;  # --- Rx gain (dB)
nbSamples	  =  204800;  # --- Desired number of samples 200kBytes

# ---------------------------------------------------- 
# --- Getting all system with function calls  
# ---------------------------------------------------- 
# --- Creating the radio ressource 
radio	= openUHD(carrierFreq,samplingRate,rxGain);
# --- Display the current radio configuration
# Both Tx and Rx sides.
print(radio);

sig	= recv(radio,nbSamples);

# This also can be done with pre-allocation 
buffer = zeros(Complex{Cfloat},nbSamples);
recv!(buffer,radio);
