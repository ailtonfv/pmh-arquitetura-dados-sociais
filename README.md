# 📊 Atlas Social de Hortolândia
Arquitetura de Dados Sociais para Políticas Públicas Municipais

Repositório do projeto **Atlas Social de Hortolândia**, iniciativa de
arquitetura de dados sociais aplicada à política socioassistencial do
município de Hortolândia – SP (IBGE: 3519071).

O projeto estrutura uma **infraestrutura analítica mínima** capaz de
compreender e acompanhar a dinâmica da vulnerabilidade social no
território municipal, utilizando dados públicos já existentes e
respeitando integralmente a legislação de proteção de dados (LGPD).

---

## 🧠 Contexto

Hortolândia possui aproximadamente **240 mil habitantes** e cerca de
**73 mil pessoas inscritas no Cadastro Único** — quase **1 em cada 3
moradores**.

Apesar da escala da política socioassistencial, os dados disponíveis
ainda não permitem responder com precisão perguntas fundamentais para
a gestão pública:

- Quem está sendo atendido?
- Onde estão as famílias que não estão sendo atendidas?
- Quanto tempo as famílias permanecem em situação de vulnerabilidade?
- Quantas pessoas conseguem alcançar emancipação social?

O último dado disponível do IPEA para Hortolândia é de **2010**.
Este projeto existe para preencher esse vazio de **16 anos**.

---

## 🧭 Princípio central

> **A arquitetura de dados deve refletir a política pública —
> nunca substituí-la.**

A proposta de modelagem:

- não altera fluxos institucionais
- não cria novos cadastros
- não redefine competências administrativas

Ela apenas organiza os **dados já existentes**, permitindo uma leitura
estratégica, territorial e longitudinal da política socioassistencial
municipal.

---

## 🏗️ Cadeia analítica central
```
Pessoa → Família → Domicílio → Loteamento → Programa Social → Serviço → Resultado
```

A hierarquia territorial adotada é:
```
Loteamento → Núcleo (área de abrangência CRAS) → Região de Planejamento
```

Essa estrutura permite compreender a política socioassistencial como
um **processo**, e não apenas como registros administrativos isolados.

---

## 🧱 Arquitetura de dados (pipeline operacional)

O projeto adota uma estrutura inspirada em **Data Lakehouse**,
organizada em camadas:
```
dados/
├── 01_bruto       → dados originais (imutáveis)
├── 02_limpo       → dados tratados (qualidade técnica)
├── 03_curado      → dados prontos para análise
├── 04_exportacao  → arquivos para consumo (Excel, relatórios)
└── 05_externos    → bases auxiliares (IBGE, etc.)
```

### Pipeline de dados

1. **Ingestão** — dados inseridos em `dados/01_bruto/AAAA_MM/`
2. **Limpeza** — tratamento técnico → `dados/02_limpo/`
3. **Curadoria** — seleção de variáveis analíticas → `dados/03_curado/`
4. **Análise** — realizada via notebooks em `notebooks/`
5. **Exportação** — resultados consolidados em `outputs/`

---

## 📁 Estrutura do projeto (MVP Fase 1)
```
cadunico_projeto/
│
├── dados/
│   └── cadunico/
│       ├── 01_bruto/
│       │   └── 2025_12/
│       │       └── cadunico.csv
│       ├── 02_limpo/
│       │   └── 2025_12/
│       │       └── cadunico_limpo.parquet
│       └── 03_curado/
│           └── 2025_12/
│               └── cadunico_ivsh_base.parquet
│
├── notebooks/
│   ├── 01_exploracao_cadunico.ipynb
│   ├── 02_limpeza_cadunico.ipynb
│   ├── 03_calculo_variaveis_ivsh.ipynb
│   └── 04_consolidacao_ivsh_parcial.ipynb
│
├── scripts/
│   ├── limpeza_cadunico.py
│   └── funcoes_gerais.py
│
├── outputs/
│   ├── tabelas/
│   └── graficos/
│
└── docs/
    ├── metodologia_ivsh.md
    └── notas_tecnicas.md
```

