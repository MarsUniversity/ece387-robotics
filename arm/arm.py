#!/usr/bin/env python

from __future__ import division
from __future__ import print_function
import serial
from math import pi
import time


class Servo(object):
	"""
	Holds the info for one servo. Different servos might have different ranges
	or whatever.

	range:= the angular space a servo moves
	pwm:= the frequency space a servo moves
	angle:= current servo angle in degrees
	"""
	def __init__(self):
		self.range = [0, 180]   # x
		self.pwm = [500, 1500]  # y
		self._angle = 0
		self.slope = (self.pwm[1] - self.pwm[0])/(self.range[1] - self.range[0])
		self.intercept = self.pwm[0] - self.slope * self.range[0]

	@property
	def angle(self):
		return self._angle

	@angle.setter
	def angle(self, a):
		if self.min <= a <= self.max:
			self._angle = a
		else:
			raise Exception("Servo::angle({}) out of range".format(a))

	@property
	def anglePi(self):
		return self._angle*pi/180

	def serialCmd(self):
		pwm = self.slope * self.angle() + self.intercept
		return '#P {}'.format(pwm)


class Arm(object):
	def __init__(self, port):
		self.servos = [
			Servo(),  # base
			Servo()   # link 1
		]

		self.serial = serial.Serial(port, 115200)
		if not self.serial.isOpen():
			raise Exception('Arm::init() could not open', port)

	def __del__(self):
		# could also move it to a neutral position
		self.serial.close()
		time.sleep(0.01)

	def commit(self, angles):
		# for i, a in enumerate(angles):
			# self.serv
		msg = []
		if len(angles) == len(self.servos):
			for s, a in zip(angles, self.servos):
				s.angle = a
				msg.append(s.serialCmd())
		else:
			raise Exception('Arm::commit() angles and servos different lengths')

		msg.append('\r')
		cmd = ''.join(msg)
		self.serial.write(cmd)
		time.sleep(0.01)

	def inverse(self, pt):
		return [1, 2, 3, 4, 5, 6]

	def run(self, points):
		for pt in points:
			angles = self.inverse(pt)
			self.commit(angles)  # send to robot arm
			time.sleep(2)


if "__name__" == "__main__":
	arm = Arm('/dev/ttySerial')
	arm.run()

	print('Done ... ')
