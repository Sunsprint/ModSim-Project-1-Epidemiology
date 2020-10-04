function [S1, I1, R1, W] = sir_v1_simulate(s1_0, i1_0, r1_0, beta, gamma, num_steps, wash)
% fcn_simulate Simulate the SIR model
% Arguments
%   s1_0 = initial number of susceptible individuals (v1)
%   i1_0 = initial number of infected individuals (v1)
%   r1_0 = initial number of recovered individuals (v1)
%
%   beta = infection rate parameter (v1)
%   gamma = recovery rate paramter (v1)
%   masks = proportion of population wearing masks
%   NOTE: mask wearing decreases risk of infection to person wearing mask by 65%
%   num_steps = number of simulation steps to simulate (how many weeks)
%
% Returns
%   S2 = simulation history of susceptible individuals (version 1); vector
%   I2 = simulation history of infected individuals (version 1); vector
%   R2 = simulation history of recovered individuals (version 1); vector
%   W = simulation week; vector

% Setup
S1 = zeros(1, num_steps);
I1 = zeros(1, num_steps);
R1 = zeros(1, num_steps);
W = 1 : num_steps;

s1 = s1_0;
i1 = i1_0;
r1 = r1_0;

% Store initial values
S1(1) = s1;
I1(1) = i1;
R1(1) = r1;

% Run simulation
for step = 2 : num_steps
    [s1, i1, r1] = sir_v1_step(s1, i1, r1, beta, gamma, wash);
    S1(step) = s1;
    I1(step) = i1;
    R1(step) = r1;
end

end
