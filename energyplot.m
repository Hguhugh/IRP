function [] = energyplot(energy_fly, speed_veh, T_stop, cycle_name, vehicle)
figure
fig=gcf;
fig.Position(3:4)=[1100,400];

yyaxis left
plot(energy_fly.Time, (energy_fly.Data)./1000, "LineWidth", 1.1)
xlabel("Time (s)")
ylabel("Energy (kJ)")
xlim([0 T_stop]);
ylim([0 max(energy_fly.Data)*5/4000]);
yyaxis right
plot(speed_veh.Time, speed_veh.Data, "LineWidth", 0.7);
ylabel("Vehicle Speed (m/s)")
xlabel("Time (s)")
xlim([0 T_stop]);
ylim([0 max(speed_veh.Data)*5/4]);

%title(append("Flywheel Energy (",cycle_name," Cycle)"))
legend("Flywheel Energy", "Vehicle Speed")
saveas(gcf, append(vehicle, " Flywheel Energy (",cycle_name," Cycle)"), 'epsc')
saveas(gcf, append(vehicle, " Flywheel Energy (",cycle_name," Cycle)"), 'jpeg')