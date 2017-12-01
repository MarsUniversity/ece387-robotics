---
title: 'Homework 9: Path Planning'
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

# Path Planning

Create a `jupyter notebook` with the following, you may need to import other libraries too:

```python
	%matplotlib inline

	from __future__ import division, print_function
	import matplotlib.pyplot as plt

	grid = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0],
			[0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0],
			[0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
			[0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1],
			[0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0],
			[0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0],
			[0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	]
```

1. Using the provided grid (map), do:
	1. Plot the map
	1. Starting at (0,0) find a path to (5,8) using a cost of 1 and a standard
	gradient decent heuristic discussed in class.
1. Did A Star search the entire map?
1. What happens if you set the heuristic to all 0's?
1. Plot the path through the map using a heuristic of all 0's. (*hint:* just
	redo problem 1 with a different heuristic)
1. Now test what happens when you set the heuristic to a random number. Use
`random.randint(0, 50)` to randomly pick your heuristic value. Plot the path
on the map.
1. Re-run the previous solution 5 times, does it always return the same path
when the heuristic is random? Why or why not?
