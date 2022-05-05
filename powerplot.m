function [] = powerplot(power, cycle_name, T_stop, vehicle)

figure
fig=gcf;
fig.Position(3:4)=[1100,400];
plot(power.Time, power.Data(:,1), "LineWidth", 1, "Color","r")
hold on

% plot(power.Time, power.Data(:,3), "LineWidth", 0.7)
plot(power.Time, power.Data(:,4), "LineWidth", 1, "Color","green")
plot(power.Time, power.Data(:,2), "LineWidth", 1, "Color", "blue")
legend("Charging Power", "Diesel Engine Power", "Regenerated (Motor) Power") %, "Total Power Demand"
xlabel("Time (s)")
xlim([0 400]);
ylabel("Power (W)")
%title(append("Power (", cycle_name, " Cycle)"))
saveas(gcf, append(vehicle, "Power (", cycle_name, " Cycle)"), 'epsc')
saveas(gcf, append(vehicle, "Power (", cycle_name, " Cycle)",".jpeg"))

end