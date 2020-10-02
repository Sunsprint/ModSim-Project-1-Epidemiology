function [S2, I2, R2, W] = sir_v2_simulate(s2_0, i2_0, r2_0, delta, epsilon, num_steps, m, s2_m, i2_m, r2_m)
% fcn_simulate Simulate the SIR model
% Arguments
%
%   s2_0 = initial number of susceptible individuals (v2) (none since it
%   doesn't exist yet)
%   i2_0 = initial number of infected individuals(v2)(none since it
%   doesn't exist yet)
%   r2_0 = initial number of recovered individuals(v2)(none since it
%   doesn't exist yet)
%   
%   s2_m = number of susceptible individuals once the virus mutates(v2)
%   i2_m = number of infected individuals once the virus mutates(v2)
%   r2_m = number of recovered individuals once the virus mutates(v2)
%
%   delta = infection rate (v2) parameter
%   epsilon = recovery rate (v2) parameter
%
%   num_steps = number of simulation steps to simulate (how many weeks to
%   model)
%
%   m = number of weeks it takes until v1 mutates into v2
%
% Returns
%   S2 = simulation history of susceptible individuals (version 2); vector
%   I2 = simulation history of infected individuals (version 2); vector
%   R2 = simulation history of recovered individuals (version 2); vector
%   W = simulation week; vector

% Setup
S2 = zeros(1, num_steps);
I2 = zeros(1, num_steps);
R2 = zeros(1, num_steps);
W = 1 : num_steps;

%s2 = s2_0;
%s2 = s2_m; 

% Store initial values
%S2(1) = s2;
%I2(1) = i2;
%R2(1) = r2;
S2(1) = s2_0;
I2(1) = i2_0;
R2(1) = r2_0;

% number of susceptible individuals at time of initial mutation is the # of people recovered from v1 + the # of people susceptible to v1 
% NOTE: This assumes people infected with v1 can become infected with v2(no one is safe)
s2 = s2_m
i2 = i2_m
r2 = r2_m


% Run simulation
for step = m : num_steps
    [s2, i2, r2] = sir_v2_step(s2, i2, r2, delta, epsilon);
    S2(step) = s2;
    I2(step) = i2;
    R2(step) = r2;
end

end
