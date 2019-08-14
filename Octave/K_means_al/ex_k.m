clear all; close all; clc;

%load data
load('ex6data1.mat');

%number of features
n = size(X,2);

%trainig examples
m = size(X,1);

%initialize in zeros the label
y = ones(51,1);
plotData(X,y);
hold on;
%only two cluster
K = 2;

%First we want to initialize K random centroids mu1,mu2,..., muk
%each centroid is in the rows 
mu = rand(2,2);
plot(mu(:,1), mu(:,2), 'rx', 'MarkerSize',8);
hold off;
%%K Means Algorithm
cluster1 = [];
cluster2 = [];
cont1 = 1;
cont2 = 1;
for i = 1:100
  for i = 1: m
    if norm(X(i,:) - mu(1,:))^2 <= norm(X(i,:) - mu(2,:))^2
      y(i) = 1;
      cluster1(cont1,[1 2]) = X(i,:); 
      cont1++;
    else
      y(i) = 2;
      cluster2(cont2,[1 2]) = X(i,:);
      cont2++;
    end 
  end
  %disp(cluster1);
  %disp(cluster2);
  
  
  mean1 = mean(cluster1,1);
 
  
  mean2 = mean(cluster2,1);

  
  mu = [mean1; mean2];
  
  
  % Pause with quit option
 
end
plot(mu(:,1), mu(:,2), 'rx', 'MarkerSize',8);
hold on;
plotData(X,y);