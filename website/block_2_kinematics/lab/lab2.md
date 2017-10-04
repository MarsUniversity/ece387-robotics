---
title: Lab 2
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
---

# Robot Arm

In this lab we will make the robot arm move through a predefined sequence of
movements. Utilizing the work you already did in homework, you will make the
arm move.

You should learn or gain experience with:

- Taking to an actuator via a common serial port
- Translate forward/inverse kinematics theory into reality with a real robot arm
- Understand how to translate angles to PWM servo commands
- Gain more experience with Python

## Setup

![AL5D Robot Arm](pics/lynx_motion_al5d.jpg){width=75%}

The arm is equipped with 5 servos and the distance between are given in the figure
above. The arm connects to your laptop via a USB-to-Serial connector.

![USB-to-Serial](pics/usb2serial.jpg)

### Determining the Serial Port

Unfortunately, it can be a little complicated to determine what the serial port
name is on Windoze.

**More Instructions**

## Pre-Lab

Combine the functions from your previous homeworks into one python program. Your
program should be able to call either the forward or inverse kinematics functions
you developed.

## Task 1: Calibrate

The robot arm uses toy RC servos^[https://en.wikipedia.org/wiki/Servo_(radio_control)]
to move. These servos are commanded by a pulse width modulated signal^[https://en.wikipedia.org/wiki/Pulse-width_modulation]
(PWM) to set their position. Unfortunately, these toy servos are produced for their low
price and not their performance. Therefore, you must determine the correct PWM signal to
get your servo to move correctly ... every servo is different.

The Lynx Motino AL5D has 5 servo motors that are able to turn between 0 and 180 degrees.
The nominal PWM signals are shown below:

| Angle | PWM   | Gripper | PWM  |
|-------|-------|---------|------|
| 0     | 800   | Open    | 800  |
| 180   | 2300  | Closed  | 2300 |

```python
	#!/usr/bin/env python
	from __future__ import print_function, division
	import pyserial
	import time

	# open serial port
	ser = pyserial.Serial('COM3', 115200)

	def angle2pwm(angle):
		# your code here

	def move_servo(servo, angle):
		# send a command to a single servo
		# example:
		#     servo 1  angle 0
		#     send '#1 P800 T2000\r'
		pwm = angle2pwm(angle)
		cmd = '#{} P{}\r'.format(int(servo), int(pwm))
		ser.write(cmd)

	if __name__ == "__main__":
		# your code here
```

## Task 2: Forward Kinematics

Once you have figured out the best PWM settings for your robot arm, now use your code
to move the arm through a sequence of orientations.

| Step | Position                     | Gripper |
|------|------------------------------|---------|
| 1    | (0, 90, 90, 0)               | open    |
| 2    | (-23.2, 83.8, 102.3, 71.5)   | closed  |
| 3    | (0.0, 111.5, 127.0, 74.5)    | closed  |
| 4    | (0, 90, 90, 0)               | open    |

After each step, pause for 2 seconds. When you have it working, show your
instructor.

## Task 3: Inverse Kinematics

Now use your code to move the arm through a sequence of positions. Since we are
grabbing an object, when the step below says *closed* it really means half way
closed or $\frac{PWM_{closed}}{2}$

| Step | Position           | Orientation | Gripper |
|------|--------------------|-------------|---------|
| 1    | (10.75, 0, 5.75)   | 0           | open    |
| 2    | (  9.5,  0, 4)     | 0           | open    |
| 3    | (  9.5,  0, 0)     | 0           | open    |
| 4    | (  9.5,  0, 0)     | 0           | closed  |
| 5    | (  9.5,  0, 4)     | 0           | closed  |
| 6    | (    7, -4, 0)     | 0           | closed  |
| 7    | (    7, -4, 0)     | 0           | open    |
| 8    | (    7, -4, 5)     | 0           | open    |
| 9    | (10.75,  0, 5.75)  | 0           | open    |

```python
	#!/usr/bin/env python
	from __future__ import print_function, division
	import pyserial
	from math import atan2, acos, sqrt, pi, cos, sin
	import time

	# open serial port
	ser = pyserial.Serial('COM3', 115200)

	def inverse(x, y, z, orientation):
		# your code here

	def angle2pwm(angle):
		# code

	def move_arm(joint_angles):
		# your code here

	if __name__ == "__main__":
		sequence = [
			[10.75, 0.0, 5.75, 0, 0], # x, y, z, orientation, gripper
			[...],
			...
		]

		for angles in sequence:
			move_arm(angles)
			time.sleep(5)

```

When you have it working, show your instructor.
