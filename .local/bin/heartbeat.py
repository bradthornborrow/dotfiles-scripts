#!/usr/bin/env python
import RPi.GPIO as GPIO
import os, time
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(15,GPIO.OUT)

while True:
	loadavg=os.getloadavg()[0]
	repeat = 0
	time.sleep(2)
	while repeat <= ((loadavg * 3) + 1):
		GPIO.output(15,GPIO.HIGH)
		time.sleep(0.15)
		GPIO.output(15,GPIO.LOW)
		time.sleep(0.15)
		repeat = repeat + 1
