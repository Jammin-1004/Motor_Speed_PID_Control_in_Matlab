clc;
clear all;
close all;

% Parameter
Jm = 1.13e-2;
b = 0.028;
La = 0.1;
Ra = 0.45;
Kt = 0.067;
Ke = 0.067;

% Gain
Kp = 3.5;
Ki = 10.5;
Kd = 0.8; %0.8

% P, PI, PID
P = Kp;
PI = Kp + Ki/tf('s');
PID = Kp + Ki/tf('s') + Kd*tf('s');

% Model
D = tf(Kt, [Jm*La, Jm*Ra + b*La, b*Ra + Kt*Ke]);

% Transfer function
P_Series = D * P;
PI_Series = D * PI;
PID_Series = D * PID;

% Closed-loop transfer functions
P_Control = feedback(P_Series, 1);
PI_Control = feedback(PI_Series, 1);
PID_Control = feedback(PID_Series, 1);

t = 0:0.01:10;

[yP, tP] = step(P_Control, t);
[yPI, tPI] = step(PI_Control, t);
[yPID, tPID] = step(PID_Control, t);

% Response Map
figure;
pzmap(P_Control)
title('Pole-Zero Map with P Controller')
grid on
figure;
pzmap(PI_Control)
title('Pole-Zero Map with PI Controller')
grid on
figure;
pzmap(PID_Control)
title('Pole-Zero Map with PID Controller')
grid on

% Response Map
figure;
plot(tP, yP, 'r', 'LineWidth', 1.5); 
hold on;
plot(tPI, yPI, 'g', 'LineWidth', 1.5);
plot(tPID, yPID, 'b', 'LineWidth', 1.5);
hold off;
title('Response of P, PI, and PID control to a reference step')
ylabel('Angular Velocity [rad/s]')
xlabel('Time [s]')
legend('P Control', 'PI Control', 'PID Control')
grid on