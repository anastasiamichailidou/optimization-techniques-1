Project 1: Minimization of Convex Functions of One Variable

Description

This project focuses on the implementation and analysis of sequential search algorithms for minimizing a given convex function $f(x)$ within a specified interval $[a, b]$. 
These methods form the foundation for more complex optimization algorithms involving multiple variables.
The project involves the implementation of the following methods from scratch in Matlab:

Search methods without derivatives:
Bisection Method Golden Section Method Fibonacci Method 

Search methods with derivatives:
Bisection Method using derivatives

Objective

The goal is to reach a final interval $[a_k, b_k]$ such that $b_k - a_k \le l$, where $l$ is the predefined accuracy. 
The algorithms are tested on the following functions in the interval $[-1, 3]$:$f_1(x) = 5^x + (2 - \cos(x))^2$ $f_2(x) = (x - 1)^2 + e^{x-5} \cdot \sin(x + 3)$ $f_3(x) = e^{-3x} - (\sin(x - 2) - 2)^2$ 

Key Study Areas

Function Evaluations: Analysis of how the number of objective function evaluations changes as parameters like $\epsilon$ (distance from the bisection) and $l$ (final range) vary.

Convergence Visualization: Plots showing the boundaries of the interval $[a_k, b_k]$ relative to the iteration index $k$.

Performance Comparison: Comparative analysis of the efficiency, advantages, and disadvantages of each method.


Project StructureMatlab_Files/: 

Contains the Matlab implementation for all four methods and scripts for generating the required plots.

Report.pdf: Comprehensive technical report including problem descriptions, diagrams, comparative tables, and result interpretations.

RequirementsMatlab (R2025 version or later).

Submission DetailsDeadline: Tuesday, November 18, 2025.Course: Optimization Techniques, 7th Semester.
