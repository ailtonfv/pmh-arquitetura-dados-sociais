[dim_dinamica_metropolitana_v03.md](https://github.com/user-attachments/files/26057021/dim_dinamica_metropolitana_v03.md)
# DIM_DINAMICA_METROPOLITANA — Dinâmica Metropolitana do Trabalho
**Versão:** v03  
**Data:** "17/03/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 01_modelagem_conceitual

> Este documento define o bloco analítico **Dinâmica Metropolitana do Trabalho** —
> conjunto de indicadores estruturais que contextualiza o IVS-H dentro da realidade
> econômica regional de Hortolândia.
>
> **Não contém:**
> - Cálculo do IVS-H → `dim_variavel_IVS_v01r4.md`
> - Cobertura de serviços por núcleo → `REL_PROGRAMA_NUCLEO` (a criar)
> - Vínculos empregatícios individuais → `FATO_INSERCAO_PRODUTIVA` (a criar)

---

## Princípio Estruturante

Este bloco analítico opera em plano distinto do IVS-H.

```
IVS-H                              DIM_DINAMICA_METROPOLITANA
──────────────────────────         ──────────────────────────────────────
fenômeno: vulnerabilidade          fenômeno: estrutura econômica
escala:   família                  escala:   município / arranjo regional
unidade:  pessoa → loteamento      unidade:  município → arranjo populacional
ciclo:    anual (dados admin.)     ciclo:    decenal (Censo) / contínuo (PNAD)
```

> **Separação conceitual obrigatória:**
> Incorporar indicadores pendulares dentro do cálculo do IVS-H misturaria
> fenômenos de escalas diferentes e quebraria a comparabilidade com o IVS
> nacional do IPEA. A Dinâmica Metropolitana é um **segundo eixo analítico** —
> complementar ao IVS-H, nunca integrante dele.

---

## 1. Motivação

Hortolândia integra o **Arranjo Populacional de Campinas/SP** (IBGE, 2016),
concentração urbana de 1,87 milhão de habitantes. O índice de integração
do município com o arranjo é **0,42** — um dos mais altos do conjunto.

Esse fenômeno não é capturado pelo IVS-H, que opera na escala família/loteamento.
Sem este bloco, o Atlas Social ficaria sem resposta para a pergunta:

> *Um núcleo com IVS-H alto é vulnerável por déficit de infraestrutura local —
> ou porque depende estruturalmente de emprego externo ao município?*

Causas diferentes exigem respostas de política pública diferentes.

---

## 2. Tipologia de Município — Por que a Taxa de Entrada é Essencial

O saldo pendular sozinho não distingue situações economicamente opostas.

| cidade | saídas | entradas | saldo | tipo real |
|--------|--------|----------|-------|-----------|
| A | 60 mil | 10 mil | -50 mil | Dormitório |
| B | 60 mil | 50 mil | -10 mil | Integrado |

O saldo é negativo nas duas — mas a estrutura econômica é totalmente diferente.
A taxa de entrada é essencial para classificar corretamente o município.

| tipo | saída | entrada | saldo | interpretação |
|------|-------|---------|-------|---------------|
| DORMITORIO | alta | baixa | negativo grande | depende de emprego externo |
| EQUILIBRADO | moderada | moderada | próximo de zero | mercado de trabalho local suficiente |
| POLO_EMPREGO | baixa | alta | positivo | atrai trabalhadores de outros municípios |
| INTEGRADO | alta | alta | variável | forte interdependência regional |

---

## 3. Estrutura da Dimensão

### 3.1 Entidade principal

```
DIM_DINAMICA_METROPOLITANA
──────────────────────────
id_registro               PK
id_municipio              código IBGE — 3519071 para Hortolândia
nome_municipio            Hortolândia
nome_arranjo              Campinas/SP
ano_referencia            ano do dado (2010 | 2022 | ...)
fonte                     IBGE_ARRANJOS | CENSO | PNAD
data_referencia
observacoes
```

### 3.2 Indicadores de fluxo

```
-- Fluxos absolutos
saidas_trabalho            residentes que trabalham fora do município
saidas_estudo              residentes que estudam fora do município
entradas_trabalho          não residentes que trabalham no município
entradas_estudo            não residentes que estudam no município

-- Indicadores calculados
taxa_saida_pendular        saidas_trabalho / populacao_ocupada_residente
taxa_entrada_pendular      entradas_trabalho / empregos_localizados_municipio
saldo_pendular             entradas_trabalho - saidas_trabalho
indice_integracao          saidas_totais / populacao_residente
                           (metodologia IBGE — Arranjos Populacionais 2016)
```

### 3.3 Custo social da mobilidade

```
tempo_medio_deslocamento_min    tempo médio casa-trabalho em minutos
proporcao_deslocamento_longo    proporção com deslocamento > 1 hora
```

> O tempo médio de deslocamento é variável presente no IVS original do IPEA
> (dimensão Infraestrutura Urbana). Para Hortolândia, com índice de integração
> 0,42, esse indicador tem peso estrutural elevado.

### 3.4 Classificação tipológica

```
tipo_municipio    derivado dos indicadores acima
                  DORMITORIO | EQUILIBRADO | POLO_EMPREGO | INTEGRADO
```

---

## 4. Dados Disponíveis no Projeto

| indicador | valor | ano | fonte |
|-----------|-------|-----|-------|
| saidas_trabalho + saidas_estudo | 58.472 | 2010 | IBGE — Arranjos Populacionais 2016, Tabela 1.1, p. 78 |
| indice_integracao | 0,42 | 2010 | IBGE — Arranjos Populacionais 2016, Tabela 1.1, p. 78 |
| nome_arranjo | Campinas/SP | — | IBGE |
| municipio_desmembrado_apos_1988 | Sim (Sumaré, 1991) | — | IBGE |
| proporcao_ate_30min | 59,8% (56.072 trabalhadores) | 2022 | IBGE — Censo Demográfico 2022, SIDRA Tabela 10330 |
| proporcao_30_60min | 27,1% (25.419 trabalhadores) | 2022 | IBGE — Censo Demográfico 2022, SIDRA Tabela 10330 |
| proporcao_mais_1hora | 12,7% (11.909 trabalhadores) | 2022 | IBGE — Censo Demográfico 2022, SIDRA Tabela 10330 |
| total_trabalhadores_deslocamento | 93.791 | 2022 | IBGE — Censo Demográfico 2022, SIDRA Tabela 10330 |

> **Interpretação:** 40,2% dos trabalhadores de Hortolândia levam mais de 30 minutos
> para chegar ao trabalho. Esse dado, combinado com o índice de integração 0,42,
> caracteriza Hortolândia como município de **integração regional elevada** —
> com pressão estrutural sobre famílias vulneráveis que dependem de transporte
> intermunicipal para acessar emprego.

**Posição territorial oficial — BET/IBGE 2024:**

Fonte: IBGE. *Banco de Estruturas Territoriais (BET) — Relatório de Divisão Territorial Brasileira*. Data base: 31/12/2024.

| campo | valor |
|-------|-------|
| UF | 35 — São Paulo |
| Região Geográfica Intermediária | 3510 — Campinas |
| Região Geográfica Imediata | 350038 — Campinas |
| Código Município Completo | 3519071 — Hortolândia |

> A Região Geográfica Intermediária de Campinas (3510 — metodologia IBGE 2017)
> é a referência territorial oficial mais atual para o arranjo regional
> ao qual Hortolândia pertence. Equivale funcionalmente ao Arranjo Populacional
> de Campinas documentado na Seção 1 deste arquivo.

---

## 5. Fontes de Dados

| indicador | fonte primária | disponibilidade |
|-----------|---------------|-----------------|
| saidas_trabalho, indice_integracao | IBGE — Arranjos Populacionais (2016) | disponível — 2010 |
| tempo de deslocamento por faixa | IBGE — Censo Demográfico 2022, SIDRA 10330 | disponível — 2022 |
| entradas_trabalho | Censo Demográfico — matriz origem-destino (microdados) | indisponível — ver Nota Metodológica |
| taxa_saida_pendular | Calculado a partir do Censo | pendente — requer cálculo |
| taxa_entrada_pendular | Calculado a partir do Censo / RAIS municipal | pendente — requer cálculo |
| saldo_pendular | Calculado | pendente — requer cálculo |
| municipios_destino_trabalhadores | Microdados da amostra — Censo 2022 | indisponível — ver Nota Metodológica |
| tipo_municipio | Derivado dos indicadores acima | pendente — após entradas disponíveis |

---

## 6. Nota Metodológica — Limitação de Dados de Fluxo Origem-Destino

> Consulta formal ao IBGE realizada em "17/03/2026" confirmou que os
> **microdados da amostra do Censo Demográfico 2022** não têm previsão
> de liberação.

A indisponibilidade dos microdados da amostra do Censo 2022 impede a construção
de matrizes origem-destino detalhadas. O modelo IVS-H adota proxies validados
de mobilidade (tempo de deslocamento e proporção de trabalhadores fora do
município), mantendo robustez analítica e aderência à literatura.

**Implicações para o modelo:**

- O indicador `entradas_trabalho` permanece pendente até liberação dos microdados
  ou uso alternativo de RAIS (município de vínculo empregatício)
- A classificação `tipo_municipio` será estimada com base nos dados disponíveis
  (saídas 2010 + proxies de tempo de deslocamento 2022), com nota de limitação
- O saldo pendular completo (entradas − saídas) não pode ser calculado no ciclo atual

**Alternativa disponível sem microdados:**

A RAIS/CAGED permite identificar vínculos empregatícios por município de trabalho,
oferecendo proxy para `entradas_trabalho` (trabalhadores com vínculo em Hortolândia
residentes em outros municípios). Essa extração está no roadmap do Produto 2.

---

## 7. Uso Analítico — Cruzamento com IVS-H por Núcleo

Quando o IVS-H por núcleo estiver calculado (Produto 3), o cruzamento
com a Dinâmica Metropolitana revela padrões de vulnerabilidade estrutural:

| núcleo | IVS-H | saída pendular | interpretação |
|--------|-------|----------------|---------------|
| alto | alto | alta | vulnerabilidade estrutural metropolitana — depende de mobilidade para sobreviver |
| alto | alto | baixa | vulnerabilidade interna — emprego e infraestrutura locais insuficientes |
| baixo | baixo | alta | integração regional — baixa vulnerabilidade |
| baixo | alto | alta | pressão sobre serviços locais por atração regional |

> Núcleos com **IVS-H alto + alta saída pendular + tempo de deslocamento longo**
> concentram a combinação mais crítica: famílias vulneráveis que dependem
> de transporte intermunicipal para acessar o único emprego disponível.
> Esse é o conceito de **vulnerabilidade estrutural metropolitana**.

---

## 8. Relação com Outros Componentes do Modelo

```
DIM_DINAMICA_METROPOLITANA
  └─ contextualiza: IVS-H (não integra — planos analíticos distintos)
  └─ cruza com:    DIM_NUCLEO (análise por núcleo — Produto 3)
  └─ alimenta:     FATO_INDICADOR (quando valores forem carregados)
  └─ subsidia:     DIM_PROGRAMA (orientação de qualificação profissional)
                   → quais cursos oferecer com base nos setores que
                     absorvem trabalhadores de Hortolândia no arranjo
```

---

## 9. Posição no Roadmap

> Esta dimensão **não é requisito para o MVP (Produto 1)**.
> O dado de 2010 já disponível pode ser carregado como registro histórico a qualquer momento.
> A dimensão completa integra naturalmente o **Produto 3 — IVS-H Consolidado Territorial**.

| etapa | ação | fonte | status |
|-------|------|-------|--------|
| 1 | Registrar dados já disponíveis (saídas e índice 2010) | IBGE Arranjos Populacionais | dado disponível |
| 2 | Registrar dados de tempo de deslocamento 2022 | IBGE Censo 2022, SIDRA 10330 | concluído — "17/03/2026" |
| 3 | Confirmar disponibilidade dos microdados do Censo 2022 | IBGE | concluído — indisponível, sem previsão |
| 4 | Explorar RAIS como proxy para entradas_trabalho | MTE/RAIS | roadmap Produto 2 |
| 5 | Calcular indicadores derivados e classificar tipo_municipio | — | pendente — após etapa 4 |
| 6 | Cruzar com IVS-H por núcleo | IVS-H + DIM_NUCLEO | Produto 3 |

---

## Pendências

| # | pendência | prioridade | status |
|---|-----------|------------|--------|
| P01 | Extrair matriz origem-destino do Censo 2010 para obter entradas_trabalho | Média | aberta |
| P02 | Microdados Censo 2022 — matriz município de destino | Média | **encerrada** — IBGE confirmou indisponibilidade em "17/03/2026" |
| P03 | Calcular taxa_saida_pendular com dados populacionais | Média | parcialmente atendida — proxy via SIDRA 10330 |
| P04 | Classificar tipo_municipio | Baixa | pendente após P01 |
| P05 | Cruzar com IVS-H por núcleo quando Produto 3 estiver disponível | Baixa | aberta |
| P06 | Avaliar RAIS como alternativa para entradas_trabalho | Média | roadmap Produto 2 |

---

## Log de Alterações

| versão | data | alterações |
|--------|------|------------|
| v01 | "15/03/2026" | Criação — bloco Dinâmica Metropolitana do Trabalho; 4 indicadores pendulares; tipologia de município; dado IBGE 2010 registrado; cruzamento com IVS-H por núcleo definido; posição no roadmap (Produto 3) |
| v02 | "16/03/2026" | Seção 4: BET/IBGE 2024 (data base 31/12/2024) confirmando posição territorial oficial. Cabeçalho corrigido: pasta `02_modelagem_lógica` → `01_modelagem_conceitual` |
| v03 | "17/03/2026" | Seção 4: dados de tempo de deslocamento por faixa (SIDRA 10330, Censo 2022) — 93.791 trabalhadores, 59,8% ate 30min, 27,1% 30-60min, 12,7% mais de 1h. Seção 5: status atualizado. Seção 6 (nova): Nota Metodológica — limitação de dados de fluxo origem-destino; consulta formal ao IBGE em "17/03/2026" confirmou indisponibilidade dos microdados sem previsão de liberação; texto de proxy adotado registrado; alternativa RAIS documentada. Pendência P02 encerrada; P06 adicionada. Roadmap atualizado. |

---

*Documento de modelagem conceitual — 01_modelagem_conceitual/*  
*Atlas Social de Hortolândia — uso interno*
