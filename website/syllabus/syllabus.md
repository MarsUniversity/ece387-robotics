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

- Apply forward and inverse kinematic analysis and dynamic analysis to planar manipulators and mobile robots
- Understand mobile robot odometry challenges and the purpose of Kalman Filters
- Understand the principles of operation and characteristics of various robot sensors
- Understand image capture with a CCD camera

## Prerequisite Course

Familiarity with any programming language, such as Matlab or C/C++, is all that
is required.

## Course Materials and Resources

| | |
|-------------|-----------------------------------------------------|
| Course Text | None, various PDFs are provided for reading         |
| Web Page    | TBD                                                 |
| Software    | Python 2.7 will need to be installed on your laptop |

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

Due to the limited time to conduct labs and the fact they are executed in groups, you can not miss a labs unless you have a medical excuse due to unplanned illness.

If you are expecting to miss class on the day an assignment is due, you shall turn in your assignment prior to your departure. Your instructor may grant a no-penalty turn-in extension for absences resulting from illness or other legitimate extenuating circumstances. Cadets shall coordinate late submittals in advance. The late policy for the Department of Electrical and Computer Engineering is as follows:

| How Late? | Max Penalty | Max Grade |
|-----------|-------------|-----------|
| < 1 day   | 25%         | 75%       |
|   2 day   | 50%         | 50%       |
|   3 day   | 75%         | 25%       |
| > 3 day   | 100%        | 0%        |

## Collaboration and Documentation Policy

You may receive help from any DFEC faculty member on the homework. Do not work with other students in the class or who have taken the class previously. Document all help received on work submitted for grading IAW DF policies, or *none* if your work was completely individual effort.

## Quizzes

Short graded quizzes will be given periodically throughout the semester and are listed in the schedule. The quizzes are based on the previous lessons.

## Labs and Final Project

The labs are performed in groups of no more than 3 students. Each lab will build
on the homework, in class lectures and readings. The purpose of the labs is to
provide hands on experience with the topics discussed in the lectures. The final project will focus on the Roomba robot, controls, computer vision, and path planning.


# Schedule

| Lsn                 | Topic                         | Quiz | Reading | Due       |
|---------------------|-------------------------------|------|---------|-----------|
| [1](block-1.html)   | Intro & Overview              |      |         |           |
| [2](block-1.html)   | Linux Command Line            |      |         |           |
| [3](block-1.html)   | Python Intro                  |      |         | [HW1 Command Line](hw123.pdf) |
| [4](block-1.html)   | Python                        |      |         | [HW2 Python](hw123.pdf) |
| [5](block-1.html)   | Python                        |      |         | [HW3 Python](hw123.pdf) |
| [6](block-1.html)   | Lab 1: linux and python       |      |         | [Lab1](lab1.pdf) EOC |
| [7](block-2.html)   | Kinematics: Intro             | Y    |         | |
| [8](block-2.html)   | Forward Kinematics            |      |         | |
| [9](block-2.html)   | Inverse Kinematics            |      |         | [HW4 Forward Kinematics](hw4.pdf)|
| [10](block-2.html)  | Robot Arm Control             |      |         | |
| [11](block-3.html)  | Image Processing              |      |         | [HW5 Inverse Kinematics](hw5.pdf)|
| [12](block-2.html)  | Lab 2: Robot Arm              |      |         | [Pre-Lab2](lab2.pdf) |
| [13](block-2.html)  | Lab 2: Robot Arm              | Y    |         | [Lab2](lab2.pdf) EOC |
| [14](block-3.html)  | Image Processing              |      |         | |
| [15](block-3.html)  | Image Processing              |      |         | [HW6 Image Sources](hw6.pdf) |
| 16                  | GR 1  (move to 18?)           |      |         | |
| [17](block-3.html)  | Computer Vision Intro         |      |         | |
| [18](block-3.html)  | CV: Face Detection            |      |         | |
| [19](block-3.html)  | CV: Marker Detection          |      |         | [HW7 Face Detection](hw7.pdf) |
| [20](block-3.html)  | CV: Target Detection          |      |         | [HW8 Marker Detection](hw8.pdf) |
| [21](block-3.html)  | CV: Kalman Filter             | Y    |         | |
| [22](block-3.html)  | CV: Target Tracking           |      |         | [HW9 Kalman Filtering](hw9.pdf) |
| [23](block-3.html)  | Lab 3: Detection and Tracking |      |         | [Lab3](lab3.pdf) EOC |
| [24](block-4.html)  | Mobile Robots                 |      |         | |
| [25](block-4.html)  | Roomba Overview               |      |         | |
| [26](block-4.html)  | Roomba Sensors (HW10 in class)|      |         | |
| [27](block-4.html)  | Nav Particle Filter           |      |         | [HW10 Roomba Sensors](hw10.pdf) |
| [28](block-4.html)  | Nav Motion Model              |      |         | |
| [29](block-4.html)  | Lab 3: Sensor Calibration     |      |         | |
| [30](block-4.html)  | Controls                      |      |         | |
| [31](block-4.html)  | Path Planning                 |      |         | [Lab4](lab4.pdf) BOC |
| [32](block-4.html)  | Path Planning (HW11 in class) |      |         | |
| [33](block-4.html)  | INS                           |      |         | [HW11](hw11.pdf) |
| [34](block-4.html)  | INS                           |      |         | |
| 35  | Lab 5: Roomba                 | Y    |         | |
| 36  | Lab 5: Roomba                 |      |         | [Lab5](lab5.pdf) EOC |
| 37  | GR2                           |      |         | |
| 38  | Final Project                 |      |         | |
| 39  | Final Project                 |      |         | |
| 40  | Final Project                 |      |         | [Final Project](final_project.pdf)|

# Templates

- [Homework: Jupyter Notebook](template.ipynb)
- [Lab: Python](python.py)
