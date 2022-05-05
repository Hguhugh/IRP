%% CONSTANTS etc
clear
close all
clc
g = 9.81;

% Drag
vehicle = "XF";
air_density = 1.246;
drag_coef = 0.8;
CSA = 7.5;
r_wheel = 0.52; % Wheel radius in metres
m_vehicle = 44000; % Vehicle mass in kg
tyre_pres = 8.5; % tyre pressure (bar), 8-9 bar for truck

% Flywheel
m_fly = 40;
k_fly = 0.606; % inertial constant (0.606 for flat solid disk)
r_fly = 0.15; % radius
J_fly = 0.21; % Moment of inertia

% Motor
T_mot = 800; % Max motor torque (on axle)
P_max = 120000; % Max power
vehicle_eff = 0.90; % percent motor and driver overall efficiency

load("drv_cycle_data.mat");
T_stop = 20; % Time length of WLTP1
step_size = 0.01;

diesel_density = 45.5e6; %45.5MJ/kg energy density
diesel_cost = 1.737; % per litre(kg) as of 14th March
av_dist = 201168; % Average distance in a year (km)

run("cycles_run.m")

E_yr_WLTP1 = E_saved_WLTP1 *av_dist/1000; % MJ per year
E_yr_ArtUrban = E_saved_ArtUrban *av_dist/1000;
E_yr_ArtRoad = E_saved_ArtRoad *av_dist/1000;
E_yr_Brau = E_saved_Brau *av_dist/1000;

cost_yr_WLTP1 = saving_per_km_WLTP1*av_dist;
cost_yr_ArtUrban = saving_per_km_ArtUrban*av_dist;
cost_yr_ArtRoad = saving_per_km_ArtRoad*av_dist;
cost_yr_Brau = saving_per_km_Brau*av_dist;

CO2_yr_WLTP1 = CO2_WLTP1*av_dist/1000; %tonnes per year
CO2_yr_ArtUrban = CO2_ArtUrban*av_dist/1000;
CO2_yr_ArtRoad = CO2_ArtRoad*av_dist/1000;
CO2_yr_Brau = CO2_Brau*av_dist/1000;

save("XF")