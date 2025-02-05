% Given Data
total_tests = 5110;  % Total tests performed
positive_tests = 44; % Positive tests observed
next_tests = 100;    % Future tests

% Estimate the probability of a positive test
p = positive_tests / total_tests;

%% Question 1a: Probability of 0 positive tests
k = 0;
% Using Poisson distribution
lambda = next_tests * p; % Poisson mean
my_poisson = exp(-lambda) * (lambda^k) / factorial(k);
% Using built-in function
Matlab_poisson = pdf('Poisson', k, lambda);

fprintf('Probability of 0 positive tests (Poisson): %.6f (calculated) vs. %.6f (MATLAB function)\n', ...
    my_poisson, Matlab_poisson);

%% Question 1b: Probability of more than 3 positive tests
k = 3;
% Poisson calculation
prob_more_than_3_poisson = 1 - sum(poisspdf(0:k, lambda));
% Using built-in function
prob_more_than_3_builtin = 1 - poisscdf(k, lambda);

fprintf('Probability of more than 3 positive tests (Poisson): %.6f (calculated) vs. %.6f (MATLAB function)\n', ...
    prob_more_than_3_poisson, prob_more_than_3_builtin);

%% Question 3b: Expected value of positive tests
expected_value = lambda;
fprintf('Expected number of positive tests: %.2f\n', expected_value);

%% Question 3c: Variance in number of positive tests
variance_poisson = lambda; % Poisson variance is equal to its mean
fprintf('Variance of positive tests: %.2f\n', variance_poisson);

%% Question 3d: Expected variance across 10,000 hospitals
num_hospitals = 10000;
variance_across_hospitals = variance_poisson / num_hospitals;
fprintf('Expected variance in positive tests across 10,000 hospitals: %.6f\n', variance_across_hospitals);
