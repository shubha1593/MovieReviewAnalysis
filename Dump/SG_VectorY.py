def getYVector():
	with open("Output/YForMatlab.txt", 'w') as f :
		for i in range(0, 1000) :
			f.write('0' + '\n')
		for i in range(0, 1000) :
			f.write('1' + '\n')
