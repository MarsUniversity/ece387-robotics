---
title: Lab 1 Linux and Python
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
---

# Overview

This lab will test your understanding of both linux command line and python.

**For this coding, let the EE's do most of the work, CompE's help out, but you have more experience already with python than they do, so help but don't do it unless time is running out in the lab**

## Task 1 Prelab: Install

If you have not already, please install python on your computer following the
software install instructions. This could take some time!!!

## Task 2: Command Line

**For this, do not use the GUI, you will need to use the command line when we work on the roomba**

1. Open a terminal window and in your home directory, create a folder called `lab_1`
(note the underscore between lab and 1)
1. Next, enter that folder and create an empty text file called `task_2.py`
1. Next, open the file from the command line and write a simple python script that
produces the following:

	```bash
		./task_2.py
		blah ...
	```

	This skeleton code will get you started:

	```python
		#!/usr/bin/env python
		from __future__ import print_function division
		from math import pi

		data = {
			['one', 3/4, pi/2],
			['two', 7/5, pi],
			['three', ]
		}

		def print_stuff(things):
			# insert code here

		if __name__ == "__main__":
			print_stuff(data)
	```

1. When you have this working, show your instructor.

## Task 3: Jupyter

1. From the command line, start the `jupyter` program by typing:

		jupyter notebook

	A web browser should open. From the top right, create a new `Python 2` notebook called *Lab 1*

1. Write a program called `task_3.py`, which takes the following 2 matrices and
performs the following operations on them. Remember to use `numpy` by adding the
following to your program:
	```python
	from __future__ import division
	from __future__ import print_function
	import numpy as np
	```

	Print out the results of `C` and `D`

	\begin{eqnarray}
		A = \begin{bmatrix}
			1 & 2 \\
			3 & 4
			\end{bmatrix} \\
		B = \begin{bmatrix}
			4 & 3 \\
			2 & 1
			\end{bmatrix} \\
		C = A * B \\
		D = C + B
	\end{eqnarray}

1. Next let's plot some stuff. In a new cell, add the following:

	```python
	%matplotlib inline
	from matplotlib import pyplot as plt
	```

	Now write a program that plots the following 2 lines in plots side-by-side

	\begin{eqnarray}
		y = 5x+6 \\
		z = \frac{1}{3}x-4
	\end{eqnarray}

	Remember to set the title and the axes as shown in the image below. Your
	plot should look like this: **insert image**
