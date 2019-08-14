function [error_train, error_val] = ...
    learningCurveRandom(X, y, Xval, yval, lambda)


% Number of training examples
m = size(X, 1);

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);


%

% ---------------------- Sample Solution ----------------------

for i=1:m
  %get theta with i training examples
  idx = randperm(i);
  X_temp = X(1:i,:);
  y_temp = y(1:i);
  
  idx_val = randperm(size(Xval,1));
  Xval = Xval(idx_val,:);
  yval = yval(idx_val,:);
  theta_i = trainLinearReg(X_temp(idx,:), y_temp(idx), lambda);
  
  %calculate the error for the i examples
  error_train(i) = linearRegCostFunction(X_temp(idx,:), y_temp(idx), theta_i, 0);
  
  %calculate the error for the cross validation
  error_val(i) = linearRegCostFunction(Xval, yval, theta_i, 0);
end





% -------------------------------------------------------------

% =========================================================================

end
