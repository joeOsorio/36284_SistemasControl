close all, clc, clear
%% PARTE I
%Inciso a)

num = [1, 0, 2, 5];

den = [3 5 2 1];

G = tf(num, den);

%Inciso b)

z = roots(num);

p = roots(den);

k = 1/3;

G1 = zpk(z, p, k);

%Inciso c)

[Z, P, K] = tf2zp(num, den);
G2 = zpk(Z, P, K);

[NUM, DEN] = zp2tf(Z, P, K);
G3 = tf(3*NUM, 3*DEN);

%Inciso d)
%impulse(G3);
%figure;
%step(G3);

%%PARTE II

num1 = [1];
den1 = [1 10];
B1 = tf(num1, den1);

num2 = [1];
den2 = [1 1];
B2 = tf(num2, den2);

num3 = [1];
den3 = [1 4 4];
B3 = tf(num3, den3);

num4 = [1, 1];
den4 = [1 2];
B4 = tf(num4, den4);

num5 = [2];
den5 = [1];
B5 = tf(num5, den5);

G1 = feedback(B1, B5, -1);
G2 = series(G1, B2);
G3 = parallel(G2, B4);
G4 = feedback(G3, 1, -1)

impulse(G4)
figure
step(G4)
figure
t = linspace(0, 100, 200);
u = t;
lsim(G4, u, t)







