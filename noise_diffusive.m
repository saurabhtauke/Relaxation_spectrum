function [reg,corr] =  noise_diffusive(N,tau,lags)

%extract random numbers from 

 % STEP 1 : fitting with (1./(1+(t/tau)))*(sqrt(1./(1+(t/tau*k*k))))
 % STEP 2 : fitting with (1./(1+((t/tau)^alpha)))*(sqrt(1./(1+((t/tau*k*k)^alpha))))
 

    variance=1; 
    delta=1;

    g = delta/tau;
    s0 = variance;
    
    exp_g = exp(-g);
    one_exp_g =  1-exp_g;
    z_norm_factor = sqrt(1-exp(-2*g))/one_exp_g;
    
    randarray = normrnd(0,1,[1000000,1]);
    
%     randarray = 2.*(randarray - 0.5);
    
    reg = zeros(N,1);
    reg(1) = one_exp_g*randarray(1);
    
%     for i = 2 : N
%         reg(i) = exp_g*reg(i-1) + one_exp_g .* randarray(i);
%     end
%     
    for i = 2 : N
        reg(i) = one_exp_g .* randarray(i);
    end
    
      reg = reg.*z_norm_factor*s0;
   
%     reg
    corr = autocorr(reg,lags);
    
%     semilogx(corr)
end

