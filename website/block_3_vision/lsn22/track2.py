#!/usr/bin/env python

from __future__ import print_function, division
import cv2
from opencvutils.Camera import SaveVideo
import numpy as np
from math import sin, cos, pi

# class SaveVideo(object):
# 	"""
# 	Simple class to save frames to video (mp4v)
#
# 	macOS: avc1
# 	windows: h264?
# 	"""
#
# 	def __init__(self):
# 		self.out = None
# 		self.encoder('avc1')
#
# 	def open(self, filename, width, height, fps=30):
# 		self.out = cv2.VideoWriter()
# 		self.out.open(filename, self.mpg4, fps, (width,height))
#
# 	def encoder(self, fourcc):
# 		try:
# 			self.mpg4 = cv2.VideoWriter_fourcc(*fourcc)
# 		except Exception as err:
# 			print(err)
# 			print('Please select another encoder for your platform')
# 			raise
#
# 	def __del__(self):
# 		self.release()
#
# 	def write(self, image):
# 		self.out.write(image)
#
# 	def release(self):
# 		if self.out:
# 			self.out.release()

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

def printKF(kf):
	print('A', kf.transitionMatrix)
	print('H', kf.measurementMatrix)
	print('x-', kf.statePre)
	print('x+', kf.statePost)
	print('Q', kf.processNoiseCov)
	print('R', kf.measurementNoiseCov)


def setupKF():
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

	return kalman


def setupBlobDetector():
	# Setup SimpleBlobDetector parameters.
	params = cv2.SimpleBlobDetector_Params()

	# Change thresholds - levels
	# params.minThreshold = 0  # inclusive
	# params.maxThreshold = 1  # exclusive
	params.thresholdStep = 1

	# Filter by Circularity - doesn't seem very precise
	params.filterByCircularity = True
	params.maxCircularity = 1.2
	params.minCircularity = .7

	detector = cv2.SimpleBlobDetector_create(params)
	return detector

def trackTarget(filename):
	# setup kf
	kalman = setupKF()

	# open video
	cap = cv2.VideoCapture(filename)

	# blob detector
	detector = setupBlobDetector()

	init = True

	sample = 0

	# loop through each video frame and track the ball
	# - predict
	# - correct
	while(cap.isOpened()):
		ret, frame = cap.read()
		if ret:
			# if this is the first time we have run this, set the starting
			# state to the blobs initial position.
			if init:
				gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

				# blob detector and draw found blob
				keypoints = detector.detect(gray)
				im_with_keypoints = cv2.drawKeypoints(
					frame,
					keypoints,
					None,  # output image
					(0,0,255),
					cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)

				init = False
				kp = keypoints[0]
				kalman.statePre = np.array([kp.pt[0], kp.pt[1], 0, 0], dtype=np.float32)
				continue

			# don't take a sample every time
			if sample%3 == 0:
				print('[{}] update'.format(sample))
				gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

				# blob detector and draw found blob
				keypoints = detector.detect(gray)
				im_with_keypoints = cv2.drawKeypoints(
					frame,
					keypoints,
					None,  # output image
					(0,0,255),
					cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)

				# in a real situation, we may find many blobs and have to handle
				# each of them. This is how you could do that
				for kp in keypoints:
					pt = (int(kp.pt[0]), int(kp.pt[1]))
					cv2.circle(im_with_keypoints, pt, 2, (255, 0, 0), -1)
					print("({:.0f}, {:.0f}) size={:.1f} resp={:.1f}".format(kp.pt[0], kp.pt[1], kp.size, kp.response))

				# there is only 1 blob here, so we are going to cheat a little
				# and just grab the first keypoint (there should *only* be 1 anyways)
				# and use that for our measurement
				kp = keypoints[0]
				kalman.correct(np.array([kp.pt[0], kp.pt[1]], dtype=np.float32))

				frame = im_with_keypoints
			else:
				print('[{}]no update'.format(sample))

			sample += 1

			# let's predict where things are going based on the dynamcs
			predict = kalman.predict()
			# print(predict)
			loc = (predict[0], predict[1])
			cv2.circle(frame, loc, 10, (0, 255, 0), 2)

			showImage(frame)
		else:
			# we have hit the end of the movie, so close it
			cap.release()

if __name__ == "__main__":
	fname = 'tracking2.mp4'
	createVideo(fname)
	# playVideo(fname)
	# trackTarget(fname)
