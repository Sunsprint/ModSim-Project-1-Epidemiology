
% Wave 1 - Mutagen v.1
% Defines Rates of Transfer (Flows)
beta = 1/90; % Infection Rate
gamma = 1/2; % Recovery rate in 1/weeks

i_0 = 2; % Number of initial infections

population = 100;
s_0 = population - i_0;
r_0 = 0; 

num_steps = 40; % Number of Days Simulated

[S,I,R,W]=sir_v1_simulate(s_0, i_0, r_0, beta, gamma, num_steps);

figure(1); clf; hold on;
plot(W,I,'k-'); label1 = "Wave 1";

% Wave 2 - Mutagen v.2

num_steps = 40;

% Defines Rates of Transfer (Flows)
delta = 1/90; % Infection Rate
epsilon = 1/4; % Recovery rate in 1/weeks

i2_0 = 0; % Number of initial infections
s2_0 = 0;
r2_0 = 0; 

m = 10; % Number of Days Simulated

s2_m = 99; %number of susceptible individuals once the virus mutates (v2)
i2_m = 1;  %number of infected individuals once the virus mutates(v2)
r2_m = 0;  %number of recovered individuals once the virus mutates(v2)

[S2,I2,R2,W]=sir_v2_simulate(s2_0, i2_0, r2_0, delta, epsilon, num_steps, m, s2_m, i2_m, r2_m);

plot(W,I2,'o-'); label2 = "Wave 2";
