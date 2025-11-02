# **Numerical Methods**

## Project 1: Trigonometric Polynomial Root Finding

A university project focused on finding zeros of trigonometric polynomials using numerical methods. The goal was to approximate the roots of

$$p(t) = \sum_{k=0}^{n} a_k \cos(kt)$$

with iterative techniques implemented in **MATLAB**.

Report: https://github.com/hoanganhlinh/Numerical-Methods/blob/main/MN_proj1_hoang/MN_P1.pdf

### Methods

* **Secant Method** – Used to approximate the zeros of the function within the interval $$(0, 2\pi)$$.
* **Goertzel Algorithm** – Applied to efficiently compute polynomial values for given arguments.

### Implementation

Three core functions were implemented:

* `fun` – Computes (p(t)) using the Goertzel algorithm.
* `secant` – Finds approximate roots using the secant method.
* `zerafun` – Identifies all zeros of (p(t)) on ([0, 2\pi]).

The project also includes a visualization module to plot the trigonometric polynomial and highlight its zeros.

### Results

The method accurately found most zeros except for those where the function was tangent to the x-axis. Accuracy was verified against analytical and WolframAlpha results, showing minimal error in identified roots.

---

## Project 2: Solving Systems of Linear Equations Using the SOR Method

This project focuses on implementing and analyzing the **Successive Over-Relaxation (SOR)** method — an iterative approach for solving systems of linear equations of the form *Ax = b*. The work explores the method’s convergence properties, performance under different relaxation parameters, and comparison with other iterative methods such as Gauss-Seidel.

Report: https://github.com/hoanganhlinh/Numerical-Methods/blob/main/MN_proj2_hoang/MN_P2.pdf

### Implementation

The program was implemented in MATLAB and consists of modular functions responsible for:

* Checking convergence based on the spectral radius of the iteration matrix.
* Solving equations using the SOR algorithm with adjustable relaxation parameter (ω).
* Visualizing iteration progress and error reduction.
* Comparing results and computational efficiency across multiple ω values.

### Results

Through computational experiments on various matrix types, the project demonstrates how the **choice of ω** significantly influences convergence speed and accuracy. The optimal ω values were found to be slightly above 1 for symmetric and positive-definite matrices, confirming theoretical expectations.

### Key Takeaways

The project highlights the effectiveness of the SOR method when properly tuned and its limitations for poorly conditioned systems.
