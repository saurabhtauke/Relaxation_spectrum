function [reg,corr,arr] =  noise_exponential(N,tau,lags)

    
    variance=1; 
    delta=1;

    g = delta/tau;
    s0 = variance;
    
    exp_g = exp(-g);
    dist_factor = 1 - exp_g;
%     z_norm_factor = sqrt(1-exp(-2*g))/dist_factor;
    
      randarray = normrnd(0,1,[1000000,1]);
%     randarray = 2.*(randarray - 0.5);
    
    arr = randarray;
    
    reg = zeros(N,1);
%     reg(1) = dist_factor*randarray(1);
      reg(1) = randarray(1);
    
%     for i = 2 : N
%         reg(i) = exp_g*reg(i-1) + dist_factor .* randarray(i);
%     end

for i = 2 : N
        reg(i) = sqrt(g)*reg(i-1)  + randarray(i);
end
    

%     reg = reg.*z_norm_factor*s0;
   
%     reg
    corr = autocorr(reg,lags);
    
%     semilogx(corr)
end

