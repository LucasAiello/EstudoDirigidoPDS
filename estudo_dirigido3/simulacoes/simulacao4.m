clc;
clear;
close all;

N = 128;
n = 0:N-1;

f0 = 0.13;

x = sin(2*pi*f0*n);

X1 = fft(x);
magX1 = abs(X1)/N;

w = hamming(N)';

xw = x .* w;

X2 = fft(xw);
magX2 = abs(X2)/N;

f = (0:N-1)/N;

figure;
plot(n, x, 'LineWidth', 1.5);
xlabel('n');
ylabel('x[n]');
title('Sinal original');
grid on;

figure;
plot(n, w, 'LineWidth', 1.5);
xlabel('n');
ylabel('w[n]');
title('Janela de Hamming');
grid on;

figure;
plot(f(1:N/2), magX1(1:N/2), 'LineWidth', 1.5);
xlabel('Frequência Normalizada');
ylabel('|X(f)|');
title('FFT sem janela');
grid on;

figure;
plot(f(1:N/2), magX2(1:N/2), 'LineWidth', 1.5);
xlabel('Frequência Normalizada');
ylabel('|X(f)|');
title('FFT com janela de Hamming');
grid on;