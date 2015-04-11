function [ accuracy ] = GetAccuracy( ActualY, PredictedY )
%{
    GetAccuracy: 
        Computes the accuracy of the classifier whose Predicted Class
        vector is received as an argument using confusion matrix.
    Confusion Matrix : http://in.mathworks.com/help/stats/confusionmat.html
%}
confusion_matrix = confusionmat(ActualY, PredictedY);
disp(confusion_matrix)
accuracy = 100*sum(diag(confusion_matrix))./sum(confusion_matrix(:));
end

