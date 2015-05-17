%{
    Using FeedForward Neural Network for classification
    Here every column represents a review.
%}
NNTrainingSet = double(TrainingSet.');
NNTrainingY = double(TrainingY.');
NNTestSet = double(TestSet.');

%neuralNetwork = newpr(NNTrainingSet, NNTrainingY, 2);
%neuralNetwork.divideFcn = '';

%neuralNetwork = init(neuralNetwork);

%{
    We have 1 hidden layer with 5 neurons and using "logsig" func
    for the 1st layer. Used so that the output lie in [0, 1]
    In the layer 2 default func "trainlm" will be used
%}
neuralNetwork = feedforwardnet([3,1]);
neuralNetwork.layers{1}.transferFcn = 'logsig';
neuralNetwork.layers{2}.transferFcn = 'purelin';
neuralNetwork = train(neuralNetwork, NNTrainingSet, NNTrainingY);

% We need discrete classification into 0 or 1 so round off
PredictedClassNN = round(sim(neuralNetwork, NNTestSet));
PredictedClassNN = PredictedClassNN.';

% Print the Predicted Class into a text file
fid = fopen('/Users/Shubha/Learn/MovieReviewAnalysis/Output/PredictedClassNN.txt', 'wt');
fprintf(fid,'%d\n',PredictedClassNN);
fclose(fid);

% Calculate the accuracy 
accuracyNN = GetAccuracy(ActualClass, PredictedClassNN);
fprintf('Neural Network Classifier Accuracy : %.2f%%\n', accuracyNN);
