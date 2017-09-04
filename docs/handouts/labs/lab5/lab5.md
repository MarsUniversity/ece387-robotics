---
title: Lab 5
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
---

# Roomba Control



## Task 1: 

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

## Task 2: 