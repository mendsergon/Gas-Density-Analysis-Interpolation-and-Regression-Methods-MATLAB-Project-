# Gas Density Analysis: Interpolation and Regression Methods (MATLAB Project)

## Project Summary

This MATLAB project implements a comprehensive numerical analysis of nitrogen gas density data at varying temperatures. The project compares three interpolation methods and three regression models to analyze and predict gas density behavior. Using experimental data points, the code performs numerical interpolation at a target temperature (330K) using linear Lagrange, cubic polynomial, and cubic spline methods, followed by least-squares regression modeling with linear, quadratic, and cubic polynomial fits. The project demonstrates numerical analysis techniques, data modeling principles, and scientific visualization for engineering applications.

## Core Features

* **Multi-Method Interpolation:** Implements three distinct interpolation techniques:
  - Linear Lagrange interpolation (2 closest points)
  - Cubic polynomial interpolation (4 closest points) 
  - Cubic spline interpolation (all 6 points)

* **Polynomial Regression Analysis:** Fits three regression models using least-squares method:
  - Linear regression (1st degree)
  - Quadratic regression (2nd degree)
  - Cubic regression (3rd degree)

* **Temperature-Density Analysis:** Models the physical relationship between gas density and temperature using experimental data points

* **Comprehensive Visualization:** Generates comparative plots for both interpolation methods and regression models

* **Automated Reporting:** Produces formatted output with numerical results and analytical expressions

## Key Methods and Algorithms

### 1. Data Handling and Preparation

* **Experimental Data:** Six temperature-density pairs (220K to 420K) with corresponding nitrogen densities
* **Target Point:** T = 330K for interpolation comparison
* **Closest Point Identification:** Automated selection of nearest data points for each interpolation method using distance calculation
* **Data Validation:** Verification of physical consistency (negative slope for density-temperature relationship)

### 2. Interpolation Methods Implementation

#### A. Linear Lagrange Interpolation (P₁)
* **Selection:** Two closest points to target (300K and 340K)
* **Algorithm:** Uses `lagranp` function for 1st-degree polynomial construction
* **Mathematical Form:** P₁(T) = a₁T + a₀

#### B. Cubic Polynomial Interpolation (P₃)
* **Selection:** Four closest points to target (260K, 300K, 340K, 380K)
* **Algorithm:** Uses `polyfit` to solve linear system for 3rd-degree coefficients
* **Mathematical Form:** P₃(T) = a₃T³ + a₂T² + a₁T + a₀

#### C. Cubic Spline Interpolation (P₅)
* **Selection:** All six data points
* **Algorithm:** Uses MATLAB's `spline` function for piecewise cubic interpolation
* **Characteristics:** Creates 5 polynomial segments between breakpoints with C² continuity

### 3. Regression Analysis Implementation

#### A. Linear Regression
* **Method:** Least-squares fit of all data points to straight line
* **Equation:** ρ(T) = a₁T + a₀
* **Implementation:** Single call to `polyfit` with degree = 1

#### B. Quadratic Regression
* **Method:** Least-squares fit to parabola
* **Equation:** ρ(T) = a₂T² + a₁T + a₀
* **Implementation:** `polyfit` with degree = 2

#### C. Cubic Regression
* **Method:** Least-squares fit to 3rd-degree polynomial
* **Equation:** ρ(T) = a₃T³ + a₂T² + a₁T + a₀
* **Implementation:** `polyfit` with degree = 3

### 4. Comprehensive Visualization System

* **Comparative Plotting:** Side-by-side display of interpolation methods and regression models
* **Multi-Figure Generation:** Creates two publication-quality figures:
  1. Regression Models Comparison
  2. Interpolation Polynomials Comparison
* **Target Point Highlighting:** Visual indication of interpolated values at T = 330K
* **Professional Formatting:** Clear labels, legends, and gridlines for scientific presentation

### 5. Automated Analysis and Reporting

* **Numerical Output:** Formatted table of interpolation results at target temperature
* **Analytical Expressions:** Symbolic representation of all polynomial equations
* **Regression Coefficients:** Precise display of model parameters with specified decimal accuracy
* **File Export:** Automatic saving of generated figures in PNG format
* **Console Reporting:** Clear, organized output of all results

