%First linear regression method with gradient decent, that's means no iterative.
% and no need to calculate cost function 

%First we need the features information 
F = input('input the features matrix X: ');
%Input the real labels that means the y's
y = input('input the real values y: ');

%here we add the ones in the first column as the matrix above, where there are m
% experiments and (n) features so adding the one column X(m, n+1)

%1 x(1,1) x(1,2) x(1,3) .... x(1,n)
%1 x(2,1) x(2,2) ........... x(2,n)
%..................................
%1 x(m,1) x(m,2) ........... x(m,n)

% numbers of experiments
m = size(F,1);
% adding the ones to the matrix features as I explained
X =[ones(1,m)' F];

%get the max value of the matrix of features
max_value = max(max(X));
%get the min value of the matrix of features
min_value = min(min(X));

%value of x that we are going to plot 
x_points = [min_value:0.001:max_value]';

%Applying liear regression to X and y data, and calculate the theta that best
%fit the line h(theta) = theta'*X
[J theta] = gradientDecent(X, y, 0.1);

%line that best fit but this is just for one feature
y_points = theta(1) + theta(2)*x_points;

%plot the points of the data set
subplot(2,1,1);
scatter(F, y);
hold on;
%plot the fit line
plot(x_points, y_points);
hold off;

%convergence of the method
subplot(2,1,2);
plot([1:1:length(J)],J);



