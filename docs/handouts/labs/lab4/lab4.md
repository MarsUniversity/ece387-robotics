---
title: Lab 4
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
---

# Detect and Track

This lab will exercise your understanding of image processing and computer vision.

You should learn or gain experience with:

- Capturing images with OpenCV
- Using image processing to clean up or prepare an image for a computer vision task
- Find objects in a image
- Locate and read AR markers

## Task 1: Pictures

Open a new `jupyter notebook` and do the following:

1. Take a picture of your group with the camera in your laptop and plot it in RGB.
2. Now convert that picture to HSV and plot it
3. Rotate the picture 90 degrees CCW
4.

## Task 2: AR Markers

1. Use the AR marker given to your group and determine what number it is. Show
the image and results in your `jupyter notebook`.

2. Now take a black marker and color in **one** black square and see if you can
still determine the number. **WARNING:** Do not black out the orientation markers
around the corner. If you don't know what that is review the lesson on AR markers.

## Task 3: Detect

Using the code you developed for the homework

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
