using UHDBindings

function main()
	# ---------------------------------------------------- 
	# --- Physical layer and RF parameters 
	# ---------------------------------------------------- 

	carrierFreq		= 868e6;	# --- The carrier frequency 	
	samplingRate		= 16e6;         # --- Targeted bandwdith 
	rxGain			= 30.0;         # --- Rx gain 
	nbSamples		= 4096;         # --- Desired number of samples

	# ---------------------------------------------------- 
	# --- Getting all system with function calls  
	# ---------------------------------------------------- 
	# --- Creating the radio ressource 
	radio	= openUHD(carrierFreq,samplingRate,rxGain);
	# --- Display the current radio configuration
	# Both Tx and Rx sides.
	print(radio);
	# --- Getting a buffer from the radio 
	sig	= recv(radio,nbSamples);
	# This also can be done with pre-allocation 
	buffer = zeros(Complex{Cfloat},nbSamples);
	recv!(buffer,radio);
	# --- Release the radio ressources
	close(radio); 
	# --- Output to signal 
	return sig;
end

main()
