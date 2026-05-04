[ipst_h_v05.md](https://github.com/user-attachments/files/27362277/ipst_h_v05.md)
# IPST-H — Índice de Pressão Social Territorial de Hortolândia

**Versão:** v05
**Data:** "04/05/2026"
**Responsável:** Ailton Vendramini
**Projeto:** Atlas Social de Hortolândia
**Repositório:** `01_modelagem_conceitual/`

---

## Posicionamento no Atlas Social

O Atlas Social de Hortolândia opera com três instrumentos complementares.
Eles não competem — respondem perguntas distintas e necessárias.

| Instrumento | Natureza | Base | O que responde |
|-------------|----------|------|----------------|
| IVS-H | Estrutural | CadÚnico + IBGE (estático) | Onde o problema existe |
| IPST-H | Dinâmica | Dados de fluxo (atendimentos, serviços) | Onde o problema pressiona a prefeitura agora |
| IPSO-H | Narrativa | Corpus jornalístico (Tribuna Liberal) | Como isso está sendo percebido |

> **"O IVS explica o problema. O IPST mostra a pressão. O IPSO conta a história.
> Juntos, eles governam a decisão."**

---

## Interpretação conjunta — IVS-H × IPST-H

| Situação | Interpretação | Implicação para gestão |
|----------|---------------|------------------------|
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
|----------|---------|------|
| Alta pressão | Sobrecarga estrutural | Expandir Estado |
| Pressão crescente | Tendência de saturação | Ajuste preventivo |
| Pressão estável | Equilíbrio relativo | Monitorar |
| Baixa pressão | Demanda residual | Manter |

---

## 3. Escopo e Restrições Metodológicas

> **Decisão de "04/05/2026":** o IPST-H não começa como índice fechado.
> Começa como **painel de pressão mensurável** — e só se transforma em
> índice quando houver série histórica, critérios estabilizados e
> defensabilidade técnica.

### Critério único de entrada

Só entra no IPST-H o que for **mensurável + recorrente + auditável**.

| Entra | Não entra |
|-------|-----------|
| Atendimentos CRAS/CREAS (contagem + data) | Percepção / opinião |
| Demanda reprimida (solicitações sem atendimento) | Notícia de jornal → IPSO-H |
| Tempo de espera (média + distribuição) | Interpretação analítica subjetiva |
| Benefícios concedidos vs solicitados (razão + série) | Evento isolado sem recorrência |
| Ocupação de serviços (% + data) | Variáveis estruturais de vulnerabilidade → IVS-H |

### O que o IPST-H NÃO é

| NÃO é | Motivo |
|-------|--------|
| "IVS 2.0" | O IVS mede estrutura; o IPST-H mede tensão do sistema público local |
| Ranking de unidades | Unidades refletem território, não desempenho |
| Avaliação de equipe | Pressão não é variável humana |
| Instrumento de punição | Diagnóstico ≠ responsabilização |
| Métrica de produtividade | Mede contexto, não produção |

> Alta pressão é argumento para **mais recurso** — nunca para cobrança.

### Trajetória planejada

O IPST-H será construído em três etapas — nunca pulando etapas:

| Etapa | O que produz | Condição de avanço |
|-------|--------------|-------------------|
| **1 — Sinais (MVP)** | 3 indicadores operacionais de fluxo — ver Seção 3.1 | Confirmar que os dados existem, são acessíveis e formam série |
| **2 — Painel de Pressão** | Séries temporais, variação %, sazonalidade, comparação entre núcleos | Instrumento gerencial operacional — sem índice ainda |
| **3 — Índice (condicional)** | Fórmula fechada com pesos validados | Mínimo 12 meses de série + aprovação metodológica documentada |

> ⚠️ Não vamos começar pelo índice. Vamos começar pelos sinais.

---

### 3.1 MVP — Três Indicadores Operacionais de Fluxo

**Decisão de "04/05/2026".**
Os três indicadores abaixo são o primeiro entregável do IPST-H.
Juntos respondem: *"o sistema está dando conta — e a situação está piorando ou melhorando?"*

| Indicador | Nome de apresentação | O que mostra |
|-----------|---------------------|--------------|
| TA | Capacidade de resposta | Se o sistema consegue atender a demanda que chega |
| CD | Tendência da pressão | Se a pressão está aumentando ou diminuindo |
| TME | Tempo de espera do cidadão | Onde há fila / gargalo |

---

#### TA — Taxa de Atendimento

```
TA = Atendimentos realizados no período
     ─────────────────────────────────────
     Demandas registradas no período
```

| Leitura | Interpretação |
|---------|---------------|
| TA ≈ 1 | Sistema acompanhando a demanda |
| TA < 1 | Pressão acumulando — déficit de atendimento |

**Fonte:** CRAS / CREAS / SIGAS — registros de entrada e atendimento.

---

#### CD — Crescimento da Demanda

```
CD = Demandas(t) − Demandas(t−1)
     ────────────────────────────
          Demandas(t−1)
```

| Leitura | Interpretação |
|---------|---------------|
| CD > 0 | Pressão crescendo |
| CD < 0 | Pressão aliviando |

**Fonte:** mesma base do TA — série mensal é suficiente.

---

#### TME — Tempo Médio de Espera

```
TME = Σ (data do atendimento − data da solicitação)
      ──────────────────────────────────────────────
                  nº de atendimentos
```

| Leitura | Interpretação |
|---------|---------------|
| TME alto | Fila longa / gargalo estrutural |
| TME baixo | Fluxo mais eficiente |

**Fonte:** SIGAS — registros com data de entrada e data de atendimento.

---

**Dependência crítica:** os três indicadores dependem dos dados do SIGAS.
Responsável pelo acesso: Caio. Status: 7 respostas pendentes.

> Fallback: os indicadores podem ser iniciados com planilhas manuais dos
> CRAS, desde que contenham data de solicitação e data de atendimento.

---

## 4. Fundamentação Conceitual

| Pilar | Referência |
|-------|------------|
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
|--------|-----------|----------------------|-------|--------|
| PT_01 | Densidade de cadastro | Famílias CadÚnico por domicílio particular (Censo 2022) | CadÚnico + Censo 2022 | Imediato |
| PT_02 | Baixa renda (RT_01) | % pessoas com renda per capita ≤ 1/2 SM | CadÚnico | Imediato |
| PT_03 | Coabitação familiar | % domicílios com mais de uma família convivente | CadÚnico | Imediato |
| PT_04 | Alta complexidade familiar | % famílias com chefia feminina + baixa escolaridade + filho menor de 15 anos | CadÚnico | Imediato |
| PT_05 | Deslocamento trabalho | % pessoas ocupadas com renda ≤ 1/2 SM que trabalham fora do município | SIDRA | Curto prazo |
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
|--------|-----------|----------------------|-------|--------|
| SR_01 | Razão famílias por CRAS | Famílias referenciadas / capacidade referencial SUAS | PMH / MDS | Curto prazo |
| SR_02 | Taxa de reincidência | % famílias com mais de um atendimento no período por demanda não resolvida | FATO_ATENDIMENTO / SIGAS | Médio prazo |
| SR_03 | Permanência prolongada | Tempo médio de acompanhamento PAIF acima do parâmetro esperado | CadÚnico / SIGAS | Médio prazo |
| SR_04 | Concentração alta complexidade | % casos encaminhados ao CREAS em relação ao total referenciado | CREAS / PMH | Curto prazo |
| SR_05 | Tempo de espera | Tempo médio entre demanda registrada e primeiro atendimento | PMH / SIGAS | Médio prazo |

> SR_02 e SR_03 não indicam ineficiência da equipe — indicam que o
> território exige resposta intersetorial que a assistência social
> sozinha não consegue prover.

> **Nota de correspondência MVP:** TA antecipa SR_01/SR_04; TME antecipa SR_05;
> CD é indicador temporal transversal sem equivalente direto nos eixos.

---

### Eixo 3 — Lacunas de Cobertura (LC)

**O que mede:** diferença entre vulnerabilidade identificada e
atendimento efetivamente realizado.

| Código | Indicador | Definição operacional | Fonte | Status |
|--------|-----------|----------------------|-------|--------|
| LC_01 | Gap de cobertura | Famílias no CadÚnico sem atendimento ativo nos últimos 12 meses | CadÚnico + FATO_ATENDIMENTO | Imediato |
| LC_02 | Taxa de cobertura CRAS | % famílias referenciadas com acompanhamento PAIF ativo | PMH / CRAS | Curto prazo |
| LC_03 | Loteamentos sem cobertura proporcional | Loteamentos com IVS-H elevado e cobertura abaixo da média municipal | DIM_LOTEAMENTO + IVS-H | Médio prazo |
| LC_04 | Famílias sem acompanhamento | Famílias em alta vulnerabilidade sem contato registrado nos últimos 6 meses | CadÚnico / SIGAS | Médio prazo |
| LC_05 | Cobertura OSC | % da demanda atendida por organizações conveniadas | DIM_OSC / PMH | Médio prazo |

> **LC_01 é o indicador mais revelador da Fase 2:**
> cruza CadÚnico × FATO_ATENDIMENTO para mapear, por loteamento,
> a fila invisível — famílias cadastradas como vulneráveis ainda não
> alcançadas pela rede.

---

## 6. Fórmula

```
IPST-H = (PT × w1) + (SR × w2) + (LC × w3)
```

### Pesos iniciais (MVP)

| Eixo | Peso | Justificativa |
|------|------|---------------|
| Pressão Territorial | 40% | Base da análise — sem ela, os outros eixos perdem referência |
| Pressão Operacional | 30% | Depende de dados com menor cobertura inicial |
| Lacunas de Cobertura | 30% | Complementa a pressão operacional |

> Pesos são hipótese inicial — recalibrados após análise empírica de
> variância entre loteamentos.

### Normalização

Min-max por loteamento — comparação interna ao município:

- **0** → menor pressão
- **1** → maior pressão

Metodologia: OECD (NARDO et al., 2008).

---

## 7. Estratégia de Implementação

> **Regra de ouro:** índice completo no papel. Índice mínimo na prática.

### Fase 1 — MVP Operacional (TA + CD + TME)

Ver definição completa na **Seção 3.1**.

| Indicador | Fonte | Dependência |
|-----------|-------|-------------|
| TA — Taxa de Atendimento | SIGAS / planilhas CRAS | Caio (SIGAS) ou coordenadores |
| CD — Crescimento da Demanda | mesma base do TA | idem |
| TME — Tempo Médio de Espera | SIGAS (data entrada + data atendimento) | Caio (SIGAS) |

**Resultado:** painel de pressão operacional mensal — sem índice, com valor gerencial imediato.

### Fase 2 — MVP Territorial (PT + LC)

Quando disponível o linkage endereço → loteamento:

| Código | Indicador | Eixo |
|--------|-----------|------|
| PT_01 | Densidade de cadastro | PT |
| PT_02 | Concentração de baixa renda | PT |
| PT_03 | Coabitação familiar | PT |
| PT_04 | Alta complexidade familiar | PT |
| LC_01 | Gap de cobertura | LC |

**Resultado:** IPST-H v0.2 — leitura de pressão e lacuna por loteamento.

### Fase 3 — Expansão

Adicionar quando disponíveis: SR_01, SR_04, LC_02, PT_05, PT_06.

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

---

## 9. Produtos Analíticos

**Painel MVP Fase 1** — TA, CD e TME por unidade (CRAS / CREAS), série mensal.
Três métricas, uma linha do tempo, uma leitura gerencial.

**Ranking por loteamento** — lista ordenada pelo IPST-H (0–1). Disponível na Fase 2.

**Mapa de pressão** — visualização por loteamento, combinada com o mapa do IVS-H.

**Painel executivo** — top 10 loteamentos sob maior pressão, cruzamento IVS-H × IPST-H.

---

## 10. Limitações

| Limitação | Impacto | Mitigação |
|-----------|---------|-----------|
| CadÚnico ≠ população total | Famílias não cadastradas ficam invisíveis | Busca ativa + atualização cadastral contínua |
| Renda autodeclarada | Possível subestimação da vulnerabilidade real | Cruzamento com CAGED quando disponível |
| PT_05 e PT_06 dependem de SIDRA | Deslocamento aguarda dados IBGE | Implementadas na Fase 3 |
| SR e LC parciais no MVP | Eixos 2 e 3 incompletos na versão inicial | Expansão progressiva conforme dados |
| TA/CD/TME dependem do SIGAS | MVP Fase 1 bloqueado sem acesso ao SIGAS | Planilhas manuais dos CRAS como fallback |

---

## 11. Governança

| Regra | Detalhe |
|-------|---------|
| Dados sensíveis | Não versionados no GitHub — armazenados localmente |
| Scripts de cálculo | Versionados no repositório |
| Metodologia | Auditável e documentada neste arquivo |
| Interpretação | Sempre por loteamento — nunca institucional |

### Versionamento do índice

| Versão | Descrição |
|--------|-----------|
| v0.1 | MVP Operacional — TA + CD + TME (Fase 1) |
| v0.2 | MVP Territorial — PT_01 a PT_04 + LC_01 (Fase 2) |
| v0.3 | Expansão — SR e LC completos (Fase 3) |
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
|--------|------|------------|
| v01 | "22/03/2026" | Criação — posicionamento metodológico completo; 3 eixos; fórmula, pesos e normalização; estratégia em fases; modelo de dados |
| v02 | "22/03/2026" | Eixo 2 renomeado. PT_01 redefinido. Pesos: hipótese inicial. |
| v03 | "23/03/2026" | Estrutura compactada. Pasta corrigida: `01_modelagem_conceitual/`. |
| v04 | "04/05/2026" | Três instrumentos (IVS-H / IPST-H / IPSO-H). Seção 3: escopo e restrições metodológicas; critério único de entrada; trajetória em 3 etapas. |
| v05 | "04/05/2026" | Seção 3.1 (nova): MVP dos três indicadores operacionais de fluxo — TA, CD, TME; fórmulas, leituras, fontes; dependência SIGAS/Caio; fallback planilhas manuais. Seção 7 reestruturada: Fase 1 (MVP Operacional), Fase 2 (MVP Territorial), Fase 3 (Expansão). Seção 9: painel MVP Fase 1 adicionado. Seção 10: limitação TA/CD/TME adicionada. Seção 11: versionamento atualizado v0.1 a v1.0. Nota de correspondência MVP nos eixos SR. |

---

*Documento de modelagem conceitual — Atlas Social de Hortolândia*
*Uso interno — Secretaria de Inclusão e Desenvolvimento Social*
