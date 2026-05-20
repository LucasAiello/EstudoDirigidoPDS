clc;
clear;
close all;

Fs = 1000;
T = 1/Fs;
L = 1000;
t = (0:L-1)*T;

f_fundamental = 60;
A1 = 2.0;

f_harmonica = 3 * f_fundamental;
A2 = 0.8;

sinal = A1*sin(2*pi*f_fundamental*t) + A2*sin(2*pi*f_harmonica*t);

Y = fft(sinal);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

figure('Position', [100, 100, 1000, 600]);

subplot(2,1,1);
plot(t, sinal, 'k', 'LineWidth', 1.5);
title('Sinal Composto no Domínio do Tempo (Fundamental + 3º Harmônico)');
xlabel('Tempo (segundos)');
ylabel('Amplitude');
grid on;
xlim([0 0.1]);

subplot(2,1,2);
stem(f, P1, 'b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
title('Espectro de Amplitude (Identificação de Frequências)');
xlabel('Frequência (Hz)');
ylabel('|X(f)|');
grid on;
xlim([0 300]); 

text(f_fundamental + 5, A1, ['Principal (' num2str(f_fundamental) ' Hz)'], 'FontWeight', 'bold');
text(f_harmonica + 5, A2, ['Harmônica (' num2str(f_harmonica) ' Hz)'], 'FontWeight', 'bold');