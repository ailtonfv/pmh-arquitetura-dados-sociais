# CORPUS JORNALÍSTICO

## Evidências Empíricas da Vulnerabilidade Social em Hortolândia

**Versão:** v1.4
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

* Registra eventos reais ocorridos no município
* Captura situações como violência, crises e ocorrências sociais
* Representa o **fluxo da vulnerabilidade**

---

### 🔹 Integração Analítica

```text id="zq6v4c"
IVS-H
→ Estrutura da vulnerabilidade
(dados estruturais e estáveis)

+

Eventos (Corpus jornalístico)
→ Manifestações da vulnerabilidade
(dados dinâmicos e observados)

=

IPSO-H
→ Pressão social observada
```

---

> **O IVS indica onde está a vulnerabilidade.
> Os eventos mostram onde ela se manifesta.
> O IPSO-H revela a intensidade dessa pressão observada.**

---

> **IPSO-H — Índice de Pressão Social Observada de Hortolândia**
> Representa a intensidade das manifestações empíricas da vulnerabilidade social, captadas por eventos observados no município.

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
* nível de criticidade
* resumo do evento
* tipo de evento
* gravidade
* polaridade
* identificação espacial (quando disponível)

---

## 🔎 Metodologia de Classificação

### 1. Dimensão da Vulnerabilidade

Todo evento deve ser classificado em uma das dimensões:

* **Infraestrutura Urbana (IU)**
* **Capital Humano (CH)**
* **Renda e Trabalho (RT)**
* **Multidimensional**

---

### 2. Tipo de Relação com a Variável

Define **como o evento se conecta à estrutura do IVS**:

* **Direta** → o evento mede a variável IVS
* **Proxy** → o evento indica fortemente a variável
* **Contextual** → o evento ocorre em ambiente de vulnerabilidade

---

### 3. Nível de Criticidade

Define **a intensidade do evento observado**:

* **Baixa**
* **Média**
* **Alta**
* **Alerta** → evento extremo com forte impacto social

---

## 📊 Regras Operacionais

| Tipo de relação | Uso da variável IVS |
| --------------- | ------------------- |
| Direta          | Obrigatória         |
| Proxy           | Recomendado         |
| Contextual      | Opcional            |

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

* **Indicador** → dado agregado
* **Problema** → situação negativa recorrente
* **Caso individual** → evento específico
* **Política pública** → ação governamental

---

## 📌 Exemplos Aplicados

### Indicador agregado — Medidas protetivas

* Dimensão: Capital Humano
* Tipo de relação: Proxy
* Nível de criticidade: Alta
* Tipo de evento: Indicador
* Polaridade: Negativa

**Interpretação:**
Indica fragilidade nas relações familiares e exposição à violência, sem medir diretamente uma variável do IVS.

---

### Evento de violência urbana — Homicídio

* Dimensão: Capital Humano
* Tipo de relação: Contextual
* Nível de criticidade: Alta
* Tipo de evento: Problema
* Polaridade: Negativa

**Interpretação:**
Evento que expressa pressão social observada no município.

---

### Evento crítico — Violência envolvendo adolescentes

* Dimensão: Capital Humano
* Tipo de relação: Contextual
* Nível de criticidade: Alerta
* Tipo de evento: Caso individual
* Polaridade: Negativa

**Interpretação:**
Evento extremo que revela ambiente de vulnerabilidade social.

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
* Cobertura parcial do município

> O corpus deve ser interpretado como complemento analítico.

---

## 🔗 Integração com o IVS-H

* **IVS-H** → estrutura da vulnerabilidade
* **Eventos** → manifestações observadas

Essa integração permite identificar:

* áreas com maior pressão social
* sinais antecipados de agravamento
* desconexões entre estrutura e realidade observada

---

## 🧭 Considerações Finais

O corpus jornalístico não substitui indicadores — ele os **complementa**.

Sua principal contribuição é transformar eventos dispersos em:

> **evidência estruturada da dinâmica social observada**

---

## 📚 Referências

* Instituto de Pesquisa Econômica Aplicada (IPEA). *Atlas da Vulnerabilidade Social*
* Schrodt, P. — Event Data Analysis
* Lazer et al. — Computational Social Science

---
