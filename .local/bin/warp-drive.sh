#!/bin/bash
# Enterprise cabin whitenoise generator

# Requires package 'sox'
# http://www.reddit.com/r/linux/comments/n8a2k/commandline_star_trek_engine_noise_comment_from/

# Star Trek TOS engines
# play -n -t alsa -c2 synth whitenoise band -n 100 24 band -n 300 100 gain +20

# Star Trek TNG engines
play -n -t alsa -c1 synth whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +14
