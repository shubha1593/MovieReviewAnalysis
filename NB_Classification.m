% Call PrepareTrainAndTestSet script to get Training and Testing data 
PrepareTrainAndTestSet;

%{
    Classify using Naive Bayes Classifier
    Using Multinomial Mode (mn) as was getting error :
    The within-class variance in each feature of TRAINING must be positive.
    The within-class variance in feature 11 14 ..... in class 0 are not 
    positive.
    Look at the link below :
    http://stackoverflow.com/questions/13427664/the-within-class-variance-in-each-feature-of-training-must-be-positive
%}
nb = NaiveBayes.fit(TrainingSet, Class, 'Distribution', 'mn');

PredictedClassNB = predict(nb, TestSet);

% Print the Predicted Class into a text file
fid = fopen('/Users/Shubha/Learn/MovieReviewAnalysis/Output/PredictedClassNB.txt', 'wt');
fprintf(fid,'%d\n',PredictedClassNB);
fclose(fid);

%{
    Get the Accuracy of Naive Bayes on this dataset :
        max Accuracy acheived was 82.50% 
%}
accuracyNB = GetAccuracy(ActualClass, PredictedClassNB);
fprintf('Naive Bayes Classifier Accuracy : %.2f%%\n', accuracyNB);
