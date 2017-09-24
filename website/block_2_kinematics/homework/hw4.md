---
title: Homework 4
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
---

**Honor Code:** ...

All homework is to be done individually. You are only authorized to receive help from an
instructor.

# Forward Kinematics

Create a `Jupyter notebook` and this at the top.

```python
	%matplotlib inline

	from __future__ import division, print_function
	from matplotlib import pylab
```

1. Write a function that takes in the DH parameters ($\theta$, $\alpha$, d, a) and returns 
   the homogenious matrix for it.
```python
def homogeniousMatrix(theta, alpha, d, a):
   """
   This calculates a homogenious matrix for the given parameters
   """
   ...
   return matrix
```
1. Using this function, find the homogenious matrix if:
    1. $\alpha$ is x
    1. $\theta$ is x
    1. d is x
    1. a is x
1. Given an array of DH parameters for a robot arm, write a function which takes this and 
   returns a homogenious matrix for the robot arm. Where the array would look like
```python
	arm = [
		[theta, alpha, d, a],
		[theta, alpha, d, a],
		[theta, alpha, d, a],
		...
	]

	def forward(params):
		"""
		Given the params, it returns the forward kinematics equations
		"""
		...
		return eqns
```
1. Using the previous function, determine the equation for the robot arm with the following
   DH parameters. *Hint:* your answer should be ....
   
   | i |$\theta_i$|$\alpha_i$| $d_i$ | $a_i$ |
   |---|----------|----------|-------|-------|
   | 1 |1         |2         |3      |4      |
   | 2 |1         |2         |3      |4      |
   | 3 |1         |2         |3      |4      |
   | 4 |1         |2         |3      |4      |