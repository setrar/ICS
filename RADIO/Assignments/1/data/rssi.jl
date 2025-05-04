using MAT

ff = matopen("./data/matlab/rssi_distance_omni_boat.mat");

@read ff rssi1;
@read ff d1;
@read ff rssi2;
@read ff d2;
