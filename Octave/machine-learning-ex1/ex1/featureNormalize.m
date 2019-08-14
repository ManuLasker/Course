function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       
%calculate the mean of the columns and return a vector 
mu = mean(X, 1);
%we repeat the rows to fill the matrix, in order to make pointwise substraction and divition
temp_mu = repmat(mu, size(X,1), 1);

%calculate the standard deviation of the columns and return a vector
sigma = std(X, 1);
%we repeat the rows to fill the matrix, in order to make pointwise substraction and divition
temp_sigma = repmat(sigma, size(X,1), 1);

%return the normalization features
X_norm = (X - temp_mu)./temp_sigma;







% ============================================================

end
