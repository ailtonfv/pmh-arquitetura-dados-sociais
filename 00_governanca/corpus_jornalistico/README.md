# CORPUS JORNALÍSTICO

## Evidências Empíricas da Vulnerabilidade Social em Hortolândia

**Versão:** v1.3
**Data:** 13 de abril de 2026
**Responsável:** Ailton Vendramini
**Iniciativa:** Atlas Social de Hortolândia

---

## 🎯 Finalidade

Este documento estabelece a metodologia para estruturação e análise de notícias locais como **evidência empírica da vulnerabilidade social**, compondo uma camada complementar ao IVS-H.

Seu objetivo é integrar:

* **dados estruturais** (indicadores oficiais);
* **eventos reais observados no município**.

---

## 🧠 Arquitetura Conceitual

O modelo baseia-se na separação entre duas camadas analíticas:

### 🔹 IVS-H — Estrutura da Vulnerabilidade

* Mede condições sociais estruturais
* Baseado em dados como CadÚnico, IBGE e CAGED
* Representa o **estoque de vulnerabilidade**

---

### 🔹 Corpus Jornalístico — Manifestação da Vulnerabilidade

* Registra eventos reais ocorridos no território
* Captura situações como violência, crises e ocorrências sociais
* Representa o **fluxo da vulnerabilidade**

---

### 🔹 Integração Analítica

```text
IVS-H
→ Estrutura da vulnerabilidade
(dados estruturais e estáveis)

+

Eventos (Corpus jornalístico)
→ Manifestações da vulnerabilidade
(dados dinâmicos e contextuais)

=

IPST-H
→ Pressão social territorial
```

---

> **O IVS indica onde está a vulnerabilidade.
> Os eventos mostram onde ela se manifesta.
> O IPST revela a intensidade dessa pressão no território.**

---

## ⚠️ Princípio Fundamental

> **Eventos jornalísticos não medem diretamente o IVS-H.**

Eles devem ser interpretados como:

> **evidências de pressão social associadas às dimensões da vulnerabilidade**

---

## 🧱 Estrutura dos Registros

Cada notícia é convertida em um registro estruturado contendo:

* fonte
* data
* dimensão IVS
* código de variável (quando aplicável)
* tipo de relação com a variável
* resumo do evento
* tipo de evento
* gravidade
* polaridade
* identificação territorial (quando disponível)

---

🔎 Metodologia de Classificação
1. Dimensão da Vulnerabilidade
Infraestrutura Urbana (IU)
Capital Humano (CH)
Renda e Trabalho (RT)
Multidimensional
2. Tipo de Relação com a Variável

Define como o evento se conecta à estrutura do IVS:

Direta → o evento mede a variável IVS
Proxy → o evento indica fortemente a variável
Contextual → o evento ocorre em ambiente de vulnerabilidade
3. Nível de Criticidade

Define a intensidade do evento no território:

Baixa
Média
Alta
Alerta → evento extremo com forte impacto social
---

## 📊 Regras Operacionais

| Tipo de relação | Uso da variável IVS |
| --------------- | ------------------- |
| Direta          | Obrigatória         |
| Proxy           | Recomendado         |
| Contextual      | Opcional            |
| Alerta          | Opcional            |

---

## 📊 Definição de Indicador

> **Indicador é um dado agregado, quantitativo ou mensurável, que descreve um fenômeno social — não um evento isolado.**

---

### ✔️ Características de um indicador

* Expressa quantidade, taxa ou variação
* Permite comparação no tempo
* Origina-se de fonte institucional ou consolidada

---

### ✔️ Exemplos

* “94 medidas protetivas em jan–fev”
* “aumento de 11,9% em relação ao ano anterior”

---

### ❌ Não são indicadores

* homicídios individuais
* acidentes isolados
* casos específicos

---

### 🧭 Regra prática

> **Se pode ser representado em gráfico → indicador
> Se é um caso específico → não é indicador**

---

## 📌 Tipos de Evento

* **Indicador** → dado agregado (ex: volume, taxa, variação)
* **Problema** → situação negativa recorrente
* **Caso individual** → evento específico
* **Política pública** → ação governamental

---

## 📌 Exemplos Aplicados

### Indicador agregado — Medidas protetivas

* Dimensão: Capital Humano
* Tipo de relação: Proxy
* Tipo de evento: Indicador
* Gravidade: Alta
* Polaridade: Negativa

**Interpretação:**
Indica fragilidade nas relações familiares e exposição à violência, sem medir diretamente uma variável do IVS.

---

### Evento de violência urbana — Homicídio

* Dimensão: Capital Humano
* Tipo de relação: Contextual
* Tipo de evento: Problema
* Gravidade: Alta
* Polaridade: Negativa

**Interpretação:**
Evento que expressa pressão social no território, associado à vulnerabilidade, mas sem correspondência direta com variável IVS.

---

### Evento crítico — Violência envolvendo adolescentes

* Dimensão: Capital Humano
* Tipo de relação: Alerta
* Tipo de evento: Caso individual
* Gravidade: Alta
* Polaridade: Negativa

**Interpretação:**
Evento extremo que revela ambiente de vulnerabilidade social, com possíveis conexões múltiplas.

---

### Indicador direto — Exemplo hipotético

* Dimensão: Capital Humano
* Variável: Analfabetismo
* Tipo de relação: Direta
* Tipo de evento: Indicador

**Interpretação:**
Evento mede diretamente variável estrutural do IVS.

---

## ⚠️ Limitações

* Tendência a registrar eventos extremos
* Possível viés editorial
* Cobertura territorial parcial

> O corpus deve ser interpretado como complemento analítico.

---

## 🔗 Integração com o IVS-H

* **IVS-H** → estrutura da vulnerabilidade
* **Eventos** → manifestações da vulnerabilidade

Essa integração permite identificar:

* territórios com maior pressão social
* sinais antecipados de agravamento
* desconexões entre estrutura e realidade observada

---

## 🧭 Considerações Finais

O corpus jornalístico não substitui indicadores — ele os **complementa**.

Sua principal contribuição é transformar eventos dispersos em:

> **evidência estruturada da dinâmica social do território**

---

## 📚 Referências

* Instituto de Pesquisa Econômica Aplicada (IPEA). *Atlas da Vulnerabilidade Social*
* Schrodt, P. — Event Data Analysis
* Lazer et al. — Computational Social Science

---
