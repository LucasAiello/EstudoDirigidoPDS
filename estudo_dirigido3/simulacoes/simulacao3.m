clc;
clear;
close all;

N = 128; 
n = 0:N-1;

f0 = 0.4;        

x1 = sin(2*pi*f0*n);

X1 = fft(x1);
magX1 = abs(X1)/N;

f = (0:N-1)/N;

x2 = x1(1:2:end);   

N2 = length(x2);
n2 = 0:N2-1;

X2 = fft(x2);
magX2 = abs(X2)/N2;

f2 = (0:N2-1)/N2;

figure;
stem(n, x1, 'filled');
xlabel('n');
ylabel('x[n]');
title('Sinal original');
grid on;


figure;
stem(n2, x2, 'filled');
xlabel('n');
ylabel('x[n]');
title('Sinal com taxa de amostragem reduzida');
grid on;

figure;
plot(f(1:N/2), magX1(1:N/2), 'LineWidth', 1.5);
xlabel('Frequência Normalizada');
ylabel('|X(f)|');
title('Espectro do sinal original');
grid on;

figure;
plot(f2(1:N2/2), magX2(1:N2/2), 'LineWidth', 1.5);
xlabel('Frequência Normalizada');
ylabel('|X(f)|');
title('Espectro após redução da taxa de amostragem');
grid on;


disp('Frequência original:');
disp(f0);