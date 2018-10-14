%% Generating Corelated noise at given correlation times.

N = 1000000;
lags  =1000;

taus = [20,50];
n_series = length(taus);

m_exnoise = zeros(N,n_series);
m_corr    = zeros(lags+1,n_series);

for i = 1 : n_series
    [m_exnoise(:,i),m_corr(:,i)] = noise_exponential(N,taus(i),lags);
     
end

m_tot   = mean(m_exnoise,2);
m_corr_tot = autocorr(m_tot,lags);

semilogx (m_corr(:,1));
hold on 

for i = 2:n_series
    semilogx(m_corr(:,i))
end

semilogx(m_corr_tot)
hold off

%% fitting

% m_corr_fit = zeros(lags+1,n_series);
% 
% g = fittype('a*exp')

%draw fit
%calculate R-square
%minimization

