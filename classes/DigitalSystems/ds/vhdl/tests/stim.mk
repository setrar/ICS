stim_sim: stim
stim_sim.sim: $(DIR)/stim.txt

$(DIR)/stim.txt:
	$(VHDL)/tests/stim > "$@"
