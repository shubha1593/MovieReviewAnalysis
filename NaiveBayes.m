% Load the Training Set : Feature Matrix : 2000 x 2012 (of type int64)
load('/Users/Shubha/Documents/Project/MovieReviewClassification/Output/featureMatrix.mat');

% Load the Class Matrix : Y : 1 x 2000 (of type int64)
load('/Users/Shubha/Documents/Project/MovieReviewClassification/Output/Y.mat');

%{
    Take transpose of Y as each row should indicate the class of
    corresponding training set row
%}
Y_transpose = Y.';

%{ 
    Convert the Training Set and Y to double. int64 was giving error on calling internal func of matlab: 
    Error using  - 
    Integers can only be combined with integers of the same class, or
    scalar doubles.
%}
TrainingSet = double(featureMatrix);
Class = double(Y_transpose);

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
