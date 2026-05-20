clear; 
clc;
close all;

Fs = 8000;
t = 0:1/Fs:0.25;
L = length(t);

f_inicial = 1000;
f_final = 3000;
sinal_audio = sin(2*pi*(f_inicial*t + (f_final - f_inicial)/(2*0.25)*t.^2)) .* exp(-30*(t-0.12).^2);

Y = fft(sinal_audio);
P2 = abs(Y/L); 
P1 = P2(1:floor(L/2)+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(floor(L/2)))/L;

figure('Position', [100, 100, 950, 600]);

subplot(2,1,1);
plot(t, sinal_audio, 'Color', [0.12 0.53 0.43], 'LineWidth', 1.2);
title('Sinal de Áudio no Domínio do Tempo', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Tempo (segundos)', 'FontSize', 10);
ylabel('Amplitude', 'FontSize', 10);
grid on;

subplot(2,1,2);
plot(f, P1, 'Color', [0.74 0.23 0.23], 'LineWidth', 1.5);
title('Espectro de Amplitude do Áudio (Análise em Frequência via FFT)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Frequência (Hz)', 'FontSize', 10);
ylabel('Magnitude |X(f)|', 'FontSize', 10);
grid on;

xlim([0 4000]);