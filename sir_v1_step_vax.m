function [s1_n, i1_n, r1_n] = sir_v1_step_vax(s1, i1, r1, beta, gamma, vaccine, dose)
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
infected1 = round(beta * i1 * s1, 0);
%disp(["infected1 is:", infected1])
recovered1 = round(gamma * i1, 0);
recoveredVax = round(dose*vaccine*s1);

% Update state
s1_n = s1 - infected1 - recoveredVax;
i1_n = i1 + infected1 - recovered1;
r1_n = r1 + recovered1 + recoveredVax;

% Enforce invariants; necessary since we're doing a discrete approx.
s1_n = max(s1_n, 0);
i1_n = max(i1_n, 0);
r1_n = max(r1_n, 0);
    
end