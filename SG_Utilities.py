def writeListToFile (filename, aList):
	#print len(aList)
	f = open(filename, 'w')
	for item in aList:
		f.write('%s\n' % item)
	f.close()

def readFileInString (filename):
	f = open(filename, 'r')
	contents = f.read()
	f.close()
	return contents

def readFileInList (filename, separator):
    contents = readFileInString(filename)
    contentList = contents.split(separator)
    return contentList


def getWordDict() :
	afinn = dict(map(lambda (k,v): (k,int(v)), [ line.split('\t') for line in open("Input/AFINN/AFINN-111.txt") ]))
	return afinn