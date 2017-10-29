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
		img = array = 255*np.ones(shape, np.uint8)  # make black frame
		x = int(shape[1]/2+radius*cos(2*pi*i/100))
		y = int(shape[0]/2+radius*sin(2*pi*i/100))
		img = cv2.circle(img,(x, y), 10, 0, -1)
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

def printKF(kf):
	print('A', kf.transitionMatrix)
	print('H', kf.measurementMatrix)
	print('x-', kf.statePre)
	print('x+', kf.statePost)
	print('Q', kf.processNoiseCov)
	print('R', kf.measurementNoiseCov)


def trackTarget(filename):
	# setup kf
	kalman = cv2.KalmanFilter(4, 2, 0)  # state size, measurement size, control vector

	dt = 1.
	A = np.eye(4, dtype=np.float32)
	A[0, 2] =  dt
	A[1, 3] =  dt
	kalman.transitionMatrix = A

	H = np.array([[1., 0, 0, 0], [0, 1., 0, 0]], dtype=np.float32)
	kalman.measurementMatrix = H

	kalman.processNoiseCov = 0.1 * np.eye(4, dtype=np.float32)
	kalman.measurementNoiseCov = 1 * np.eye(2, dtype=np.float32)

	printKF(kalman)

	# kalman.errorCovPost = 1. * np.ones((4, 4), dtype=np.float32)
	# kalman.statePost = 0.1 * np.random.randn(2, 1)

	# open video
	cap = cv2.VideoCapture(filename)

	# blob detector
	# https://www.learnopencv.com/blob-detection-using-opencv-python-c/
	# Setup SimpleBlobDetector parameters.
	params = cv2.SimpleBlobDetector_Params()

	# color - doesn't seem to work
	# params.blobColor = 255

	# Change thresholds - levels
	# params.minThreshold = 0  # inclusive
	# params.maxThreshold = 1  # exclusive
	params.thresholdStep = 1

	# Filter by Area.
	# params.filterByArea = True
	# params.minArea = 1500

	# Filter by Circularity - doesn't seem very precise
	params.filterByCircularity = True
	params.maxCircularity = 1.2
	params.minCircularity = .7

	# Filter by Convexity
	# params.filterByConvexity = True
	# params.minConvexity = 0.87

	# Filter by Inertia
	# params.filterByInertia = True
	# params.minInertiaRatio = 0.01

	detector = cv2.SimpleBlobDetector_create(params)

	init = True

	sample = 0

	# loop through each video frame and track the ball
	while(cap.isOpened()):
		ret, frame = cap.read()
		if ret:
			gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
			# loc, rad = findBall(gray)
			# (minVal, maxVal, minLoc, maxLoc) = cv2.minMaxLoc(gray)
			# cv2.circle(frame, loc, rad, (255, 0, 0), 2)

			keypoints = detector.detect(gray)
			im_with_keypoints = cv2.drawKeypoints(
				frame,
				keypoints,
				None,  # output image
				(0,0,255),
				cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)

			for kp in keypoints:
				pt = (int(kp.pt[0]), int(kp.pt[1]))
				cv2.circle(im_with_keypoints, pt, 2, (255, 0, 0), -1)

				if init:
					init = False
					kalman.statePre = np.array([kp.pt[0], kp.pt[1], 0, 0], dtype=np.float32)

			# print(keypoints)
			print("----")
			for kp in keypoints:
				# print(dir(kp))
				print("({:.0f}, {:.0f}) size={:.1f} resp={:.1f}".format(kp.pt[0], kp.pt[1], kp.size, kp.response))

			kp = keypoints[0]

			if sample%4 == 0:
				kalman.correct(np.array([kp.pt[0], kp.pt[1]], dtype=np.float32))
			else:
				print('no update')

			sample += 1

			predict = kalman.predict()
			print(predict)
			loc = (predict[0], predict[1])
			cv2.circle(im_with_keypoints, loc, 10, (0, 255, 0), 2)

			showImage(im_with_keypoints)
		else:
			cap.release()

if __name__ == "__main__":
	fname = 'tracking2.mp4'
	# createVideo(fname)
	# playVideo(fname)
	trackTarget(fname)
