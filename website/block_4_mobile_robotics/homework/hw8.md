---
title: 'Homework 8: Roomba Telemetry'
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

# Robot Telemetry

For **Lab 5** you will be calibrating your Roomba's IMU. To get you use to working
with bag files and the Roomba's sensors, This homework will get you use to working
with the files and plotting the data.

Also, for **Lab 4** and the final project, some of the sensors we want to be able
to access are:

- encoders
- bump and cliff sensors (integers, not the Boolean values)

This is also a good exercise to learn how to do this.

## Data

Basic arrangement of data:

- **Create 2:** All sensor data from the create follows the format shown in class
- **IMU:** IMU data is an array in the order of [accel, mag, gyro]
- **Imagery:** Camera data is just one frame (image) after the other

## Hints

- Remember, when you load the data from the bag file, it will become a python
dictionary where every data sample will be: [data, timestamp]. The data will be
one of the above
- **I don't understand how the data is arranged in each key?** *Hint:** just
print the data to get an idea of what it looks like. Remember, it is arranged as
[data, timestamp] for each sample

# Homework

1. Download the telemetry file `hw.json` from the lesson 27 zip file
1. Create a Jupyter notebook and load the data using `the-collector` library as
we did in that lesson
1. In a Jupyter cell, run `%ls` to see if you put the data file in the same location
as your notebook. This is to help you if you have issues.
1. Print out the keys in the data file and show how many data
samples are in each key like we did in class
1. Plot the following items, make sure to turn on the grid and label the plot
axes or use a legend so we can tell what the data is
    1. left/right encoder counts.
      1. Is there anything strange about them?
    1. just the center left/right light bumpers. *Hint 1:* Not the Boolean values,
    the integer ones. *Hint 2:* unfortunately,
    the bag file changes the original roomba data structure into a dictionary, so
    you have to access the data like: `my_roomba_data['light_bumper_center_left']`.
    You **cannot** do `my_roomba_data[36]` or `my_roomba_data.light_bumper_center_left`
    like you could if we were accessing the data in real-time on the raspberry pi.
    1. just the front left/right cliff signals, again, the integer ones
       1. Anything strange? If so, what do you think is going on?
1. From the array of images, plot frame 320. *Hint:* it is an image, so do the
same thing you would do for an OpenCV image
