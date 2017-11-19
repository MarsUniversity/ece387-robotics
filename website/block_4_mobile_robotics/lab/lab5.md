---
title: 'Lab 5: Sensor Calibration'
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
---

# Sensor Calibration

![Adafruit inertial measurement unit](pics/imu-iso.jpg){width=50%}

In this lab you will calibrate the inertial measurement unit (IMU)^[https://en.wikipedia.org/wiki/Inertial_measurement_unit]
on your roomba.

# Day 1

## Get Data

The first part of the lab we will gather data. Use the python library
`the-collector` to save the data

```python
	#!/usr/bin/env python

	from __future__ import print_function, division
	import nxp_imu
	from the-collector.bagit import BagWriter
	import time

	if __name__ == "__main__":
		imu = nxp_imu.IMU('imu.json')
		bag = bag = BagWriter()
		bag.open(['imu'])

		for i in range(1000):
			a,m,g = imu.get()         # grab data
			bag.push('imu', (a,m,g))  # save data
			time.sleep(1/20)          # grab data at 20 Hz

		bag.write('imu.json')
		print('Done ...')
```

When you are capturing the data, you will do it 2 different ways:

1. The first way is to help determine biases, so we need to roll the roomba around and
exercise the axes of the sensor. **WARNING:** If you drop the roomba, you automatically
fail the lab. There are not enough robots available if we start damaging them. Please make
sure you have a good grip at all times and no horse play!
2. Start off holding the roomba level. Slowly rotate 360 degrees stopping for a few seconds
every 90 degrees. This second data set is to check our biases are correct. Remember, the
biases you calculate are only good the robot you develop them for, they are not transferable
to another robot.

After you have save the data successfully, take a look at the data.

	cat imu_1.json

You will notice that the data is all text. Since text is generally not efficient, a better
way to store lots of data would be to use a binary form of json (bson^[https://en.wikipedia.org/wiki/BSON])
with some method of compress to reduce the data file size.

## Determine Calibration

Now open a new `jupyter notebook` and input the first set of data. Use the
template provided and follow the same process we did in clas to determine the
biases of the IMU.

## Correct for Biases

Once you have the biases, apply them to the second set of data and see if you get what
you expect. Also plot the second set of data without the calibration data so see what
an uncalibrated IMU gives you ... are the results noticeably bad?

# Turn In

When you are done, print out and turn in your `jupyter notebook` showing *Task 2*
and *Task 3*.
