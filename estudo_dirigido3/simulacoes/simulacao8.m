clear; 
clc; 
close all;

Fs = 1000;
f0 = 60;

T1 = 0.05;
t1 = 0:1/Fs:T1-(1/Fs);        
x1 = sin(2*pi*f0*t1);
L1 = length(x1);

T2 = 0.5;
t2 = 0:1/Fs:T2-(1/Fs);        
x2 = sin(2*pi*f0*t2);
L2 = length(x2);

Y1 = fft(x1);
P2_1 = abs(Y1/L1);
P1_1 = P2_1(1:floor(L1/2)+1);
P1_1(2:end-1) = 2*P1_1(2:end-1);
f1 = Fs*(0:(floor(L1/2)))/L1;
df1 = Fs/L1;

Y2 = fft(x2);
P2_2 = abs(Y2/L2);
P1_2 = P2_2(1:floor(L2/2)+1);
P1_2(2:end-1) = 2*P1_2(2:end-1);
f2 = Fs*(0:(floor(L2/2)))/L2;
df2 = Fs/L2;

fprintf('--- ANÁLISE DE RESOLUÇÃO ESPECTRAL ---\n');
fprintf('Sinal 1 (Curto): %d amostras | Resolução (df): %.2f Hz\n', L1, df1);
fprintf('Sinal 2 (Longo): %d amostras | Resolução (df): %.2f Hz\n\n', L2, df2);

figure('Position', [100, 100, 1000, 600]);

subplot(2,2,1);
stem(t1, x1, 'r', 'filled');
title(sprintf('Sinal 1: Tempo (N = %d)', L1));
xlabel('Tempo (s)'); ylabel('Amplitude'); 
grid on;

subplot(2,2,3);
stem(f1, P1_1, 'r', 'LineWidth', 1.5); 
hold on;
plot(f1, P1_1, 'r:');
title(sprintf('FFT 1: Espectro (\\Deltaf = %.1f Hz)', df1));
xlabel('Frequência (Hz)'); ylabel('|X_1(f)|'); 
grid on;
xlim([0 150]);

subplot(2,2,2);
plot(t2, x2, 'b', 'LineWidth', 1.5);
title(sprintf('Sinal 2: Tempo (N = %d)', L2));
xlabel('Tempo (s)'); ylabel('Amplitude');
grid on;

subplot(2,2,4);
stem(f2, P1_2, 'b', 'LineWidth', 1.5); 
hold on;
plot(f2, P1_2, 'b:');
title(sprintf('FFT 2: Espectro (\\Deltaf = %.1f Hz)', df2));
xlabel('Frequência (Hz)'); ylabel('|X_2(f)|'); 
grid on;
xlim([0 150]);