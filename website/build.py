#!/usr/bin/env python
from __future__ import print_function
# from subprocess import check_output
from subprocess import call
import os


def run(cmd):
	cmds = cmd.split()
	# print(cmds)
	call(cmds)


def jupyter(lsns):
	dest = '../www'
	for lsn in lsns:
		print(' > Moving {}.zip to {}'.format(lsn, dest))
		run('zip -r {}.zip {}'.format(lsn, lsn))
		run('mv {}.zip {}'.format(lsn, dest))


# def check_file(f):
# 	ret = None
# 	if f == '.DS_Store':
# 		ret = None
# 	elif len(f.split('.')) == 2:
# 		f, ext = f.split('.')
# 		ret = (f, ext)
# 	return ret


def pandoc(dir):
	os.chdir(dir)
	files = os.listdir('.')
	# print('fiels', files)
	for md in files:
		if len(md.split('.')) == 2:
			f, ext = md.split('.')
		else:
			continue

		if ext == 'md':
			run('pandoc {}.md -V geometry:margin=1in -s -o {}.pdf'.format(f, f))
			run('mv {}.pdf ../../www'.format(f))
	os.chdir('..')


def html():
	cmd = 'pandoc -s -c pandoc.css -t html5-smart -o {0}.html {0}.md'

	files = os.listdir('.')
	# print('fiels', files)
	for md in files:
		if len(md.split('.')) == 2:
			f, ext = md.split('.')
		else:
			continue

		if ext == 'md':
			run(cmd.format(f))
			run('mv {}.html ../www'.format(f))
			# run('cp pandoc.css ../www')


def copy(lsn):
	os.chdir(lsn)
	files = os.listdir('.')
	# print('files', files)
	for f in files:
		if len(f.split('.')) == 2:
			_, ext = f.split('.')
		else:
			continue

		if ext == 'pdf' or ext == 'pptx' or ext == 'ppt':
			cmd = 'cp {} ../../www'.format(f)
			# print(cmd)
			run(cmd)
		else:
			print('>>> Unknown file type:', f)

	os.chdir('..')


def build_block(block, jup, pptpdf=None):
	print('-'*30)
	print('Changed in to {}'.format(block))
	os.chdir(block)

	# jupyter -----------------------------------
	jupyter(jup)

	# homework ----------------------------------
	pandoc('homework')

	# labs ---------------------------------------
	pandoc('lab')

	# pdfs and ppts ------------------------------
	if pptpdf:
		for dr in pptpdf:
			copy(dr)
	copy('references')

	# block page ----------------------------------
	html()

	os.chdir('..')


def build_guides():
	os.chdir('guides')

	def simple(name):
		os.chdir(name)
		cmd = 'pandoc readme.md -V geometry:margin=1in -s  -o {0}.pdf'
		run(cmd.format(name))
		run('mv {}.pdf ../../www'.format(name))
		os.chdir('..')

	simple('build_website')
	simple('pandoc_setup')
	simple('ps4_controller')
	simple('access_point')
	simple('roomba_setup')
	simple('samba')
	simple('software_install')

	copy('cheatsheet')

	html()

	os.chdir('..')


def main():
	ppt = [
		['lsn1', 'lsn2', 'lsn3'],
		['lsn8', 'lsn9'],
		None,
		None
	]
	jup = [
		['lsn4', 'lsn5'],
		['lsn7', 'lsn10'],
		['lsn11', 'lsn14', 'lsn15', 'lsn17', 'lsn18', 'lsn19', 'lsn20', 'lsn21', 'lsn22'],
		['lsn26', 'lsn27', 'lsn28', 'lsn29', 'lsn30', 'lsn33']
	]
	blocks = [
		'block_1_basics',
		'block_2_kinematics',
		'block_3_vision',
		'block_4_mobile_robotics'
	]

	run('rm -fr www')
	run('mkdir -p www')

	for blk, j, p in zip(blocks, jup, ppt):
		build_block(blk, j, p)

	build_guides()

	# syllabus -----------------------------------------------------------------
	run('cp pandoc.css www')
	os.chdir('syllabus')
	# html()
	run('pandoc syllabus.md -V geometry:margin=1in -s -o syllabus.pdf')
	run('mv syllabus.pdf ../www')
	run('pandoc -s --toc -c pandoc.css syllabus.md -t html5-smart -o index.html')
	run('mv index.html ../www')
	os.chdir('..')

	# templates ----------------------------------------------------------------
	os.chdir('templates')
	run('cp jupyter.ipynb ../www')
	run('cp python.py ../www')
	os.chdir('..')


if __name__ == "__main__":
	os.system("find . -type f -name '.DS_Store' -exec rm {} +")
	main()
