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
