## Discussão sobre resultado da simulação 4

* Sem o uso de janela, o espectro apresenta vazamento espectral, pois o sinal finito não contém um número inteiro de períodos dentro da janela de observação. Isso provoca espalhamento de energia para frequências vizinhas.

* Ao aplicar a janela de Hamming, as extremidades do sinal são suavizadas, reduzindo as descontinuidades no início e no fim do trecho analisado. Com isso:

- o vazamento espectral diminui;
- os lóbulos laterais ficam menores;
- o espectro fica mais limpo.

* Por outro lado, a janela também alarga o pico principal, reduzindo um pouco a resolução em frequência.