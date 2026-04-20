# Metodologia — IVS-H (Índice de Vulnerabilidade Social de Hortolândia)

## 🎯 Objetivo

Construir o **Índice de Vulnerabilidade Social de Hortolândia (IVS-H)**, com base na metodologia do IPEA, adaptada à realidade local, utilizando dados disponíveis no município e fontes complementares.

---

## 🧠 Fundamentação teórica

O IVS-H tem como referência o:

- COSTA, M. A.; MARGUTI, B. O. *Atlas da Vulnerabilidade Social nos Municípios Brasileiros*. IPEA, 2015.

O modelo original do IPEA:

- utiliza **16 variáveis**
- organizadas em **3 dimensões**
- com objetivo de medir **restrições ao bem-estar e à capacidade de escolha dos indivíduos**

---

## 🧱 Estrutura do índice

O IVS-H preserva a estrutura conceitual do IPEA:

### Dimensões

| Dimensão | Descrição |
|--------|----------|
| infraestrutura_urbana | Condições físicas do território |
| capital_humano | Educação, saúde e ciclo de vida |
| renda_trabalho | Inserção produtiva e renda |

---

## 🔄 Princípio metodológico central

O IVS-H segue o princípio de:

> **"Adaptação local sem ruptura metodológica"**

Ou seja:

- Mantém as **variáveis e dimensões do IPEA**
- Ajusta a aplicação conforme **disponibilidade de dados**
- Permite evolução **progressiva e auditável**

---

## 🧩 Construção progressiva

O IVS-H não nasce completo.

Ele evolui em fases:

### Fase 1 — Dados disponíveis (MVP)

Base principal:
- Cadastro Único (CadÚnico)

Variáveis já utilizáveis:

| Código | Variável | Dimensão |
|--------|----------|----------|
| CH_05 | mães chefes de família com baixa escolaridade | capital_humano |
| CH_06 | analfabetismo | capital_humano |
| CH_07 | baixa escolaridade no domicílio | capital_humano |
| RT_01 | baixa renda per capita | renda_trabalho |
| RT_04 | dependência de idosos de baixa renda | renda_trabalho |

---

### Fase 2 — Integração de bases

Fontes previstas:

- IBGE (Censo 2022)
- CAGED
- Saúde (e-SUS / RNDS)
- Educação (INEP)
- Assistência (SIGAS)

---

### Fase 3 — Modelo completo

- 16 variáveis completas
- cálculo consolidado por loteamento
- comparabilidade com IVS nacional

---

## ⚖️ Ajuste de pesos (IVS-H)

O IVS-H permite ajuste de pesos entre dimensões:

| Dimensão | Peso IPEA | Diretriz IVS-H |
|--------|----------|----------------|
| infraestrutura_urbana | 33% | menor relevância relativa local |
| capital_humano | 33% | maior peso |
| renda_trabalho | 33% | maior peso |

> Ajustes devem ser documentados e justificados tecnicamente.

---

## 📍 Unidade de análise

A estrutura analítica segue:

**Pessoa → Família → Loteamento → Núcleo → Região de Planejamento**

### Princípios:

- A unidade mínima é a **pessoa**
- A unidade territorial de leitura é o **loteamento**
- Núcleos são estruturas operacionais (não fixas)

---

## 🧭 Integração com IPST-H

O IVS-H mede:

> **"Onde está a vulnerabilidade"**

O IPST-H (índice complementar) medirá:

> **"Onde a vulnerabilidade pressiona a capacidade do Estado"**

---

## 📊 Natureza do indicador

O IVS-H é:

- multidimensional
- territorial
- progressivo
- auditável
- comparável com o padrão nacional

O IVS-H não é:

- ranking de pobreza
- diagnóstico absoluto
- substituto de políticas públicas

---

## ⚠️ Limitações

- Dependência de qualidade do CadÚnico
- Cobertura parcial de variáveis na fase inicial
- Necessidade de integração com bases externas
- Possível defasagem temporal entre fontes

---

## 🔁 Atualização

O IVS-H será atualizado conforme:

- atualização do CadÚnico
- integração de novas bases
- revisão metodológica documentada

---

## 🧾 Rastreabilidade

Todo cálculo deve:

- registrar fonte de dados
- registrar período de referência
- registrar versão metodológica
- permitir reprodução técnica

---

## 📌 Situação atual

- Metodologia definida
- Fase 1 em execução (CadÚnico)
- Integração com fontes externas em planejamento

---

## 📚 Referências

COSTA, M. A.; MARGUTI, B. O. Atlas da Vulnerabilidade Social nos Municípios Brasileiros. IPEA, 2015.

JANNUZZI, P. M. Indicadores Sociais no Brasil. Campinas: Alínea, 2012.

OECD. Handbook on Constructing Composite Indicators. OECD Publishing, 2008.