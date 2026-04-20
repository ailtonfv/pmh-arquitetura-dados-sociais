# Regras de Negócio — Atlas Social de Hortolândia

## 🎯 Objetivo

Definir as regras operacionais e conceituais que orientam:

- tratamento dos dados
- construção dos indicadores
- classificação de registros
- consistência do modelo analítico

Este documento garante que o projeto seja:

- consistente
- reproduzível
- auditável
- compreensível por terceiros

---

## 🧠 Princípio geral

> **"Toda transformação de dado deve ser explicável e reproduzível."**

Nenhuma regra deve existir apenas no código.

---

## 👤 Unidade mínima de análise

- A unidade mínima é a **Pessoa**
- A Pessoa está vinculada a uma **Família**
- A Família está vinculada a um **Território (loteamento)**

---

## 🧩 Identificação de registros

### Regra 1 — Identificador principal

- Priorizar uso de **CPF**
- Caso CPF esteja ausente ou inválido:

→ utilizar chave composta:


## 👤 nome + data_nascimento


⚠️ Essa chave deve ser tratada como:
- aproximação
- sujeita a duplicidade

---

### Regra 2 — Deduplicação

Quando houver múltiplos registros:

- manter apenas um registro por pessoa
- priorizar:

1. registro mais recente
2. registro mais completo

---

## 💰 Classificação de renda

### Regra 3 — Baixa renda

Definição operacional:
renda_per_capita ≤ 0,5 salário mínimo


Essa regra alimenta:

- RT_01 (baixa renda)
- RT_04 (dependência de idosos)

---

## 👩‍👧 Capital humano

### Regra 4 — Mães vulneráveis (CH_05)

Condições simultâneas:

- mulher responsável pela família
- sem ensino fundamental completo
- possui filho menor de 15 anos

---

### Regra 5 — Baixa escolaridade domiciliar (CH_07)

Domicílio onde:

- nenhum morador possui ensino fundamental completo

---

## 🧓 Dependência de idosos

### Regra 6 — RT_04

Domicílios onde:

- renda per capita ≤ 0,5 SM
- presença de idoso (≥ 60 anos)
- dependência econômica do idoso

---
## 📍 Organização espacial dos dados

### Regra 7 — Estrutura espacial

A organização espacial do Atlas Social é baseada em três níveis:

Pessoa → Família → Loteamento → Núcleo → Região de Planejamento

---

### Regra 7.1 — Definições

| Nível | Definição |
|------|----------|
| loteamento | unidade geográfica básica |
| núcleo | agrupamento de loteamentos |
| região_planejamento | divisão administrativa do município |

---

### Regra 7.2 — Unidade padrão de análise

A unidade principal de análise é o **núcleo**.

O núcleo permite:

- consolidar dados de múltiplos loteamentos
- representar a organização operacional das políticas públicas
- viabilizar análise comparável entre áreas do município

---

### Regra 7.3 — Associação dos dados

- Todo registro deve estar vinculado a um loteamento
- Sempre que possível, deve ser associado a um núcleo

---

### Regra 7.4 — Hierarquia

A hierarquia deve ser respeitada:

loteamento → núcleo → região_planejamento

---

### Regra 7.5 — Sobreposição

- Um loteamento pode estar associado a mais de um núcleo
- Essa associação pode variar conforme a política pública (ex.: assistência, saúde, educação)

Essa sobreposição deve ser preservada como informação analítica

---

### Regra 7.6 — Evolução temporal

A associação entre loteamentos e núcleos pode mudar ao longo do tempo

Sempre que possível registrar:

- data_inicio
- data_fim

---

## 🧠 Observação

> "O loteamento localiza o dado.  
O núcleo organiza a ação do Estado."

---

## 🧮 Tratamento de dados

### Regra 8 — Dados faltantes

- Não substituir automaticamente valores nulos
- Identificar e registrar ausência

---

### Regra 9 — Tipos de dados

- datas → formato ISO (`YYYY-MM-DD`)
- texto → padronização sem acentos (quando necessário)
- categorias → snake_case

---

### Regra 10 — Padronização de colunas

- nomes devem ser:

minúsculos
sem espaços
snake_case

Exemplo:
renda_per_capita
codigo_variavel
tipo_evento


---

## 🧾 Classificação de eventos (imprensa)

### Regra 11 — Tipo de evento

Valores permitidos:

- politica_publica
- problema
- caso_individual
- infraestrutura
- acao_institucional

---

### Regra 12 — Gravidade

Valores permitidos:

- baixa
- media
- alta

---

## ⚖️ Consistência analítica

### Regra 13 — Não misturar camadas

- 01_bruto → nunca alterado
- 02_limpo → tratamento técnico
- 03_curado → pronto para análise

---

### Regra 14 — Reprodutibilidade

Todo resultado deve permitir:

- identificar fonte
- identificar período
- reproduzir cálculo

---

## 🔒 LGPD e dados sensíveis

### Regra 15 — Uso responsável

- não expor dados pessoais identificáveis
- evitar exibição de CPF em outputs
- análises devem ser agregadas

---

## 📊 Uso dos indicadores

### Regra 16 — Natureza dos resultados

Os indicadores produzidos:

- não são definitivos
- não substituem política pública
- são instrumentos de apoio à decisão

---

## 📌 Situação atual

- Regras iniciais definidas
- Podem ser ajustadas conforme evolução do projeto
- Toda alteração deve ser registrada em:


