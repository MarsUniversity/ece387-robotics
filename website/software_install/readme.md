---
title: Install Software for ECE387
author: Kevin J. Walchko
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
abstract: This will show you how to install the software for the class. We will install python 2.7, windoze compiler, OpenCV for python, and a bunch of python modules that will be used in the class.
---

# Install

## Git-Bash

1. Grab the git-bash package from [git-scm.com](https://git-scm.com/download/win) and install it
1. From this folder, grab .bash_profile (note it has "." on the front so it is a hidden file) and drop it in your home folder
    1. My home folder, for example, is: C:/Users/Kevin.Walchko
1. Now to open a bash window, you can double click on the git-bash icon on your desktop or from the start menu: All Programs -> Git -> Git Bash

## Python

1. Grab the python package from the software folder (or download from www.python.org)
1. You should have an `python-2.7.13.amd64.msi`, run that and install the software to your C: drive
1. Now install
1. Open a bash window
1. Run: `pip install -U pip setuptools wheel` to update your software

- Python 2.7
    - python-2.7 installer
    - VCForPython27: it is a cpp compiler to build wheels

- Python 3.6
    - python-3.6 installer
    - vs_buildtools: it is a cpp compiler to build wheels

## OpenCV 3.2

1. Download OpenCV 3.2 from [Sourceforge](https://sourceforge.net/projects/opencvlibrary/). Your browser
   should put it in your `Downloads` folder. If it goes else where, then adjust the instructions below.
    1. Alternatively you can get it from the `software` folder, grab `cv2.pyd`
1. Grab the opencv library (`cv2.pyd`) and put it into your python library
    1. from: `C:\Users\<your username>\Downloads\opencv\build\python\2.7\x64\cv2.pyd`
    1. to: `C:\Python27\Lib\site-packages`
1. Now test:
    1. open a bash window
    1. run `python`
    1. type: `import cv2`
    1. if there are no errors ... you are good!

## Jupyter Notebooks

1. Go to the software folder and install `VCForPython27.msi`. This will install the
   microsoft compiler so you can build python libraries in wheel format
1. Run `pip install -U numpy jupyter opencvutils matplotlib`
1. Open a bash window
1. Run `jupyter notebook` and a webpage should open up. From there you can create or
   navigate to jupyter notebooks and open them

## Other Python Libraries

1. Run `pip install -U pycreate2 ar_markers future sparklines pyserial`
