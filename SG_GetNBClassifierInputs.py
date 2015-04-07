from SG_GetDataForClassifier import *
import scipy.io

trainingSet, trainingY = getTrainingData()
testSet, testY = getTestData()

#trainingSet_m = numpy.array(trainingSet)
#trainingY_m = numpy.array(trainingY)

scipy.io.savemat('Output/TrainingSet.mat', mdict={'trainingSet' : trainingSet})
scipy.io.savemat('Output/TrainingY.mat', mdict={'trainingY' : trainingY})
scipy.io.savemat('Output/TestSet.mat', mdict={'testSet' : testSet})
scipy.io.savemat('Output/TestY.mat', mdict={'testY' : testY})