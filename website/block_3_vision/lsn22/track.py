#!/usr/bin/env python

from __future__ import print_function, division
import cv2
# from opencvutils.Camera import SaveVideo
import numpy as np
from math import sin, cos, pi

class SaveVideo(object):
	"""
	Simple class to save frames to video (mp4v)

	macOS: avc1
	windows: h264?
	"""

	def __init__(self):
		self.out = None
		self.encoder('avc1')
		# self.mpg4 = cv2.VideoWriter_fourcc('m', 'p', '4', 'v')  # faster?
		# self.mpg4 = cv2.VideoWriter_fourcc('x', '2', '6', '4')  # better quality?

	def open(self, filename, width, height, fps=30):
		self.out = cv2.VideoWriter()
		self.out.open(filename, self.mpg4, fps, (width,height))

	def encoder(self, fourcc):
		try:
			self.mpg4 = cv2.VideoWriter_fourcc(*fourcc)
		except Exception as err:
			print(err)
			print('Please select another encoder for your platform')
			raise

	def __del__(self):
		self.release()

	def write(self, image):
		self.out.write(image)

	def release(self):
		if self.out:
			self.out.release()

def createVideo(filename):
	shape = (240,320)
	sv = SaveVideo()
	# sv.encoder('H264')
	# sv.encoder('MP4V')
	# sv.encoder('x264')
	sv.open(filename, shape[1], shape[0])  # order is backwards!!!!
	radius = 50

	for i in range(100):
		img = array = np.zeros(shape, np.uint8)  # make black frame
		x = int(shape[1]/2+radius*cos(2*pi*i/100))
		y = int(shape[0]/2+radius*sin(2*pi*i/100))
		img = cv2.circle(img,(x, y), 10, 255, -1)
		img = cv2.cvtColor(img, cv2.COLOR_GRAY2BGR)
		# showImage(img)
		sv.write(img)

	sv.release()

def showImage(img):
	# print(img.shape)
	cv2.imshow('frame',img)
	if cv2.waitKey(100) & 0xFF == ord('q'):
		exit()

def playVideo(filename):
	cap = cv2.VideoCapture(filename)
	frameCnt = 0
	while(cap.isOpened()):
		ret, frame = cap.read()

		if ret:
			frameCnt += 1
			cv2.imshow('frame',frame)
			if cv2.waitKey(1) & 0xFF == ord('q'):
				break
		else:
			print('Frames displayed:', frameCnt)
			cap.release()

def findBall(img):
	# find the white ball
	cnts = cv2.findContours(img, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)[-2]
	c = max(cnts, key=cv2.contourArea)
	((x, y), radius) = cv2.minEnclosingCircle(c)
	x, y, radius = int(x), int(y), int(radius)
	# print('Circle center: ({}, {})   radius: {} pixels'.format(x, y, radius))
	return ((x, y), radius)

def trackTarget(filename):
	# setup kf
	kalman = cv2.KalmanFilter(2, 1, 0)  # state size, measurement size, control vector
	kalman.transitionMatrix = np.array(
		[
			[1., 1.],
			[0., 1.]
		]
	)
	kalman.measurementMatrix = 1. * np.ones((1, 2))
	kalman.processNoiseCov = 1e-5 * np.eye(2)
	kalman.measurementNoiseCov = 1e-1 * np.ones((1, 1))
	kalman.errorCovPost = 1. * np.ones((2, 2))
	kalman.statePost = 0.1 * np.random.randn(2, 1)

	# open video
	cap = cv2.VideoCapture(filename)

	# loop through each video frame and track the ball
	while(cap.isOpened()):
		ret, frame = cap.read()
		if ret:
			gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
			loc, rad = findBall(gray)
			# (minVal, maxVal, minLoc, maxLoc) = cv2.minMaxLoc(gray)
			cv2.circle(frame, loc, rad, (255, 0, 0), 2)
			showImage(frame)
		else:
			cap.release()

if __name__ == "__main__":
	fname = 'tracking.mp4'
	# createVideo(fname)
	# playVideo(fname)
	trackTarget(fname)
