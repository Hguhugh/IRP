function [E_saved, cost_saving, saving_per_km, CO2_yr] = energy_calc(energy,diesel_density,diesel_cost,distance)

    E_saved = (energy.Data(end,1)/distance.Data(end)) ; % kJ PER KM

    %%%%%%%%%%%%%%%%%%%%

    E_tot = energy.Data(end,2);
    E_eng = energy.Data(end,3);
    fuel_req = E_tot/(diesel_density*0.30);
    new_fuel_req = E_eng/(diesel_density*0.30); % in litres
    cost_old = fuel_req*diesel_cost;
    cost_new = new_fuel_req*diesel_cost;
    cost_saving = cost_old-cost_new;
    saving_per_km = cost_saving/distance.Data(end) *1000; % £ per km
    CO2_yr = (new_fuel_req-fuel_req)/distance.Data(end)*2.68*1000; % kg CO2 per km
end