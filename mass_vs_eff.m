%% CONSTANTS etc
clear
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
% Flywheel
m_fly = 9;
k_fly = 0.606; % inertial constant (0.606 for flat solid disk)
r_fly = 0.15; % radius
J_fly = 0.21; % Moment of inertia

% Motor
T_mot = 800; % Max motor torque (on axle)
P_max = 120000; % Max power
vehicle_eff = 0.90; % percent motor and driver overall efficiency

load("drv_cycle_data.mat");
step_size = 0.01;

diesel_density = 45.5e6; %45.5MJ/kg energy density
diesel_cost = 1.737; % per litre(kg) as of 14th March
av_dist = 201168; % Average distance in a year (km)
effs = [];
masses = [];
saved = [];

for i = 1:1:20
    m_vehicle = (i)*5000; % Vehicle mass in kg
    masses(i) = m_vehicle/1000; %tonnes

    cycle = WLTP1;
    T_stop = length(cycle);
    sim("Model_2_WLTC1")
    saved_1(i) = energy.Data(end,1)/distance.Data(end); %kJ/km
    effs_1(i) = eff.Data(end);
    cost_1(i) = (energy.Data(end,1))/(diesel_density*0.30)*diesel_cost/distance.Data(end) *1000; % £ per km
    carbon_1(i) = (energy.Data(end,1))/(diesel_density*0.30)*2.68/distance.Data(end) * 1000;

    cycle = ArtUrban;
    T_stop = length(cycle);
    sim("Model_2_WLTC1")
    saved_2(i) = energy.Data(end,1)/distance.Data(end); %kJ/km
    effs_2(i) = eff.Data(end);
    cost_2(i) = (energy.Data(end,1))/(diesel_density*0.30)*diesel_cost/distance.Data(end) *1000; % £ per km
    carbon_2(i) = (energy.Data(end,1))/(diesel_density*0.30)*2.68/distance.Data(end) * 1000;

    cycle = ArtRoad;
    T_stop = length(cycle);
    sim("Model_2_WLTC1")
    saved_3(i) = energy.Data(end,1)/distance.Data(end); %kJ/km
    effs_3(i) = eff.Data(end);
    cost_3(i) = (energy.Data(end,1))/(diesel_density*0.30)*diesel_cost/distance.Data(end) *1000; % £ per km
    carbon_3(i) = (energy.Data(end,1))/(diesel_density*0.30)*2.68/distance.Data(end) * 1000;

    read_cycle = table2array(readtable("Braunschweig City Driving Cycle.csv"));
    cycle = [read_cycle(:,1) read_cycle(:,2).*1.60934];
    T_stop = length(cycle);
    sim("Model_2_WLTC1")
    saved_4(i) = energy.Data(end,1)/distance.Data(end); %kJ/km
    effs_4(i) = eff.Data(end);
    cost_4(i) = (energy.Data(end,1))/(diesel_density*0.30)*diesel_cost/distance.Data(end) *1000; % £ per km
    carbon_4(i) = (energy.Data(end,1))/(diesel_density*0.30)*2.68/distance.Data(end) * 1000; % kg CO2 per km
end
%%
close all
figure
fig=gcf;
fig.Position(3:4)=[550,400];
hold on
plot(masses,effs_1)
plot(masses,effs_2)
plot(masses,effs_3)
plot(masses,effs_4)
xlabel("Mass (tonnes)")
xlim([5 100])
ylabel("Energy Recovered (%)")
legend("WLTP1", "ArtUrban", "ArtRoad", "Braunschweig")
saveas(gcf, "mass_vs_en1", "epsc")

figure
fig=gcf;
fig.Position(3:4)=[550,400];
hold on
plot(masses, saved_1)
plot(masses, saved_2)
plot(masses, saved_3)
plot(masses, saved_4)
xlabel("Mass (tonnes)")
xlim([5 100])
ylabel("Energy Recovered per km (kJ/km)")
legend("WLTP1", "ArtUrban", "ArtRoad", "Braunschweig", "Location","southeast")
saveas(gcf, "mass_vs_en2", "epsc")

figure
hold on
fig=gcf;
fig.Position(3:4)=[550,400];
plot(masses,cost_1)
plot(masses,cost_2)
plot(masses,cost_3)
plot(masses,cost_4)
xlabel("Mass (tonnes)")
xlim([5 100])
ylabel("Cost saving per km (£/km)")
legend("WLTP1", "ArtUrban", "ArtRoad", "Braunschweig", "Location","southeast")
saveas(gcf, "mass_vs_cost", "epsc")


figure
hold on
fig=gcf;
fig.Position(3:4)=[550,400];
plot(masses,carbon_1)
plot(masses,carbon_2)
plot(masses,carbon_3)
plot(masses,carbon_4)
xlabel("Mass (tonnes)")
xlim([5 100])
ylabel("Carbon dioxide saving per km (kg/km)")
legend("WLTP1", "ArtUrban", "ArtRoad", "Braunschweig", "Location","southeast")
saveas(gcf, "mass_vs_co2", "epsc")

