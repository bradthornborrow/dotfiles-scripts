#!/bin/bash
# Engage Warp Drive

# Requires package 'sox'
# http://www.reddit.com/r/linux/comments/n8a2k/commandline_star_trek_engine_noise_comment_from/

# Enterprise original
# play -n -c1 synth whitenoise band -n 100 20 band -n 50 20 gain +25 fade h 1 864000 1

# Enterprise stereo
# play -c2 -n synth whitenoise band -n 100 24 band -n 300 100 gain +20

# Enterprise TNG
play -n -t alsa -c1 synth whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +14
