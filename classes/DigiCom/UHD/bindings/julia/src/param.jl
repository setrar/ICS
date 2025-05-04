using UHDBindings

function main()
	# ---------------------------------------------------- 
	# --- Physical layer and RF parameters 
	# ---------------------------------------------------- 
	carrierFreq	= 868e6; 	# --- The carrier frequency (Hz)	
	samplingRate	= 16e6;         # --- Targeted bandwidth (Hz)
	rxGain		= 30.0;         # --- Rx gain (dB)
	nbSamples	= 4096;         # --- Desired number of samples

	# ---------------------------------------------------- 
	# --- Getting all system with function calls  
	# ---------------------------------------------------- 
	# --- Creating the radio resource 
	# The first parameter is for specific parameter (FPGA bitstream, IP address)
	radio	= openUHD(carrierFreq,samplingRate,rxGain);
	# --- Display the current radio configuration
	print(radio);
	# --- We what to change the parameters ! 
	updateSamplingFreq!(radio,100e6);
	updateCarrierFreq!(radio,2400e6);
	updateGain!(radio,30)
	# --- Print the new radio configuration 
	print(radio);
	# --- Release the radio resources
	close(radio); 
end

main()
