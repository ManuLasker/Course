function cost = costFunction(X, y, theta)
  m = size(X,1);
  predictions = X*theta;
  
  cost = norm(predictions - y)^2/(2*m);  
end