---
title: Homework 5
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

# Inverse Kinematics

Create a `Jupyter notebook` and this at the top.

```python
	%matplotlib inline

	from __future__ import division, print_function
	from matplotlib import pylab
	import arm  # some plotting functions to help
```

The robot arm is commanded by an ASCII string that looks like this: `#0 P1000 #1 P2000 T2000\r`.
This string tells servo 0 to set a PWM of 1000 and servo 1 set to a PWM of 2000. The last
part of the command T2000 basically gives a time frame to move the arm to the new position.
If we move too fast, we could damage the arm, so we are always going to send the last command
as T2000 since high speed is not important to us. Now this command only moves the first 2
servos, but our arm has 5 degrees of freedom (5 servos), so our command string will contain
5 servo commands and the T2000 command with a `\r` on the end.

This homework will walk you through building the code to run the robot arm

| Angle [deg] | PWM  |
|-------------|------|
| 0	          | 900  |
| 180         | 2100 |

1. Write a function that takes in an angle (degrees or radians, your choice) and returns a
string to command 1 servo to that position. There is a linear relationship (i.e., straight
line) between angle and PWM.
```python
def deg2pwm(servo_num, angle):
    """
    deg2pwm(3, 20) -> "#3 P2000"
    """
    ...
```
*Hint:* If you took ECE231, you did this in the signal conditioning part of the class

1. Using the function above, write another function that takes in 5 angles and returns the
ASCII command string.
```python
def command(a, b, c, d, e):
    """
    command(10,20,30,40,50) -> #0 ... T2000\r
    """
    ...
```
*Hint:* Remember to append `T2000\r` on the end

1. Write a function that takes a 3d point (x, y, z) and returns the joint angles.
```python
def inverse(x,y,z, angle, claw):
	"""
	Calculates the joint angles given:
	   (x,y,z) - end effector location
	   angle - orientation of end effector
	   claw - is the claw open or closed
	"""
	...
```
