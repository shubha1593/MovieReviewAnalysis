from SG_GetFeatureMatrix import *
from SG_VectorY import *
import numpy, scipy.io

featureMatrix = numpy.array(featureMatrixFromReviews())
Y = numpy.array(getYVector())

scipy.io.savemat('Output/featureMatrix.mat', mdict={'featureMatrix' : featureMatrix})
scipy.io.savemat('Output/Y.mat', mdict={'Y' : Y})


