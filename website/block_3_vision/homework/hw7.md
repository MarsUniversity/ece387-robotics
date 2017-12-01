---
title: Homework 7
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
---

**Integrity:** Your honor is extremely important.  This academic security policy is designed to help you succeed in meeting academic requirements while practicing the honorable behavior our country rightfully demands of its military.  Do not compromise your integrity by violating academic security or by taking unfair advantage of your classmates.

**Authorized Resources:** You can **ONLY** seek help from the instructor. Homework
is an individual exercise.

# Computer Vision

All work for this assignment will be done in a `jupyter notebook`. Grab the
template from the class website and modify it. When you are done, print out
the notebook and turn it in.

## AR Markers

Make sure you setup your notebook with the following:

```python
  %matplotlib inline

  from __future__ import print_function, division
  import cv2 # opencv
  import ar_markers
  from matplotlib import pyplot as plt # this lets you draw inline pictures in the notebooks
  import pylab # this allows you to control figure size
  pylab.rcParams['figure.figsize'] = (10.0, 8.0) # this controls figure size in the notebook
```


1. Using the `ar_marker` library, create a marker using the command: `ar_marker_generate`.
Print that image out (a small one is fine) and attach it to something flat (maybe
tape it to a book). What is the number that the marker represents? (*hint:* when
you generated it, the program should have printed out the number)

2. Using the marker you just generated, grab a picture of you (make sure your face
  is in the image) and the marker using the camera in your laptop. Now write
  some code using the `ar_marker` library to read the marker in the image.

## Face Detection

3. Using the image of yourself and marker above, write some code to detect your face
and draw a green box around it with blue dot in the center.
