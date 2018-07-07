
m = 10;
T = 1000; %Number of time instants

h = single(sqrt(0.5)*(randn(m,1) + 1i*randn(m,1))); % channel

% Due to numerical errors the diagonal entries of h*h' include a small 
% imaginary part. The two following lines remove this imaginary part.
A = h*h';
A = A -diag(diag(A)) + real(diag(diag(A)));

alpha = single(0.99);
Ps = 10.^(0.1*(40:2:56)); % power range

% results of the simulations
conds = zeros(length(Ps),1);
MSE1 = zeros(length(Ps),1);
MSE2 = zeros(length(Ps),1);

for iP = 1:length(Ps)
    
    P = single(Ps(iP));
    
    % initialize with correct values for steady state analysis
    C = single(eye(m) + P*double(A));
    L = single(chol(eye(m) + P*double(A),'lower')); 
    
    for t=1:T
        % generate received signal
        s = single(sqrt(0.5)*(randn(1) + 1i*randn(1)));
        w = single(sqrt(0.5)*(randn(m,1) + 1i*randn(m,1)));
        y = single(sqrt(P)*h*s + w);
        
        % update the covariance matrix estimate
        C = alpha*C + (1-alpha)*(y*y');
        
        
        % TODO: calculate LMMSE filter using the estimate C, mychol, backsub 
        %       and fwdsub (4.4)
        % TODO: calculate shat (4.4)
        
        % update average error
        MSE1(iP) = MSE1(iP) + 1/T*abs(s-shat)^2;
        
        
        % TODO: directly update the lower triangular matrix L (4.10)
        % TODO: Use L to calculate the LMMSE filter (4.13)
        % TODO: Calculate shat and update MSE for second method (4.14)
        
    end
    
    % TODO: (4.1)
    
end

%TODO: plot condition numbers of final estimates C w.r.t. P (4.1)
figure


xlabel 'P (dB)'
ylabel 'Condition number of C[T]'
grid on

%TODO: plot MSE1 as a function of P (4.5)
figure

xlabel 'P (dB)'
ylabel 'MSE'
grid on

%TODO: plot MSE1 and MSE2 as a function of P (4.14)
figure

hold on

xlabel 'P (dB)'
legend('MSE1','MSE2')
ylabel 'MSE'
grid on