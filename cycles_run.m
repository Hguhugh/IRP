%% WLTP1 cycle
close all
clc

cycle = WLTP1;
cycle_name = "WLTP1";
T_stop = length(cycle);
sim("Model_2_WLTC1")

energy_WLTP1 = energy;
power_WLTP1 = power;

energyplot(energy_fly, speed_veh, T_stop, cycle_name,vehicle)
powerplot(power, cycle_name, T_stop, vehicle)
eff_WLTP1 = eff.Data(end);

[E_saved_WLTP1,cost_saving_WLTP1, saving_per_km_WLTP1, CO2_WLTP1] = energy_calc(energy,diesel_density,diesel_cost,distance);

%% ArtRoad cycle
close all
clc

cycle = ArtRoad;
cycle_name = "ArtRoad";
T_stop = length(cycle);
sim("Model_2_WLTC1")

energy_ArtRoad = energy;
power_ArtRoad = power;

energyplot(energy_fly, speed_veh, T_stop, cycle_name,vehicle)
powerplot(power, cycle_name, T_stop, vehicle)
eff_ArtRoad = eff.Data(end);

[E_saved_ArtRoad,cost_saving_ArtRoad, saving_per_km_ArtRoad, CO2_ArtRoad] = energy_calc(energy,diesel_density,diesel_cost,distance);

%% ArtUrban cycle
close all
clc

cycle = ArtUrban;
cycle_name = "ArtUrban";
T_stop = length(cycle);
sim("Model_2_WLTC1")

energy_ArtUrban = energy;
power_ArtUrban = power;

energyplot(energy_fly, speed_veh, T_stop, cycle_name, vehicle)
powerplot(power, cycle_name, T_stop, vehicle)
eff_ArtUrban = eff.Data(end);

[E_saved_ArtUrban,cost_saving_ArtUrban, saving_per_km_ArtUrban, CO2_ArtUrban] = energy_calc(energy,diesel_density,diesel_cost,distance);

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

energyplot(energy_fly, speed_veh, T_stop, cycle_name, vehicle)
powerplot(power, cycle_name, T_stop, vehicle)
eff_Brau = eff.Data(end);

[E_saved_Brau,cost_saving_Brau, saving_per_km_Brau, CO2_Brau] = energy_calc(energy,diesel_density,diesel_cost,distance);
