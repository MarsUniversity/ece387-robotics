---
title: Setting Up Pandoc on macOS
author: Kevin J. Walchko
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead[CO,CE]{ECE 387}
    - \fancyfoot[CO,CE]{\thepage}
    - \fancyfoot[LE,RO]{Robots are cool!}
abstract: This will show you how to setup pandoc on macOS so you can generate the documentation. Pandoc has its own flavor of Markdown which extends basic Markdown to easily enable greatly needed additions like \LaTeX, being able to size images, and add footers/headers.
---

![](pics/apple.jpg){width=1in}

# Setup

## Homebrew^[https://brew.sh/]

We will use `homebrew` to install the software:

```bash
	brew update
	brew install pandoc
	brew install caskroom/cask/basictex
```

Now `basictex` installs 90 MB of basic latex software. If you want or need more,
you can try install `mactex`, however, it is about 2.9 GB of data and takes a
while to install. Once `basictex` is installed, you need to add it to your path:

```bash
	export PATH=$PATH:/Library/TeX/texbin
```

Also, run:

```bash
	tlmgr install collection-fontsrecommended
```

## Pandoc^[http://pandoc.org/]

Now `pandoc` has its own flavor of Markdown^[http://pandoc.org/MANUAL.html#pandocs-markdown]
that accepts latex equations and other formatting directives not usually found
in Markdown. Some things I like about it are:

- Set image size by appending `{width=x height=y}` to the end of an image command
	- Example: `![Caption text](path/to/image){width=50%}`
- Latex equation commands
	- `\begin{eqnarray} ... \end{eqnarray}`
	- In line equations: `$\theta$`
	- `\newcommand ...`

All most all of the pdfs are built using:

```bash
	pandoc filename.md -V geometry:margin=1in -N -s  -o filename.pdf
```

where:

- `-V geometry:margin=1in` sets a 1 in margin all the way around
- `-N` puts numbers on the paragraphs
- `-s` makes the document a stand alone document, so it adds things like page numbers
- `-o filename.pdf` tells pandoc to output a pdf using `pdflatex` on macOS

## Windoze Setup

You should be able to do this on Windoze too by installing both `pandoc` and
`texlive`. I will leave that exercise up to the reader.
