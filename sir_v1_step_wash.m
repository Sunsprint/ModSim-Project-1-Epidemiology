function [s1_n, i1_n, r1_n] = sir_v1_step(s1, i1, r1, beta, gamma, wash)
% fcn_step Advance an SIR model one timestep
%
% Usage
%   [s_n, i_n, r_n] = fcn_step(s, i, r, beta, gamma)
% 
% Arguments
%   s1 = current number of susceptible individuals (v1 virus)
%   i1 = current number of infected individuals (v1 virus)
%   r1 = current number of recovered individuals (v1 virus)
%
%   beta = infection rate (v1) parameter
%   gamma = recovery rate (v1) paramter
% 
% Returns
%   s1_n = next number of susceptible individuals (v1)
%   i1_n = next number of infected individuals (v1)
%   r1_n = next number of recovered individuals (v1)

% compute new infections and recoveries
susWash = round(s1*wash); %number of susceptible people washing hands
susNoWash = s1 - susWash; %number of susceptible people not washing hands
betaW = beta*.84; %washing hands decreases risk of infection by 16%

infectW = round(betaW * i1 * susWash, 0); %amount of new infections amongst people wearing washing hands
infectN = round(beta * i1 * susNoWash, 0);
infected1 = infectW + infectN;
recovered1 = round(gamma * i1, 0);

% Update state
s1_n = s1 - infected1;
i1_n = i1 + infected1 - recovered1;
r1_n = r1 + recovered1;

% Enforce invariants; necessary since we're doing a discrete approx.
s1_n = max(s1_n, 0);
i1_n = max(i1_n, 0);
r1_n = max(r1_n, 0);
    
end