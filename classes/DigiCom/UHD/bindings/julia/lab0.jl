using UHDBindings
using Plots
using Printf

function main()

        # ---------------------------------------------------- 
        # --- Physical layer and RF parameters 
        # ---------------------------------------------------- 
        # carrierFreq	  = 2.585e3; 	# --- The carrier frequency (Hz)	
        carrierFreq	  = 2.584950e9; 	# --- The carrier frequency (Hz)	
        samplingRate      =  30.72e6;  # --- Targeted bandwidth (Hz)
        rxGain		  =  70.0;  # --- Rx gain (dB)
        nbSamples	  =  614400;  # --- Desired number of samples

	# ---------------------------------------------------- 
	# --- Getting all system with function calls  
	# ---------------------------------------------------- 
	# --- Creating the radio ressource 
	radio	= openUHD(carrierFreq,samplingRate,rxGain);
	# --- Display the current radio configuration
	# Both Tx and Rx sides.
	# --- Getting a buffer from the radio 
	sig	= recv(radio,nbSamples);
	# This also can be done with pre-allocation 
	buffer = zeros(Complex{Cfloat},nbSamples);
	recv!(buffer,radio);
	# --- Release the radio ressources
	close(radio); 
	# --- Output to signal 
        @printf "Hello %s" buffer[1:10]
	return sig;
end

main()
