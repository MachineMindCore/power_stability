% Pre-requisitos
section_1

% Desarrollo Falla L5

L5 = [3, 5];


% Muestra de inestabilidad
system.solve_stability(5, 5, 10, L5, "Inestabilidad 3_L4")

% Tiempo critico

system.solve_stability(5, 2.4, 10, L5, "d(tc) 3_L5") % tc

system.solve_stability(5, 2.5, 10, L5, "d(tc+0.1) 3_L5") % tc + 0.1