clear; 
clc; 
close all;

x = [1, 2, 3, 4, 3, 2, 1, 0]; 
N = length(x);

X_dft = zeros(1, N);

for k = 0:N-1
    soma = 0;
    for n = 0:N-1
        soma = soma + x(n+1) * exp(-1i * 2 * pi * k * n / N);
    end
    X_dft(k+1) = soma;
end

X_fft = fft(x);

erro_maximo = max(abs(X_dft - X_fft));
fprintf('Diferença máxima absoluta entre DFT manual e FFT: %e\n\n', erro_maximo);

k_eixo = 0:N-1;

figure('Position', [100, 100, 900, 500]);

subplot(2,1,1);
stem(k_eixo, abs(X_dft), 'ro', 'LineWidth', 2, 'MarkerSize', 8); hold on;
stem(k_eixo, abs(X_fft), 'bx--', 'LineWidth', 1.5);
title('Comparação de Magnitude: DFT Direta vs FFT Nativa');
xlabel('Índice de Frequência (k)');
ylabel('|X[k]|');
legend('DFT Direta (Manual)', 'FFT Nativa');
grid on;

subplot(2,1,2);
stem(k_eixo, angle(X_dft), 'ro', 'LineWidth', 2, 'MarkerSize', 8); hold on;
stem(k_eixo, angle(X_fft), 'bx--', 'LineWidth', 1.5);
title('Comparação de Fase: DFT Direta vs FFT Nativa');
xlabel('Índice de Frequência (k)');
ylabel('Fase (radianos)');
legend('DFT Direta (Manual)', 'FFT Nativa');
grid on;