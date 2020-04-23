function [C, sigma] = dataset3parameterss(X, y, Xval, yval)
%DATASET3parametersS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameterseters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3parametersS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameterseters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

paramaters = [0.01 0.03 0.1 0.3 1 3 10 30];

minerror = 1;

for i=1:8,
    for j=1:8,
        ctest = paramaters(i);
        sigma_test = paramaters(j);
        model = svmTrain(X, y, ctest, @(x1, x2) gaussianKernel(x1, x2, sigma_test));
        predictions = svmPredict(model, Xval);
        err = mean(double(predictions ~= yval));
        if err < minerror,
            C = ctest;
            sigma = sigma_test;
            minerror = err;
        end
    end
end

% =========================================================================

end
