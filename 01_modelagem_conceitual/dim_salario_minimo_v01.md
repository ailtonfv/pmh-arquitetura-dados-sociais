# DIM_SALARIO_MINIMO — Série Histórica do Salário Mínimo

**Versão:** v01  
**Data:** "29/03/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 01_modelagem_conceitual  

---

## Objetivo

Registrar a série histórica do salário mínimo brasileiro para garantir
rastreabilidade temporal dos cálculos do IVS-H, em especial RT_01
(renda per capita ≤ 0,5 SM), cujo denominador varia conforme o valor
vigente na competência da base utilizada.

## Aplicação no IVS-H

| Variável | Uso |
| --- | --- |
| RT_01 | Pessoas em famílias com renda per capita ≤ 0,5 × valor_sm |
| RT_04 | Domicílios com renda per capita ≤ 0,5 × valor_sm e presença de idoso |

**Regra de aplicação:** usar o `valor_sm` cuja janela `data_inicio` ≤
`competencia_base` ≤ `data_fim`. Para a base CadÚnico dez/2025,
o valor aplicável é **R$ 1.518,00** — meio SM = **R$ 759,00**.

---

## Estrutura

```
data_inicio      data de vigência inicial (ISO 8601: YYYY-MM-DD)
data_fim         data de vigência final   (ISO 8601: YYYY-MM-DD)
                 9999-12-31 = vigência aberta (valor atual)
valor_sm         valor nominal em reais
variacao_pct     variação percentual em relação ao valor anterior
```

---

## Série Histórica

| data_inicio | data_fim | valor_sm | variacao_pct |
| --- | --- | --- | --- |
| 1994-07-01 | 1994-08-31 | 64.79 | — |
| 1994-09-01 | 1995-04-30 | 70.00 | 8.04% |
| 1995-05-01 | 1996-04-30 | 100.00 | 42.86% |
| 1996-05-01 | 1997-04-30 | 112.00 | 12.00% |
| 1997-05-01 | 1998-04-30 | 120.00 | 7.14% |
| 1998-05-01 | 1999-05-31 | 130.00 | 8.33% |
| 1999-06-01 | 2000-05-31 | 136.00 | 4.62% |
| 2000-06-01 | 2001-05-31 | 151.00 | 11.03% |
| 2001-06-01 | 2002-05-31 | 180.00 | 19.21% |
| 2002-06-01 | 2003-05-31 | 200.00 | 11.11% |
| 2003-06-01 | 2004-04-30 | 240.00 | 20.00% |
| 2004-05-01 | 2005-04-30 | 260.00 | 8.33% |
| 2005-05-01 | 2006-03-31 | 300.00 | 15.38% |
| 2006-04-01 | 2007-03-31 | 350.00 | 16.67% |
| 2007-04-01 | 2008-02-29 | 380.00 | 8.57% |
| 2008-03-01 | 2009-01-31 | 415.00 | 9.21% |
| 2009-02-01 | 2009-12-31 | 465.00 | 12.05% |
| 2010-01-01 | 2010-12-31 | 510.00 | 9.68% |
| 2011-01-01 | 2011-02-28 | 540.00 | 5.88% |
| 2011-03-01 | 2011-12-31 | 545.00 | 0.93% |
| 2012-01-01 | 2012-12-31 | 622.00 | 14.13% |
| 2013-01-01 | 2013-12-31 | 678.00 | 9.00% |
| 2014-01-01 | 2014-12-31 | 724.00 | 6.78% |
| 2015-01-01 | 2015-12-31 | 788.00 | 8.84% |
| 2016-01-01 | 2016-12-31 | 880.00 | 11.68% |
| 2017-01-01 | 2017-12-31 | 937.00 | 6.48% |
| 2018-01-01 | 2018-12-31 | 954.00 | 1.81% |
| 2019-01-01 | 2019-12-31 | 998.00 | 4.61% |
| 2020-01-01 | 2020-01-31 | 1039.00 | 4.10% |
| 2020-02-01 | 2020-12-31 | 1045.00 | 0.58% |
| 2021-01-01 | 2021-12-31 | 1100.00 | 5.26% |
| 2022-01-01 | 2022-12-31 | 1212.00 | 10.18% |
| 2023-01-01 | 2023-04-30 | 1302.00 | 7.43% |
| 2023-05-01 | 2023-12-31 | 1320.00 | 1.38% |
| 2024-01-01 | 2024-12-31 | 1412.00 | 6.97% |
| 2025-01-01 | 2025-12-31 | 1518.00 | 7.50% |
| 2026-01-01 | 9999-12-31 | 1621.00 | 6.79% |

---

## Valor de Referência — MVP Fase 1

| Competência base | Valor SM vigente | Meio SM (limiar RT_01 / RT_04) |
| --- | --- | --- |
| Dezembro/2025 | R$ 1.518,00 | R$ 759,00 |
| Janeiro/2026 em diante | R$ 1.621,00 | R$ 810,50 |

---

## Nota Metodológica

A série inicia em julho de 1994, com a introdução do Real.
Valores anteriores ao Plano Real não são relevantes para o IVS-H
dado que a base CadÚnico mais antiga disponível no projeto
é de dezembro de 2025.

O campo `variacao_pct` é informativo — não utilizado nos cálculos
do IVS-H. Serve para contextualização histórica e eventual análise
de poder de compra ao longo do tempo.

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "29/03/2026" | Criação — série histórica 1994-2025; estrutura data_inicio / data_fim / valor_sm; valor de referência MVP dez/2025 definido como R$ 1.518,00 |
| v01.1 | "29/03/2026" | Adição do SM 2026: R$ 1.621,00 (+6,79%, vigência 01/01/2026); meio SM 2026 = R$ 810,50; tabela de referência expandida |

---

*Documento de modelagem conceitual — 01_modelagem_conceitual/*  
*Atlas Social de Hortolândia — uso interno*

[dim_salario_minimo_v01.md](https://github.com/user-attachments/files/26325303/dim_salario_minimo_v01.md)
