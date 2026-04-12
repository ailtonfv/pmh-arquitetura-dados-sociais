[ipst_h_v03.md](https://github.com/user-attachments/files/26193457/ipst_h_v03.md)
# IPST-H — Índice de Pressão Social Territorial de Hortolândia

**Versão:** v03  
**Data:** "23/03/2026"  
**Responsável:** Ailton Vendramini  
**Projeto:** Atlas Social de Hortolândia  
**Repositório:** `01_modelagem_conceitual/`

---

## Posicionamento no Atlas Social

O Atlas Social de Hortolândia opera com dois níveis complementares
de leitura da realidade social. Eles não competem — respondem
perguntas distintas e necessárias.

| Nível | Índice | Pergunta que responde |
| --- | --- | --- |
| Estrutural | IVS-IPEA / IVS-H | Onde está a vulnerabilidade? |
| Operacional | IPST-H | Onde a vulnerabilidade se transforma em pressão sobre o Estado? |

> **"O IVS mostra onde está a vulnerabilidade. O IPST-H mostra onde a
> vulnerabilidade se transforma em pressão sobre o Estado."**

---

## Interpretação conjunta

A leitura correta exige o uso combinado dos dois índices:

| Situação | Interpretação | Implicação para gestão |
| --- | --- | --- |
| IVS alto + IPST-H alto | Alta vulnerabilidade e Estado pressionado | Prioridade máxima |
| IVS alto + IPST-H baixo | Vulnerabilidade alta, rede ainda absorvendo | Monitorar |
| IVS baixo + IPST-H alto | Pressão operacional invisível ao IVS | Investigar causa |
| IVS baixo + IPST-H baixo | Situação estável | Manutenção |

> O quadrante **IVS baixo + IPST-H alto** é o mais estratégico:
> revela pressão real onde o IVS não aponta prioridade — por fluxo
> pendular, concentração de casos complexos ou cobertura insuficiente.

---

## 1. Objetivo

O IPST-H mede a intensidade da pressão social sobre o território,
considerando:

- concentração de vulnerabilidade identificada;
- pressão sobre a rede de atendimento;
- lacunas entre demanda e cobertura.

**Pergunta central:**

> *"Onde a presença do Estado precisa ser ampliada com urgência?"*

---

## 2. Princípio Estruturante

### O IPST-H é um instrumento de leitura do território

Ele **não avalia desempenho institucional**.

Mede condições estruturais — não qualidade de gestão.

---

### O IPST-H mede demanda identificada — não demanda total

O índice é calculado sobre a população registrada no CadÚnico.

> CadÚnico ≠ população total

Portanto:

- mede pressão **observável**
- subestima pressão **real**

**Implicação direta:**
> Busca ativa é parte obrigatória da estratégia analítica.

---

### Interpretação correta

Alta pressão ≠ falha da rede  
Alta pressão = demanda > capacidade instalada

| Situação | Leitura | Ação |
| --- | --- | --- |
| Alta pressão | Sobrecarga estrutural | Expandir Estado |
| Pressão crescente | Tendência de saturação | Ajuste preventivo |
| Pressão estável | Equilíbrio relativo | Monitorar |
| Baixa pressão | Demanda residual | Manter |

---

## 3. O que o IPST-H NÃO é

| NÃO é | Motivo |
| --- | --- |
| Ranking de unidades | Unidades refletem território, não desempenho |
| Avaliação de equipe | Pressão não é variável humana |
| Instrumento de punição | Diagnóstico ≠ responsabilização |
| Métrica de produtividade | Mede contexto, não produção |

> Alta pressão é argumento para **mais recurso** — nunca para cobrança.

---

## 4. Fundamentação Conceitual

| Pilar | Referência |
| --- | --- |
| Vulnerabilidade social | COSTA & MARGUTI (IPEA, 2015) |
| Indicadores sociais | JANNUZZI (2012) |
| Índices compostos | OECD (2008) |

---

## 5. Estrutura do Índice

```
IPST-H
├── Pressão Territorial (PT)
├── Pressão Operacional sobre a Rede (SR)
└── Lacunas de Cobertura (LC)
```

---

### Eixo 1 — Pressão Territorial (PT)

**O que mede:** intensidade e concentração da vulnerabilidade.

| Código | Indicador | Definição operacional | Fonte | Status |
| --- | --- | --- | --- | --- |
| PT_01 | Densidade de cadastro | Famílias CadÚnico por domicílio particular (Censo 2022) — evita comparação direta CadÚnico vs população total | CadÚnico + Censo 2022 | Imediato |
| PT_02 | Baixa renda (RT_01) | % pessoas com renda per capita menor ou igual a meio SM | CadÚnico | Imediato |
| PT_03 | Coabitação familiar | % domicílios com mais de uma família convivente | CadÚnico | Imediato |
| PT_04 | Alta complexidade familiar | % famílias com chefia feminina + baixa escolaridade + filho menor de 15 anos | CadÚnico | Imediato |
| PT_05 | Deslocamento trabalho | % pessoas ocupadas com renda menor ou igual a meio SM que trabalham fora do município | SIDRA | Curto prazo |
| PT_06 | Deslocamento estudo | % pessoas que frequentam estabelecimento de ensino fora do município | SIDRA | Curto prazo |

> PT_05 e PT_06 capturam pressão invisível ao IVS: o território expulsa
> diariamente parte de sua população para outros municípios, dificultando
> o acompanhamento contínuo pela rede.

---

### Eixo 2 — Pressão Operacional sobre a Rede (SR)

**O que mede:** tensão sobre a capacidade instalada do Estado.
Não avalia quem opera a rede — avalia se a rede tem condições de
responder à demanda.

| Código | Indicador | Definição operacional | Fonte | Status |
| --- | --- | --- | --- | --- |
| SR_01 | Razão famílias por CRAS | Famílias referenciadas / capacidade referencial SUAS | PMH / MDS | Curto prazo |
| SR_02 | Taxa de reincidência | % famílias com mais de um atendimento no período por demanda não resolvida | FATO_ATENDIMENTO / SIGAS | Médio prazo |
| SR_03 | Permanência prolongada | Tempo médio de acompanhamento PAIF acima do parâmetro esperado | CadÚnico / SIGAS | Médio prazo |
| SR_04 | Concentração alta complexidade | % casos encaminhados ao CREAS em relação ao total referenciado | CREAS / PMH | Curto prazo |
| SR_05 | Tempo de espera | Tempo médio entre demanda registrada e primeiro atendimento | PMH / SIGAS | Médio prazo |

> SR_02 e SR_03 não indicam ineficiência da equipe — indicam que o
> território exige resposta intersetorial que a assistência social
> sozinha não consegue prover.

---

### Eixo 3 — Lacunas de Cobertura (LC)

**O que mede:** diferença entre vulnerabilidade identificada e
atendimento efetivamente realizado.

| Código | Indicador | Definição operacional | Fonte | Status |
| --- | --- | --- | --- | --- |
| LC_01 | Gap de cobertura | Famílias no CadÚnico sem atendimento ativo nos últimos 12 meses | CadÚnico + FATO_ATENDIMENTO | Imediato |
| LC_02 | Taxa de cobertura CRAS | % famílias referenciadas com acompanhamento PAIF ativo | PMH / CRAS | Curto prazo |
| LC_03 | Loteamentos sem cobertura proporcional | Loteamentos com IVS-H elevado e cobertura abaixo da média municipal | DIM_LOTEAMENTO + IVS-H | Médio prazo |
| LC_04 | Famílias sem acompanhamento | Famílias em alta vulnerabilidade sem contato registrado nos últimos 6 meses | CadÚnico / SIGAS | Médio prazo |
| LC_05 | Cobertura OSC | % da demanda atendida por organizações conveniadas | DIM_OSC / PMH | Médio prazo |

> **LC_01 é o indicador mais imediatamente disponível e mais revelador.**
> Cruza CadÚnico × FATO_ATENDIMENTO para mapear, por loteamento, a fila
> invisível — famílias cadastradas como vulneráveis ainda não alcançadas
> pela rede. É o primeiro entregável analítico do MVP.

---

## 6. Fórmula

```
IPST-H = (PT × w1) + (SR × w2) + (LC × w3)
```

### Pesos iniciais (MVP)

| Eixo | Peso | Justificativa |
| --- | --- | --- |
| Pressão Territorial | 40% | Base da análise — sem ela, os outros eixos perdem referência |
| Pressão Operacional | 30% | Depende de dados com menor cobertura inicial |
| Lacunas de Cobertura | 30% | Complementa a pressão operacional |

> Pesos são hipótese inicial — recalibrados após análise empírica de
> variância entre loteamentos. Pesos fixos prematuros viram dogma;
> pesos calibrados viram evidência.

### Normalização

Min-max por loteamento — comparação interna ao município:

- **0** → menor pressão
- **1** → maior pressão

Metodologia: OECD (NARDO et al., 2008).

---

## 7. Estratégia de Implementação

> **Regra de ouro:** índice completo no papel. Índice mínimo na prática.

### Fase 1 — MVP (executável agora)

| Código | Indicador | Eixo |
| --- | --- | --- |
| PT_01 | Densidade de cadastro | PT |
| PT_02 | Concentração de baixa renda | PT |
| PT_03 | Coabitação familiar | PT |
| PT_04 | Alta complexidade familiar | PT |
| LC_01 | Gap de cobertura | LC |

**Resultado:** IPST-H v0.1 — leitura imediata de pressão e lacuna por loteamento.

### Fase 2 — Expansão

Adicionar quando disponíveis:

- SR_01, SR_04
- LC_02
- PT_05, PT_06

### Nota de horizonte

> *"O modelo converge para a incorporação de todas as variáveis dos três
> eixos à medida que as fontes forem disponibilizadas, preservando a
> estrutura original do índice."*

---

## 8. Modelo de Dados

```sql
FATO_IPST_LOTEAMENTO
├── id_loteamento           FK → DIM_LOTEAMENTO
├── periodo_referencia      formato: YYYY ou YYYY-MM
├── pressao_territorial     valor normalizado (0–1)
├── pressao_operacional     valor normalizado (0–1)
├── lacuna_cobertura        valor normalizado (0–1)
├── ipsth_geral             índice composto (0–1)
├── flag_mvp                1 = calculado com variáveis MVP
└── data_calculo
```

**Dependências:**

```
FATO_IPST_LOTEAMENTO
├── DIM_LOTEAMENTO
├── DIM_FAMILIA
├── FATO_ATENDIMENTO
└── DIM_OSC
```

---

## 9. Produtos Analíticos

**Ranking por loteamento** — lista ordenada pelo IPST-H (0–1), com
comparação entre períodos.

**Mapa de pressão** — visualização por loteamento, combinada com o
mapa do IVS-H para leitura conjunta dos dois índices.

**Painel executivo** — top 10 loteamentos sob maior pressão, evolução
por eixo, cobertura por rede, cruzamento IVS-H × IPST-H por núcleo.

---

## 10. Limitações

| Limitação | Impacto | Mitigação |
| --- | --- | --- |
| CadÚnico ≠ população total | Famílias não cadastradas ficam invisíveis | Busca ativa + atualização cadastral contínua |
| Renda autodeclarada | Possível subestimação da vulnerabilidade real | Cruzamento com CAGED quando disponível |
| PT_05 e PT_06 dependem de SIDRA | Deslocamento intermunicipal aguarda dados IBGE | Implementadas na Fase 2 |
| SR e LC parciais no MVP | Eixos 2 e 3 incompletos na versão inicial | Expansão progressiva conforme dados |

---

## 11. Governança

| Regra | Detalhe |
| --- | --- |
| Dados sensíveis | Não versionados no GitHub — armazenados localmente |
| Scripts de cálculo | Versionados no repositório |
| Metodologia | Auditável e documentada neste arquivo |
| Interpretação | Sempre por loteamento — nunca institucional |

### Versionamento do índice

| Versão | Descrição |
| --- | --- |
| v0.1 | MVP — PT_01 a PT_04 + LC_01 |
| v0.2 | Expansão — SR e LC completos |
| v1.0 | Completo — todos os eixos, dados IBGE integrados |

---

## Referências

COSTA, M. A.; MARGUTI, B. O. *Atlas da Vulnerabilidade Social nos
Municípios Brasileiros*. Brasília: IPEA, 2015.

JANNUZZI, P. M. *Indicadores Sociais no Brasil: conceitos, fontes de
dados e aplicações*. 5. ed. Campinas: Alínea, 2012.

OECD. *Handbook on Constructing Composite Indicators*. OECD Publishing,
2008.

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "22/03/2026" | Criação — posicionamento metodológico completo; 3 eixos com 16 variáveis; fórmula, pesos e normalização; estratégia em fases; modelo de dados |
| v02 | "22/03/2026" | Eixo 2 renomeado para "Pressão Operacional sobre a Rede". PT_01 redefinido com denominador domicílios Censo 2022. Seção 3 criada. Pesos: de fixos para hipótese inicial. Frase síntese atualizada. |
| v03 | "23/03/2026" | Estrutura compactada e reorganizada: linguagem mais direta, seções mais curtas, tabelas enxutas. Nome completo preservado: "Índice de Pressão Social **Territorial**" (o T do IPST-H é parte do nome). Seções 9–11 mantidas em forma resumida (proteção metodológica e rastreabilidade). Definições operacionais dos indicadores mantidas — removê-las comprometeria auditabilidade. Pasta corrigida: `01_modelagem_conceitual/` (arquivo atualmente em `02_modelagem_lógica/` por erro de localização). |

---

*Documento de modelagem conceitual — Atlas Social de Hortolândia*  
*Uso interno — Secretaria de Inclusão e Desenvolvimento Social*
