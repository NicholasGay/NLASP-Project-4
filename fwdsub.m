function y = fwdsub(L,x)
%FWDSUB
%
% y = FWDSUB(L,x) calculates y = inv(L)*x for a lower triangular matrix L
% via forward-substitution

m = size(L,1);

% To make sure that y is a zero matrix of same type as x
y = x;
y(:) = 0;

%TODO