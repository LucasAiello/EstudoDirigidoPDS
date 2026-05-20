clear;
clc;
close all;

N = 25;
n = 0:N-1;

b = [1];
a = [1, -0.8];

delta = zeros(1, N);
delta(1) = 1; 

h = filter(b, a, delta);

figure('Position', [150, 150, 750, 450]);
stem(n, h, 'filled', 'MarkerFaceColor', [0 0.45 0.74], 'LineWidth', 1.5);
title('Resposta ao Impulso h[n] (Determinação Numérica)');
xlabel('Amostras (n)');
ylabel('Amplitude h[n]');
grid on;

xlim([-1, N]);
ylim([-0.1, 1.1]);

for i = 1:5
    text(n(i), h(i) + 0.04, sprintf('%.3f', h(i)), ...
         'HorizontalAlignment', 'center', 'FontSize', 9, 'FontWeight', 'bold');
end