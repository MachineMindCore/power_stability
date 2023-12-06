function [c, error] = t_convergence(system, interval, tol, max_steps)
%CONVERGENCE Summary of this function goes here
%   Detailed explanation goes here
arguments
    system (1,1) PowerSystem  
    interval (1,2) double
    tol (1,1) double = 0.05
    max_steps int16 = 100
end

a = interval(1);
b = interval(2);
fa = logic_function(a);
fb = logic_function(b);
l = abs(interval(2) - interval(1));

% Check convergence existence
if not(xor(fa, fb))
    disp("Interval must be oposite")
    c = nan;
    return
end

% Method
k = 1;
x_k = a;
d_x = l/2;
error = d_x/l;
state = fa;
direction = 1;

while error > tol & k <= max_steps
    x_k = x_k + direction*d_x;
    fx_k = logic_function(x_k);
    
    % Check state
    if fx_k ~= state
        state = fx_k;
        direction = -1 * direction;
        d_x = d_x/2;
        error = d_x/l;
    end
    k = k+1;
end

if error > tol
    c = nan;
    error = nan;
else
    c = x_k;
end
end