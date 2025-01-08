% variables declaration
A = 0.0085; % Cross sectional area of oil-water separator
c = 4200; % SHC of water
m_still = 10; % Mass of mixture in the still
m_coolant = 25; % Mass of coolant
h_conv = 50; % Convective coefficient at radiator
A_rad = 1.01; % Effective convective area of radiator
% Transfer functions
% Distillate level controller
Distillate_level_controller = tf(A, [1, 0, 0]);
% Still heating system
Still_heating_system = tf(m_still*c, [1, 0, 0]);
% Distillate temperature controller
Distillate_temperature_controller = tf(m_coolant*c, [1, 0, 0]);
% Heat convection controller
Heat_convection_controller = tf(h_conv*A_rad, [1, 0, 0]);
% Configuration validation in closed loop
% step responses
figure(1)
subplot(2,1,1)
step(1+Distillate_level_controller)
title("Step response of Distillate level controller in openloop")
subplot(2,1,2)
step(1/(1+Distillate_level_controller))
title("Step response of Distillate level controller with PID Controller")
figure(2)
subplot(2,1,1)
step(1+Still_heating_system)
title("Step response of Still heating system in openloop")
subplot(2,1,2)
step(1/(1+Still_heating_system))
title("Step response of Still heating system with PID Controller")
figure(3)
subplot(2,1,1)
step(1+Distillate_temperature_controller)
title("Step response of Distillate temperature controller in openloop")
subplot(2,1,2)
step(1/(1+Distillate_temperature_controller))
title("Step response of Distillate temperature controller with PID Controller")
figure(4)
subplot(2,1,1)
step(1+Heat_convection_controller)
title("Step response of Heat convection controller in openloop")
subplot(2,1,2)
step(1/(1+Heat_convection_controller))
title("Step response of Heat convection controller with PID Controller")
% Bode analysis
figure(1)
subplot(2,1,1)
bode(1+Distillate_level_controller)
title("Bode Plot of Distillate level controller in openloop")
subplot(2,1,2)
bode(1/(1+Distillate_level_controller))
title("Bode Plot of Distillate level controller with PID Controller")