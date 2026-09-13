clc;
clear;


% 1. Constants


T_init = 1000 + 273.15;   % 1000 C in Kelvin
T_env  = 20 + 273.15;     % 20 C in Kelvin
m      = 1.5;             % mass
A      = 0.08;            % surface area
c      = 460;             % specific heat of steel
ems    = 0.8;             % emissivity
sbc    = 5.67e-8;         % Stefan-Boltzmann constant

%heat transfer coefficients

h_air  = 25;
h_oil  = 300;
h_water = 2000;

% 2. the ode's

ode_air = @(t,T) -(((h_air * A) / (m * c)) * (T - T_env)) - ((( ems * sbc * A ) / ( m * c )) * ( T^4 - T_env^4));
ode_water = @(t,T) -(((h_water * A) / (m * c)) * (T - T_env)) - ((( ems * sbc * A ) / ( m * c )) * ( T^4 - T_env^4));
ode_oil = @(t,T) -(((h_oil * A) / (m * c)) * (T - T_env)) - ((( ems * sbc * A ) / ( m * c )) * ( T^4 - T_env^4));


% 3. computation of ode's

[time_steps_air , temp_steps_air] = ode45(ode_air, [0;100], T_init);
[time_steps_water, temp_steps_water] = ode45(ode_water, [0;100], T_init);
[time_steps_oil, temp_steps_oil] = ode45(ode_oil,[0;100],T_init);

% 4. plotting of the ode's

plot (time_steps_air,temp_steps_air);
hold on;
plot (time_steps_oil,temp_steps_oil);
plot (time_steps_water,temp_steps_water);
hold off;
xlabel('Time');
ylabel('Temperature in Kelvin (+273.15)');
title ('Quenching comparison; Air, vs. Oil vs. Water');
legend('air','oil','water');
grid on;
