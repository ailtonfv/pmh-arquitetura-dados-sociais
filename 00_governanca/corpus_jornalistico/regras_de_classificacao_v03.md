# Regras de Classificacao -- Corpus Jornalistico
**Versao:** v03
**Data:** "15/04/2026"
**Responsavel:** Ailton Vendramini
**Repositorio:** Atlas-Social-de-Hortolandia / 00_governanca/corpus_jornalistico/

---

## 0. Framework Analitico de 3 Camadas

O corpus registra eventos em tres camadas analiticas distintas. Manter essa separacao e essencial para preservar o poder discriminativo do modelo.

| Camada | Tipo | Codigos | Funcao |
|---|---|---|---|
| **Camada 1 — IVS** | Vulnerabilidade | `infraestrutura_urbana`, `capital_humano`, `renda_trabalho`, `multidimensional` | Mede ou sinaliza vulnerabilidade da populacao |
| **Camada 2 — Governanca** | Resposta do Estado | `GOV_MUNICIPAL`, `GOV_ESTADUAL`, `GOV_FEDERAL` | Explica capacidade de resposta institucional |
| **Camada 3 — Contexto** | Sinais fracos | `SMIDS_EXT` | Antecipa tendencias; pressao social; narrativas difusas |

> **Principio operacional:**  
> *"IVS mede. GOV e SMIDS_EXT explicam."*  
> Nao forcamos eventos para o IVS apenas para evitar campos vazios.

**Nota de migracao:** entradas anteriores com `SMIDS_GOV` devem ser migradas para `GOV_MUNICIPAL` em script batch futuro.

---

## 1. nivel_criticidade

| Valor | Criterio |
|---|---|
| `alta` | Impacto direto na populacao vulneravel |
| `media` | Impacto indireto |
| `baixa` | Acao institucional / preventiva |
| `alerta` | Evento critico -- violencia, risco grave, morte |

---

## 2. tipo_relacao_variavel

| Valor | Criterio |
|---|---|
| `direta` | O evento **mede** a variavel IVS -- producao de dado mensuravel, explicita ou estatisticamente defensavel |
| `indireta` | O evento contribui por via secundaria -- obra, investimento, programa, politica publica |
| `contextual` | O evento fornece contexto sem metrica IVS defensavel |
| `latente` | Politica ou programa recentemente lancado com potencial mensuravel ainda nao observado empiricamente |

> **Regra R01:** `direta` exige mensuracao explicita OU estatisticamente defensavel. Nao basta sinalizar ou influenciar a variavel.  
> **Regra R02:** Obra / investimento / programa / acao institucional --> quase sempre `indireta`.  
> **Regra R03:** Politica publica --> quase sempre `indireta` ou `latente`.  
> **Regra R04:** `codigo_variavel` vazio quando o evento nao tem metrica IVS defensavel.

---

## 3. codigo_variavel

| Situacao | Preenchimento |
|---|---|
| Evento tem metrica IVS defensavel | Codigo da variavel (ex: `IU_01`, `CH_05`) |
| Evento nao tem metrica IVS defensavel | Campo vazio |
| Politica recentemente lancada sem efeito empirico ainda | Codigo da variavel + `tipo_relacao = latente` + nota na `observacao` |
| Variavel proxima (melhor aproximacao disponivel) | Codigo + nota obrigatoria na `observacao`: "variavel proxima -- [descricao do vinculo real]" |
| Evento de governanca municipal | `GOV_MUNICIPAL` |
| Evento de governanca estadual | `GOV_ESTADUAL` |
| Evento de governanca federal | `GOV_FEDERAL` |
| Evento de contexto / sinal fraco | `SMIDS_EXT` |

---

## 4. Regra para "multidimensional"

`multidimensional` nao e codigo de "incerteza". E codigo de **atuacao simultanea em mais de uma dimensao do IVS**.

**Uso correto:**
- PAIF (atua em CH e RT simultaneamente de forma inequivoca)
- Situacao de rua (IU + CH + RT)
- Programas que atravessam dimensoes de forma institucional e documentada

**Uso incorreto:**
- "nao sei onde encaixar" → usar `SMIDS_EXT` ou campo vazio
- Programas com repercussao difusa → restringir ao nucleo de incidencia principal

