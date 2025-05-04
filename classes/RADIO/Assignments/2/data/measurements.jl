using MAT

ff = matopen("./data/matlab/rx_power.mat");

@read ff H2;
@read ff rx_power_dBm;
