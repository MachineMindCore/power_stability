% Pre-requisitos
section_1

% Desarrollo falla L6

L6 = [5, 6];

% Muestra de inestabilidad
system.solve_stability(5, 5, 10, L6, "Inestabilidad 3_L6")

% Tiempo critico (inestable)

system.solve_stability(5, 0.000001, 10, L6, "d(0) 3_L6") % tc
