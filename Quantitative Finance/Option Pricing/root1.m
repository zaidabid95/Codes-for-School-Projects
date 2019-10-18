r = 0.03;
SDx = 0.06;
x0 = 100;
t = 1;
n = 10000;
N = 10000;
K = 100;

[V_Call V_Put V_DCall V_DPut V_FCall V_FPut V_LCall V_LPut] = option(r, SDx, x0, t, n, N, K);
