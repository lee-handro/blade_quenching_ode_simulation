clc;
clear;
close all;

% 1. constants (with kelvin conversion)

T_init = 1000 + 273.15;   % 1000 C in Kelvin
T_env  = 20 + 273.15;     % 20 C in Kelvin
k      = 0.05;

% 2. the ode

my_ode = @(t, T) (-k) * (T - T_env);

% 3. computation

[time_steps, temp_steps] = ode45(my_ode, [0, 100], T_init);

% 4. plot

plot(time_steps, temp_steps);
xlabel('Time (seconds)');
ylabel('Temperature (Kelvin)');
title('Sword Cooling Down (Solved with ode45)');
grid on;