> Pastas `sigas/`, `externos/` e `integracao/` diferidas para quando
> as fontes estiverem disponíveis.

---

## 📂 Estrutura do repositório GitHub

| Diretorio | Conteudo |
| --- | --- |
| `00_governanca` | Principios arquitetonicos, fundamentos institucionais e normativos |
| `01_modelagem_conceitual` | Definicao das entidades centrais da politica social |
| `02_modelagem_logica` | Esquemas de tabelas, dicionarios de dados e DDLs |
| `03_indicadores_mvp` | Definicao dos indicadores estruturantes |
| `04_documentacao_tecnica` | Padroes operacionais (notebooks, nomenclatura, dicionarios) |
| `05_plano_evolutivo` | Roteiro de evolucao do projeto |
| `06_banco_dados` | Banco de dados SQLite (nao versionado) |
| `dados/` | Pipeline de dados (bruto, limpo, curado) |
| `notebooks/` | Processamento e analise dos dados |
| `outputs/` | Resultados analiticos (tabelas e graficos) |

---

## 📊 Modelo de dados (visão simplificada)

### Dimensões principais

- Pessoa
- Família
- Domicílio
- Loteamento / Núcleo / Região de Planejamento
- Programas sociais
- Unidades de atendimento
- Normas jurídicas
- Estruturas de governança

### Tabelas de fatos

- Atendimentos
- Concessão de benefícios
- Participação em programas sociais
- IVS por loteamento (`fato_ivs_loteamento`)

---

## 📈 Metodologia do IVS-H

O projeto replica as **16 variáveis oficiais do IVS/IPEA**, organizadas
em 3 dimensões, e propõe o **IVS-H**: a mesma estrutura calibrada para
a realidade local de Hortolândia, com granularidade territorial
(loteamento) e atualização contínua via CadÚnico.

### Variáveis por dimensão

**Infraestrutura Urbana (IU)**
- IU_01 — domicilios sem agua ou esgoto adequado
- IU_02 — domicilios sem coleta de lixo
- IU_03 — renda baixa com deslocamento prolongado

**Capital Humano (CH)**
- CH_01 — mortalidade infantil
- CH_02 — criancas de 0 a 5 anos fora da escola
- CH_03 — criancas de 6 a 14 anos fora da escola
- CH_04 — maes adolescentes (10 a 17 anos)
- CH_05 — maes chefes de familia sem fundamental e com filhos menores
- CH_06 — analfabetismo
- CH_07 — criancas sem ensino fundamental completo
- CH_08 — jovens nem-nem

**Renda e Trabalho (RT)**
- RT_01 — renda domiciliar per capita baixa
- RT_02 — desocupacao
- RT_03 — informalidade
- RT_04 — idosos em domicilios vulneraveis
- RT_05 — trabalho infantil

### Pesos por dimensão

| Dimensao | Peso IPEA | Peso IVS-H (hipotese local) |
| --- | --- | --- |
| Infraestrutura Urbana | 33% | 15 a 20% |
| Capital Humano | 33% | 40 a 45% |
| Renda e Trabalho | 33% | 35 a 40% |

> A calibracao reflete a alta cobertura de infraestrutura urbana e a
> persistencia de vulnerabilidades em capital humano e renda.

### Abordagem em fases

O IVS-H e construido de forma incremental:

- **Fase 1 — MVP CadUnico**: 5 variaveis disponiveis imediatamente
- **Fase 2 — Expansao**: variaveis adicionais conforme acesso aos dados
- **Convergencia**: o modelo converge para as 16 variaveis do IVS/IPEA
  a medida que as fontes forem disponibilizadas, preservando a
  estrutura original do indice

---

## 📊 Índice de Pressão Social Territorial — IPST-H

Além do IVS-H, o projeto constrói o **IPST-H (Índice de Pressão
Social Territorial de Hortolândia)**.

