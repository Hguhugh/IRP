%% Plotting cycles only
set(groot,'defaultAxesFontSize',12)
close all
load("drv_cycle_data.mat")
figure
fig=gcf;
fig.Position(3:4)=[550,200];
plot(WLTP1(:,1), WLTP1(:,2))
ylabel("Velocity (km/h)")
xlabel("Time (s)")
xlim([0 length(WLTP1(:,1))])
saveas(gcf, "WLTP1_cycle", "epsc")
figure
fig=gcf;
fig.Position(3:4)=[550,200];
plot(ArtRoad(:,1), ArtRoad(:,2))
ylabel("Velocity (km/h)")
xlabel("Time (s)")
xlim([0 length(ArtRoad(:,1))])
saveas(gcf, "ArtRoad_cycle", "epsc")
figure
fig=gcf;
fig.Position(3:4)=[550,200];
plot(ArtUrban(:,1), ArtUrban(:,2))
ylabel("Velocity (km/h)")
xlabel("Time (s)")
xlim([0 length(ArtUrban(:,1))])
saveas(gcf, "ArtUrban_cycle", "epsc")

read_cycle = table2array(readtable("Braunschweig City Driving Cycle.csv"));
Braun = [read_cycle(:,1) read_cycle(:,2).*1.60934];
figure
fig=gcf;
fig.Position(3:4)=[550,200];
plot(Braun(:,1), Braun(:,2))
ylabel("Velocity (km/h)")
xlabel("Time (s)")
xlim([0 length(Braun(:,1))])
saveas(gcf, "Braun_cycle", "epsc")

set(groot,'defaultAxesFontSize',10)