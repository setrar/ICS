% Example usage of levinson function

% Generate a random correlation sequence
r = randn(1, 21);

% Call the levinson function
[sigma_sq, A, K] = levinson(r);

% Display the results
disp('Prediction Error Variances:');
disp(sigma_sq.');

disp('Prediction Error Filter Coefficients:');
disp(A.');

disp('PARCORS:');
disp(K.');

% Plot the prediction error variances
figure;
stem(0:20, sigma_sq);
xlabel('Order');
ylabel('Prediction Error Variance');
title('Prediction Error Variances');

% Plot the prediction error filter coefficients
figure;
stem(0:20, A(end, :));
xlabel('Filter Coefficient Index');
ylabel('Coefficient Value');
title('Prediction Error Filter Coefficients');

% Plot the PARCORS
figure;
stem(1:20, K);
xlabel('Order');
ylabel('PARCOR');
title('PARCOR Sequence');

