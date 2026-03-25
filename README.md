# 📊 Atlas Social de Hortolândia  
Arquitetura de Dados Sociais para Políticas Públicas Municipais

Repositório do projeto **Atlas Social de Hortolândia**, iniciativa de arquitetura de dados sociais aplicada à política socioassistencial do município de Hortolândia – SP.

O projeto busca estruturar uma **infraestrutura analítica mínima** capaz de compreender e acompanhar a dinâmica da vulnerabilidade social no território municipal, utilizando dados públicos já existentes e respeitando integralmente a legislação de proteção de dados.

---

## 🧠 Contexto

Hortolândia possui aproximadamente **240 mil habitantes** e cerca de **73 mil pessoas inscritas no Cadastro Único** — quase **1 em cada 3 moradores**.

Apesar da escala da política socioassistencial, os dados disponíveis ainda não permitem responder com precisão perguntas fundamentais para a gestão pública:

- Quem está sendo atendido?  
- Onde estão as famílias que não estão sendo atendidas?  
- Quanto tempo as famílias permanecem em situação de vulnerabilidade?  
- Quantas pessoas conseguem alcançar emancipação social?  

Este projeto busca estruturar uma **infraestrutura analítica mínima** capaz de responder a essas perguntas de forma sistemática.

---

## 🧭 Princípio central

> **A arquitetura de dados deve refletir a política pública — nunca substituí-la.**

A proposta de modelagem:

- não altera fluxos institucionais  
- não cria novos cadastros  
- não redefine competências administrativas  

Ela apenas organiza os **dados já existentes**, permitindo uma leitura estratégica, territorial e longitudinal da política socioassistencial municipal.

---

## 🏗️ Arquitetura analítica do projeto

A lógica analítica do Atlas Social organiza a política pública na seguinte cadeia:
Pessoa → Família → Domicílio → Loteamento → Programa Social → Serviço → Resultado

A hierarquia territorial adotada é:
Loteamento → Núcleo (área de abrangência CRAS) → Região de Planejamento


Essa estrutura permite compreender a política socioassistencial como um **processo**, e não apenas como registros administrativos isolados.

---

## 🧱 Arquitetura de dados (pipeline operacional)

O projeto adota uma estrutura inspirada em **Data Lakehouse**, organizada em camadas:

dados/
├── 01_bruto → dados originais (imutáveis)
├── 02_limpo → dados tratados (qualidade técnica)
├── 03_curado → dados prontos para análise
├── 04_exportacao → arquivos para consumo (Excel, relatórios)
└── 05_externos → bases auxiliares (IBGE, etc.)


### 🔁 Pipeline de dados

1. **Ingestão**  
   Dados são inseridos em `dados/01_bruto/AAAA_MM/`

2. **Limpeza**  
   Tratamento técnico → `dados/02_limpo/`

3. **Curadoria**  
   Seleção de variáveis analíticas (IVS-H) → `dados/03_curado/`

4. **Análise**  
   Realizada via notebooks em `notebooks/`

5. **Exportação**  
   Resultados consolidados em:
   - `dados/04_exportacao/`
   - `outputs/`

---

## 📂 Estrutura do repositório

| Diretório | Conteúdo |
|---|---|
| `00_governanca` | Princípios arquitetônicos, fundamentos institucionais e normativos |
| `01_modelagem_conceitual` | Definição das entidades centrais da política social |
| `02_modelagem_logica` | Esquemas de tabelas, dicionários de dados e DDLs |
| `03_indicadores_mvp` | Definição dos indicadores estruturantes |
| `04_documentacao_tecnica` | Padrões operacionais (notebooks, nomenclatura, dicionários) |
| `05_plano_evolutivo` | Roteiro de evolução do projeto |
| `06_banco_dados` | Banco de dados SQLite (não versionado) |
| `dados/` | Pipeline de dados (bruto → limpo → curado) |
| `notebooks/` | Processamento e análise dos dados |
| `outputs/` | Resultados analíticos (tabelas e gráficos) |

---

## 📊 Modelo de dados (visão simplificada)

O modelo segue princípios de **modelagem dimensional analítica**.

### Dimensões principais

- Pessoa  
- Família  
- Domicílio  
- Loteamento / Núcleo / Região  
- Programas sociais  
- Unidades de atendimento  
- Normas jurídicas  
- Estruturas de governança  

### Tabelas de fatos

- Atendimentos  
- Concessão de benefícios  
- Participação em programas sociais  
- IVS por loteamento (`fato_ivs_loteamento`)  

Essas estruturas permitem análises **territoriais, temporais e institucionais** da política pública.

---

## 📈 Índice de Vulnerabilidade Social — IVS-H

O projeto adota o **IVS (IPEA)** como referência metodológica e propõe o **IVS-H**, calibrado à realidade local.

| Dimensão | Peso IPEA | Peso IVS-H (hipótese) |
|---|---|---|
| Infraestrutura Urbana | 33% | ~15–20% |
| Capital Humano | 33% | ~40–45% |
| Renda e Trabalho | 33% | ~35–40% |

A calibração reflete as especificidades locais, especialmente a alta cobertura de infraestrutura urbana e a persistência de vulnerabilidades estruturais em capital humano e renda.

> Referência: `00_governanca/ivs_vs_ivsh_comparativo_v05.md`

---

## ⚠️ Governança de dados

- Dados em `01_bruto` são **imutáveis**  
- Nenhuma análise deve ser feita diretamente sobre dados brutos  
- Cada etapa gera uma nova camada  
- Versionamento por período (`AAAA_MM`)  
- Notebooks seguem cabeçalho padrão institucional  

---

## 🚫 O que este repositório **não contém**

Por razões legais e éticas, este repositório **não inclui**:

- dados pessoais  
- microdados identificáveis do CadÚnico  
- informações sensíveis de cidadãos  
- dados operacionais internos  

Inclui apenas:

- estruturas de dados  
- documentação metodológica  
- esquemas analíticos  
- exemplos sintéticos  

---

## 🛠️ Tecnologia utilizada (MVP)

| Camada | Tecnologia |
|---|---|
| Processamento de dados | Python + Pandas |
| Banco de dados | SQLite |
| Ambiente analítico | Jupyter Notebook |
| Versionamento | GitHub |
| Próxima etapa | PostgreSQL + pipeline ELT |

---

## 🏛️ Contexto institucional

| | |
|---|---|
| Município | Hortolândia – SP |
| Secretaria | Inclusão e Desenvolvimento Social |
| Responsável técnico | Ailton Vendramini |
| Ano de início | 2026 |
| Fase atual | MVP — estruturação e validação |

---

## 🎯 Objetivo de longo prazo

Construir uma **arquitetura de dados sociais replicável para municípios brasileiros**, integrando:

- Cadastro Único  
- rede socioassistencial  
- equipamentos públicos  
- organizações da sociedade civil  
- análise territorial da vulnerabilidade  

---

## 🧭 Diretriz estratégica

> **“O IVS-H não é apenas um indicador — é uma ferramenta de integração do governo.”**

---

## 📚 Referências

- IPEA (2015) — Atlas da Vulnerabilidade Social  
- Kimball, R. — Data Warehouse Toolkit  
- McKinney, W. — Python for Data Analysis  
- Zaharia et al. — Lakehouse Architecture  

---

## 📄 Licença

Projeto institucional público.

Não contém dados pessoais e segue os princípios da **Lei Geral de Proteção de Dados (LGPD)** e boas práticas de **governança de dados no setor público**.

