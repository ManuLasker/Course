function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.

y_temp = zeros(size(y,1),num_labels);
I = eye(num_labels);

%Recode y, in the form that if y were 1,2,..10 for the purpose of the training a neural
%network, we need the labes as vectors containing only values 0 or 1 so that
% y=[0 0 1] that means the number was 3.
y_temp = I(:,y)';

%calculate the hypoteshis
%save a1 without the ones in the column
temp_a1 = X;
a1 = [ones(size(X),1) temp_a1];
z2 = a1*Theta1';

%save a2 without the ones in the firs column
temp_a2 = sigmoid(z2);
a2 =[ones(size(z2),1) temp_a2];
z3 = a2*Theta2';
a3 = sigmoid(z3);

%Backward propagation calculate the deltas
d3 = a3 - y_temp;

%save theta2 without the bias column
temp_Theta2 = Theta2;
temp_Theta2(:,1) = [];

%calculate the second deltas
d2 = (d3*temp_Theta2).*temp_a2.*(1-temp_a2);

%computing gradients
Theta2_grad = Theta2_grad + d3'*a2;
Theta1_grad = Theta1_grad + d2'*a1;

%Here calculate the cost function without regularization
J = sum(sum(-y_temp.*log(a3)-(1-y_temp).*log(1-a3)));

#{
for i=1:m
  %calculate the hypoteshis for each sample
  
  %save a1 without the ones in the column
  temp_a1 = X(i,:);
  a1 = [ones(size(X(i,:)),1) temp_a1];
  z2 = a1*Theta1' ;
  
  %save a2 without the ones in the firs column
  temp_a2 = sigmoid(z2);
  a2 =[ones(size(z2),1) temp_a2];
  z3 = a2*Theta2';
  a3 = sigmoid(z3);
  
  %disp(size(a1))
  %disp(size(a2))
  %disp(size(a3))
  %disp(size(y_temp(i,:)))
  
  %Backward propagation calculate the deltas
  d3 = a3 - y_temp(i,:);
  
  %disp(size(d3))
  
  %save theta2 without the bias column
  temp_Theta2 = Theta2;
  temp_Theta2(:,1) = [];
  
  %disp(size(temp_Theta2));
  %calculate the second deltas
  d2 = (d3*temp_Theta2).*temp_a2.*(1-temp_a2);

  %disp(size(d2))
  
  %computing gradients
  Theta2_grad = Theta2_grad + d3'*a2;
  Theta1_grad = Theta1_grad + d2'*a1;
  
  %Here calculate the cost function without regularization
  J = J + sum(-y_temp(i,:).*log(a3)-(1-y_temp(i,:)).*log(1-a3));
endfor
#}
%whitout regularization
Theta1_grad = 1/m * Theta1_grad;
Theta2_grad = 1/m * Theta2_grad;
%%If it is regularized nn jump into this code here
if lambda != 0
  %dont regularize the bias information
  Theta1(:,1) = 0;
  Theta2(:,1) = 0;
  %here we shrink the thetas
  reg_temp = sum(sum(Theta1.^2)) + sum(sum(Theta2.^2));
  J = J + lambda/2 * reg_temp;
  Theta1_grad = Theta1_grad + lambda/m *Theta1;
  Theta2_grad = Theta2_grad + lambda/m *Theta2;
  
end

J = J/m;


% roll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];











% -------------------------------------------------------------

% =========================================================================




end
