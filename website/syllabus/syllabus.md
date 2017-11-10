---
title: ECE 387 Intro to Robotic Systems
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
---

# [Sprint 2018 Syllabus](syllabus.pdf)

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

Familiarity with any programming language, such as Matlab or C/C++, is all that
is required.

## Course Materials and Resources

| | |
|-------------|-----------------------------------------------------|
| Course Text | None, various PDFs are provided for reading         |
| Web Page    | [https://marsuniversity.github.io/ece387/](https://marsuniversity.github.io/ece387/) |
| Software    | Python 2.7, OpenCV 3.3 and Jupyter notebook will need to be installed on your laptop |

## Grades

| Grade        | Grade        |
|--------------|--------------|
| 90 < A < 100 | 74 < C+ < 77 |
| 87 < A- < 90 | 70 < C  < 74 |
| 84 < B+ < 87 | 67 < C- < 70 |
| 80 < B < 84  | 60 < D  < 67 |
| 77 < B- < 80 |  0 < F  < 60 |

|               | Prog Pts | Final Pts |
|---------------|----------|-----------|
| HW            | (5)25    | (6)30     |
| GRs           | 100      | 100       |
| Labs          | (2)40    | (3)60     |
| Quizzes       | (2)20    | (2)20     |
| Final Project |          | 100       |
| TOTAL         | 185      | 310       |

## Missing Class and the Late Policy

Inform your instructor of absences in advance via email. Please include the reason for the absence and any relevant SCA. Check the SCA to see if instructor permission is required and if it is, make the request prior to the absence. You will be given an Unexcused Absence in CAS if you fail to get permission.

If you plan to miss a class, you *must* take any quiz or GR prior to your departure.

Due to the limited time to conduct labs and the fact they are executed in groups, you can not miss a labs unless you have a medical excuse due to unplanned illness.

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

| Lsn                 | Topic                         | Reading             | Due                       |
|---------------------|-------------------------------|---------------------|---------------------------|
| [1](block-1.html)   | Intro & Overview              |                     |                           |
| [2](block-1.html)   | Linux Command Line            | Matlof Ch 1.0 - 1.9 | Install required software |
| [3](block-1.html)   | Python Intro                  |                     | [HW1 Command Line](hw123.pdf) |
| [4](block-1.html)   | Python                        | Matlof Ch 3         | [HW2 Python](hw123.pdf) |
| [5](block-1.html)   | Python                        |                     | [HW3 Python](hw123.pdf) |
| [6](block-1.html)   | Lab 1: linux and python       |                     | [Lab1](lab1.pdf) EOC |
| [7](block-2.html)   | Kinematics: Intro             | Craig Ch 3          | |
| [8](block-2.html)   | 2D Forward-Inv Kinematics     |                     | |
| [9](block-2.html)   | 3D Inverse-Inv Kinematics     |                     | [HW4 Forward Kinematics](hw4.pdf)|
| [10](block-2.html)  | Robot Arm Control             |                     | |
| [11](block-3.html)  | Image Processing              |                     | [HW5 Inverse Kinematics](hw5.pdf)|
| [12](block-2.html)  | Lab 2: Robot Arm              |                     | [Pre-Lab2](lab2.pdf) |
| [13](block-2.html)  | Lab 2: Robot Arm              |                     | [Lab2](lab2.pdf) EOC |
| [14](block-3.html)  | Image Processing              |                     | |
| [15](block-3.html)  | Image Processing              |                     | [HW6 Image Sources](hw6.pdf) |
| 16                  | GR 1                          |                     | |
| [17](block-3.html)  | Computer Vision Intro         |                     | |
| [18](block-3.html)  | CV: Face Detection            |                     | |
| [19](block-3.html)  | CV: Marker Detection          |                     | |
| [20](block-3.html)  | CV: Target Detection          |                     | [HW7 Detection I](hw7.pdf) |
| [21](block-3.html)  | CV: Tracking I                |[Kalman Filter](KalmanFilter.pdf)| |
| [22](block-3.html)  | CV: Tracking II               |                     | [HW8 Detection II](hw8.pdf) |
| [23](block-3.html)  | CV: Image Stitching           |                     | |
| [24](block-3.html)  | Lab 3: Detection and Tracking |                     | [HW9 Kalman Filter](hw9.pdf)|
| [25](block-3.html)  | Lab 3: Detection and Tracking |                     | [Lab3](lab3.pdf) EOC |
| [26](block-4.html)  | Mobile Robots                 |                     | |
| [27](block-4.html)  | Roomba Overview               |                     | |
| [28](block-4.html)  | Roomba Sensors (HW10 in class)|                     | |
| [29](block-4.html)  | Controls                      |                     | [HW10 Roomba Sensors](hw10.pdf) |
| [30](block-4.html)  | Controls                      |                     | |
| [31](block-4.html)  | Lab 4: Roomba Control         |                     | |
| [32](block-4.html)  | Lab 4: Roomba Control         |                     | [Lab4](lab4.pdf) EOC |
| [33](block-4.html)  | Path Planning                 |                     | |
| [34](block-4.html)  | Path Planning (HW11 in class) |                     | |
| [35](block-4.html)  | Lab 5: Roomba Sensors         |                     | [HW11](hw11.pdf)|
| [36](block-4.html)  | Lab 5: Roomba Sensors         |                     | [Lab5](lab5.pdf) EOC |
| 37                  | GR2                           |                     | |
| [38](block-4.html)  | Final Project                 |                     | |
| [39](block-4.html)  | Final Project                 |                     | |
| [40](block-4.html)  | Final Project                 |                     | [Final Project](final_project.pdf)|

# Templates

- [Jupyter Notebook](jupyter.ipynb)
- [Python](python.py)

# References

## Install/Setup Guides

- [**Required Software:** Laptop software install for python, OpenCV, and MS Compiler](software_install.pdf)
- [Roomba Setup](roomba_setup.pdf)
- [Interfacing Windoze and Linux file systems](windows_linux.pdf)
- [Connecting to the Roomba via wifi](access_point.pdf)
- [Pandoc setup for automating website/documentation generation](pandoc_setup.pdf)

## Class Python Libraries

- [ar_markers](https://pypi.python.org/pypi/ar-markers)
- [nxp_imu](https://pypi.python.org/pypi/nxp-imu)
- [pycreate2](https://pypi.python.org/pypi/pycreate2)
- [ins_nav](https://pypi.python.org/pypi/ins-nav)
- [opencvutils](https://pypi.python.org/pypi/opencvutils)
- [the-collector](https://pypi.python.org/pypi/the-collector)
- [pyhexdump](https://pypi.python.org/pypi/pyhexdump)

## Cheat Sheets and References

- [Linux command line reference](command-line.pdf)
- [Markdown](markdown.pdf)
- [Python (long)](python.pdf)
- [Python (short)](python-qr.pdf)
- [Jupyter reference I](jupyter-1.pdf)
- [Jupyter reference II](jupyter-2.pdf)
- [iRobot Create 2 interface](iRobot_Roomba_600_Open_Interface_Spec.pdf)
