function y = backsub(R,x)
%BACKSUB
%
% y = BACKSUB(R,x) calculates y = inv(R)*x for an upper triangular matrix R
% via backsubstitution

m = size(R,1);

% To make sure y is a zero matrix of same type as x
y = x;
y(:) = 0;

%TODO (use code from Project 2)