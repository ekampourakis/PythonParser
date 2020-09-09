import math
from math import sq

# This is my simulation class
class Simulator():
	# These are my simulation variables
	SimulationState = 0
	TimeStep = 0.01

	def Step():
		for x in range():
			SimulationState = SimulationState + 1

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
