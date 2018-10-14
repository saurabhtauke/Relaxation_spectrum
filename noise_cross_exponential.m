function [a, randarray] = noise_cross_exponential(N,tau)

variance = 1;
deltat = 1;

g = deltat/tau;
s0 = variance;

exp_g = exp(-g);

one_exp_g = 1 - exp_g;
z_norm_factor = sqrt(1 - exp(-2 * g)) / one_exp_g;

% create random number array
% generates random numbers in interval [0,1)
randarray = rand(N,1);

% make numbers random in interval [-1,1)
randarray = 2 * (randarray - 0.5);

% simulate exponential random behavior
a = zeros(N);
a(1) = one_exp_g * randarray(1);

b = zeros(N);
b(1) = one_exp_g * randarray(1);
% slow
% for i in np.arange(N-1)+1:
    %    for j in np.arange(i-1):
        %        a[i] += exp_g**j*randarray[i-j]
        %    a[i] += one_exp_g*randarray[i]
        % faster
        j = 1:N+5;
        for i = 2 : N
            a(i) = a(i) + sum(exp_g.^j(2:i + 1) .* fliplr(randarray(2:i + 1)));
            a(i) = a(i)+ one_exp_g * randarray(i);
        end 
        
            a = a.*z_norm_factor * s0;
            randarray = randarray * z_norm_factor * s0;
            
           a
           randarray
          
end