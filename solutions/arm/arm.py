#!/usr/bin/env python

from __future__ import division
from __future__ import print_function
import serial
from math import pi
import time


class Arm(object):
	range = [0, 180]   # x
	pwm = [900, 2100]  # y

	def __init__(self, port):
		self.slope = (self.pwm[1] - self.pwm[0])/(self.range[1] - self.range[0])
		self.intercept = self.pwm[0] - self.slope * self.range[0]

		self.ser = serial.Serial(port, 115200)
		if not self.ser.isOpen():
			raise Exception('Arm::init() could not open', port)
		else:
			print('Arm opened {} @ 115200'.format(port))

	def __del__(self):
		# could also move it to a neutral position
		rest = [[90, 90, 90, 90, 90]]
		self.set(rest)
		time.sleep(3)
		self.ser.close()
		time.sleep(0.01)

	def set(self, angles):
		# cmd = '#0 P1500 #1 P1500 #2 P1500 #3 P1500 #4 P1500 T4000\r'
		cmd = []
		for channel, a in enumerate(angles):
			pwm = self.slope * a + self.intercept
			cmd.append('#{} P{}'.format(channel, pwm))
		cmd.append('T2000\r')
		return ''.join(cmd)

	def inverse(self, pt):
		return pt

	def run(self):
		points = [
			[90, 90, 90, 90, 0],
			[10, 90, 10, 10, 90],
			[170, 170, 170, 170, 90],
			[90, 90, 90, 90, 170]
		]

		for angles in points:
			# angles = self.inverse(pt)
			cmd = self.set(angles)  # send to robot arm
			print(cmd)
			self.ser.write(cmd)
			time.sleep(3)


if __name__ == "__main__":
	arm = Arm('COM3')
	arm.run()

	print('Done ... ')
