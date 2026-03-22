# Matriz de Rastreabilidade Operacional — Atlas Social de Hortolândia
**Versão:** v01  
**Data:** "22/03/2026"  
**Pasta:** `04_documentacao_tecnica/`  
**Leitura obrigatória:** antes de executar qualquer notebook

---

## 0. Como Usar Esta Matriz

Esta matriz é a ponte entre o que foi **acordado no GitHub** e o que é **executado no Jupyter**.
Cada linha responde quatro perguntas simultaneamente:

1. Qual notebook executa qual parte do modelo?
2. Qual output deriva de qual indicador?
3. Qual tabela deriva de qual dimensão/fato?
4. Qual documento conceitual fundamenta o cálculo?

Antes de modificar qualquer notebook, localize sua linha aqui.
Se a modificação alterar a fundamentação conceitual, o documento do GitHub deve ser atualizado primeiro.

---

## 1. Matriz Principal

| Notebook | O que executa | Variáveis IVS-H | Tabela SQLite alimentada | Output gerado | Documento GitHub que fundamenta |
| --- | --- | --- | --- | --- | --- |
| `01_rt01_exploracao_inicial.ipynb` | Exploração e validação da RT_01. Leitura do CadÚnico bruto. Primeiro cálculo de renda per capita. | RT_01 | — (exploração, sem carga) | `outputs/tabelas/ivs_variaveis.csv` (parcial) | `dim_variavel_IVS_v01r6.md` → RT_01 |
| `02_tratamento_base.ipynb` | Limpeza, deduplicação, padronização de campos. Gera base tratada para os demais notebooks. | — (pré-cálculo) | `STG_CADUNICO_RAW` | `dados/processado.xlsx` | `arquitetura_dados_IVS_v10.md` → Camada Trusted |
| `03_analises_variaveis.ipynb` | Cálculo das 5 variáveis MVP: CH_05, CH_06, CH_07, RT_01, RT_04. Análise exploratória por loteamento. | CH_05, CH_06, CH_07, RT_01, RT_04 | `DIM_LOTEAMENTO` (consulta) | `outputs/tabelas/ivs_variaveis.csv` `outputs/graficos/distribuicao_renda.png` `outputs/graficos/vulnerabilidade_por_familia.png` | `dim_variavel_IVS_v01r6.md` → CH_05, CH_06, CH_07, RT_01, RT_04 |
| `04_calculo_ivsh.ipynb` | Composição do IVS-H MVP. Aplicação de pesos. Ranking por loteamento/núcleo. | IVS-H MVP (5 variáveis) | `FATO_IVS_LOTEAMENTO` | `outputs/tabelas/ivs_resultado_final.csv` `outputs/tabelas/familias_vulneraveis.csv` `outputs/graficos/ivs_por_nucleo.png` | `dim_variavel_IVS_v01r6.md` → pesos `arquitetura_dados_IVS_v10.md` → modelo `ipst_h_v02.md` → interpretação conjunta |

---

## 2. Rastreabilidade por Variável IVS-H

| Variável | Definição resumida | Fonte no CadÚnico | Coluna(s) relevante(s) | Notebook que calcula | Documento de referência |
| --- | --- | --- | --- | --- | --- |
| RT_01 | % famílias renda per capita <= 1/2 SM | CadÚnico — renda autodeclarada | `vlr_renda_media_fam` | `01_rt01_exploracao_inicial.ipynb` `03_analises_variaveis.ipynb` | `dim_variavel_IVS_v01r6.md` → RT_01 |
| RT_04 | % pessoas em domicílios com renda <= 1/2 SM dependentes de idosos | CadÚnico — composição familiar + renda | `vlr_renda_media_fam` + `dta_nasc_pessoa` | `03_analises_variaveis.ipynb` | `dim_variavel_IVS_v01r6.md` → RT_04 |
| CH_05 | % mães chefes de família sem fund. completo, filho < 15 anos | CadÚnico — escolaridade + composição | `cod_escola_memb` + `ind_parc_membro_fam` | `03_analises_variaveis.ipynb` | `dim_variavel_IVS_v01r6.md` → CH_05 |
| CH_06 | Taxa analfabetismo — 15 anos ou mais | CadÚnico — escolaridade | `cod_escola_memb` + `dta_nasc_pessoa` | `03_analises_variaveis.ipynb` | `dim_variavel_IVS_v01r6.md` → CH_06 |
| CH_07 | % crianças em domicílios sem morador com fund. completo | CadÚnico — escolaridade + composição | `cod_escola_memb` + `dta_nasc_pessoa` | `03_analises_variaveis.ipynb` | `dim_variavel_IVS_v01r6.md` → CH_07 |

> **Nota:** Colunas do CadÚnico serão confirmadas na sessão de mapeamento do dicionário
> (`dicionario_cadunico_ver01`). Os nomes acima são referência — validar antes de codar.

---

## 3. Rastreabilidade por Output

