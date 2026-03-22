[matriz_rastreabilidade_operacional_v02.md](https://github.com/user-attachments/files/26169180/matriz_rastreabilidade_operacional_v02.md)
# Matriz de Rastreabilidade Operacional — Atlas Social de Hortolândia
**Versão:** v02  
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

Antes de modificar qualquer notebook, localize sua linha aqui pelo `id_rastreabilidade`.
Se a modificação alterar a fundamentação conceitual, o documento do GitHub deve ser atualizado primeiro.
Se a modificação alterar schema de tabela ou coluna do CadÚnico, registrar versão do dicionário utilizado.

---

## 1. Matriz Principal

| id_rastreabilidade | Notebook | O que executa | Variáveis IVS-H | Tabela leitura | Tabela escrita | Output gerado | tipo_output | periodo_referencia | Documento GitHub que fundamenta |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| RTB_001 | `01_rt01_exploracao_inicial.ipynb` | Exploração e validação da RT_01. Leitura do CadÚnico bruto. Primeiro cálculo de renda per capita. | RT_01 | `STG_CADUNICO_RAW` | — | `outputs/tabelas/ivs_variaveis.csv` ⚠️ exploratório — não oficial | exploratorio | CadÚnico dez/2025 | `dim_variavel_IVS_v01r7.md` → RT_01 |
| RTB_002 | `02_tratamento_base.ipynb` | Limpeza, deduplicação, padronização de campos. Gera base tratada para os demais notebooks. | — (pré-cálculo) | — | `STG_CADUNICO_RAW` | `dados/processado.xlsx` | operacional | CadÚnico dez/2025 | `arquitetura_dados_IVS_v10.md` → Camada Trusted |
| RTB_003 | `03_analises_variaveis.ipynb` | Cálculo das 5 variáveis MVP: CH_05, CH_06, CH_07, RT_01, RT_04. Análise por loteamento. | CH_05, CH_06, CH_07, RT_01, RT_04 | `STG_CADUNICO_RAW` `DIM_LOTEAMENTO` | — | `outputs/tabelas/ivs_variaveis.csv` `outputs/graficos/distribuicao_renda.png` `outputs/graficos/vulnerabilidade_por_familia.png` | analitico / institucional | CadÚnico dez/2025 | `dim_variavel_IVS_v01r7.md` → CH_05, CH_06, CH_07, RT_01, RT_04 |
| RTB_004 | `04_calculo_ivsh.ipynb` | Composição do IVS-H MVP. Aplicação de pesos. Ranking por loteamento/núcleo. | IVS-H Fase 1 (5 variáveis) | `DIM_LOTEAMENTO` `DIM_NUCLEO` | `FATO_IVS_LOTEAMENTO` | `outputs/tabelas/ivs_resultado_final.csv` `outputs/tabelas/familias_vulneraveis.csv` `outputs/graficos/ivs_por_nucleo.png` | institucional / operacional / institucional | CadÚnico dez/2025 | `dim_variavel_IVS_v01r7.md` `arquitetura_dados_IVS_v10.md` `ipst_h_v02.md` |

> **⚠️ RTB_001 — output exploratório:** o CSV gerado neste notebook
> tem finalidade de inspeção e validação, não de consumo analítico
> oficial. Não deve ser referenciado por outros notebooks.
> O CSV oficial de variáveis é gerado em RTB_003.

---

## 2. Rastreabilidade por Variável IVS-H

| id_rastreabilidade | Variável | Definição resumida | Fonte no CadÚnico | Coluna(s) relevante(s) | Risco de schema | Mitigação | Notebook que calcula | Documento de referência |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| RTB_010 | RT_01 | % famílias renda per capita menor ou igual a 1/2 SM | CadÚnico — renda autodeclarada | `vlr_renda_media_fam` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_001 RTB_003 | `dim_variavel_IVS_v01r7.md` → RT_01 |
| RTB_011 | RT_04 | % pessoas em domicílios renda menor ou igual a 1/2 SM dependentes de idosos | CadÚnico — composição familiar + renda | `vlr_renda_media_fam` + `dta_nasc_pessoa` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_003 | `dim_variavel_IVS_v01r7.md` → RT_04 |
| RTB_012 | CH_05 | % mães chefes sem fund. completo, filho menor de 15 anos | CadÚnico — escolaridade + composição | `cod_escola_memb` + `ind_parc_membro_fam` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_003 | `dim_variavel_IVS_v01r7.md` → CH_05 |
| RTB_013 | CH_06 | Taxa analfabetismo — 15 anos ou mais | CadÚnico — escolaridade | `cod_escola_memb` + `dta_nasc_pessoa` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_003 | `dim_variavel_IVS_v01r7.md` → CH_06 |
| RTB_014 | CH_07 | % crianças em domicílios sem morador com fund. completo | CadÚnico — escolaridade + composição | `cod_escola_memb` + `dta_nasc_pessoa` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_003 | `dim_variavel_IVS_v01r7.md` → CH_07 |

> **Nota sobre risco de schema:** todas as colunas listadas acima foram
> identificadas no dicionário CadÚnico versão dez/2025
> (`sistema_cadunico_ver01_dicionario.docx`).
> Qualquer atualização do Ministério que renomeie ou remova essas colunas
> invalida os notebooks RTB_001, RTB_003 e RTB_004 sem aviso.
> Mitigação obrigatória: ao iniciar nova carga, verificar versão do
> dicionário e registrar no cabeçalho do notebook.

---

## 3. Rastreabilidade por Output

| id_rastreabilidade | Arquivo de Output | tipo_output | Gerado por | periodo_referencia | Conteúdo | Pode ser commitado? | Observação LGPD |
| --- | --- | --- | --- | --- | --- | --- | --- |
| RTB_020 | `outputs/tabelas/ivs_variaveis.csv` | exploratorio | RTB_001 | CadÚnico dez/2025 | Valor de RT_01 por família — inspeção inicial | Não | Dado individual — não oficial |
| RTB_021 | `outputs/tabelas/ivs_variaveis.csv` | analitico | RTB_003 | CadÚnico dez/2025 | Valor das 5 variáveis IVS-H por família/loteamento | Não | Dado pessoal — LGPD |
| RTB_022 | `outputs/tabelas/ivs_resultado_final.csv` | institucional | RTB_004 | CadÚnico dez/2025 | IVS-H composto por loteamento (agregado) | Sim | Dado agregado — sem identificação individual |
| RTB_023 | `outputs/tabelas/familias_vulneraveis.csv` | operacional | RTB_004 | CadÚnico dez/2025 | Famílias acima do limiar de vulnerabilidade | Não | Dado pessoal — LGPD — uso restrito à rede CRAS |
| RTB_024 | `outputs/graficos/distribuicao_renda.png` | institucional | RTB_003 | CadÚnico dez/2025 | Histograma renda per capita CadÚnico | Sim | Dado agregado — apresentável |
| RTB_025 | `outputs/graficos/vulnerabilidade_por_familia.png` | analitico | RTB_003 | CadÚnico dez/2025 | Distribuição de vulnerabilidade por família | Não | Pode revelar padrões individuais |
| RTB_026 | `outputs/graficos/ivs_por_nucleo.png` | institucional | RTB_004 | CadÚnico dez/2025 | IVS-H por núcleo — visualização territorial | Sim | Dado agregado — apresentável em reunião |

> **Atenção:** RTB_020 e RTB_021 geram o mesmo nome de arquivo
> (`ivs_variaveis.csv`) em notebooks diferentes. O de RTB_001 é
> exploratório e deve ser sobrescrito ou movido para subpasta
> `outputs/tabelas/exploratorio/` antes da execução de RTB_003.

---

## 4. Rastreabilidade por Tabela SQLite

| id_rastreabilidade | Tabela SQLite | Operação | Notebook responsável | Dimensão/Fato de origem | periodo_referencia | Documento GitHub |
| --- | --- | --- | --- | --- | --- | --- |
| RTB_030 | `STG_CADUNICO_RAW` | escrita | RTB_002 | Staging — sem dimensão | CadÚnico dez/2025 | `arquitetura_dados_IVS_v10.md` |
| RTB_031 | `STG_CADUNICO_RAW` | leitura | RTB_001 RTB_003 | Staging — sem dimensão | CadÚnico dez/2025 | `arquitetura_dados_IVS_v10.md` |
| RTB_032 | `DIM_LOTEAMENTO` | leitura | RTB_003 RTB_004 | `loteamento_dim_v03.md` | Planilha territorial v03 | `loteamento_dim_v03.md` |
| RTB_033 | `DIM_NUCLEO` | leitura | RTB_004 | `DIM_NUCLEO v01` | Definição analítica | `loteamento_dim_v03.md` |
| RTB_034 | `FATO_IVS_LOTEAMENTO` | escrita | RTB_004 | Fato de resultado analítico | CadÚnico dez/2025 | `arquitetura_dados_IVS_v10.md` `dim_variavel_IVS_v01r7.md` |

---

## 5. Documentos GitHub e seus Papéis na Implementação

| id_rastreabilidade | Documento GitHub | Pasta | Papel na implementação | Notebooks dependentes |
| --- | --- | --- | --- | --- |
| RTB_040 | `dim_variavel_IVS_v01r7.md` | `01_modelagem_conceitual/` | Define as 16 variáveis, fases MVP, fórmulas, pesos | RTB_001 RTB_003 RTB_004 |
| RTB_041 | `arquitetura_dados_IVS_v10.md` | `00_governança/` | Define o modelo de dados, camadas, fontes | RTB_002 RTB_004 |
| RTB_042 | `loteamento_dim_v03.md` | `01_modelagem_conceitual/` | Define loteamento como átomo espacial, núcleo como agregação | RTB_003 RTB_004 |
| RTB_043 | `ipst_h_v02.md` | `01_modelagem_conceitual/` | Define eixos do IPST-H — interpretação conjunta com IVS-H | RTB_004 |
| RTB_044 | `convencao_nomenclatura_v01.md` | `04_documentacao_tecnica/` | Governa nomes de notebooks, variáveis, tabelas e outputs | Todos |
| RTB_045 | `conceito_vulnerabilidade_v03.md` | `01_modelagem_conceitual/` | Fundamenta limites do CadÚnico, renda autodeclarada | RTB_001 RTB_003 |

---

## 6. Regras de Manutenção desta Matriz

1. **A matriz é atualizada quando um notebook novo é criado** — antes da primeira célula de código. Novo `id_rastreabilidade` deve ser atribuído.
2. **A matriz é atualizada quando um documento GitHub muda de versão** — atualizar a coluna de referência na Seção 5.
3. **A matriz é atualizada quando o schema do CadÚnico muda** — atualizar `Coluna(s) relevante(s)` na Seção 2 e registrar nova versão do dicionário.
4. **A matriz não substitui os documentos GitHub** — ela aponta para eles.
5. **Se houver conflito entre a matriz e um documento GitHub**, o documento GitHub prevalece.
6. **Outputs com dados individuais nunca são commitados** — coluna "Pode ser commitado" é definitiva.
7. **`periodo_referencia` é obrigatório** — nenhuma linha nova sem este campo preenchido.

---

## 7. Pendências de Mapeamento

| # | Pendência | Impacto na matriz |
| --- | --- | --- |
| P01 | Confirmar nomes exatos das colunas CadÚnico para CH_05, CH_06, CH_07, RT_04 | Seção 2 — colunas provisórias |
| P02 | Produzir carga de `DIM_LOTEAMENTO` e `DIM_NUCLEO` no SQLite | Seção 4 — RTB_032 e RTB_033 |
| P03 | Vincular endereço CadÚnico ao `id_loteamento` | Notebooks RTB_003 e RTB_004 |
| P04 | Definir limiar de vulnerabilidade para `familias_vulneraveis.csv` | RTB_023 — output RTB_004 |
| P05 | Resolver conflito de nome `ivs_variaveis.csv` entre RTB_020 e RTB_021 | Seção 3 — nomes de output |
| P06 | Formalizar `periodo_referencia` como campo no cabeçalho padrão do notebook | Seção 1 — coluna periodo_referencia |

---

*Atlas Social de Hortolândia — Documento de Rastreabilidade*  
*"O notebook executa. O GitHub fundamenta. A matriz conecta."*
