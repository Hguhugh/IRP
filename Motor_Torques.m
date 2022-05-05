%% DAF XF
clear
close all
clc
g = 9.81;

% Specific Vehicle Properties
air_density = 1.246;
drag_coef = 0.8;
CSA = 7.5;
r_wheel = 0.52; % Wheel radius in metres
m_vehicle = 44000; % Vehicle mass in kg
tyre_pres = 8.5; % tyre pressure (bar), 8-9 bar for truck

P_max = 120000; % Max power
vehicle_eff = 0.90; % percent motor and driver overall efficiency

load("drv_cycle_data.mat");
step_size = 0.01;

diesel_density = 45.5e6; %45.5MJ/kg energy density
diesel_cost = 1.737; % per litre(kg) as of 14th March
av_dist = 201168; % Average distance in a year (km)

% Flywheel
m_fly = 40;
k_fly = 0.606; % inertial constant (0.606 for flat solid disk)
r_fly = 0.2; % radius
J_fly = k_fly*m_fly*r_fly^2; % Moment of inertia

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ES = [];
X = [];
cycle = ArtUrban;
T_stop = length(cycle);
for T_mot = 400:100:2000
    i = (T_mot/100)-3;
    X(i) = T_mot;
    sim("Model_2_WLTC1")
    [ES(i),~,~,~] = energy_calc(energy,diesel_density,diesel_cost,distance);
end
close
plot(X, ES)
xlabel("Torque (Nm)")
ylabel("Energy Saved (J)")
xlim([400 2000])
savefig("Motor Torques_XF");
saveas(gcf, "Motor Torques_XF", "epsc");
%% DAF LF

close all
clc
g = 9.81;

% Drag
air_density = 1.246;
drag_coef = 0.8;
CSA = 5.5;
r_wheel = 0.55; % Wheel radius in metres
m_vehicle = 16000; % Vehicle mass in kg
tyre_pres = 8.5; % tyre pressure (bar), 8-9 bar for truck

ES = [];
X = [];
cycle = ArtUrban;
T_stop = length(cycle);
for T_mot = 400:10:1000
    i = (T_mot/10)-39;
    X(i) = T_mot;
    sim("Model_2_WLTC1")
    [ES(i),~,~,~] = energy_calc(energy,diesel_density,diesel_cost,distance);
end
close
plot(X, ES)
xlabel("Torque (Nm)")
ylabel("Energy Saved (J)")
xlim([400 1000])
savefig("Motor Torques_LF");
saveas(gcf, "Motor Torques_LF", "epsc");
%% Metrocity

close all
clc
g = 9.81;

% Drag
air_density = 1.246;
drag_coef = 0.8;
CSA = 7;
r_wheel = 0.25; % Wheel radius in metres
m_vehicle = 13000; % Vehicle mass in kg
tyre_pres = 8.5; % tyre pressure (bar), 8-9 bar for truck

ES = [];
X = [];
cycle = ArtUrban;
T_stop = length(cycle);
for T_mot = 400:10:1000
    i = (T_mot/10)-39;
    X(i) = T_mot;
    sim("Model_2_WLTC1")
    [ES(i),~,~,~] = energy_calc(energy,diesel_density,diesel_cost,distance);
end
close
plot(X, ES)
xlabel("Torque (Nm)")
ylabel("Energy Saved (J)")
xlim([400 1000])
savefig("Motor Torques_BUS");
saveas(gcf, "Motor Torques_BUS", "epsc");