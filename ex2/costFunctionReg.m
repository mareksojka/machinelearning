function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
z=theta'*X'
h=(1+exp(-z)).^(-1);
logh=log(h);
log1h=log(1-h);
lambda2m=(lambda/(2*m))*sum(theta(2:size(theta,1)).^2);
J=1/m*(sum(-1*(y.*logh')-(1-y).*log1h'))+lambda2m;
grad(1)=1/m*(sum((h'-y)'*X(:,1)));
for n=2:size(X,2);
    grad(n)=1/m*(sum((h'-y)'*X(:,n)))+theta(n)*lambda/m;
end






% =============================================================

end
