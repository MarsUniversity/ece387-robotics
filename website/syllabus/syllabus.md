---
title: 'ECE 387: Intro to Robotic Systems'
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
---

# [Spring 2018 Syllabus](syllabus.pdf)

## Instructor

	Maj Kevin Walchko
	Fairchild 2F48
	kevin.walchko@usafa.edu

## Course Goals and Objectives

Cadets shall:

- Apply common robotic skills using python and the linux command line
- Apply forward and inverse kinematic analysis manipulators and mobile robots
- Apply control methods to mobile robots so they can avoid obstacles and navigate
- Apply common techniques in modern image processing and computer vision

## Prerequisite Course

- Familiarity with any programming language, such as Matlab or C/C++
- Understanding of high school trigonometry
- Understanding of simple matrix/vector operations

## Course Materials and Resources

| | |
|-------------|-----------------------------------------------------|
| Course Text | None, various PDFs are provided for reading         |
| Web Page    | [https://marsuniversity.github.io/ece387/](https://marsuniversity.github.io/ece387/) |
| Software    | Python 2.7                                          |
|             | OpenCV 3.3.x                                        |
|             | Jupyter notebooks                                   |
|             | GitBash                                             |

## Grades

| Grade        | Grade        |
|--------------|--------------|
| 90 < A < 100 | 74 < C+ < 77 |
| 87 < A- < 90 | 70 < C  < 74 |
| 84 < B+ < 87 | 67 < C- < 70 |
| 80 < B < 84  | 60 < D  < 67 |
| 77 < B- < 80 |  0 < F  < 60 |

|               | Prog %   | Final %   |
|---------------|----------|-----------|
| HW            | 10       | 10        |
| Quizzes       | 10       | 10        |
| GRs           | 45       | 30        |
| Labs          | 35       | 30        |
| Final Project |          | 20        |

## Missing Class and the Late Policy

Inform your instructor of absences in advance via email. Please include the reason for the absence and any relevant SCA. Check the SCA to see if instructor permission is required and if it is, make the request prior to the absence. You will be given an Unexcused Absence in CAS if you fail to get permission.

If you plan to miss a class, you *must* take any quiz or GR prior to your departure.

Due to the limited time to conduct labs and the fact they are executed in groups, you can not miss both lab days unless you have a medical excuse due to unplanned illness. You can miss one lab day, but depending on situation (e.g., something you could have avoided), you may loose points for the lab.

If you are expecting to miss class on the day an assignment is due, you shall turn in your assignment prior to your departure. Your instructor may grant a no-penalty turn-in extension for absences resulting from illness or other legitimate extenuating circumstances. Cadets shall coordinate late submittals in advance. The late policy for the Department of Electrical and Computer Engineering is as follows:

| How Late? | Max Penalty | Max Grade |
|-----------|-------------|-----------|
| < 1 day   | 25%         | 75%       |
|   2 day   | 50%         | 50%       |
|   3 day   | 75%         | 25%       |
| > 3 day   | 100%        | 0%        |

## Collaboration and Documentation Policy

You may receive help from any DFEC faculty member on the homework. Do not work
with other students in the class or who have taken the class previously. Document
all help received on work submitted for grading IAW DF policies, or document
*none* if your work was completely individual effort.

## Labs and Final Project

The labs are performed in groups of no more than 3 students. Each lab will build
on the homework, in class lectures and readings. The purpose of the labs is to
provide hands on experience with the topics discussed in the lectures. The final
project will focus on the Roomba robot, controls, computer vision, and path planning.

# Schedule

- Homeworks are at the beginning of class (BOC)
- Labs are due on the final day at the end of class (EOC)

| Lsn | Topic                                                 | Reading                     | Due                       |
|-----|-------------------------------------------------------|-----------------------------|---------------------------|
| 1   | [Intro & Overview][1]                                 |                             | Read syllabus and familiarize yourself with the website links/references |
| 2   | [Linux Command Line][2]                               | Matlof Ch 1.0-1.9           | Install required software |
| 3   | [Python Intro][3] [[download](lsn3.zip)]              |                             | [HW 1](hw123.pdf) |
| 4   | [Python Numpy, sympy, Matplotlib][4] [[download](lsn4.zip)]| Matlof Ch 3                 | [HW 2](hw123.pdf) |
| 5   | [Python Quiz][5]  [[download](lsn5.zip)]              |                             | [HW 3](hw123.pdf) |
| 6   | [Lab 1: linux and python](lab1.pdf)                   |                             | Lab1 EOC |
| 7   | [Kinematics: Intro][7]  [[download](lsn5.zip)]        | Craig Ch 3                  | **Quiz 1**|
| 8   | [2D Forward-Inv Kinematics][8]  [[download](lsn8.zip)]|                             | |
| 9   | [3D Inverse-Inv Kinematics][9]  [[download](lsn9.zip)]|                             | [HW4](hw4.pdf)|
| 10  | [Robot Arm Control][10]  [[download](lsn10.zip)]      | RC Servos                   | |
| 11  | [OpenCV Introduction][11]  [[download](lsn11.zip)]    |                             | [HW5](hw5.pdf)|
| 12  | [Lab 2: Robot Arm](lab2.pdf)                          |                             | [Pre-Lab2](lab2.pdf) |
| 13  | [Lab 2: Robot Arm](lab2.pdf)                          |                             | Lab2 EOC |
| 14  | [Filtering][14]  [[download](lsn14.zip)]              | Edge Detection              | [HW6](hw6.pdf)|
| 15  | [Feature Detection][15]  [[download](lsn15.zip)]      |                             | **Quiz 2**|
| 16  | **GR 1**                                              |                             | |
| 17  | [Cameras and Calibration][17]  [[download](lsn17.zip)]|                             | |
| 18  | [Face Detection][18]  [[download](lsn18.zip)]         |                             | |
| 19  | [Marker Detection][19]  [[download](lsn19.zip)]       | Wolf                        | |
| 20  | [Color Detection][20]  [[download](lsn20.zip)]        |                             | |
| 21  | [Change Detection][21]  [[download](lsn21.zip)]       |                             | |
| 22  | [Tracking][22]  [[download](lsn22.zip)]               |                             | [HW7](hw7.pdf) |
| 23  | [Image Stitching][23]  [[download](lsn23.zip)]        |                             | **Quiz 3**|
| 24  | [Lab 3: Detection and Tracking](lab3.pdf)             |                             | |
| 25  | [Lab 3: Detection and Tracking](lab3.pdf)             |                             | Lab3 EOC |
| 26  | [Mobile Robotics][26]  [[download](lsn26.zip)]        | Siegwart Ch 3               | |
| 27  | [Roomba Sensors][27]  [[download](lsn27.zip)]         | Siegwart Ch 4-4.1.71        | |
| 28  | [Sensor Calibration][28]  [[download](lsn28.zip)]     |                             | |
| 29  | [Controls][29]  [[download](lsn29.zip)]               | Siegwart Ch 5               | [HW8](hw8.pdf) |
| 30  | [TBD][30]  [[download](lsn30.zip)]                    |                             | |
| 31  | [Lab 4: Roomba Control](lab4.pdf)                     |                             | |
| 32  | [Lab 4: Roomba Control](lab4.pdf)                     |                             | Lab4 EOC |
| 33  | [Path Planning][33]  [[download](lsn33.zip)]          | Law                         | |
| 34  | [TBD][34]  [[download](lsn34.zip)]                    |                             | **Quiz 4**|
| 35  | [Lab 5: Roomba Sensors](lab5.pdf)                     |                             | [HW9](hw9.pdf)|
| 36  | [Lab 5: Roomba Sensors](lab5.pdf)                     |                             | Lab5 EOC |
| 37  | **GR2**                                               |                             | |
| 38  | [Final Project](final_project.pdf)                    |                             | |
| 39  | [Final Project](final_project.pdf)                    |                             | |
| 40  | [Final Project](final_project.pdf)                    |                             | Final Project EOC|

[1]: lsn1.pptx
[2]: lsn2-linux.pptx
[3]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_1_basics/lsn3/lsn3.ipynb
[4]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_1_basics/lsn4/lsn4.ipynb
[5]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_1_basics/lsn5/lsn5.ipynb
[7]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_2_kinematics/lsn7/lsn7.ipynb
[8]: lsn8.pdf
[9]: lsn9.pdf
[10]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_2_kinematics/lsn10/lsn10.ipynb
[11]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_3_vision/lsn11/lsn11.ipynb
[14]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_3_vision/lsn14/lsn14.ipynb
[15]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_3_vision/lsn15/lsn15.ipynb
[17]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_3_vision/lsn17/lsn17.ipynb
[18]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_3_vision/lsn18/lsn18.ipynb
[19]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_3_vision/lsn19/lsn19.ipynb
[20]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_3_vision/lsn20/lsn20.ipynb
[21]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_3_vision/lsn21/lsn21.ipynb
[22]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_3_vision/lsn22/lsn22.ipynb
[23]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_3_vision/lsn23/lsn23.ipynb
[26]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_4_mobile_robotics/lsn26/lsn26.ipynb
[27]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_4_mobile_robotics/lsn27/lsn27.ipynb
[28]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_4_mobile_robotics/lsn28/lsn28.ipynb
[29]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_4_mobile_robotics/lsn29/lsn29.ipynb
[30]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_4_mobile_robotics/lsn30/lsn30.ipynb
[33]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_4_mobile_robotics/lsn33/lsn33.ipynb
[34]: http://nbviewer.jupyter.org/github/MarsUniversity/ece387/blob/master/website/block_4_mobile_robotics/lsn34/lsn34.ipynb


# Homework/Lab Templates

- [Jupyter Notebook](jupyter.ipynb)
- [Python](python.py)

# References

## Readings

- [Matlof, "Fast Lane to Python"](python-matlof.pdf)
- [Craig, "Introduction to Robotics"](Introduction-to-Robotics-Craig.pdf)
- [RC Servos](hobby_servos.pdf)
- [Edge Detection, 2nd half of pdf](Edge_Detection.pdf)
- [Siegwart, "Introduction to Autonomous Mobile Robots"](siegwartRobotBook.pdf)
- [Wolf, "AN INTRODUCTION TO ERROR CORRECTING CODES"](ErrorCorrection.pdf)
- [Faragher, "Understanding the Basis of the Kalman Filter"](KalmanFilter.pdf)
- [Law, "Quantitative Comparison of Flood Fill and Modified Flood Fill Algorithms"](FloodFill.pdf)

## Install/Setup Guides

- [**Required Software:** Laptop software install for python, OpenCV, and MS Compiler](software_install.pdf)
- [Roomba Setup](roomba_setup.pdf)
- [Interfacing Windoze and Linux file systems](windows_linux.pdf)
- [Connecting to the Roomba via wifi](access_point.pdf)
- [Pandoc setup for automating website/documentation generation](pandoc_setup.pdf)

## On-line Python  and Command Line Class

- [www.codeacademy.com](www.codeacademy.com)

## Lynxmotion Arm Guide

- [SSC-32u Servo motor controller](ssc-32u_guide.pdf)

## Class Python Libraries

- [ar_markers](https://pypi.python.org/pypi/ar-markers): detecting QR markers
- [nxp_imu](https://pypi.python.org/pypi/nxp-imu): driver for NXP inertial measurement unit
- [pycreate2](https://pypi.python.org/pypi/pycreate2): driver for iRobot Create 2
- [ins_nav](https://pypi.python.org/pypi/ins-nav): algorithms for inertial navigation
- [opencvutils](https://pypi.python.org/pypi/opencvutils): OpenCV functions
- [the-collector](https://pypi.python.org/pypi/the-collector): saving live data for later
- [pyhexdump](https://pypi.python.org/pypi/pyhexdump): reads binary files

## Standford Python Class: Introduction to Scientific Python, CME 193

- [Intro](python-1.pdf)
- [Functions & Testing](python-2.pdf)
- [Data Structures](python-3.pdf)
- [Object Oriented Programming](python-4.pdf)
- [Numpy and Matplotlib](python-5.pdf)
- [File I/O and Strings](python-6.pdf)
- [Other Topics](python-7.pdf)

## OpenCV Documentation

- [OpenCV 3 Overview pdf](OpenCV-3-overview.pdf)
- [OpenCV Documentation, all languages](http://docs.opencv.org/trunk/index.html)
- [OpenCV tutorials for python](http://docs.opencv.org/trunk/d6/d00/tutorial_py_root.html)
- [OpenCV source code on github, python examples](https://github.com/opencv/opencv/tree/master/samples/python)

## Cheat Sheets and References

- [Linux command line reference](command-line.pdf)
- [Markdown](markdown.pdf)
- [LaTeX math symbols](latex-symbols.pdf)
- [Python and matplotlib (long)](python.pdf)
- [Python (short)](python-qr.pdf)
- [Python Crash Course](https://github.com/ehmatthes/pcc/tree/master/cheat_sheets)
- [Jupyter reference I](jupyter-1.pdf)
- [Jupyter reference II](jupyter-2.pdf)
- [iRobot Create 2 (short)](roomba.pdf)
- [iRobot Create 2 interface (long)](iRobot_Roomba_600_Open_Interface_Spec.pdf)
