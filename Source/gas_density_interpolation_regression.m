%% Clear workspace
clear all; close all; clc;

%% Given data
T = [220, 260, 300, 340, 380, 420]; % Temperature in K
rho = [1.555, 1.317, 1.140, 1.006, 0.900, 0.814]; % Density in kg/m³

% Target temperature
T_target = 330;

%% A. INTERPOLATION

% P1(T) - Linear interpolation using two closest points
distances = abs(T - T_target);
[sorted_dist, indices] = sort(distances);
closest_indices = indices(1:2);
T_closest1 = T(closest_indices);
rho_closest1 = rho(closest_indices);

% Lagrange interpolation for P1
[P1_coeff] = lagranp(T_closest1, rho_closest1);
P1_330 = polyval(P1_coeff, T_target);

% P3(T) - Cubic interpolation using four closest points
closest_indices3 = indices(1:4);
T_closest3 = T(closest_indices3);
rho_closest3 = rho(closest_indices3);

% Polyfit for P3
P3_coeff = polyfit(T_closest3, rho_closest3, 3);
P3_330 = polyval(P3_coeff, T_target);

% P5(T) - Spline interpolation using all points
P5_spline = spline(T, rho);
P5_330 = ppval(P5_spline, T_target);

%% B. REGRESSION

% Linear regression (degree 1)
lin_coeff = polyfit(T, rho, 1);
lin_curve = polyval(lin_coeff, T);

% Quadratic regression (degree 2)
quad_coeff = polyfit(T, rho, 2);
quad_curve = polyval(quad_coeff, T);

% Cubic regression (degree 3)
cubic_coeff = polyfit(T, rho, 3);
cubic_curve = polyval(cubic_coeff, T);

%% 1. PLOTS

% Figure 1: Regression models
figure(1);
plot(T, rho, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
hold on;

T_fine = linspace(min(T), max(T), 1000);
plot(T_fine, polyval(lin_coeff, T_fine), 'r-', 'LineWidth', 2);
plot(T_fine, polyval(quad_coeff, T_fine), 'g-', 'LineWidth', 2);
plot(T_fine, polyval(cubic_coeff, T_fine), 'b-', 'LineWidth', 2);

xlabel('Temperature (K)');
ylabel('Density (kg/m^3)');
title('Regression Models');
legend('Data', 'Linear', 'Quadratic', 'Cubic', 'Location', 'Best');
grid on;

% Figure 2: Interpolation polynomials
figure(2);
plot(T, rho, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
hold on;

% P1(T)
T_P1 = linspace(min(T_closest1), max(T_closest1), 100);
rho_P1 = polyval(P1_coeff, T_P1);
plot(T_P1, rho_P1, 'r-', 'LineWidth', 2);

% P3(T)
T_P3 = linspace(min(T_closest3), max(T_closest3), 100);
rho_P3 = polyval(P3_coeff, T_P3);
plot(T_P3, rho_P3, 'g-', 'LineWidth', 2);

% P5(T)
rho_P5 = ppval(P5_spline, T_fine);
plot(T_fine, rho_P5, 'b-', 'LineWidth', 2);

% Mark interpolation point
plot(T_target, P1_330, 'r*', 'MarkerSize', 15, 'LineWidth', 2);
plot(T_target, P3_330, 'g*', 'MarkerSize', 15, 'LineWidth', 2);
plot(T_target, P5_330, 'b*', 'MarkerSize', 15, 'LineWidth', 2);

xlabel('Temperature (K)');
ylabel('Density (kg/m^3)');
title('Interpolation Polynomials');
legend('Data', 'P1(T)', 'P3(T)', 'P5(T)', 'P1(330)', 'P3(330)', 'P5(330)', 'Location', 'Best');
grid on;

%% 2. RESULTS TABLE
fprintf('\n=== ESTIMATION RESULTS ===\n');
fprintf('| Estimation | Value (kg/m^3) |\n');
fprintf('|------------|----------------|\n');
fprintf('| P1(330)    | %.4f         |\n', P1_330);
fprintf('| P3(330)    | %.4f         |\n', P3_330);
fprintf('| P5(330)    | %.4f         |\n\n', P5_330);

%% 3. ANALYTICAL EXPRESSIONS
fprintf('=== ANALYTICAL EXPRESSIONS ===\n\n');

% P1(T)
fprintf('P1(T) = %.4f * T + %.4f\n', P1_coeff(1), P1_coeff(2));

% P3(T)
fprintf('P3(T) = %.6f * T^3 + %.6f * T^2 + %.6f * T + %.6f\n', ...
    P3_coeff(1), P3_coeff(2), P3_coeff(3), P3_coeff(4));

% P5(T) spline information
fprintf('\nP5(T) - Cubic spline with %d segments\n', P5_spline.pieces);
fprintf('Break points: ');
fprintf('%.1f ', P5_spline.breaks);
fprintf('\n');

%% Save figures
saveas(figure(1), 'regression_plot.png');
saveas(figure(2), 'interpolation_plot.png');