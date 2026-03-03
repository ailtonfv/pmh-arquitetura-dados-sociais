# MARCO_LEGAL_ASSISTENCIA_SOCIAL — Hortolândia

Versão: 01  
Data de criação: 02/03/2026  
Responsável: Ailton Vendramini  
Projeto: PMH Arquitetura de Dados Sociais  

---

## 🎯 Objetivo

Estabelecer metodologia padronizada para:

- Identificação
- Captura
- Classificação
- Versionamento
- Vinculação com modelagem de dados

de leis, decretos, resoluções e normativas relacionadas à Assistência Social no município de Hortolândia.

---

# 1️⃣ Metodologia de Captura Normativa

## 1.1 Fontes Oficiais

### 🔹 Federal
- Constituição Federal (Art. 203 e 204)
- LOAS — Lei nº 8.742/1993
- SUAS
- Portarias MDS
- Decreto Bolsa Família

### 🔹 Estadual (SP)
- Normativas SUAS-SP
- Deliberações CONSEAS

### 🔹 Municipal (Hortolândia)
- Leis Municipais
- Decretos
- Criação de Programas
- Criação de CRAS/CREAS
- Plano Municipal de Assistência Social (PMAS)
- Lei Orçamentária (LOA)
- PPA
- LDO

---

# 2️⃣ Estrutura de Registro Normativo

Cada norma deverá ser registrada no seguinte padrão:

## Modelo de Registro

- Tipo: (Lei / Decreto / Portaria / Resolução)
- Número:
- Ano:
- Esfera: (Federal / Estadual / Municipal)
- Tema principal:
- Secretaria responsável:
- Impacto em dados:
- Impacto em modelagem:
- Necessita nova DIM? (Sim/Não)
- Necessita nova FATO? (Sim/Não)
- Observações técnicas:

---

# 3️⃣ Classificação Estratégica

Cada norma será classificada segundo:

- 🧩 Estrutural (Criação de órgão / unidade)
- 💰 Financeira (Orçamento / repasse)
- 👥 Público-alvo
- 📊 Indicadores
- 📌 Territorial
- ⚖️ Regulamentação Operacional

---

# 4️⃣ Vinculação com Arquitetura de Dados

A cada nova norma capturada, deve-se avaliar:

- Afeta DIM_PROGRAMA?
- Afeta DIM_UNIDADE?
- Afeta DIM_TERRITORIO?
- Afeta FATO_ATENDIMENTO?
- Afeta KPIs estratégicos?

---

# 5️⃣ Registro Histórico (Versionamento)

| Versão | Data | Alteração | Responsável |
|--------|------|----------|-------------|
| 01 | 02/03/2026 | Criação do documento | Ailton Vendramini |

---

# 6️⃣ Diretriz Estratégica

A arquitetura de dados deve ser:

- Imune a mudanças políticas
- Sensível a mudanças normativas
- Capaz de rastrear origem legal de cada programa

---

# 7️⃣ Próximo Passo

Criar:

- DIM_NORMA_JURIDICA
ou
- Tabela de metadados normativos integrada ao Catálogo de Programas

