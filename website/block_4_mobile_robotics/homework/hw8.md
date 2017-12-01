---
title: 'Homework 8: Telemetry'
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

# Telemetry

1. Download the telemetry file `hw8.json` from lesson 28
1. Create a Jupyter notebook and load the data using `the-collector` library
1. Plot the following items with a grid, axes labelled, and titles:
    1. left/right encoder counts in a single plot, use a legend for the 2 datasets
    1. all light bumpers (index 36-41) in a 2x3 subplot
    1. all cliff signals (index 20-23) in a 2x2 subplot
