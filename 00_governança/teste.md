# Atlas Social de Hortolândia
**Fechamento do Dia — 14 e 15 de março de 2026**
**Responsável:** Ailton Vendramini

---

# 1. Problema Técnico Resolvido — Upload GitHub

Durante a sessão foi identificado e resolvido um problema recorrente de formatação no envio de arquivos ao GitHub. O método anterior (copiar do VS Code ou Bloco de Notas e colar) distorcia as tabelas Markdown, convertendo pipes `|` em tabulações e inserindo barras de escape nos underscores.

**Solução definitiva adotada:**

```
Baixar o arquivo gerado pelo Claude
↓
Abrir o editor do GitHub (github.com/.../edit/...)
↓
Ctrl+A → Delete para limpar o conteúdo existente
↓
Arrastar o arquivo da pasta Downloads para dentro do editor
↓
Confirmar o commit
```

> O método de arrastar faz o GitHub ler o arquivo diretamente do disco,
> sem nenhum programa intermediário que interprete ou converta o Markdown.
> **Esse é o protocolo definitivo para todos os uploads futuros.**

---

# 2. Pendências do Dia 13 — Encerradas

Os 4 arquivos identificados no fechamento do dia 13 como pendentes foram concluídos:

| Arquivo | Atualização | Status |
|---|---|---|
| `dim_orgao_executor_v03.md` | Data corrigida; log v03 adicionado | ✅ Commitado |
| `arquitetura_dados_IVS_IBGE_Horto_v03.md` | Já estava atualizado no repositório | ✅ Confirmado |
| `ivs_vs_ivsh_comparativo_v04.md` | Já estava atualizado no repositório; formatação corrigida via arrastar | ✅ Commitado |
| `dim_variavel_IVS_v01r4.md` | RT_01 confirmada com CadÚnico como fonte primária; log v01r4 adicionado | ✅ Commitado |

---

# 3. Trabalho Autônomo no IVS-H — Ailton

## 3.1 Dicionário metodológico consolidado

O arquivo `DIM_VARIAVEL_IVS_v01r4` passa a funcionar como dicionário metodológico do índice, com as 16 variáveis estruturadas por dimensão, nível de análise, fonte de dados municipal e disponibilidade operacional.

**Referência principal:** COSTA, M. A.; MARGUTI, B. O. *Atlas da Vulnerabilidade Social nos Municípios Brasileiros*. IPEA, 2015.

## 3.2 Estrutura dimensional confirmada

| Dimensão | Nº de variáveis | Peso IPEA | Peso IVS-H (hipótese) |
|---|---|---|---|
| Infraestrutura Urbana | 3 | 33% | ~15–20% |
| Capital Humano | 8 | 33% | ~40–45% |
| Renda e Trabalho | 5 | 33% | ~35–40% |

## 3.3 Disponibilidade de dados — 5 variáveis imediatas

| Variável | Dimensão | Fonte |
|---|---|---|
| IVS008 — CH_05 | Capital Humano | CadÚnico |
| IVS009 — CH_06 | Capital Humano | CadÚnico |
| IVS010 — CH_07 | Capital Humano | CadÚnico |
| IVS012 — RT_01 | Renda e Trabalho | CadÚnico |
| IVS015 — RT_04 | Renda e Trabalho | CadÚnico |

## 3.4 Decisão metodológica — RT_01 e Censo 2022

**Confirmado:** o IBGE não publicou renda domiciliar per capita por setor censitário no Censo 2022. O arquivo disponível contém apenas `V06004` (rendimento médio do responsável), que não equivale à renda per capita familiar.

**Decisão adotada:** RT_01 será calculada com base no CadÚnico como fonte primária, até publicação futura do IBGE.

## 3.5 Conceito de MVP analítico

O projeto passa a operar em duas camadas:

| Camada | Variáveis | Objetivo |
|---|---|---|
| IVS-H MVP | 5 (disponíveis imediatamente no CadÚnico) | Primeiros indicadores, validação metodológica, início da análise territorial |
| IVS-H Completo | 16 (modelo original) | Após integração intersetorial com Saúde, Educação, CAGED e Censo 2022 |

**Estrutura do MVP:**

| Dimensão | Variáveis |
|---|---|
| Capital Humano | IVS008, IVS009, IVS010 |
| Renda e Trabalho | IVS012, IVS015 |

> A dimensão Infraestrutura Urbana será incorporada posteriormente.

## 3.6 Arquitetura analítica em três escalas

| Escala | Instrumento |
|---|---|
| Família | Índice de Vulnerabilidade Familiar |
| Território | IVS-H |
| Programas | Indicadores de atendimento |

> Essa arquitetura transforma o projeto em um sistema de inteligência social territorial.

## 3.7 Próximo passo técnico definido

Construção da **tabela operacional de variáveis do IVS-H**, com os seguintes campos:

