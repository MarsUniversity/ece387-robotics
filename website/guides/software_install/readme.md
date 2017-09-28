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
1. From this folder, grab `.bash_profile` (note it has "." on the front so it is a hidden file) and drop it in your home folder
    1. My home folder, for example, is: `C:/Users/Kevin.Walchko`
1. Now to open a bash window, you can double click on the git-bash icon on your desktop or from the start menu: All Programs -> Git -> Git Bash

Also to make your life a little easier, use this `.bash_profile`. Just place this
in a simple text file and leave it in your home directory `C:/Users/<your name>`:

```bash
export PATH=/c/Python27:/c/Python27/Scripts:$PATH
alias python='winpty /c/Python27/python.exe'
alias pip='python -m pip'
alias ll='ls -lh'
alias ls='ls -Fh --color=auto --show-control-chars'

USR="\[\033[01;32m\]"
HOST="\[\033[01;35m\]"
DIR="\[\033[01;34m\]"
END="\[\033[0m\]"

export PS1="$USR\u@$HOST\h $DIR\W$END \$ "

# for some stupid reason, bash starts at root level
cd ~

```

If there is already a `.bash_profile` there, then overwrite it with this one.

## Python

1. Grab the python package from [www.python.org](https://www.python.org/downloads/windows/)
1. You should have something like `python-2.7.14.amd64.msi`, run that and install the software to your C: drive
1. Open a bash window
1. Update your software with: `pip install -U pip setuptools wheel`

### Microsoft Compiler for Python 2.7

In order to build some of the python packages we need, you have to have a compiler
installed. For linux/unix, this isn't an issue. For Windoze, we need to get and
install one.

1. Download the [Microsoft Visual C++ Compiler for Python 2.7](https://www.microsoft.com/en-us/download/details.aspx?id=44266)
1. Once you have it, double click and install it

## OpenCV 3.3

1. Download OpenCV 3.3 from [Github](https://github.com/opencv/opencv/releases). Your browser
   should put it in your `Downloads` folder. If it goes else where, then adjust the instructions below.
1. Grab the opencv library (`cv2.pyd`) and put it into your python library
    1. from: `C:\Users\<your username>\Downloads\opencv\build\python\2.7\x64\cv2.pyd`
    1. to: `C:\Python27\Lib\site-packages`
1. Now test:
    1. open a bash window
    1. run: `python`
    1. type: `import cv2`
    1. if there are no errors ... you are good!

## Jupyter Notebooks

You have to have Python and GitBash installed already before you do this.

1. Open a bash window
1. Run: `pip install -U numpy jupyter opencvutils matplotlib jupyter_tools`
1. Once that finishes installing, run: `jupyter notebook`
1. A webpage should open up. From there you can create or
   navigate to jupyter notebooks and open them.

## Other Python Libraries

1. Run `pip install -U pycreate2 ar_markers future sparklines pyserial`
