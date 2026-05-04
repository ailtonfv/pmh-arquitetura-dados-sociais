[ivs_vs_ivsh_comparativo_v08 (1).md](https://github.com/user-attachments/files/27360642/ivs_vs_ivsh_comparativo_v08.1.md)
# IVS × IVS-H — Comparativo das 16 Variáveis de Vulnerabilidade Social

**Arquivo:** `00_governanca/ivs_vs_ivsh_comparativo_v08.md`
**Versão:** v08
**Data:** "04/05/2026"
**Responsável:** Ailton Vendramini
**Repositório:** Atlas-Social-de-Hortolândia

---

## ⚠️ Nota Metodológica — Fase do Projeto

Para o MVP (Fase 1), o IVS-H será calculado com base na metodologia original do IPEA,
garantindo comparabilidade nacional e execução imediata.

> ⚠️ Dados do CadÚnico representam apenas a população cadastrada, não a população
> total do município. Isso não é limitação — toda pessoa flaggada já está dentro
> do alcance da política municipal.

---

## Nota Arquitetural — Três Instrumentos Complementares

| Instrumento | O que mede | Base | Natureza |
|-------------|------------|------|----------|
| **IVS-H** | Vulnerabilidade estrutural da população | CadÚnico + IBGE | Quantitativo |
| **IPST-H** | Pressão mensurável sobre o Estado — sobrecarga da rede, lacunas de cobertura | Dados administrativos | Quantitativo |
| **IPSO-H** | Pressão social observada — o que está acontecendo agora | Corpus jornalístico (Tribuna Liberal) | Qualitativo / narrativo |

> "O IVS mostra onde está a vulnerabilidade. O IPST-H mostra onde ela se transforma em pressão
> mensurável sobre o Estado. O IPSO-H mostra o que está acontecendo agora."

**Os três instrumentos não se mesclam metodologicamente.** A integração é narrativa:
o IPSO-H valida qualitativamente o que o IVS-H e o IPST-H medem em bases quantitativas.

**Matriz de interpretação — IVS-H × IPST-H:**

| IVS | IPST | Interpretação |
|-----|------|---------------|
| Alto | Alto | Alta vulnerabilidade + Estado pressionado |
| Alto | Baixo | Vulnerabilidade alta, rede ainda absorvendo |
| Baixo | Alto | Pressão operacional (fluxo / mobilidade / rede insuficiente) |
| Baixo | Baixo | Situação estável |

> IPST-H: `01_modelagem_conceitual/ipst_h_modelo_v01.md` (a produzir).
> IPSO-H: `00_governanca/corpus_jornalistico/README_corpus_v1.5.md`.
> Detalhamento técnico de fontes: `arquitetura_dados_IVS_IBGE_Horto_v11.md`.

---

## 📘 As 16 Variáveis — Escopo Completo do IVS-H

### 🔹 Dimensão 1 — Infraestrutura Urbana (IU)

Peso IVS-H: **~15–20%** | Peso IPEA: 33%

> Infraestrutura de Hortolândia é predominantemente adequada no município agregado.
> O poder discriminatório de IU é **territorial** — concentra-se nos aglomerados subnormais.
> Ver Seção 6.1.7 do arquivo de arquitetura.

| Código | Variável | Fonte IVS-H | Fase | Status |
|--------|----------|-------------|------|--------|
| IU_01 | Água/esgoto inadequados | IBGE Censo 2022 — domicilio1/2/3 | Fase 2 | pendente (dicionário a mapear) |
| IU_02 | Ausência de coleta de lixo | IBGE Censo 2022 — domicilio1/2/3 | Fase 2 | pendente (dicionário a mapear) |
| IU_03 | Baixa renda + deslocamento > 1h | IBGE Censo 2022 — SIDRA Tab. 10330 | Fase 2 | proxy disponível (RT_mobilidade_pendular_longa = 12,7%) |

---

### 🔹 Dimensão 2 — Capital Humano (CH)

Peso IVS-H: **~40–45%** | Peso IPEA: 33%

> CH é o principal vetor de vulnerabilidade em Hortolândia.
> Dados históricos IPEA: CH caiu de 0,445 (2000) para 0,258 (2010) — maior melhora entre as dimensões.
> Justificativa empírica para peso elevado no IVS-H.

| Código | Variável | Fonte IVS-H | Fase | Status |
|--------|----------|-------------|------|--------|
| CH_01 | Mortalidade infantil | SIM/DATASUS | Fase 2 | pendente — integração Secretaria de Saúde (Renato) |
| CH_02 | Crianças 0–5 fora da escola | IBGE Censo 2022 — demografia | Fase 2 | pendente (dicionário a mapear) |
| CH_03 | Crianças 6–14 fora da escola | IBGE Censo 2022 — demografia | Fase 2 | pendente (dicionário a mapear) |
| CH_04 | Gravidez na adolescência (mães 10–17) | SIM/DATASUS | Fase 2 | pendente — integração Secretaria de Saúde |
| CH_05 | Mães chefes com baixa escolaridade | **CadÚnico** | **Fase 1** | ✅ variável identificada — aguarda linkage loteamento |
| CH_06 | Analfabetismo (15+) | **CadÚnico** | **Fase 1** | ✅ variável identificada — aguarda linkage loteamento |
| CH_07 | Baixa escolaridade no domicílio | **CadÚnico** | **Fase 1** | ✅ variável identificada — aguarda linkage loteamento |
| CH_08 | Jovens nem-nem com baixa renda | CadÚnico + CAGED | Fase 2 | pendente — requer cruzamento com CAGED |

---

### 🔹 Dimensão 3 — Renda e Trabalho (RT)

Peso IVS-H: **~35–40%** | Peso IPEA: 33%

> RT é a tensão socioeconômica central de Hortolândia.
> O município integra o Arranjo Populacional de Campinas (integração 0,42) —
> renda, emprego e mobilidade atravessam fronteiras municipais.

| Código | Variável | Fonte IVS-H | Fase | Status |
|--------|----------|-------------|------|--------|
| RT_01 | Renda per capita ≤ 1/2 SM | **CadÚnico** | **Fase 1** | ✅ calculado — **~60,5%** das famílias cadastradas |
| RT_02 | Desocupação | CadÚnico + CAGED | Fase 2 | pendente |
| RT_03 | Informalidade + baixa escolaridade | CadÚnico + CAGED | Fase 2 | pendente |
| RT_04 | Baixa renda + presença de idoso (≥60) | **CadÚnico** | **Fase 1** | ✅ variável identificada — aguarda linkage loteamento |
| RT_05 | Trabalho infantil | CadÚnico / Conselho Tutelar | Fase 2 | pendente |

> **RT_04 — Interpretação:**
> Captura famílias de baixa renda com presença de idoso, indicando maior necessidade
> de cuidados e pressão sobre serviços públicos. Não pressupõe dependência econômica do idoso.

> **Nota — Mobilidade Pendular:**
> As variáveis RT_mobilidade_pendular_saida (~62% proxy) e RT_mobilidade_pendular_longa (12,7%)
> pertencem à dimensão RT — não são variáveis das 16 originais do IPEA, mas complementos
> metodológicos do IVS-H para capturar a dinâmica metropolitana de Hortolândia.
> Detalhamento em `arquitetura_dados_IVS_IBGE_Horto_v11.md`, Seção 2.1.

---

## 📊 Estado da Fase 1 MVP

**Período de referência:** CadÚnico `2025_12`
**Registros disponíveis:** 72.424 indivíduos | 211 colunas
**Bloqueio crítico:** linkage endereço → loteamento (DE-PARA CEP → `cod_loteamento`)

| Variável | Cálculo municipal | Cálculo por loteamento |
|----------|-------------------|------------------------|
| RT_01 | ✅ **~60,5%** calculado | 🔴 bloqueado — aguarda linkage |
| RT_04 | ✅ identificada | 🔴 bloqueado — aguarda linkage |
| CH_05 | ✅ identificada | 🔴 bloqueado — aguarda linkage |
| CH_06 | ✅ identificada | 🔴 bloqueado — aguarda linkage |
| CH_07 | ✅ identificada | 🔴 bloqueado — aguarda linkage |

> O cálculo por loteamento é o produto estratégico do IVS-H.
> O cálculo municipal é apenas referência de validação.

---

## Resumo Executivo por Dimensão

| Dimensão | Peso IVS-H | Peso IPEA | Justificativa |
|----------|------------|-----------|---------------|
| Infraestrutura Urbana | ~15–20% | 33% | Cobertura municipal adequada — poder discriminatório territorial |
| Capital Humano | ~40–45% | 33% | Principal vetor — maior variação histórica (2000→2010) |
| Renda e Trabalho | ~35–40% | 33% | Tensão central — mobilidade pendular amplifica vulnerabilidade |

> 💡 A vulnerabilidade em Hortolândia é predominantemente socioeconômica, não infraestrutural.
> A exceção crítica está nos aglomerados subnormais — ver Seção 6.1.7 do arquivo de arquitetura.

---

## Conclusão Estratégica

O IVS-H permite:
- identificar **onde** atuar (território)
- identificar **para quem** atuar (família / grupo)
- orientar **qual política** aplicar (dimensão)

> O índice não apenas mede vulnerabilidade — orienta decisão.
> O IVS-H sozinho é diagnóstico. O IVS-H + IPST-H é gestão. O IVS-H + IPST-H + IPSO-H é inteligência institucional.

---

## Log de Alterações

| Versão | Data | Alterações |
|--------|------|------------|
| v01–v06 | "03/2026" | Versões iniciais — estruturação das variáveis e pesos |
| v07 | "30/04/2026" | Inclusão da lista completa das 16 variáveis; ajuste RT_04; nota IPST-H; reforço institucional |
| v08 | "04/05/2026" | Tabela de variáveis expandida — colunas Fonte IVS-H / Fase / Status adicionadas a todas as 3 dimensões; RT_01 com resultado confirmado (~60,5%); estado da Fase 1 MVP formalizado; **arquitetura de três instrumentos** (IVS-H / IPST-H / IPSO-H) — separação metodológica obrigatória, matriz IVS-H × IPST-H, referência ao README_corpus_v1.5.md; conclusão estratégica atualizada. |
