clear; 
clc; 
close all;

Fs = 1000;
T = 1/Fs;
L = 1000;
t = (0:L-1)*T;

f0 = 50;
A = 1.5;

sinal_util = A * sin(2*pi*f0*t);

ruido = 2.5 * randn(size(t)); 

sinal_composto = sinal_util + ruido;

Y = fft(sinal_composto);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

figure('Position', [100, 100, 1000, 600]);

subplot(2,1,1);
plot(t, sinal_composto, 'Color', [0.7, 0.7, 0.7], 'LineWidth', 1); hold on;
plot(t, sinal_util, 'r', 'LineWidth', 2);
title('Sinal no Domínio do Tempo');
xlabel('Tempo (segundos)');
ylabel('Amplitude');
legend('Sinal Composto (Com Ruído)', 'Sinal Útil (Senoide Original)');
grid on;
xlim([0 0.2]); 

subplot(2,1,2);
plot(f, P1, 'b', 'LineWidth', 1.5);
title('Espectro de Amplitude Único (Domínio da Frequência via FFT)');
xlabel('Frequência (Hz)');
ylabel('|P1(f)|');
grid on;
xlim([0 200]); 