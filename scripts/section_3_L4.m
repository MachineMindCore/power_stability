% Pre-requisitos
section_1

% Desarrollo Falla L4

L4 = [4, 5];

% Muestra de inestabilidad
system.solve_stability(5, 5, 10, L4, "Inestabilidad 3_L4")

% Tiempo critico

system.solve_stability(5, 2.3, 10, L4, "d(tc) 3_L4") % tc

system.solve_stability(5, 2.4, 10, L4, "d(tc+0.1) 3_L4") % tc + 0.1
