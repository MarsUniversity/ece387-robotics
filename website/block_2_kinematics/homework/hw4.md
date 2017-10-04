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

# Forward Kinematics

Using the template from the website, create a `Jupyter notebook` for this
assignment.

```python
	%matplotlib inline

	from __future__ import division, print_function
	from matplotlib import pylab
```

1. Write a function that takes in the DH parameters ($\theta$, $\alpha$, d, a) and returns
   the homogenious matrix for it.
	```python
	def homogeneousMatrix(theta, alpha, d, a):
	   """
	   This calculates a homogeneous matrix for the given parameters
	   """
	   ...
	   return matrix
	```
1. Using this function, find the homogeneous matrix if:
    1. $\alpha$ is x
    1. $\theta$ is x
    1. d is x
    1. a is x
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
1. Using the previous function, determine the equation for the robot arm with the following
   DH parameters. *Hint:* your answer should be ....

   | i |$\theta_i$|$\alpha_i$| $d_i$ | $a_i$ |
   |---|----------|----------|-------|-------|
   | 1 |          |          |       |       |
   | 2 |          |          |       |       |
   | 3 |          |          |       |       |
   | 4 |          |          |       |       |
   | 5 |          |          |       |       |