> **Regra R05:** Uso de `multidimensional` exige **justificativa explicita** na coluna `observacao`.  
> Sem justificativa, o campo nao e aceito na revisao metodologica.

---

## 5. Eventos a Remover ou Rebaixar

| Tipo | Tratamento |
|---|---|
| Temas politico-institucionais sensiveis sem impacto IVS claro | Rebaixar para `SMIDS_EXT | contextual | baixa` em vez de remover -- preserva o dado |
| Beneficios de servidores municipais sem impacto na populacao vulneravel | Rebaixar para `SMIDS_EXT | contextual | baixa` com nota |
| Eventos corporativos municipais sem nexo IVS | Rebaixar para `SMIDS_EXT | contextual | baixa` |

> **Regra R06 (revisada):** Em vez de excluir, rebaixar para `SMIDS_EXT | contextual | baixa`.  
> Excecao: remover apenas quando o item comprometer a credibilidade metodologica do corpus (ex: conteudo editorial explicitamente politico-eleitoral).

---

## 6. Outros Casos Especiais

| Situacao | Tratamento |
|---|---|
| Politica publica recentemente lancada | `latente` + codigo da variavel + nota na `observacao` |
| Corpus captura presenca estatal positiva | Sinais institucionais de resposta sao validos como contraponto |
| Eventos regionais (RMC, Estado SP) | `localidade = Regional`; `cod_loteamento` vazio; criterio: impacto direto ou provavel em variaveis IVS-H de Hortolandia |

> **Regra R07:** Politica `latente`: variavel + nota na observacao.  
> **Regra R08:** Corpus captura sinais de presenca estatal positivos.

---

## 7. Distincao entre Corpus e `rel_programa_variavel_ivs_v03.md`

| Instrumento | Logica | Funcao |
|---|---|---|
| `rel_programa_variavel_ivs_v03.md` | Relacao conceitual -- mais permissivo | Define o que cada programa **pode** medir |
| Corpus jornalistico | Evento observado -- mais restrito | Registra o que cada evento **efetivamente** mede |

> O arquivo `.md` e a teoria. O corpus e a evidencia empirica.

---

## 8. Nota Arquitetural — Instancias de Governanca (Pendente)

Os orgaos de controle social (CMAS, CMDCA, COMSEA, CAISAN, Conselhos Tutelares) sao conceitualmente distintos dos programas/servicos com incidencia IVS. Futuramente, considerar tabela separada:

- `REL_INSTANCIA_GOVERNANCA_DIMENSAO`

**Status:** proposta para fase 2. Ate la, manter em `GOV_MUNICIPAL` com `cod_variavel_ivs = NULL`.

---

## 9. Nota Arquitetural — Politicas Publicas (Pendente)

Politicas normativas (PNE, PNAS, NOB-SUAS) sao distintas de programas operacionais.  
Futuramente: `DIM_POLITICA_PUBLICA` com campos `tipo`, `nome`, `eixo`, `status`, `data_inicio`, `data_fim`.

**Tratamento atual:** registrar em `rel_programa_variavel_ivs_v03.md` com `tipo_instrumento = politica_federal/estadual/municipal` e `tipo_relacao = latente` ou `indireta`.

**Status:** proposta para fase 2 (durante auditoria de tabelas do `hortolandia.db`).

---

## Log de Alteracoes

| Versao | Data | Alteracoes |
|---|---|---|
| v01 | "14/04/2026" | Criacao -- regras consolidadas na sessao de revisao metodologica |
| v02 | "15/04/2026" | Framework de 3 camadas; regras R01-R08 formalizadas; nota arquitetural governanca |
| v03 | "15/04/2026" | `SMIDS_GOV` → `GOV_MUNICIPAL/ESTADUAL/FEDERAL`; adiciona `latente`; R01 refinado (mensuracao explicita OU defensavel); R05 exige justificativa obrigatoria para multidimensional; R06 revisada (rebaixar em vez de remover); nota arquitetural DIM_POLITICA_PUBLICA |

---

*Arquivo de governanca -- Atlas Social de Hortolandia*
*00_governanca/corpus_jornalistico/*
regras_de_classificacao_v03.md…]()
