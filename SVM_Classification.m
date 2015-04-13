%{
    Classify using Support Vector Machine Classifier
%}
SVMStruct = svmtrain(TrainingSet, Class);
PredictedClassSVM = svmclassify(SVMStruct, TestSet);

% Print the Predicted Class into a text file
fid = fopen('/Users/Shubha/Learn/MovieReviewAnalysis/Output/PredictedClassSVM.txt', 'wt');
fprintf(fid,'%d\n',PredictedClassSVM);
fclose(fid);

%{
    Get the Accuracy of SVM on this dataset :
        max Accuracy acheived was 76.50% 
%}
accuracySVM = GetAccuracy(ActualClass, PredictedClassSVM);
fprintf('SVM Classifier Accuracy : %.2f%%\n', accuracySVM);