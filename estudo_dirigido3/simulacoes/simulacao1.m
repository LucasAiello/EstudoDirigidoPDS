clc;
clear;
close all;

f0 = 0.1;
N = 128;

n = 0:N-1;

x = sin(2*pi*f0*n);

figure;
stem(n, x, 'filled');
xlabel('n');
ylabel('x[n]');
title('Senoide discreta no domínio do tempo');
grid on;

X = fft(x);

magX = abs(X);

f = (0:N-1)/N;

figure;
plot(f, magX, 'LineWidth', 1.5);
xlabel('Frequência Normalizada');
ylabel('|X(f)|');
title('Espectro da senoide utilizando FFT');
grid on;