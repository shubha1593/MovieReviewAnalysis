from SG_GetDataForClassifier import *
import scipy.io

FeatureMatrix, Y = getDataForClassifier()

#Featurematrix_m = numpy.array(FeatureMatrix)
#Y_m = numpy.array(Y)

scipy.io.savemat('Output/FeatureMatrix.mat', mdict={'FeatureMatrix' : FeatureMatrix})
scipy.io.savemat('Output/Y.mat', mdict={'Y' : Y})