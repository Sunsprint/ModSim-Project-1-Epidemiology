% Wave 1 - Mutagen v.1
% Defines Rates of Transfer (Flows)
beta = 1/90; % Infection Rate
gamma = 1/2; % Recovery rate in 1/weeks
masks = 1/10;
wash = 1/10;

% Vaccination Setup
vaccine = 50/100;
dose = 5/100;

i_0 = 2; % Number of initial infections

population = 100;
s_0 = population - i_0;
r_0 = 0; 

num_steps = 40; % Number of Days Simulated

[S,I,R,W]=sir_v1_simulate(s_0, i_0, r_0, beta, gamma, num_steps);

figure(1); clf; hold on;
plot(W,I,'k-'); label1 = "None";

[S,I,R,W]=sir_v1_simulate_mask(s_0, i_0, r_0, beta, gamma, num_steps, masks);

plot(W,I,'s-'); label2 = "Masks - 10%";

[S,I,R,W]=sir_v1_simulate_wash(s_0, i_0, r_0, beta, gamma, num_steps, wash);

plot(W,I,'o-'); label3 = "Wash - 10%";

[S,I,R,W]=sir_v1_simulate_vax(s_0, i_0, r_0, beta, gamma, num_steps, vaccine, dose);

plot(W,I,'*-'); label4 = "Vaccination";


xlabel("Weeks")
ylabel("Infected Persons")
legend({label1, label2, label3, label4})
title("Comparison")