### Conceito

Enquanto o IVS-H mede a **condição de vulnerabilidade**, o IPST-H
mede a **pressão sobre a rede de atendimento do Estado**.

> "O IVS-H mostra onde está a vulnerabilidade.
> O IPST-H mostra onde a vulnerabilidade se transforma em
> pressão sobre o Estado."

### Dimensões de análise

- densidade de familias vulneraveis por loteamento
- volume de atendimentos realizados
- capacidade instalada da rede (CRAS, CREAS, OSCs)
- demanda potencial nao atendida

### Interpretação conjunta

| IVS-H | IPST-H | Significado |
| --- | --- | --- |
| Alto | Alto | Alta vulnerabilidade e Estado pressionado |
| Alto | Baixo | Vulnerabilidade alta, rede ainda absorvendo |
| Baixo | Alto | Pressao operacional (fluxo, mobilidade, rede insuficiente) |
| Baixo | Baixo | Situacao estavel |

---

## ⚠️ Governança de dados

- Dados em `01_bruto` sao **imutaveis**
- Nenhuma analise deve ser feita diretamente sobre dados brutos
- Cada etapa gera uma nova camada
- Versionamento por periodo (`AAAA_MM`)
- Notebooks seguem cabecalho padrao institucional

---

## 🚫 O que este repositório não contém

Por razões legais e éticas, este repositório **não inclui**:

- dados pessoais
- microdados identificaveis do CadUnico
- informacoes sensiveis de cidadaos
- dados operacionais internos

Inclui apenas:

- estruturas de dados
- documentacao metodologica
- esquemas analiticos
- exemplos sinteticos

---

## 🛠️ Tecnologia utilizada (MVP)

| Camada | Tecnologia |
| --- | --- |
| Processamento de dados | Python + Pandas |
| Banco de dados | SQLite |
| Ambiente analitico | Jupyter Notebook |
| Versionamento | GitHub |
| Proxima etapa | PostgreSQL + pipeline ELT |

---

## 🏛️ Contexto institucional

| | |
| --- | --- |
| Municipio | Hortolandia - SP (IBGE: 3519071) |
| Secretaria | Inclusao e Desenvolvimento Social |
| Responsavel tecnico | Ailton Vendramini |
| Ano de inicio | 2026 |
| Fase atual | MVP - estruturacao e validacao |

---

## 🎯 Objetivo de longo prazo

Construir uma **arquitetura de dados sociais replicável para municípios
brasileiros**, integrando:

- Cadastro Único
- rede socioassistencial
- equipamentos públicos
- organizações da sociedade civil
- análise territorial da vulnerabilidade

---

## 🧭 Diretriz estratégica

> **"O IVS-H não é apenas um indicador — é uma ferramenta de
> integração do governo."**

---

## 📚 Referências

- IPEA (2015) — Atlas da Vulnerabilidade Social
- Kimball, R. — Data Warehouse Toolkit
- McKinney, W. — Python for Data Analysis
- Zaharia et al. — Lakehouse Architecture