| Arquivo de Output | Gerado por | Conteúdo | Pode ser commitado no GitHub? | Observação |
| --- | --- | --- | --- | --- |
| `outputs/tabelas/ivs_variaveis.csv` | `03_analises_variaveis.ipynb` | Valor de cada variável IVS-H por família/loteamento | Não — contém dados individuais | Dado pessoal — LGPD |
| `outputs/tabelas/ivs_resultado_final.csv` | `04_calculo_ivsh.ipynb` | IVS-H composto por loteamento (agregado) | Sim — dado agregado | Sem identificação individual |
| `outputs/tabelas/familias_vulneraveis.csv` | `04_calculo_ivsh.ipynb` | Lista de famílias acima do limiar de vulnerabilidade | Não — contém dados individuais | Dado pessoal — LGPD |
| `outputs/graficos/distribuicao_renda.png` | `03_analises_variaveis.ipynb` | Histograma de renda per capita CadÚnico | Sim | Dado agregado — sem identificação |
| `outputs/graficos/vulnerabilidade_por_familia.png` | `03_analises_variaveis.ipynb` | Distribuição de vulnerabilidade por família | Não | Pode revelar padrões individuais |
| `outputs/graficos/ivs_por_nucleo.png` | `04_calculo_ivsh.ipynb` | IVS-H por núcleo — visualização territorial | Sim | Dado agregado — apresentável |

---

## 4. Rastreabilidade por Tabela SQLite

| Tabela SQLite | Alimentada por | Notebook responsável | Dimensão/Fato de origem | Documento GitHub |
| --- | --- | --- | --- | --- |
| `STG_CADUNICO_RAW` | `dados/bruto.csv` | `02_tratamento_base.ipynb` | Staging — sem dimensão | `arquitetura_dados_IVS_v10.md` |
| `DIM_LOTEAMENTO` | Planilha territorial v03 | Carga manual (script separado) | `loteamento_dim_v03.md` | `loteamento_dim_v03.md` |
| `DIM_NUCLEO` | Definição analítica | Carga manual (script separado) | `DIM_NUCLEO v01` | `loteamento_dim_v03.md` |
| `FATO_IVS_LOTEAMENTO` | `ivs_resultado_final.csv` | `04_calculo_ivsh.ipynb` | Fato de resultado analítico | `arquitetura_dados_IVS_v10.md` `dim_variavel_IVS_v01r6.md` |

---

## 5. Documentos GitHub e seus Papéis na Implementação

| Documento GitHub | Pasta | Papel na implementação | Notebooks que dependem dele |
| --- | --- | --- | --- |
| `dim_variavel_IVS_v01r6.md` | `01_modelagem_conceitual/` | Define as 16 variáveis, fases MVP, regras de cálculo | 01, 03, 04 |
| `arquitetura_dados_IVS_v10.md` | `00_governança/` | Define o modelo de dados, camadas, fontes | 02, 04 |
| `loteamento_dim_v03.md` | `01_modelagem_conceitual/` | Define loteamento como átomo espacial, núcleo como agregação | 03, 04 |
| `ipst_h_v02.md` | `01_modelagem_conceitual/` | Define eixos do IPST-H — interpretação conjunta com IVS-H | 04 |
| `convencao_nomenclatura_v01.md` | `04_documentacao_tecnica/` | Governa nomes de notebooks, variáveis, tabelas e outputs | Todos |
| `conceito_vulnerabilidade_v03.md` | `01_modelagem_conceitual/` | Fundamenta limites do CadÚnico, renda autodeclarada | 01, 03 |

---

## 6. Regras de Manutenção desta Matriz

1. **A matriz é atualizada quando um notebook novo é criado** — antes da primeira célula de código.
2. **A matriz é atualizada quando um documento GitHub muda de versão** — atualizar a coluna de referência.
3. **A matriz não substitui os documentos GitHub** — ela aponta para eles.
4. **Se houver conflito entre a matriz e um documento GitHub**, o documento GitHub prevalece.
5. **Outputs com dados individuais nunca são commitados** — coluna "Pode ser commitado" é definitiva.

---

## 7. Pendências de Mapeamento

Estes itens precisam ser resolvidos para que a matriz fique completa:

| Pendência | Responsável | Impacto |
| --- | --- | --- |
| Confirmar nomes exatos das colunas CadÚnico para CH_05, CH_06, CH_07, RT_04 | Ailton — dicionário CadÚnico | Seção 2 da matriz |
| Produzir `dim_variavel_IVS_v01r6.md` (restaurar IU_03, remover RT_06/07) | Próxima sessão | Seção 5 — documento base |
| Vincular endereço CadÚnico ao `id_loteamento` | Próximas sessões | Notebooks 03 e 04 |
| Definir limiar de vulnerabilidade para `familias_vulneraveis.csv` | Decisão metodológica | Notebook 04 |

---

*Atlas Social de Hortolândia — Documento de Rastreabilidade*  
*"O notebook executa. O GitHub fundamenta. A matriz conecta."*

[matriz_rastreabilidade_operacional_v01 (1).md](https://github.com/user-attachments/files/26167143/matriz_rastreabilidade_operacional_v01.1.md)
