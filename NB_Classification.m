%{
 Load the Training Data : 
    Training Set : 1800 x 2012 (of type int64)
    Training Y : 1 X 1800 (of type int64)
%}
load('/Users/Shubha/Learn/MovieReviewAnalysis/Output/TrainingSet.mat');
load('/Users/Shubha/Learn/MovieReviewAnalysis/Output/TrainingY.mat');

%{
 Load the Test Data : 
    Test Set : 200 x 2012 (of type int64)
    Test Y : 1 x 2012 (of type int64)
%}
load('/Users/Shubha/Learn/MovieReviewAnalysis/Output/TestSet.mat');
load('/Users/Shubha/Learn/MovieReviewAnalysis/Output/TestY.mat');

%{
    Take transpose of Y as each row should indicate the class of
    corresponding training data row
%}
TrainingY = trainingY.';
TestY = testY.';

%{ 
    Convert the Training Data and Test Data to double. int64 was giving error on calling internal func of matlab: 
    Error using  - 
    Integers can only be combined with integers of the same class, or
    scalar doubles.
%}
TrainingSet = double(trainingSet);
Class = double(TrainingY);

TestSet = double(testSet);
ActualClass = double(TestY);

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

PredictedClass = predict(nb, TestSet);

% Print the Predicted Class into a text file
fid = fopen('/Users/Shubha/Learn/MovieReviewAnalysis/Output/PredictedClassNB.txt', 'wt');
fprintf(fid,'%d\n',PredictedClass);
fclose(fid);

%{
    Okay now let's check the accuracy of our classifier
    Confusion Matrix : http://in.mathworks.com/help/stats/confusionmat.html
 
    Accuracy of Naive Bayes on this dataset : 82.50%
%}
confusion_matrix = confusionmat(ActualClass, PredictedClass);
accuracy = 100*sum(diag(confusion_matrix))./sum(confusion_matrix(:));
fprintf('Naive Bayes Classifier Accuracy : %.2f%%\n', accuracy);
