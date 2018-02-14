---
title: Homework 4
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
---

**Integrity:** Your honor is extremely important.  This academic security policy is designed to help you succeed in meeting academic requirements while practicing the honorable behavior our country rightfully demands of its military.  Do not compromise your integrity by violating academic security or by taking unfair advantage of your classmates.

**Authorized Resources:** You can **ONLY** seek help from the instructor. Homework
is an individual exercise.

# [25 pts] Forward Kinematics

Using the template from the website, create a `Jupyter notebook` for this
assignment. Remember to setup your notebook like this

```python
from __future__ import division
from __future__ import print_function
import sympy
from sympy import symbols, sin, cos, pi, simplify
import numpy as np
```

1. Write a function that takes in the DH parameters ($\theta$, $\alpha$, d, a) and returns the homogeneous matrix for it.
   ```python
	def homogeneousMatrix(theta, alpha, d, a):
	   """
	   This calculates a homogeneous matrix for the given parameters
	   """
	   ...
	   return matrix
	```
    Using this function and the values below, print out the translation for this transform using:
    1. $\alpha$ is 20 degrees
    1. $\theta$ is 45 degrees
    1. d is 6 inches
    1. a is 5 inches

    *Hint:* You should get $(x,y,z)$: $[5 -6*sin(pi/9) 6*cos(pi/9)]$

1. Given an array of DH parameters for a robot arm, write a function which takes this and
   returns a homogeneous matrix for the robot arm. Where the array would look like
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
   Using this function, determine the equation for the robot arm with the following
   DH parameters. Make sure you simplify your answer symbolically.

   | i |$\theta_i$  |$\alpha_i$ | $d_i$ | $a_i$ |
   |---|------------|-----------|-------|-------|
   | 1 | $\theta_1$ | 0         | 3     | 0     |
   | 2 | $\theta_2$ | 0         | 5     | 0     |
   | 3 | $\theta_3$ | 0         | 0     | 2     |
   | 4 | $\theta_4$ | $\alpha_4$| 2     | 0     |

   Print the equations and separately print the translation.
   *Hint:* You should get for the z translation: 2.0*cos(a4) + 8.0
