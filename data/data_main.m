% Factor de grupo
g_factor = 0.95;

%--- Lineas ---%

X_1 = 0.005;
X_2 = 0.1;
X_3 = 0.1;
X_4 = 0.025;
X_5 = 0.025;
X_6 = 0.05;

%--- Generadores ---%

% Gen_1
Xdp_1 = 0.2;
H_1 = 25;

% Gen_2
Xdp_2 = 0.1;
H_2 = 6;

% Gen_3
Xdp_3 = 0.1;
H_3 = 3;

%--- Cargas ---%
P_3 = 3; 
Q_3 = 2;

P_4 = 2; 
Q_4 = 0.9;

P_5 = 1; 
Q_5 = 0.3;

S_3 = P_3 + 1j*Q_3;
S_4 = P_4 + 1j*Q_4;
S_5 = P_5 + 1j*Q_5;

P_g = (P_3 + P_4 + P_5)/3;
Q_g = (Q_3 + Q_4 + Q_5)/3 + 0.75;

%---------------------------------------------------------%
% Multiplicacion de factor

X_1 = X_1 * g_factor;
X_3 = X_3 * g_factor;
S_3 = S_3 * g_factor;
S_4 = S_4 * g_factor;
S_5 = S_5 * g_factor;
H_3 = H_3 * g_factor;

%---------------------------------------------------------%


%--- Datos estructurales ---%

basemva = 100;  accuracy = 0.0001;  maxiter = 10;

% busdata -> [Bus code |V| θ Load_MW Load_MVAR Gen_MW Gen_MVAR Gen_min
% Gen_max Shunt_MVAR]
busdata = [
    1, 1, 1.05, 0, 0.0, 0.0, 0.0, 0.0, 0, 0.0, 0;
    2, 2, 1.05, 0, 0.0, 0.0, P_g, Q_g, 0, 100, 0; 
    3, 0, 1.00, 0, P_3, Q_3, 0.0, 0.0, 0, 0.0, 0;
    4, 0, 1.00, 0, P_4, Q_4, 0.0, 0.0, 0, 0.0, 0;
    5, 0, 1.00, 0, P_5, Q_5, 0.0, 0.0, 0, 0.0, 0;
    6, 2, 1.05, 0, 0.0, 0.0, P_g, Q_g, 0, 100, 0;
];

linedata = [
    1, 2, 0, X_1, 0, 1;
    2, 4, 0, X_2, 0, 1;
    1, 3, 0, X_3, 0, 1;
    4, 5, 0, X_4, 0, 1;
    3, 5, 0, X_5, 0, 1;
    5, 6, 0, X_6, 0, 1;
];

gendata = [
    1, 0, Xdp_1, H_1;
    2, 0, Xdp_2, H_2;
    6, 0, Xdp_3, H_3;
];
