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

% Create a single figure with subplots
figure;

% Plot the prediction error variances
subplot(3, 1, 1);
stem(0:20, sigma_sq);
xlabel('Order');
ylabel('Prediction Error Variance');
title('Prediction Error Variances');

% Plot the prediction error filter coefficients
subplot(3, 1, 2);
stem(0:20, A(end, :));
xlabel('Filter Coefficient Index');
ylabel('Coefficient Value');
title('Prediction Error Filter Coefficients');

% Plot the PARCORS
subplot(3, 1, 3);
stem(1:20, K);
xlabel('Order');
ylabel('PARCOR');
title('PARCOR Sequence');

