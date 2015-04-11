%{
 Load the Data : 
    FeatureMatrix : 2000 x 2477 (of type int64)
    Y : 1 X 2000 (of type int64)
%}
load('/Users/Shubha/Learn/MovieReviewAnalysis/Output/FeatureMatrix.mat');
load('/Users/Shubha/Learn/MovieReviewAnalysis/Output/Y.mat');


%{
 Split Data to get Training and Test Set :
    trainingSet : 1600 x 2477
    trainingY : 1 x 1600

    testSet : 400 x 2477 (of type int64)
    testY : 1 x 400 (of type int64)
%}
num_points = size(FeatureMatrix,1);
split_point = round(num_points*0.8);
seq = randperm(num_points);
trainingSet = FeatureMatrix(seq(1:split_point),:);
trainingY = Y(seq(1:split_point));
testSet = FeatureMatrix(seq(split_point+1:end),:);
testY = Y(seq(split_point+1:end));


%{
 Training Data : 
    Training Set : 1600 x 2477 (of type int64)
    Training Y : 1600 x 1 (of type int64)

 Test Data : 
    Test Set : 400 x 2477 (of type int64)
    Test Y : 400 x 1 (of type int64)
%}


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

% Print the Actual class in a text file (just for viewing sake)
fid = fopen('/Users/Shubha/Learn/MovieReviewAnalysis/Output/ActualClass.txt', 'wt');
fprintf(fid,'%d\n',ActualClass);
fclose(fid);