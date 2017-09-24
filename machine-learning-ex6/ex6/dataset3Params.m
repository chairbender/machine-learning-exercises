function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = .1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%{
C_params = [.01 .03 .1 .3 1 3 10 30];
sigma_params = [.01 .03 .1 .3 1 3 10 30];
C_best = 0;
sigma_best = 0;
error_best = 9999999;
for i = 1:size(C_params,2)
  for j = 1:size(sigma_params,2)
    %train
    model = svmTrain(X, y, C_params(i), @(x1, x2) gaussianKernel(x1, x2, sigma_params(j)));
    
    %calculate CV error
    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~= yval));
    if (error < error_best)
      error_best = error;
      C_best = C_params(i);
      sigma_best = sigma_params(j);
    endif
  end
end

C = C_best;
sigma = sigma_best;
%}
% =========================================================================

end
