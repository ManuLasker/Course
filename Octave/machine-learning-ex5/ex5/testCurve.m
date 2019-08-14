function [lambda_vec, error_train, error_test] = ...
    testCurve(X, y, Xtest, ytest)

%

% Selected values of lambda (you should not change this)
lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';

% You need to return these variables correctly.
error_train = zeros(length(lambda_vec), 1);
error_test = zeros(length(lambda_vec), 1);


%
for i = 1: length(lambda_vec)
  lambda = lambda_vec(i);
  
  theta_i = trainLinearReg(X, y, lambda);
  
  error_train(i) = linearRegCostFunction(X, y, theta_i, 0);
  
  error_test(i) = linearRegCostFunction(Xtest, ytest, theta_i, 0);
end

end