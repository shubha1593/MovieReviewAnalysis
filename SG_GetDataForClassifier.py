from SG_GetFeatureMatrix import *
from SG_VectorY import *

featureMatrix = featureMatrixFromReviews()
Y = getYVector()

def getDataForClassifier() :
	return featureMatrix, Y