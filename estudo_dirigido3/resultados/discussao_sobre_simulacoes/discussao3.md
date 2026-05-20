## Discussão sobre resultado da simulação 3

* O aliasing ocorre quando a taxa de amostragem é insuficiente para representar corretamente um sinal de alta frequência.

* Ao reduzir a taxa de amostragem (como mostrado no gráfico grafico_simulacao3_2.png), componentes de alta frequência passam a aparecer como frequências menores no espectro (como mostrado na diferença entre os gráficos grafico_simulacao3_3.png e grafico_simulacao3_4.png). Esse efeito provoca distorção e faz com que o sinal original seja interpretado incorretamente.

No experimento:

- o espectro original mostra corretamente a frequência da senoide;
- após a subamostragem, o pico espectral muda de posição;
- isso evidencia o fenômeno de aliasing.