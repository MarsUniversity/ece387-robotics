---
title: 'Lab 3: Detection'
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
---

This lab will exercise your understanding of image processing and computer vision.

![](demo.png)

You are going to build a python program that will manipulate a video stream from
your laptop and do:

- watch for movement (change detection)
- detect faces/eyes
- draw funny things on people
- indication whether it is currently detecting faces or not
- **[Bonus]** do star wars stuff

## [20 pts] Task 1: Change Detection

1. Check the image for change, if nothing has changed in the image, then don't
check it for faces
   1. In a corner of the image put a marker, like a small red circle to indicate
   there is nothing there
1. Once there is movement, then search the region that changed for a face
   1. Update the marker in the corner to show you have detected a face and
   continuously doing Task 2 face detection

## [50 pts] Task 2: Face Detection

Create a python program and do the following:

1. Open a window and display the live camera feed
1. Using an OpenCV cascade filter, use it find faces and eyes in each image
1. Using the identified face/eye locations do 3 things
   1. Put glasses on each person using OpenCV drawing commands
   1. Put a hat on each person
   1. Draw funny eyebrows
      1. You can even animate them
   1. Something else ... if you have an idea ask your instructor first

## [30 pts] Task 3: AR Markers

1. Generate AR markers according to the libraries directions. Show
the image and the marker number in your video feed.
   1. NOTE: the library can only detect 1 marker in the image, no more
1. Change what you draw on people based on the AR marker, so you will need to
have a couple of them.

## [10 pts] Bonus

Instead of doing Task 1 like described, everything you do has to be tied to Star Wars, like:

- Put Darth Vader's, Boba Fett's, Jango Fett's, or a storm trooper's helmet on people
- Put one of [Queen Amidala](http://starwars.wikia.com/wiki/Padm%C3%A9_Amidala) crazy outfits, headdress, or hats on people.
- Use an AR marker to determine which outfit will go on people
- Something else ... if you have an idea ask your instructor first
