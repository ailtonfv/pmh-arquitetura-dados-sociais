[ipst_h_v01 (1).md](https://github.com/user-attachments/files/26160218/ipst_h_v01.1.md)
# IPST-H — Índice de Pressão Social Territorial de Hortolândia

**Versão:** v01  
**Data:** "22/03/2026"  
**Responsável:** Ailton Vendramini  
**Projeto:** Atlas Social de Hortolândia  
**Repositório:** `01_modelagem_conceitual/`

---

## Posicionamento no Atlas Social

O Atlas Social de Hortolândia opera com dois níveis de leitura da realidade social. Eles não competem — respondem perguntas diferentes sobre o mesmo território.

| Nível | Índice | Pergunta que responde |
| --- | --- | --- |
| Estrutural | IVS-IPEA / IVS-H | Onde está a vulnerabilidade? |
| Operacional | IPST-H | Onde o Estado está sob pressão? |

> **"O IVS mostra onde está o problema. O IPST-H mostra onde o problema está pressionando o Estado."**

### Interpretação conjunta

A leitura correta do território exige o uso combinado dos dois índices:

| Situação | Interpretação | Implicação para gestão |
| --- | --- | --- |
| IVS alto + IPST-H alto | Alta vulnerabilidade e Estado pressionado | Prioridade máxima — reforço imediato |
| IVS alto + IPST-H baixo | Vulnerabilidade alta, rede ainda absorvendo | Monitorar — pode saturar |
| IVS baixo + IPST-H alto | Pressão operacional: fluxo, mobilidade, rede insuficiente | Investigar causa — território invisível |
| IVS baixo + IPST-H baixo | Situação estável | Manutenção e monitoramento |

> O quadrante **IVS baixo + IPST-H alto** é o mais relevante para a gestão
> operacional. Ele identifica territórios que não aparecem como prioritários
> pelo IVS, mas que exercem pressão real sobre a rede — por fluxo pendular,
> por concentração de casos complexos ou por cobertura insuficiente.

---

## 1. Objetivo

O IPST-H mede a intensidade da pressão social sobre o território, considerando:

- concentração de vulnerabilidade;
- sobrecarga da rede de atendimento;
- lacunas entre demanda identificada e cobertura efetiva.

**Pergunta central:**

> *"Onde o território exerce maior pressão sobre o Estado — e onde a presença pública precisa ser reforçada?"*

---

## 2. Princípio Estruturante

> **Leitura obrigatória antes de qualquer uso do índice.**

### O IPST-H é um instrumento de leitura territorial

Ele **não** é um instrumento de avaliação de desempenho institucional.

O índice mede **condições estruturais do território** — não a eficiência de equipes técnicas, unidades (CRAS, CREAS, OSC) ou gestores públicos.

### Interpretação correta

Alta pressão territorial **não significa falha da rede**.

Significa que a **demanda social excede a capacidade instalada** — e que o território precisa de mais presença do Estado.

| Situação | Leitura correta | Ação recomendada |
| --- | --- | --- |
| Alta pressão | Território sobrecarregado | Reforçar presença do Estado |
| Pressão crescente | Tendência de saturação | Ajuste preventivo |
| Pressão estável | Equilíbrio relativo | Monitoramento |
| Baixa pressão | Demanda residual | Manutenção |

**Diretriz de uso:**

> O IPST-H deve orientar **expansão e priorização territorial** — nunca responsabilização institucional.

---

## 3. Fundamentação Conceitual

O IPST-H se apoia em três referências:

| Pilar | Referência | Contribuição |
| --- | --- | --- |
| Vulnerabilidade social | COSTA & MARGUTI, IPEA, 2015 | Estrutura das 16 variáveis do IVS como base diagnóstica |
| Indicadores sociais | JANNUZZI, 2012 | Uso de indicadores para diagnóstico e decisão, não julgamento |
| Índices compostos | OECD, 2008 | Necessidade de interpretação contextual e normalização |

---

## 4. Estrutura do Índice

O IPST-H é composto por **3 eixos estruturantes**:

```
IPST-H
├── Eixo 1 — Pressão Territorial     (PT)
├── Eixo 2 — Sobrecarga da Rede      (SR)
└── Eixo 3 — Lacunas de Cobertura    (LC)
```

---

### Eixo 1 — Pressão Territorial (PT)

**O que mede:** concentração e intensidade da vulnerabilidade no espaço. Quanto mais vulneráveis, mais próximas e com menos recursos, maior a pressão sobre o loteamento.

| Código | Indicador | Definição operacional | Fonte | Disponível |
| --- | --- | --- | --- | --- |
| PT_01 | Densidade de cadastro | % da população do loteamento registrada no CadÚnico | CadÚnico dez/2025 | Imediato |
| PT_02 | Concentração de baixa renda | % de pessoas com renda per capita ≤ ½ SM no loteamento (RT_01 do IVS-H) | CadÚnico dez/2025 | Imediato |
| PT_03 | Coabitação familiar | % de domicílios com mais de uma família convivente | CadÚnico dez/2025 | Imediato |
| PT_04 | Famílias de alta complexidade | % de famílias com marcadores simultâneos de risco: chefia feminina + baixa escolaridade + filho menor | CadÚnico dez/2025 | Imediato |
| PT_05 | Deslocamento para trabalho | % de pessoas ocupadas com renda ≤ ½ SM que trabalham fora do município | IBGE SIDRA | Curto prazo |
| PT_06 | Deslocamento para estudo | % de pessoas que estudam fora do município | IBGE SIDRA | Curto prazo |

> **Nota sobre PT_05 e PT_06:** Esses indicadores capturam uma forma de
> pressão invisível no IVS — o território não apenas concentra
> vulnerabilidade, mas também expulsa diariamente parte de sua população
> para outros municípios, reduzindo vínculos comunitários e dificultando
> o acompanhamento contínuo pela rede.

---

### Eixo 2 — Sobrecarga da Rede (SR)

**O que mede:** pressão sobre a capacidade instalada do Estado. Não avalia quem opera a rede — avalia se a rede tem condições estruturais de responder à demanda do território.

| Código | Indicador | Definição operacional | Fonte | Disponível |
| --- | --- | --- | --- | --- |
| SR_01 | Razão famílias por CRAS | Número de famílias referenciadas / capacidade referencial da unidade (parâmetros SUAS) | PMH / MDS | Curto prazo |
| SR_02 | Taxa de reincidência | % de famílias com mais de um atendimento no mesmo período por demanda não resolvida | FATO_ATENDIMENTO / SIGAS | Médio prazo |
| SR_03 | Permanência prolongada | Tempo médio de permanência no acompanhamento PAIF acima do parâmetro esperado | CadÚnico / SIGAS | Médio prazo |
| SR_04 | Concentração de alta complexidade | % de casos encaminhados ao CREAS em relação ao total de famílias referenciadas | CREAS / PMH | Curto prazo |
| SR_05 | Tempo de espera | Tempo médio entre demanda registrada e primeiro atendimento efetivo | PMH / SIGAS | Médio prazo |

> **Nota sobre SR_02 e SR_03:** Reincidência e permanência prolongada não
> indicam ineficiência da equipe. Indicam que o território apresenta
> demandas que a política de assistência social, sozinha, não consegue
> resolver — o que reforça a necessidade de resposta intersetorial.

---

### Eixo 3 — Lacunas de Cobertura (LC)

**O que mede:** diferença entre a demanda social identificada e o atendimento efetivamente realizado. Onde há pessoas vulneráveis que o Estado ainda não alcança.

| Código | Indicador | Definição operacional | Fonte | Disponível |
| --- | --- | --- | --- | --- |
| LC_01 | Gap de cobertura | Famílias no CadÚnico sem registro de atendimento ativo nos últimos 12 meses | CadÚnico + FATO_ATENDIMENTO | Imediato |
| LC_02 | Taxa de cobertura CRAS | % de famílias referenciadas com acompanhamento PAIF ativo | PMH / CRAS | Curto prazo |
| LC_03 | Loteamentos sem cobertura proporcional | Loteamentos com IVS-H elevado e cobertura abaixo da média municipal | DIM_LOTEAMENTO + IVS-H | Médio prazo |
| LC_04 | Famílias sem acompanhamento | Famílias em alta vulnerabilidade sem visita ou contato registrado nos últimos 6 meses | CadÚnico / SIGAS | Médio prazo |
| LC_05 | Cobertura OSC | % da demanda atendida por organizações da sociedade civil conveniadas | DIM_OSC / PMH | Médio prazo |

> **Nota sobre LC_01:** Este é o indicador mais imediatamente disponível
> e mais revelador. O cruzamento CadÚnico × FATO_ATENDIMENTO permite
> identificar, por loteamento, o tamanho da fila invisível — famílias
> cadastradas como vulneráveis que ainda não foram alcançadas pela rede.

---

## 5. Fórmula do Índice

### Estrutura geral

```
IPST-H = (Pressão Territorial    × 0,40)
       + (Sobrecarga da Rede      × 0,30)
       + (Lacunas de Cobertura    × 0,30)
```

### Pesos por eixo (hipótese MVP)

| Eixo | Peso | Justificativa |
| --- | --- | --- |
| Pressão Territorial | 40% | Base da análise — sem ela, os outros eixos perdem referência |
| Sobrecarga da Rede | 30% | Depende de dados operacionais com menor cobertura inicial |
| Lacunas de Cobertura | 30% | Complementa a sobrecarga com a visão da demanda não atendida |

> Os pesos serão revisados após o primeiro ciclo de cálculo com dados reais.
> A metodologia seguirá as diretrizes da OCDE (NARDO et al., 2008).

### Normalização

Cada variável deve ser normalizada para escala 0–1 antes da composição:

- **0** → melhor situação (menor pressão)
- **1** → pior situação (maior pressão)

A normalização utiliza o método min-max, aplicado sobre o conjunto de
loteamentos de Hortolândia — tornando o índice comparativo interno ao município.

---

## 6. Estratégia de Implementação

> **Regra de ouro:** Índice completo no papel. Índice mínimo na prática.

### Fase 1 — MVP (executável agora)

Variáveis disponíveis imediatamente no CadÚnico dez/2025:

| Código | Indicador | Eixo |
| --- | --- | --- |
| PT_01 | Densidade de cadastro | Pressão Territorial |
| PT_02 | Concentração de baixa renda | Pressão Territorial |
| PT_03 | Coabitação familiar | Pressão Territorial |
| PT_04 | Famílias de alta complexidade | Pressão Territorial |
| LC_01 | Gap de cobertura | Lacunas de Cobertura |

**Resultado:** IPST-H v0.1 — versão operacional inicial com leitura de
pressão territorial e lacuna de cobertura por loteamento.

### Fase 2 — Expansão

Adicionar quando os dados estiverem disponíveis:

- SR_01 (razão famílias/CRAS)
- SR_04 (concentração alta complexidade)
- LC_02 (taxa de cobertura CRAS)
- PT_05 e PT_06 (deslocamento SIDRA/IBGE)

### Nota de horizonte

> *"O modelo converge para a incorporação de todas as variáveis dos três
> eixos à medida que as fontes forem disponibilizadas, preservando a
> estrutura original do índice."*

A versão completa integrará dados de saúde (e-SUS), educação (INEP/SME)
e dados IBGE por setor censitário — expandindo a capacidade analítica
sem alterar a arquitetura conceitual.

---

## 7. Modelo de Dados

### Tabela principal

```sql
FATO_IPST_LOTEAMENTO
├── id_loteamento          FK → DIM_LOTEAMENTO
├── periodo_referencia     formato: YYYY ou YYYY-MM
├── pressao_territorial    valor normalizado (0–1)
├── sobrecarga_rede        valor normalizado (0–1)
├── lacuna_cobertura       valor normalizado (0–1)
├── ipsth_geral            índice composto (0–1)
├── flag_mvp               indica se calculado com variáveis MVP
└── data_calculo
```

### Dependências

```
FATO_IPST_LOTEAMENTO
├── DIM_LOTEAMENTO
├── DIM_FAMILIA
├── FATO_ATENDIMENTO
└── DIM_OSC
```

---

## 8. Produtos Analíticos

O IPST-H gera três entregáveis principais:

**1. Ranking por loteamento**
Lista ordenada pelo índice IPST-H (0–1), permitindo identificar os
territórios sob maior pressão e comparar evolução entre períodos.

**2. Mapa territorial**
Visualização geográfica com intensidade de pressão por loteamento.
Cor indica o índice IPST-H. Tamanho proporcional à população vulnerável.
Combinado com o mapa do IVS-H, permite a leitura conjunta dos dois índices.

**3. Painel executivo**
- Top 10 loteamentos críticos
- Evolução temporal por eixo
- Cobertura por rede (CRAS, CREAS, OSC)
- Cruzamento IVS-H × IPST-H por núcleo

---

## 9. Uso na Gestão Pública

O IPST-H permite:

- **priorizar territórios** — com base em evidência, não em percepção
- **alocar equipes** — onde a pressão é maior e a cobertura é menor
- **justificar expansão de serviços** — com dado quantificado por loteamento
- **orientar políticas intersetoriais** — identificando onde Inclusão, Saúde e Educação precisam atuar juntas
- **demonstrar evidência** — para gestão, conselho e instâncias de controle

---

## 10. Limitações

| Limitação | Impacto | Mitigação |
| --- | --- | --- |
| Subcobertura do CadÚnico | Famílias vulneráveis não cadastradas ficam invisíveis | Busca ativa + atualização cadastral contínua |
| Renda autodeclarada | Subestimação da vulnerabilidade real | Cruzamento com CAGED quando disponível |
| Ausência inicial de dados IBGE detalhados | Variáveis PT_05 e PT_06 aguardam SIDRA | Implementadas na Fase 2 |
| Cobertura parcial da rede | LC_02 a LC_05 dependem de SIGAS estruturado | Implementadas progressivamente |

---

## 11. Governança

| Regra | Detalhe |
| --- | --- |
| Dados sensíveis | Não versionados no GitHub — armazenados localmente |
| Scripts de cálculo | Versionados no repositório |
| Metodologia | Auditável e documentada neste arquivo |
| Interpretação | Sempre territorial — nunca institucional |

### Versionamento

| Versão | Descrição |
| --- | --- |
| v0.1 | MVP — PT_01 a PT_04 + LC_01 |
| v0.2 | Expansão — SR e LC completos |
| v1.0 | Completo — todos os eixos, dados IBGE integrados |

---

## Referências

COSTA, M. A.; MARGUTI, B. O. *Atlas da Vulnerabilidade Social nos Municípios Brasileiros*. Brasília: IPEA, 2015.

JANNUZZI, P. M. *Indicadores Sociais no Brasil: conceitos, fontes de dados e aplicações*. 5. ed. Campinas: Alínea, 2012.

OECD. *Handbook on Constructing Composite Indicators*. OECD Publishing, 2008.

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "22/03/2026" | Criação — posicionamento metodológico completo; 3 eixos com 16 variáveis definidas operacionalmente; fórmula, pesos e normalização; estratégia de implementação em fases; modelo de dados; interpretação conjunta IVS-H × IPST-H |

---

*Documento de modelagem conceitual — Atlas Social de Hortolândia*  
*Uso interno — Secretaria de Inclusão e Desenvolvimento Social*
