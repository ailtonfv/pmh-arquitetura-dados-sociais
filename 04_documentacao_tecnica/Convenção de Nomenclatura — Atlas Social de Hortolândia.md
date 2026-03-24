# Convenção de Nomenclatura — Atlas Social de Hortolândia
**Versão:** v01  
**Data:** "22/03/2026"  
**Pasta:** `04_documentacao_tecnica/`  
**Status:** Documento normativo — alterações exigem nova versão

---

## 0. Princípio Geral

Todo artefato do projeto — arquivo, variável, tabela, output — deve ser identificável
sem abrir seu conteúdo. O nome carrega contexto suficiente para rastreamento.

---

## 1. Notebooks Jupyter

### 1.1 Prefixo numérico obrigatório

O prefixo indica a sequência lógica de execução dentro do pipeline.

| Faixa | Finalidade |
| --- | --- |
| `01_` a `09_` | Exploração e validação de variáveis individuais |
| `10_` a `19_` | Cálculo de dimensões (IU, CH, RT) |
| `20_` a `29_` | Composição de índices (IVS-H, IPST-H) |
| `30_` a `39_` | Vínculo territorial (endereço → loteamento) |
| `40_` a `49_` | Outputs e exportações |
| `90_` a `99_` | Testes, experimentos, rascunhos — nunca commitados |

### 1.2 Padrão de nome

```
NN_codigo_variavel_descricao_vNN.ipynb
```

**Exemplos:**

| Notebook | Significado |
| --- | --- |
| `01_rt01_exploracao_v01.ipynb` | Exploração da variável RT_01 — versão 1 |
| `10_ch_dimensao_calculo_v01.ipynb` | Cálculo completo da dimensão Capital Humano |
| `20_ivsh_composicao_mvp_v01.ipynb` | Composição do IVS-H com as 5 variáveis MVP |
| `30_endereco_loteamento_vinculo_v01.ipynb` | Vínculo endereço → id_loteamento |

### 1.3 Regras

- Apenas letras minúsculas, números e underscore — sem espaços, sem acentos
- Código da variável ou dimensão sempre imediatamente após o prefixo numérico
- Versão (`_vNN`) obrigatória a partir da segunda versão do mesmo notebook
- Notebooks da faixa `90_99_` nunca sobem para o GitHub

---

## 2. Scripts Python (.py)

Notebooks exploratórios que se tornam produção viram scripts `.py` versionados.

```
modulo_descricao_vNN.py
```

**Exemplos:**

| Script | Significado |
| --- | --- |
| `calculo_rt01_v01.py` | Cálculo definitivo de RT_01 |
| `vinculo_endereco_loteamento_v01.py` | Lógica de vínculo territorial |
| `exporta_ivsh_mvp_v01.py` | Exportação do IVS-H MVP |

**Pasta no repositório:** `05_scripts/`

---

## 3. Variáveis do IVS-H e IPST-H

### 3.1 Variáveis IVS-H (16 variáveis IPEA)

Código fixo — não alterar.

| Dimensão | Prefixo | Exemplos |
| --- | --- | --- |
| Infraestrutura Urbana | `IU_` | `IU_01`, `IU_02`, `IU_03` |
| Capital Humano | `CH_` | `CH_01` … `CH_08` |
| Renda e Trabalho | `RT_` | `RT_01` … `RT_05` |

### 3.2 Variáveis IPST-H

| Eixo | Prefixo | Exemplos |
| --- | --- | --- |
| Pressão Territorial | `PT_` | `PT_01` … `PT_06` |
| Pressão Operacional | `PO_` | `PO_01` … |
| Lacunas de Cobertura | `LC_` | `LC_01` … |

### 3.3 Em código Python

Variáveis calculadas seguem o código oficial em minúsculas com prefixo `var_`:

```python
var_rt01 = ...   # % famílias renda <= 1/2 SM
var_ch05 = ...   # % mães chefes sem fund. completo, filho < 15
var_ch06 = ...   # taxa analfabetismo 15+
```

Colunas do DataFrame seguem o padrão do CadÚnico original — sem renomear na ingestão.
Renomeação só ocorre na camada de modelagem.

