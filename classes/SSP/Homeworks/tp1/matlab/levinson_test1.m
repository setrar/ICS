% Example usage
r = [1, -0.6, 0.4, -0.2];
[sigma_sq, A, K] = levinson(r);
disp('Prediction Error Variances:');
disp(sigma_sq.');
disp('Prediction Error Filter Coefficients:');
disp(A.');
disp('PARCORS:');
disp(K.');

