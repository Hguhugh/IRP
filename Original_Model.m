%% CONSTANTS etc

clc
g = 9.81;

% Drag
air_density = 1.246;
drag_coef = 0.8;
CSA = 7.3;

% Flywheel
m_fly = 40;
k_fly = 0.606; % inertial constant (0.606 for flat solid disk)
r_fly = 0.2; % radius
J_fly = k_fly*m_fly*r_fly^2; % Moment of inertia

% Motor
T_mot = 800; % Max motor torque (on axle)
P_max = 120000; % Max power
vehicle_eff = 0.90; % percent motor and driver overall efficiency

r_wheel = 0.5; % Wheel radius in metres
m_vehicle = 6000; % Vehicle mass in kg
tyre_pres = 8.5; % tyre pressure (bar), 8-9 bar for truck

load("drv_cycle_data.mat");
T_stop = 20; % Time length of WLTP1
step_size = 0.01;

diesel_density = 45.5e6; %45.5MJ/kg energy density
diesel_cost = 1.737; % per litre(kg) as of 14th March
av_dist = 201168; % Average distance in a year (km)


cycles = [];
costs = [];
savings_km = [];
savings_yr = [];

% ModelName 'Model_2_WLTC1.slx'
% print('-sModelName','-dtiff','model.tiff')

%% Braking Ratios Graph

% brake_ratios = table2array(readtable('brake ratios.csv'));
% figure
% plot(brake_ratios(:,1), brake_ratios(:,2))
% hold on
% plot(brake_ratios(:,1), brake_ratios(:,3))
% plot(brake_ratios(:,1), brake_ratios(:,4))
% legend("Total Single Axle Braking", "Regenerative Braking", "Frictional Braking", "Location", "east")
% xlabel("Velocity (km/h)")
% ylabel("Brake distribution ratio (%)")
% title("Braking Torque Distributions")
% ylim([0 100])
% saveas(gcf, "Braking Torque Ratios", 'epsc')


%% Contrived cycle
% close all
% clc
% 
% %  v = [0 3 6 9 12 15 15 15 15 15 15 12 9 6 3 0 0 0 0 0]; % in kph
% % v = [0 3 6 9 12 15 15 15 15 15 15 7 0 0 0 0 0 0 0 0]; % in kph
% v = [0 7 12 4 0 4 8 16 20 24 200]; % in kph
% v = v.*4;
% speeds = [v v v v v v];
% time = 0:1:length(speeds)-1;
% contrived = [time',speeds'];
% 
% cycle = contrived;
% cycle_name = "Contrived";
% T_stop = length(cycle);
% sim("Model_2_WLTC1")
% 
% energy_cont = energy;
% power_cont = power;
% 
% energyplot(energy_fly, speed_veh, T_stop, cycle_name)
% 
% powerplot(power, cycle_name, T_stop)
% 
% [cost_saving_cont, saving_per_km_cont, saving_per_yr_cont] = energy_calc(energy,diesel_density,diesel_cost,distance);
% cycles(end+1) = cycle_name;
% costs(end+1) = cost_saving_cont;
% savings_km(end+1) = saving_per_km_cont;
% savings_yr(end+1) = saving_per_yr_cont;

%% Plotting cycles only

%% WLTP1 cycle
close all
clc

cycle = WLTP1;
cycle_name = "WLTP1";
T_stop = length(cycle);
sim("Model_2_WLTC1")

energy_WLTP1 = energy;
power_WLTP1 = power;

energyplot(energy_fly, speed_veh, T_stop, cycle_name)

powerplot(power, cycle_name, T_stop)

[cost_saving_WLTP1, saving_per_km_WLTP1, saving_per_yr_WLTP1] = energy_calc(energy,diesel_density,diesel_cost,distance);
cycles(end+1) = cycle_name;
costs(end+1) = cost_saving_WLTP1;
savings_km(end+1) = saving_per_km_WLTP1;
savings_yr(end+1) = saving_per_yr_WLTP1;

%% ArtRoad cycle
close all
clc

cycle = ArtRoad;
cycle_name = "ArtRoad";
T_stop = length(cycle);
sim("Model_2_WLTC1")

energy_ArtRoad = energy;
power_ArtRoad = power;

energyplot(energy_fly, speed_veh, T_stop, cycle_name)

powerplot(power, cycle_name, T_stop)

[cost_saving_ArtRoad, saving_per_km_ArtRoad, saving_per_yr_ArtRoad] = energy_calc(energy,diesel_density,diesel_cost,distance);
cycles(end+1) = cycle_name;
costs(end+1) = cost_saving_ArtRoad;
savings_km(end+1) = saving_per_km_ArtRoad;
savings_yr(end+1) = saving_per_yr_ArtRoad;

%% ArtUrban cycle
close all
clc

cycle = ArtUrban;
cycle_name = "ArtUrban";
T_stop = length(cycle);
sim("Model_2_WLTC1")

energy_ArtUrban = energy;
power_ArtUrban = power;

energyplot(energy_fly, speed_veh, T_stop, cycle_name)

powerplot(power, cycle_name, T_stop)

[cost_saving_ArtUrban, saving_per_km_ArtUrban, saving_per_yr_ArtUrban] = energy_calc(energy,diesel_density,diesel_cost,distance);
cycles(end+1) = cycle_name;
costs(end+1) = cost_saving_ArtUrban;
savings_km(end+1) = saving_per_km_ArtUrban;
savings_yr(end+1) = saving_per_yr_ArtUrban;

%% Braunschweig cycle
close all
clc

read_cycle = table2array(readtable("Braunschweig City Driving Cycle.csv"));
cycle = [read_cycle(:,1) read_cycle(:,2).*1.60934];
cycle_name = "Braunschweig";
T_stop = length(cycle);
sim("Model_2_WLTC1")

energy_Brau = energy;
power_Brau = power;

energyplot(energy_fly, speed_veh, T_stop, cycle_name)

powerplot(power, cycle_name, T_stop)

[cost_saving_Brau, saving_per_km_Brau, saving_per_yr_Brau] = energy_calc(energy,diesel_density,diesel_cost,distance);
cycles(end+1) = cycle_name;
costs(end+1) = cost_saving_Brau;
savings_km(end+1) = saving_per_km_Brau;
savings_yr(end+1) = saving_per_yr_Brau;

%% Table of values
%T = [["Cycle Name","Cost saving over one cycle", "Cost saving per km","Cost saving per year"]; [cycles', costs', savings_km', savings_yr']];


%% Varying motor torques

effs = [];
X = [];
for T_mot = 400:10:1000
    i = (T_mot/10)-3;
    X(i) = T_mot;
    sim("Model_2_WLTC1")
    effs(i) = eff.Data(end);
end
close
plot(X, effs)
xlabel("Torque (Nm)")
ylabel("Percentage of energy from regeneration (%)")
xlim([400 1000])
savefig("Motor Torques");
saveas(gcf, "Motor Torques", "epsc");


