---
title: Homework 6
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

# Image Processing

All work for this assignment will be done in a `jupyter notebook`. Grab the
template from the class website and modify it. When you are done, print out
the notebook and turn it in.

1. Using the camera on your laptop, grab an image of yourself and display it
using `plt.imshow()`. Remember to convert the image from BGR to RGB colorspace.
Also, print out the size of the image in pixels
1. Take your color image and split it into the red, blue, and green channels,
create a 1x3 subplot (three side by side). Title each image according to its
color channel
1. Create a 1x2 subplot (two images side by side) of your image. Have the left
image rotated counter clockwise 90 degrees and the right image inverted (flipped).
1. Make a copy of your original image and split out (separate) the red, green,
and blue planes. Then plot a 1x3 subplot of the histogram of your image. Make sure
to set the title of each subplot to the appropriate color and turn on the grid.
1. Make a copy of your original image and on the copy, write your name and date
on the image. Write your name in blue and the date in green.
1. Crop the image so it only shows your face (*hint:* use an ROI) and then plot
it.
1. Take your original RGB image and resize it so the image is 100x100 pixels (like
a thumb nail) and plot it.
