clear all;
hold all;
% Simulationsdaten laden
simulation = importdata('Aktives Filter.txt');

% Messwerte laden
measure = importdata('Messdaten Aktive Filter.xlsx');

% Messdaten aufbereiten, Spannung in dB umrechnen. Die Messdaten sind als
% Effektivewrt in mV gespeichert, also durch 1000 rechnen um auf dBV zu
% kommen
amp_dB = 20*log(measure.data.Sheet1*[0 0 1]'/1000);

% simulierter Amplitudengang zeichnen
subplot(4, 1, 1),   plot(simulation.data*[1 0 0]', simulation.data*[0 1 0]')
title('\it{Simulation}','FontSize',16)
xlabel('Frequenz in [Hz]','FontSize',12), ylabel('Amplitude','FontSize',12)

% gemessener Amplitudengang zeichnen
subplot(4, 1, 2),   plot(measure.data.Sheet1*[1 0 0]', amp_dB)
title('\it{Messung}','FontSize',16)
xlabel('Frequenz in [Hz]','FontSize',12), ylabel('Amplitude','FontSize',12)

% simulierter Phasengang zeichnen
subplot(4, 1, 3),   plot(simulation.data*[1 0 0]', simulation.data*[0 0 1]')
title('\it{Simulation}','FontSize',16)
xlabel('Frequenz in [Hz]','FontSize',12), ylabel('Phase','FontSize',12)

% gemessener Phasengang zeichnen
subplot(4, 1, 4),   plot(measure.data.Sheet1*[1 0 0]', measure.data.Sheet1*[0 1 0]')
title('\it{Messung}','FontSize',16)
xlabel('Frequenz in [Hz]','FontSize',12), ylabel('Phase','FontSize',12)

