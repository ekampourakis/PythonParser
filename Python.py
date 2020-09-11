import math
from tf import listener

# This is my simulation class
class Simulator():
	# These are my simulation variables
	State = 0
	TimeStep = 0.01

	def Step():
		for x in range():
			State = State + 1

	def Speed():
		if TimeStep == 0.01:
			TimeStep = 0.1
		elif TimeStep == 0.1:
			TimeStep = 0.01
		else:
			TimeStep = 0.0

# The main code
c = Simulator()
c.Step()
c.SpeedUp()
