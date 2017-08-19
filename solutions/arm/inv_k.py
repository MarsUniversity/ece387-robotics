#!/usr/bin/env python

from __future__ import division
from __future__ import print_function
from math import atan2, acos, sqrt, pi


def cosine_law(a, b, c, phase=False):
	if phase:
		angle = acos((c**2 - (a**2 + b**2))/(2*a*b))
	else:
		angle = acos((c**2 - (a**2 + b**2))/(-2*a*b))

	if 1 < angle > -1:
		raise Exception('angle outside range')
	return angle


def mag(a, b):
	return sqrt(a**2 + b**2)


def inverse(x, y, z):
	l1 = 5.75
	l2 = 7.375
	l3 = 3.375

	# check workspace constraints
	t1 = atan2(x, y)

	w = mag(x, y)
	r = mag(z, w)
	c = mag(l1, l2)

	t3 = cosine_law(l1, l2, c, True)  # theta 3

	m = mag(l2, l3)
	t4 = cosine_law(l2, l3, m, True)

	t2 = cosine_law(l1, r, m) + atan2(z, w)

	ans = []
	tmp = (t1, t2, t3, t4)
	for a in tmp:
		ans.append(a*180/pi)

	return ans


if __name__ == '__main__':
	angles = inverse(5, 5, 5)
	print(angles)
