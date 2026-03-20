# DIM_PROGRAMAS_SOCIAIS — Documento Mestre
**Versão:** v01  
**Data:** 2026-03-11  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia

---

## Nota Metodológica

O catálogo de programas sociais de Hortolândia foi estruturado em **quatro arquivos especializados**,
cada um com propósito e audiência distintos. Este documento é o ponto de entrada e a referência
de navegação entre eles.

A separação segue o princípio arquitetural do projeto:
**cadastro puro, relação analítica e conhecimento institucional não se misturam.**

---

## Os Quatro Arquivos

| Arquivo | Camada | Finalidade |
|---|---|---|
| [`dim_programa_v02.md`](../02_modelagem_lógica/dim_programa.md) | Modelagem Lógica | Núcleo cadastral de cada programa — campos relacionais, carga em banco |
| [`dim_orgao_executor_v02.md`](../01_modelagem_conceitual/dim_orgao_executor.md) | Modelagem Conceitual | Cadastro de equipamentos, secretarias, OSCs e operadores externos |
| [`rel_programa_dimensao_ivs_v02.md`](../02_modelagem_lógica/rel_programa_dimensao_ivs.md) | Modelagem Lógica | Ponte analítica programa × IVS-H — variáveis, tipo de relação, justificativa |
| [`notas_arquiteturais_programas_sociais_v01.md`](../00_governanca/notas_arquiteturais_programas_sociais.md) | Governança | Conhecimento institucional, fluxos, pontos cegos, pendências, riscos |

---

## Resumo Executivo

- **Total de programas catalogados:** 64
- **Grupos temáticos:** 11
- **Esfera federal:** 12 | **Estadual:** 8 | **Municipal:** 38 | **Intersetorial:** 6
- **Com vínculo CadÚnico (S):** 22 | **Parcial/Indireto:** 20 | **A confirmar:** 14 | **N:** 8

---

## Distribuição por Dimensão IVS-H

| Dimensão IVS-H | Programas com relação direta | Programas com relação indireta | Multidimensional |
|---|---|---|---|
| Capital Humano | 14 | 11 | — |
| Renda e Trabalho | 18 | 7 | — |
| Infraestrutura Urbana | 6 | 2 | — |
| Multidimensional | — | — | 12 |
| Governança | 11 | — | — |

> Leitura estratégica: **Capital Humano** e **Renda e Trabalho** concentram a maior cobertura programática.
> **Infraestrutura Urbana** é a dimensão com menor cobertura — especialmente IU_03 (mobilidade urbana),
> que não possui programa municipal com relação direta.

---

## Distribuição por Grupo Temático

| # | Grupo | Qtd. Programas |
|---|---|---|
| 1 | Proteção Social Básica | 3 |
| 2 | Proteção Social Especial — Média Complexidade | 6 |
| 3 | Proteção Social Especial — Alta Complexidade | 10 |
| 4 | Programas Municipais Específicos (Inclusão) | 11 |
| 5 | Segurança Alimentar | 5 |
| 6 | Habitação | 4 |
| 7 | Inserção Produtiva e Qualificação | 13 |
| 8 | Públicos Específicos / Direitos Humanos | 10 |
| 9 | Formação Cultural | 1 |
| 10 | Saúde com Interface SUAS | 2 |
| 11 | Governança e Conselhos | 11 |
| | **Total** | **64** |

---

## Pontos Cegos Estruturais (síntese)

| Ponto Cego | Impacto |
|---|---|
| Alta Complexidade: OSCs executoras não identificadas | 5 modalidades sem `id_orgao_executor` definitivo |
| Centro POP e pop. de rua: sem CPF → fora do CadÚnico | Subnotificação estrutural |
| MEI e trabalhadores informais: não aparecem no CAGED | RT_03 subestimado |
| Jovens fora do CadÚnico e fora da escola | CH_03/CH_08 subestimados |
| Renda real vs renda declarada no CadÚnico | RT_01 impreciso |
| Programas de Cultura sem registro de matrículas | Sem entrada em FATO_ATENDIMENTO |

> Detalhamento completo: `00_governanca/notas_arquiteturais_programas_sociais.md`

---

## Lacuna Programática Identificada

| Variável IVS-H | Descrição | Cobertura Programática |
|---|---|---|
| IU_03 | Mobilidade urbana / ausência de carro + renda | **Nenhum programa com relação direta** |
| CH_08 | Geração nem-nem (15–29 sem escola e sem emprego) | Cobertura fragmentada — APRENDIZ_SOCIAL + MSE + SCFV |
| RT_04 | Renda domiciliar dependente de idoso ≤ ½ SM | Cobertura restrita a ILPI e POL_IDOSO |

---

## Log de Alterações

| Versão | Data | Descrição |
|---|---|---|
| v01 | 2026-03-11 | Criação — documento mestre com resumo executivo, distribuição IVS e links para os 4 arquivos especializados |

---

*Atlas Social de Hortolândia — uso interno*  
*Para navegar no detalhe, acesse os arquivos especializados listados acima.*
