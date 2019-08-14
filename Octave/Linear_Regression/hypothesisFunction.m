function h = hypothesisFunction(theta, x_sample)
  %this hypothesis function returns the aproximation of just one experiment
  %to return the aproximation of all experiments h = X*theta where X is
  %the amount of samples
  h = theta'*x_sample;
end