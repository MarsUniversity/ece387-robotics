#!/usr/bin/env python

from __future__ import print_function
from __future__ import division
import cv2
import time

def detectChange(img):
    pass

def findFaceEyes(img):
    pass

def drawFunny(img):
    pass

def starWars(img):
    pass

if __name__ == "__main__":
    # we want to capture the default camera: 0
    # if we had other cameras attached on USB ports, we could
    # pass in 1, 2, 3, etc to pick which one
    cam = cv2.VideoCapture(0)

    # loop forever
    while True:
        # reading the camera returns 2 things:
        #    good: was the image successfully captured - True/False
        #    img: if successful, then img is a good/valid image
        good, img = cam.read()
        if good:
            cv2.imshow('window title', img)  # you can name the
                                             # window anything
            key = cv2.waitKey(10)  # wait 10 ms. If you put 0, then
                                   # it will wait forever for a
                                   # key press.
            if key == ord('q'):
                break  # q = quit, break out of loop
        time.sleep(0.03)  # sleep for a little

    cam.release()  # close camera
    cv2.destroyAllWindows() # clean up GUI
