function  [J theta]=gradientDecent(X, y, alpha)
  theta = zeros(size(X,2),1);
  m = size(X,1);
  error = costFunction(X,y,theta);
  iter = 1;
  while error > 10^(-8)
    theta = theta - alpha*1/m*derivativeCFGD(X, y, theta);
    J(iter) = error;
    error = costFunction(X,y,theta);
    iter ++;
  end
end
  