## Skills Demonstrated

* **Numerical Analysis:** Implementation and comparison of multiple interpolation algorithms
* **Statistical Modeling:** Least-squares regression with polynomial fitting
* **MATLAB Programming:** Efficient use of built-in functions (`polyfit`, `spline`, `polyval`, `ppval`)
* **Scientific Visualization:** Creation of clear, informative plots for data analysis
* **Physical Modeling:** Application of numerical methods to real engineering data
* **Algorithm Design:** Custom implementation of Lagrange interpolation algorithm
* **Data Interpretation:** Analysis and explanation of numerical results in physical context
* **Technical Documentation:** Creation of comprehensive, well-organized code with clear output

## File Overview

| File Name | Type | Description |
|-----------|------|-------------|
| **gas_density_interpolation_regression.m** | MATLAB Script | Main analysis script with complete implementation |
| **lagranp.m** | MATLAB Function | Custom Lagrange interpolation function (required) |
| **regression_plot.png** | Output Figure | Comparative plot of regression models (auto-generated) |
| **interpolation_plot.png** | Output Figure | Comparative plot of interpolation methods (auto-generated) |

## Generated Output Files

When executed, the script automatically creates:
- **regression_plot.png**: Shows linear, quadratic, and cubic regression fits
- **interpolation_plot.png**: Shows P₁(T), P₃(T), and P₅(T) interpolation curves

## Results Example

### Numerical Results at T = 330K:

```
=== ESTIMATION RESULTS ===
| Estimation | Value (kg/m^3) |
|------------|----------------|
| P1(330)    | 1.0395         |
| P3(330)    | 1.0363         |
| P5(330)    | 1.0364         |
```

### Analytical Expressions:

- **P₁(T)**: -0.0033T + 2.1450
- **P₃(T)**: -1.7×10⁻⁸T³ + 4.9×10⁻⁵T² - 0.0224T + 4.5516
- **P₅(T)**: Cubic spline with 5 segments between 220-420K

### Key Observations:

- **Consistency**: All interpolation methods give similar results (<0.3% difference)
- **Physical Validity**: Negative slope confirms density decreases with temperature
- **Spline Advantage**: Cubic spline provides smoothest curve through all points
- **Regression Insights**: Higher-degree regression coefficients are extremely small, suggesting near-linear relationship

## Physical Context

The analysis demonstrates the inverse relationship between gas density and temperature, consistent with the ideal gas law (ρ ∝ 1/T at constant pressure). The minimal differences between interpolation methods indicate robust estimation at the target temperature. The regression analysis reveals that while higher-degree polynomials provide slightly better fits, the linear model captures the essential physics with sufficient accuracy for this temperature range.

## How to Run

1. **Prerequisites**: MATLAB with basic toolboxes (no special toolboxes required)
2. **Required Files**: Ensure both `gas_density_interpolation_regression.m` and `lagranp.m` are in the same directory
3. **Execution**: Run the main script `gas_density_interpolation_regression.m` in MATLAB
4. **Output**: Check the MATLAB console for results and the working directory for generated PNG files
5. **Modification**: Adjust target temperature or data points in the parameter section if needed

## Educational Value

This project provides practical experience in:
- **Numerical Interpolation**: Comparing different interpolation strategies
- **Regression Analysis**: Understanding model selection and overfitting
- **Physical Modeling**: Connecting mathematical methods to real engineering data
- **MATLAB Programming**: Developing structured, documented scientific code
- **Data Visualization**: Creating effective plots for technical communication

## Code Structure

The MATLAB script follows a clear organizational structure:
1. **Data Definition**: Temperature and density arrays
2. **Interpolation Section**: Three distinct methods with detailed comments
3. **Regression Section**: Three polynomial fits using least squares
4. **Visualization**: Two comprehensive figures with professional formatting
5. **Reporting**: Console output with formatted tables and analytical expressions
6. **File Management**: Automatic saving of generated plots

## Notes on Implementation

- The `lagranp` function is required and must be in the MATLAB path
- The script automatically determines closest points based on absolute distance
- All numerical outputs are formatted with consistent decimal precision
- Generated plots use distinct colors and markers for clear differentiation
- The code includes extensive comments for educational purposes