---

## 4. Tabelas do Banco de Dados (SQLite)

### 4.1 Prefixos obrigatórios

| Prefixo | Tipo | Exemplos |
| --- | --- | --- |
| `DIM_` | Dimensão | `DIM_LOTEAMENTO`, `DIM_NUCLEO`, `DIM_PROGRAMA` |
| `FATO_` | Fato | `FATO_ATENDIMENTO`, `FATO_IVS_LOTEAMENTO` |
| `REL_` | Relacionamento | `REL_PROGRAMA_INDICADOR` |
| `STG_` | Staging — temporário | `STG_CADUNICO_RAW` |

### 4.2 Campos de chave

| Campo | Convenção |
| --- | --- |
| Chave primária | `id_[entidade]` — ex: `id_loteamento`, `id_familia` |
| Chave estrangeira | mesmo nome da PK da tabela referenciada |
| Data de carga | `dt_carga` |
| Data de referência | `dt_referencia` |
| Flag ativo | `ativo` (0/1) |

### 4.3 Regras gerais

- Nomes em maiúsculas para tabelas, minúsculas para campos
- Sem acentos, sem espaços — underscore como separador
- Campos booleanos como inteiro (0/1) — SQLite não tem tipo boolean nativo

---

## 5. Arquivos de Output

Outputs gerados por notebooks ou scripts seguem o padrão:

```
output_descricao_AAAAMMDD.csv
output_descricao_AAAAMMDD.xlsx
```

**Exemplos:**

| Arquivo | Significado |
| --- | --- |
| `output_rt01_por_loteamento_20260322.csv` | RT_01 por loteamento — gerado em 22/03/2026 |
| `output_ivsh_mvp_20260322.csv` | IVS-H MVP — 5 variáveis — gerado em 22/03/2026 |

**Pasta:** `06_outputs/` — incluída no `.gitignore` para dados brutos.  
Outputs analíticos agregados (sem dados pessoais) podem ser commitados.

---

## 6. Arquivos de Documentação no GitHub

### 6.1 Padrão de nome

```
modulo_descricao_vNN.md
```

**Exemplos:**

| Arquivo | Pasta |
| --- | --- |
| `loteamento_dim_v03.md` | `01_modelagem_conceitual/` |
| `programa_dim_v02.md` | `01_modelagem_conceitual/` |
| `ipst_h_v02.md` | `01_modelagem_conceitual/` |
| `arquitetura_dados_IVS_v10.md` | `00_governança/` |

### 6.2 Datas em documentos

Datas sempre entre aspas duplas para evitar inversão no preview do GitHub:

```
"22/03/2026"   ✔
22/03/2026     ✘
```

### 6.3 Prefixos de módulo em `01_modelagem_conceitual/`

| Módulo | Prefixo |
| --- | --- |
| Loteamento | `loteamento_` |
| Programa | `programa_` |
| Atendimento | `atendimento_` |
| Evento Social | `evento_social_` |
| Legislativo | `legislativo_` |
| Documentação técnica | sem prefixo — pasta própria `04_documentacao_tecnica/` |

---

## 7. Referência Rápida

| O que é | Convenção |
| --- | --- |
| Notebook exploração | `01_rt01_exploracao_v01.ipynb` |
| Notebook cálculo dimensão | `10_ch_dimensao_calculo_v01.ipynb` |
| Script produção | `calculo_rt01_v01.py` |
| Variável calculada Python | `var_rt01` |
| Tabela dimensão SQLite | `DIM_LOTEAMENTO` |
| Tabela fato SQLite | `FATO_IVS_LOTEAMENTO` |
| Output CSV | `output_rt01_loteamento_20260322.csv` |
| Documento GitHub | `modulo_descricao_vNN.md` |
| Data em documento | `"22/03/2026"` |

---

*Atlas Social de Hortolândia — Documento Normativo*  
*"O nome carrega contexto. O contexto garante rastreabilidade."*

[convencao_nomenclatura_v01.md](https://github.com/user-attachments/files/26212930/convencao_nomenclatura_v01.md)
