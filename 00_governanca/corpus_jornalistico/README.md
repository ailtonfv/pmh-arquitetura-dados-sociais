[README_corpus_v1_5.md](https://github.com/user-attachments/files/26859621/README_corpus_v1_5.md)
# CORPUS JORNALÍSTICO

## Evidências Empíricas da Vulnerabilidade Social em Hortolândia

**Versão:** v1.5  
**Data:** "18/04/2026"  
**Responsável:** Ailton Vendramini  
**Iniciativa:** Atlas Social de Hortolândia  
**Regras de classificação:** `regras_de_classificacao_v10_1.md`

---

## 🎯 Finalidade

Este documento descreve a metodologia para estruturação e análise de notícias locais como **evidência empírica da vulnerabilidade social**, compondo uma camada complementar ao IVS-H.

Seu objetivo é integrar:

* **dados estruturais** — indicadores oficiais (IVS-H, CadÚnico, IBGE)
* **eventos reais observados no município** — corpus jornalístico

---

## 🧠 Arquitetura Conceitual

```
IVS-H
→ Estrutura da vulnerabilidade
→ Dados estruturais e estáveis

+

Corpus Jornalístico
→ Manifestações e pressões da vulnerabilidade
→ Dados dinâmicos e observados

=

IPST-H
→ Índice de Pressão Social Territorial de Hortolândia
→ Onde a vulnerabilidade se transforma em pressão sobre o Estado
```

> **O IVS-H mostra onde está a vulnerabilidade.**
> **O IPST-H mostra onde a vulnerabilidade se transforma em pressão sobre o Estado.**

---

## 🧱 Framework de Três Camadas Analíticas

Todo registro percorre três camadas de decisão em sequência:

### Camada 1 — Classificação Estrutural
> *O que é este evento e onde impacta?*

| Campo | Valores |
|---|---|
| `tipo_camada` | `IVS` \| `GOVERNANCA` \| `PRESSAO_SOCIAL` \| `CONTEXTO` |
| `dimensao_analitica` | `capital_humano` \| `infraestrutura_urbana` \| `renda_trabalho` |

### Camada 2 — Qualificação Analítica
> *Como este evento se relaciona com o modelo?*

| Campo | Valores |
|---|---|
| `tipo_relacao_variavel` | `direta` \| `indireta` \| `contextual` \| `latente` |
| `codigo_variavel` | código IVS \| `GOV_MUNICIPAL` \| `SMIDS_EXT` |
| `observacao` | vocabulário controlado (15 valores) |

### Camada 3 — Integração Dinâmica
> *Como este evento se conecta ao território ao longo do tempo?*

| Campo | Valores |
|---|---|
| `papel_no_ciclo` | `emergencia` \| `resposta` \| `agravamento` \| `sinal_desfecho` \| `nao_aplicavel` |
| `id_caso_pressao` | agrupamento temático (opcional) |
| `entra_ipst` | `sim` \| `avaliar` \| `nao` |

---

## 📊 Matriz Analítica

O corpus é estruturado como uma matriz de dois eixos ortogonais:

| | `capital_humano` | `infraestrutura_urbana` | `renda_trabalho` |
|---|---|---|---|
| `IVS` | analfabetismo | saneamento inadequado | desocupação |
| `PRESSAO_SOCIAL` | feminicídio | enchente | informalidade |
| `GOVERNANCA` | programa social | Tapa-Buraco | DECOLA |
| `CONTEXTO` | editorial sobre família | onda de calor | carga tributária |

> **Células vazias são informação** — indicam ausência de cobertura ou de atuação do Estado.

---

## 🔎 tipo_camada — Natureza do Evento

| Valor | Critério |
|---|---|
| `IVS` | Mede ou aproxima variável das 16 do IVS/IPEA |
| `GOVERNANCA` | Ação direta do Estado (municipal, estadual ou federal) |
| `PRESSAO_SOCIAL` | Fenômeno relevante, mensurável, fora das 16 variáveis IVS |
| `CONTEXTO` | Pano de fundo sem impacto social identificável direto |

> **Princípio:** `codigo_variavel` identifica o universo analítico de referência. `tipo_camada` especifica a natureza do registro dentro desse universo.

---

## 🔎 tipo_relacao_variavel

| Valor | Critério |
|---|---|
| `direta` | Mede variável IVS (explícita ou estatisticamente defensável) |
| `indireta` | Atua sobre a variável (obra, programa, política pública) |
| `contextual` | Descreve contexto sem atuação direta |
| `latente` | Política com potencial mensurável ainda não observado |

> **Regra R21:** violência letal nunca é `contextual` — sempre `direta` ou `indireta`.

---

## 🔎 codigo_variavel

| Situação | Preenchimento |
|---|---|
| Variável IVS mensurável | Código (ex: `CH_06`, `RT_01`) |
| Sem variável IVS | vazio |
| Governança | `GOV_MUNICIPAL`, `GOV_ESTADUAL`, `GOV_FEDERAL` |
| PRESSAO_SOCIAL ou CONTEXTO | `SMIDS_EXT` |

> **SMIDS_EXT** designa eventos analiticamente relevantes que não correspondem nem ao IVS clássico nem à governança. Não é gaveta residual — é categoria robusta que exige `tipo_camada`, `dimensao_analitica`, `observacao` e `entra_ipst` preenchidos.

---

## 🔎 papel_no_ciclo — Ciclo de Pressão Social

O corpus registra a posição de cada evento no ciclo:

```
PRESSAO_SOCIAL aparece
    ↓ emergencia
Estado responde
    ↓ resposta
Pressão persiste ou volta
    ↓ agravamento
Indício de melhora
    ↓ sinal_desfecho
```

> **Regra R22:** `GOVERNANCA` só recebe `papel_no_ciclo = resposta` quando há pressão identificável como gatilho. Ações estruturais e preventivas → `nao_aplicavel`.

> **Regra R20:** `agravamento` é válido mesmo sem histórico no corpus, quando a própria matéria documenta progressão mensurável.

---

## ⚠️ Princípio Fundamental

> *"IVS mede. Governança e SMIDS_EXT explicam."*

> *"O corpus não é o lugar onde o ciclo se resolve. É o lugar onde o ciclo começa a ser visível."*

---

## 📌 Schema Completo dos Registros

| Campo | Camada | Obrigatório |
|---|---|---|
| `id_evento` | — | sim |
| `data_publicacao` | — | sim |
| `fonte` | — | sim |
| `titulo` | — | sim |
| `pagina` | — | sim |
| `municipio` | — | sim |
| `localidade` | — | sim |
| `tipo_camada` | 1 | sim |
| `dimensao_analitica` | 1 | sim (salvo narrativo puro) |
| `tipo_relacao_variavel` | 2 | sim |
| `codigo_variavel` | 2 | sim |
| `nivel_criticidade` | 2 | sim |
| `observacao` | 2 | sim |
| `aproximacao_variavel` | 2 | não |
| `nota_analista` | 2 | não |
| `cod_loteamento` | — | sim |
| `nivel_confianca_loteamento` | — | sim |
| `papel_no_ciclo` | 3 | sim |
| `id_caso_pressao` | 3 | não |
| `entra_ipst` | 3 | sim |

---

## ⚠️ Limitações

* Tendência a registrar eventos extremos (viés de negatividade)
* Cobertura parcial do município
* Desfecho não observável diretamente — inferido por triangulação com CadÚnico e IVS-H

> O corpus deve ser interpretado como complemento analítico, não como instrumento de conclusão.

---

## 🔗 Integração com o IVS-H e IPST-H

| Instrumento | Função |
|---|---|
| IVS-H | Estrutura da vulnerabilidade (estoque) |
| Corpus jornalístico | Manifestações observadas (fluxo) |
| IPST-H | Pressão sobre o Estado (derivado) |

Registros `PRESSAO_SOCIAL + alerta + dado_auditavel` são candidatos naturais a variáveis do IPST-H.

---

## 📚 Documentação Relacionada

* `regras_de_classificacao_v10_1.md` — regras operacionais completas
* `series_jornalisticas/` — arquivos CSV por edição

---

## 📚 Referências

* Instituto de Pesquisa Econômica Aplicada (IPEA). *Atlas da Vulnerabilidade Social*
* Schrodt, P. — Event Data Analysis
* Lazer et al. — Computational Social Science

---
