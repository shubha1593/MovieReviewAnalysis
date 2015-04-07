from SG_GetFeatureMatrix import *
from SG_VectorY import *


def buildFeatureMatrixFile() :
	featureMatrix = featureMatrixFromReviews()
	with open("Output/FeatureMatrixForMatlab.txt", 'w') as f :
		for featureVector in featureMatrix :
			f.write(" ".join(str(feature) for feature in featureVector) + "\n")


buildFeatureMatrixFile()
getYVector()