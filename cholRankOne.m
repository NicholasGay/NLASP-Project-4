function Lr = cholRankOne(L,x)
%CHOLRANKONE
%
% Lr = CHOLRANKONE(L,x) given a lower-triangular L and a vector x returns a
% quadratic lower-triangular Lr such that
% Lr*Lr^He = L*L^He + x*x^He

m = size(L,2);

Lr = [x L];

for i=1:m
    %TODO
end

Lr = tril(Lr(:,1:m));