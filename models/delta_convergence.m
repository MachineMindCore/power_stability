function result = delta_convergence(t, delta, tc, threshold)
%DIVERGENCE Summary of this function goes here
%   Detailed explanation goes here
arguments
    t (:,1) double
    delta (:,1) double
    tc (1,1) double
    threshold (1,1) double = 0.7
end



% Cut
t_cut = t(t >= tc);
delta_cut = delta(t >= tc);

% Polyfit
fit_params = polyfit(t_cut, delta_cut, 2);
delta_hat = polyval(fit_params, t_cut);

r_2 = 1 - sum((delta_cut - delta_hat).^2) / sum((delta_cut - mean(delta_cut)).^2);

% Conditions
result = true;
in_range = all(delta_cut > -180 & delta_cut < 180);
is_parabolic = r_2 > threshold;

if ~in_range | is_parabolic
    result = false;
    return
end

end

