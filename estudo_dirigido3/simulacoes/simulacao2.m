clc;
clear;
close all;

N = 128;  
n = 0:N-1;
f1 = 0.1;
f2 = 0.25;

x1 = sin(2*pi*f1*n);
x2 = sin(2*pi*f2*n);

x = x1 + x2;

figure;
stem(n, x, 'filled');
xlabel('n');
ylabel('x[n]');
title('Soma de duas senoides em tempo discreto');
grid on;

X = fft(x);

magX = abs(X)/N;

f = (0:N-1)/N;

figure;
plot(f, magX, 'LineWidth', 1.5);
xlabel('Frequência Normalizada');
ylabel('|X(f)|');
title('Espectro completo');
grid on;

disp('Frequências presentes no sinal:');
disp(f1);
disp(f2);