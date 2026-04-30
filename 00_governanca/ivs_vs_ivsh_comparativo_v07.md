# IVS × IVS-H — Comparativo das 16 Variáveis de Vulnerabilidade Social

**Arquivo:** `00_governanca/ivs_vs_ivsh_comparativo_v05.md`
**Versão:** v07
**Data:** "30/04/2026"
**Responsável:** Ailton Vendramini
**Repositório:** Atlas-Social-de-Hortolândia

---

## ⚠️ Nota Metodológica — Fase do Projeto

Para o MVP (Fase 1), o IVS-H será calculado com base na metodologia original do IPEA, garantindo comparabilidade nacional e execução imediata.

> ⚠️ Dados do CadÚnico representam apenas a população cadastrada, não a população total do município.

---

## Nota Arquitetural — Dois Índices Complementares

* **IVS-H:** mede vulnerabilidade estrutural
* **IPST-H:** mede pressão sobre o Estado

> “O IVS mostra onde está a vulnerabilidade. O IPST-H mostra onde ela se transforma em pressão.”

---

## 📘 Escopo Completo das Variáveis do IVS-H

### 🔹 Infraestrutura Urbana

* IU_01 — água/esgoto inadequados
* IU_02 — ausência de coleta de lixo
* IU_03 — baixa renda + tempo elevado de deslocamento

### 🔹 Capital Humano

* CH_01 — mortalidade infantil
* CH_02 — crianças 0–5 fora da escola
* CH_03 — crianças 6–14 fora da escola
* CH_04 — gravidez na adolescência
* CH_05 — mães chefes com baixa escolaridade
* CH_06 — analfabetismo (15+)
* CH_07 — baixa escolaridade no domicílio
* CH_08 — jovens nem-nem com baixa renda

### 🔹 Renda e Trabalho

* RT_01 — renda per capita ≤ 1/2 SM
* RT_02 — desocupação
* RT_03 — informalidade + baixa escolaridade
* RT_04 — baixa renda + presença de idoso
* RT_05 — trabalho infantil

> 🔎 Detalhamento técnico completo: `01_modelagem_conceitual/dim_variavel_IVS_v01r7.md`

---
Na Fase 1, o IVS-H será calculado exclusivamente com variáveis disponíveis no CadÚnico, garantindo execução imediata com dados reais.

Variáveis incluídas:
- RT_01 — renda per capita ≤ 1/2 SM
- RT_04 — baixa renda + presença de idoso
- CH_05 — mães chefes com baixa escolaridade
- CH_06 — analfabetismo (15+)
- CH_07 — baixa escolaridade no domicílio

As demais variáveis serão incorporadas progressivamente nas fases seguintes, conforme integração com bases externas (IBGE, CAGED, Saúde e Educação).

---

## Resumo Executivo por Dimensão

| Dimensão              | Peso IVS-H | Interpretação                      |
| --------------------- | ---------- | ---------------------------------- |
| Infraestrutura Urbana | ~15–20%    | Baixo impacto relativo             |
| Capital Humano        | ~40–45%    | Principal vetor de vulnerabilidade |
| Renda e Trabalho      | ~35–40%    | Tensão socioeconômica central      |

> 💡 A vulnerabilidade em Hortolândia é predominantemente socioeconômica, não infraestrutural.

---

## Dimensão 3 — Renda e Trabalho (ajuste crítico)

RT_04 — % pessoas em domicílios com renda ≤ 1/2 SM e com presença de idoso (≥60)

**Interpretação:**
Captura famílias de baixa renda com presença de idoso, indicando maior necessidade de cuidados e pressão sobre serviços públicos.
Não pressupõe dependência econômica do idoso.

---

## Nota de Interpretação

O IVS-H deve ser entendido como instrumento de priorização de políticas públicas.

Cada variável aponta não apenas para a existência de vulnerabilidade, mas para sua natureza:

* educação
* trabalho
* assistência
* saúde

---

## Conclusão Estratégica

O IVS-H permite:

* identificar onde atuar
* identificar para quem atuar
* orientar qual política aplicar

> O índice não apenas mede vulnerabilidade — orienta decisão.

---

## Log de Alterações

| Versão | Data       | Alterações                                                                    |
| ------ | ---------- | ----------------------------------------------------------------------------- |
| v07    | 30/04/2026 | Inclusão da lista completa das variáveis; ajuste RT_04; reforço institucional |
