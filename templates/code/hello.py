#!/usr/bin/env python
#---------------------------------------------
# Author: Doctor Who
# License: MIT

from __future__ import print_statement  # bring in python 3 print function
from __future__ import division         # use python 3 division
from math import pi                     # get pi from the math library


def main():
    """
    This is a function called main, but the function could have been called anything.
    This is a docstring and can be multi-line ... it should describe wheat your function
    does.
    """
    print('hello!')  # you can use single quotes for strings
    print('the value of pi is: {:.6f}'.format(pi))  # you can format output, this is a float with 6 decimal places
    print("bye")  # you can use double quotes for strings


if __name__ is '__main__':
    main()