```
id_variavel
cod_variavel
dimensao
usar_no_mvp
peso_inicial
direcao
```

Essa tabela permitirá iniciar o cálculo do índice.

---

# 4. Garimpo Jornalístico — Tribuna Liberal 14 e 15/03/2026

## 4.1 Dado de alta relevância — Medidas protetivas

Hortolândia registrou **94 medidas protetivas** em janeiro e fevereiro de 2026 — o **maior volume absoluto** entre 6 municípios da região (Sumaré, Nova Odessa, Paulínia, Americana e Monte Mor), com crescimento de **+11,9%** em relação ao mesmo período de 2025.

**Fonte:** TJ-SP a pedido do Tribuna Liberal, 15/03/2026.

**Conexões com o modelo:**
- Demanda real sobre `CRAM_01` e `CREAS_01`
- Variável auxiliar para Capital Humano (CH_04)
- Dado externo publicado, datado e auditável — adequado para uso na apresentação de março

## 4.2 Caso Nicolly Pogere — interface CREAS/Conselho Tutelar

Adolescente de 15 anos assassinada em Hortolândia em julho/2025. Casal de adolescentes de 14 e 17 anos apreendido em operação interestadual. Mãe mobiliza campanha pela "Lei Nicolly Pogere" com meta de 20 mil assinaturas até 28/03/2026 para envio ao Senado Federal.

**Conexão com o modelo:** interface CREAS/Conselho Tutelar; variáveis CH_03 e CH_08 do IVS-H.

## 4.3 Contexto político — Cafu César (vice-prefeito)

STJ reduziu cautelares impostas ao vice-prefeito Carlos Augusto César (Cafu), investigado na Operação Coffee Break. MPF não o incluiu entre os acusados na denúncia. Decisão abre caminho para retorno ao cargo.

---

# 5. Arquivos Atualizados na Sessão

## 5.1 `dim_orgao_executor_v04.md` — ⏳ Aguarda upload

**Mudanças em relação ao GitHub atual:**

| | Mudança |
|---|---|
| Cabeçalho | Data: `2026-03-15` |
| Log | Entrada v03 adicionada (correção IBGE 3519070→3519071) |
| CRAM_01 | Campo `observacoes` preenchido: 94 medidas protetivas jan-fev/2026, fonte TJ-SP/Tribuna Liberal |
| Log | Entrada v04 adicionada |

> **Atenção:** após commitar, renomear o arquivo de `v03.md` para `v04.md` no editor do GitHub.

## 5.2 `notas_arquiteturais_programas_sociais_v03.md` — ⏳ Aguarda upload

**Mudanças em relação ao GitHub atual:**

| | Mudança |
|---|---|
| Nota 18 | Medidas protetivas: 94 casos jan-fev/2026, maior volume da região |
| Nota 19 | Caso Nicolly Pogere — interface CREAS/CT; implicações para CH_03 e CH_08 |
| Seção 2 | Ponto cego de violência doméstica adicionado |
| Seção 10 | Indicador de medidas protetivas adicionado à tabela de contexto |
| Pendência #27 | Monitorar Lei Nicolly Pogere — mudança no ECA afeta fluxo modelado |

> **Atenção:** após commitar, renomear o arquivo de `v02.md` para `v03.md` no editor do GitHub.

---

# 6. Situação do Projeto — Etapas

| Etapa | Status |
|---|---|
| Curadoria de variáveis IBGE | ✅ Concluída |
| Estruturação do repositório IVS | ✅ Concluída |
| Filtro municipal 3519071 — 7 arquivos | ✅ Concluída |
| Integração com IVS oficial IPEA (BigQuery) | ✅ Concluída |
| Decisão sobre grupos populacionais | ✅ Concluída |
| Dicionário metodológico (DIM_VARIAVEL_IVS_v01r4) | ✅ Concluída |
| Arquitetura analítica MVP definida | ✅ Concluída |
| Tabela operacional de variáveis (próxima etapa) | ⏳ Próxima sessão |
| Definição de pesos IVS-H | ⏳ Próxima sessão |
| Normalização das variáveis | ⏳ Próxima sessão |
| Cálculo do IVS-H | ⏳ Próxima sessão |

---

# 7. Agenda para a Próxima Sessão

| Prioridade | Ação |
|---|---|
| 1 | Subir `dim_orgao_executor_v04.md` e `notas_arquiteturais_programas_sociais_v03.md` via arrastar |
| 2 | Construir tabela operacional de variáveis do IVS-H (`id_variavel`, `cod_variavel`, `dimensao`, `usar_no_mvp`, `peso_inicial`, `direcao`) |
| 3 | Definir pesos IVS-H e iniciar normalização das variáveis |
| 4 | Iniciar cálculo do IVS-H MVP com as 5 variáveis do CadÚnico |

---

*Atlas Social de Hortolândia — Secretaria de Inclusão e Desenvolvimento Social — uso interno*
