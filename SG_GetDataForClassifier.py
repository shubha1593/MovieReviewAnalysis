from SG_GetFeatureMatrix import *
from SG_VectorY import *

featureMatrix = featureMatrixFromReviews()
Y = getYVector()

def getTrainingData() :
	trainingSet = featureMatrix[0 : 900] + featureMatrix[1000 : 1900]
	trainingY = Y[0 : 900] + Y[1000 : 1900]
	return trainingSet, trainingY

def getTestData() :
	testSet = featureMatrix[900 : 1000] + featureMatrix[1900 : 2000]
	testY = Y[900 : 1000] + Y[1900 : 2000]
	return testSet, testY