function [s2_n, i2_n, r2_n] = sir_v2_step_vax(s2, i2, r2, delta, epsilon, vaccine2, dose2)
% fcn_step Advance an SIR model one timestep
%
% Usage
%   [s2_n, i2_n, r2_n] = fcn_step(s2, i2, r2, delta, epsilon)
% 
% Arguments
%   s2 = current number of susceptible individuals (v2 virus)
%   i2 = current number of infected individuals (v2 virus)
%   r2 = current number of recovered individuals (v2 virus)
%
%   delta = infection rate (v2) parameter
%   epsilon = recovery rate (v2) parameter
% 
% Returns
%   s2_n = next number of susceptible individuals (v2)
%   i2_n = next number of infected individuals (v2)
%   r2_n = next number of recovered individuals (v2)

% compute new infections and recoveries
infected2 = round(delta * i2 * s2, 0); %infected stock = infection rate * current # of infected people * current # of susceptible people
recovered2 = round(epsilon * i2, 0); %recovered stock = recovery rate * current # of infected people
recoveredVax2 = round(dose2 * vaccine2 * s2);

% Update state
s2_n = s2 - infected2 - recoveredVax2;
i2_n = i2 + infected2 - recovered2;
r2_n = r2 + recovered2 + recoveredVax2;

% Enforce invariants; necessary since we're doing a discrete approx.
s2_n = max(s2_n, 0);
i2_n = max(i2_n, 0);
r2_n = max(r2_n, 0);
    
end