---
Como ficaria a árvore no Jupyter
**atlas social/
├── README.md
├── .gitignore
│
├── dados/
│   ├── cadunico/
│   │   ├── 01_bruto/
│   │   │   ├── 2025_12/
│   │   │   │   └── cadunico.csv
│   │   │   └── 2026_03/
│   │   │       └── cadunico.csv
│   │   ├── 02_limpo/
│   │   │   ├── 2025_12/
│   │   │   │   └── cadunico_limpo.parquet
│   │   │   └── 2026_03/
│   │   │       └── cadunico_limpo.parquet
│   │   ├── 03_curado/
│   │   │   ├── 2025_12/
│   │   │   │   └── cadunico_ivsh_base.parquet
│   │   │   └── 2026_03/
│   │   │       └── cadunico_ivsh_base.parquet
│   │   └── 04_exportacao/
│   │       ├── 2025_12/
│   │       │   ├── cadunico_resumo.xlsx
│   │       │   └── cadunico_diagnostico.csv
│   │       └── 2026_03/
│   │           ├── cadunico_resumo.xlsx
│   │           └── cadunico_diagnostico.csv
│   │
│   ├── sigas/
│   │   ├── 01_bruto/
│   │   │   └── 2026_03/
│   │   │       └── sigas.xlsx
│   │   ├── 02_limpo/
│   │   │   └── 2026_03/
│   │   │       └── sigas_limpo.parquet
│   │   ├── 03_curado/
│   │   │   └── 2026_03/
│   │   │       └── sigas_base_integracao.parquet
│   │   └── 04_exportacao/
│   │       └── 2026_03/
│   │           └── sigas_resumo.xlsx
│   │
│   ├── externos/
│   │   ├── ibge/
│   │   │   ├── 01_bruto/
│   │   │   │   └── 2022/
│   │   │   │       └── ibge_setores_hortolandia.parquet
│   │   │   ├── 02_limpo/
│   │   │   │   └── 2022/
│   │   │   │       └── ibge_setores_hortolandia_limpo.parquet
│   │   │   └── 03_curado/
│   │   │       └── 2022/
│   │   │           └── ibge_setores_hortolandia_base.parquet
│   │   ├── territorios/
│   │   │   ├── 01_bruto/
│   │   │   ├── 02_limpo/
│   │   │   └── 03_curado/
│   │   └── auxiliares/
│   │       ├── 01_bruto/
│   │       ├── 02_limpo/
│   │       └── 03_curado/
│   │
│   └── integracao/
│       ├── 01_bruto/
│       ├── 02_limpo/
│       ├── 03_curado/
│       └── 04_exportacao/
│
├── notebooks/
│   ├── cadunico/
│   │   ├── 01_exploracao_cadunico.ipynb
│   │   ├── 02_tratamento_cadunico.ipynb
│   │   ├── 03_analise_variaveis_cadunico.ipynb
│   │   ├── 04_analise_temporal_cadunico.ipynb
│   │   └── 05_calculo_ivsh_cadunico.ipynb
│   │
│   ├── sigas/
│   │   ├── 01_exploracao_sigas.ipynb
│   │   ├── 02_tratamento_sigas.ipynb
│   │   └── 03_analise_sigas.ipynb
│   │
│   ├── externos/
│   │   ├── 01_exploracao_ibge.ipynb
│   │   ├── 02_tratamento_ibge.ipynb
│   │   └── 03_analise_territorial_externos.ipynb
│   │
│   └── integracao/
│       ├── 01_merge_cadunico_sigas.ipynb
│       ├── 02_merge_territorial_integracao.ipynb
│       ├── 03_analise_temporal_integracao.ipynb
│       └── 04_calculo_ivsh_final_integracao.ipynb
│
├── scripts/
│   ├── cadunico/
│   │   ├── leitura_cadunico.py
│   │   ├── limpeza_cadunico.py
│   │   └── curadoria_cadunico.py
│   ├── sigas/
│   │   ├── leitura_sigas.py
│   │   ├── limpeza_sigas.py
│   │   └── curadoria_sigas.py
│   ├── integracao/
│   │   ├── merge_integracao.py
│   │   └── serie_temporal_integracao.py
│   └── utils/
│       ├── funcoes_gerais.py
│       ├── caminhos.py
│       └── validacoes.py
│
├── outputs/
│   ├── tabelas/
│   │   ├── cadunico/
│   │   ├── sigas/
│   │   ├── externos/
│   │   └── integracao/
│   ├── graficos/
│   │   ├── cadunico/
│   │   ├── sigas/
│   │   ├── externos/
│   │   └── integracao/
│   └── relatorios/
│       ├── cadunico/
│       ├── sigas/
│       └── integracao/
│
└── docs/
    ├── metodologia_ivsh.md
    ├── padrao_nomenclatura.md
    ├── regras_negocio.md
    └── notas_tecnicas.md

---


