function cost = derivativeCFGD(X, y , theta)
  m = size(X,1);
  n = size(X,2);
  i = 1;
  cost = zeros(n,1);
  while i <= m
    h = hypothesisFunction(theta, X(i,:)');
    cost = cost + (h - y(i))*X(i,:)';
    i = i + 1;
  end
end
    
    
    