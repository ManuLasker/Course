function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;
% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
%find return the postition where y is equal to one or zero, i.e: y = [ 1 1 3 1], find(y)=[1 2 4]
pos = find(y==1); neg = find(y == 0);

% plot examples
plot(X(pos,1), X(pos,2), 'k+', 'LineWidth', 1, 'MarkerSize', 4);
plot(X(neg,1), X(neg,2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 4);



% =========================================================================



hold off;

end
