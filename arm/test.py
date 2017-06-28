#!/usr/bin/env python


from __future__ import division
from __future__ import print_function
import serial
from math import pi
import time


def run(port):
	cmd = '#0 P1500 #1 P1500 #2 P1500 #3 P1500 #4 P1500 T4000\r'
	ser = serial.Serial(port, 115200)
	if not ser.isOpen():
		raise Exception('Arm::init() could not open', port)
	ser.write(cmd)
	time.sleep(5)

if __name__ == '__main__':
	run('COM3')
