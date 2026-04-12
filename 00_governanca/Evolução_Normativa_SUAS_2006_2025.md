# EVOLUÇÃO NORMATIVA DO SUAS MUNICIPAL — HORTOLÂNDIA (2006–2025)
**Responsável:** Atlas Social de Hortolândia — Arquitetura de Dados Socioassistencial  
**Data de consolidação:** 03/03/2026  
**Última atualização:** 09/03/2026 (v02)

---

## 1. Introdução

Este documento consolida a evolução normativa da Política Municipal de Assistência Social de Hortolândia, identificando os marcos estruturantes, regulamentadores e operacionais que fundamentam o Sistema Único de Assistência Social (SUAS) no âmbito municipal.

O objetivo é vincular a arquitetura jurídica à arquitetura de dados do Atlas Social de Hortolândia.

---

## 2. Fase I — Estrutura Inicial (2006–2017)

### Marcos
- Lei nº 1.723/2006 — Criação do Conselho Municipal do Idoso e Fundo Municipal
- Série de Leis de Subvenção (2012–2017)
- Conferências Municipais periódicas

### Características
- Modelo baseado em subvenção a entidades
- Execução indireta predominante
- Governança participativa ativa

### Impacto na modelagem

| Dimensão no documento (v01) | Dimensão correta no modelo |
|---|---|
| `DIM_CONSELHO` | `DIM_COLEGIADOS` |
| `DIM_ENTIDADE` | `DIM_OSC` |
| `REL_NORMA_ENTIDADE` | `REL_NORMA_ENTIDADE` *(a confirmar)* |
| `FATO_REPASSE` | `FATO_REPASSE` *(histórico — a implementar)* |

---

## 3. Fase II — Ajustes e Pandemia (2019–2020)

### Marcos
- Decretos de remanejamento orçamentário (2019–2020)
- Lei nº 3.780/2020 — Crédito especial

### Características
- Reorganização financeira
- Ajustes emergenciais
- Aumento expressivo de movimentação orçamentária

### Impacto na modelagem
- `DIM_NORMA_JURIDICA` (categoria: financeira)
- Monitoramento de execução orçamentária

---

## 4. Fase III — Institucionalização Formal do SUAS (2021–2022)

### Lei nº 3.911/2021
Dispõe sobre a Política Municipal de Assistência Social e institui o SUAS municipal.

### Características
- Consolidação normativa do sistema
- Formalização da política pública
- Base jurídica estruturante

### Impacto na modelagem

| Dimensão no documento (v01) | Dimensão correta no modelo |
|---|---|
| `DIM_POLITICA_PUBLICA` | `DIM_PROGRAMAS_SOCIAIS` |
| `DIM_SERVICO` | `DIM_PROGRAMAS_SOCIAIS` |
| `DIM_UNIDADE` | `DIM_UNIDADES_ATENDIMENTO` |
| `DIM_TERRITORIALIDADE` | `DIM_LOTEAMENTO` / `DIM_REGIAO_PLANEJAMENTO` / `DIM_NUCLEO` |

> **Nota:** O modelo do Atlas Social não adota "Território" como entidade analítica. A unidade territorial de referência é o **Loteamento**, agrupado em **Região de Planejamento** e operacionalizado via **Núcleo** (área de abrangência do CRAS).

### Lei nº 3.955/2022
*(Conteúdo a registrar — pendente de descrição pelo responsável do projeto)*

---

## 5. Fase IV — Regulamentação Operacional (2025)

### Decreto nº 5.598/2025
Regulamenta os procedimentos e fluxos para concessão dos benefícios eventuais, conforme art. 28 da Lei 3.911/2021.

### Características
- Define critérios de elegibilidade
- Define fluxo operacional
- Define responsabilidades técnicas
- Vincula execução ao SUAS municipal

### Impacto direto na modelagem
- `DIM_BENEFICIO_EVENTUAL`
- `FATO_CONCESSAO_BENEFICIO`
- Regras de elegibilidade vinculadas ao CadÚnico
- Registro da norma vigente na concessão

---

## 6. Linha do Tempo Consolidada

```
2006 — Conselho e Fundo Municipal (Lei nº 1.723/2006)
2012–2017 — Subvenções recorrentes a entidades (DIM_OSC)
2019–2020 — Ajustes financeiros e pandemia
2021 — Instituição formal do SUAS (Lei nº 3.911/2021)
2022 — Lei nº 3.955/2022 ⟵ descrição pendente
2023 — XIV Conferência Municipal
2025 — XV Conferência + Regulamentação dos Benefícios Eventuais (Decreto nº 5.598/2025)
```

---

## 7. Veredicto Técnico

O município de Hortolândia possui arcabouço jurídico maduro e suficiente para sustentar:
- Sistema de dados estruturado
- Monitoramento analítico da política pública
- Rastreabilidade normativa
- Conformidade jurídica das concessões

O Atlas Social de Hortolândia deve refletir explicitamente a **Lei nº 3.911/2021** e o **Decreto nº 5.598/2025** como normas estruturantes do modelo de dados.

---

*Documento gerado em 03/03/2026.*  
*Atualizado em 09/03/2026 (v02): correção do nome do projeto (Atlas Social de Hortolândia), alinhamento dos nomes das dimensões ao modelo vigente, eliminação de "Território" como entidade, inclusão da Lei nº 3.955/2022 na linha do tempo (descrição pendente).*
