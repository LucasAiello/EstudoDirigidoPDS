# Questão 1:
**Discussão Técnica:** No contexto agrícola, o filtro permitiu eliminar o ruído induzido na fiação do sensor pelo circuito de alimentação de motores ou da rede elétrica local, mantendo intacta a dinâmica lenta do ecossistema estudado.

# Questão 2:
O filtro FIR (finito) projetado com a janela de Hamming funcionou como um limitador de banda eficaz, limpando as oscilações rápidas indesejadas e deixando apenas a tendência real da variável medida. A principal vantagem observada aqui é a garantia de estabilidade e a ausência de distorção de fase, permitindo que os picos e vales do sinal limpo coincidam perfeitamente no tempo com o sinal original.

# Questão 3:
**Discussão Técnica:** Para microcontroladores de baixo custo em campo (nós IoT agrícolas), o filtro IIR de ordem 3 consome muito menos processamento e memória RAM do que o FIR de 51 coeficientes, entregando um nível de atenuação de ruído equivalente.

# Questão 4:
* O filtro IIR Butterworth oferece uma transição extremamente íngreme após a frequência de corte de 10 Hz com uma estrutura matemática simples, o que significa que ele elimina frequências altas de interferência de forma muito mais agressiva com pouquíssimo custo computacional.

* O filtro FIR, por outro lado, apresenta lóbulos secundários (oscilações na banda de rejeição) causados pelo efeito de Gibbs devido ao truncamento da janela de Hamming. Para obter a mesma taxa de atenuação do IIR, o FIR exigiria um aumento massivo na quantidade de coeficientes (taps), demandando mais memória do hardware.

# Questão 5:
**Discussão Técnica:** No ambiente de automação no campo, garantir que os polos fiquem estritamente dentro do círculo unitário assegura que o filtro nunca entrará em oscilação descontrolada (instabilidade), evitando leituras errôneas enviadas ao tomador de decisão.

# Questão 6:
* A resposta ao impulso do FIR cai exatamente para zero após 51 amostras. Isso significa que qualquer transiente ou erro que entrar no filtro sumirá completamente do sistema após esse tempo.

* No filtro IIR, a resposta ao impulso decai exponencialmente, mas estende-se infinitamente devido à realimentação de saídas anteriores (recursividade). Em sistemas de controle agrícola críticos, escolher o IIR exige atenção para garantir que esses "ecos" de transientes passados não atrasem a estabilização de uma leitura real.

# Questão 7:
Na manutenção preditiva de tratores e colheitadeiras, os sensores de vibração captam um espectro complexo: o balanço do terreno (baixa frequência) e atritos mecânicos diversos (alta frequência). Ao aplicarmos o filtro passa-faixa sintonizado entre 38 Hz e 52 Hz, conseguimos isolar cirurgicamente a frequência nominal de rotação do motor ($45Hz). A análise espectral via FFT comprovou o sucesso do isolamento, permitindo que um algoritmo de diagnóstico monitore apenas a integridade do motor, ignorando os ruídos das irregularidades do solo ou da esteira.

# Questão 8:
**Discussão Técnica:** Para tomada de decisões críticas baseadas no tempo preciso do evento (ex: pulso de acionamento de um bico atomizador de defensivo), a linearidade de fase do FIR garante que a forma e a temporização do sinal não sofram distorção geométrica.

# Questão 9:
* No filtro FIR, o atraso de grupo é perfeitamente plano (constante) para todas as frequências. Isso garante que o formato do sinal não se dissipe, o que é vital para decodificar dados sem erros em redes de comunicação de sensores (como módulos LoRa ou ZigBee).

* No filtro IIR, o atraso é altamente variável, especialmente perto da frequência de corte. Se esse sinal filtrado for usado para acionar um sistema de corte de fluxo em tempo real (ex: interromper a irrigação ao atingir um nível crítico), o atraso variável do IIR poderia introduzir uma latência imprevisível, prejudicando a precisão da automação.

# Questão 10:
**Discussão Técnica:** Com o filtro implementado na Etapa 10, os ruídos de chaveamento eletrônico e as oscilações térmicas de alta frequência foram suprimidos com sucesso. O tomador de decisão (ou algoritmo automatizado de irrigação) agora recebe uma curva limpa da umidade real do solo, evitando desperdício de água ou estresse hídrico na plantação.