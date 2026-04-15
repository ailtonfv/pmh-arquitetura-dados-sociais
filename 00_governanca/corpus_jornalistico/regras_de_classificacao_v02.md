[regras_de_classificacao_v02.md](https://github.com/user-attachments/files/26748477/regras_de_classificacao_v02.md)[Uploading regr# Regras de Classificacao -- Corpus Jornalistico
**Versao:** v02
**Data:** "15/04/2026"
**Responsavel:** Ailton Vendramini
**Repositorio:** Atlas-Social-de-Hortolandia / 00_governanca/corpus_jornalistico/

---

## 0. Framework Analitico de 3 Camadas

O corpus registra eventos em tres camadas analiticas distintas. Manter essa separacao e essencial para preservar o poder discriminativo do modelo.

| Camada | Tipo | Codigos | Funcao |
|---|---|---|---|
| **Camada 1 — IVS** | Vulnerabilidade | `infraestrutura_urbana`, `capital_humano`, `renda_trabalho`, `multidimensional` | Mede ou sinaliza vulnerabilidade da populacao |
| **Camada 2 — Governanca** | Resposta do Estado | `SMIDS_GOV` | Explica capacidade de resposta institucional |
| **Camada 3 — Contexto** | Sinais fracos | `SMIDS_EXT` | Antecipa tendencias; pressao social; narrativas difusas |

> **Principio operacional:**  
> *"IVS mede. GOV e SMIDS_EXT explicam."*  
> Nao forcamos eventos para o IVS apenas para evitar campos vazios.

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
| `direta` | O evento **mede** a variavel IVS -- produz dado mensuravel sobre o fenomeno |
| `indireta` | O evento contribui por via secundaria -- obra, investimento, programa, politica publica |
| `contextual` | O evento fornece contexto sem metrica IVS defensavel |

> **Regra R01:** `direta` e raro. Exige que o evento produza dado mensuravel sobre a variavel, nao apenas a sinalize.  
> **Regra R02:** Obra / investimento / programa / acao institucional --> quase sempre `indireta`.  
> **Regra R03:** Politica publica --> quase sempre `indireta`.  
> **Regra R04:** `codigo_variavel` vazio quando o evento nao tem metrica IVS defensavel.

---

## 3. codigo_variavel

| Situacao | Preenchimento |
|---|---|
| Evento tem metrica IVS defensavel | Codigo da variavel (ex: `IU_01`, `CH_05`) |
| Evento nao tem metrica IVS defensavel | Campo vazio |
| Politica ainda nao implementada | Codigo da variavel + nota em `observacao`: "impacto potencial -- politica ainda nao implementada" |
| Evento de governanca sem variavel IVS | `SMIDS_GOV` |
| Evento de contexto / sinal fraco | `SMIDS_EXT` |

---

## 4. Regra para "multidimensional"

`multidimensional` nao e codigo de "incerteza". E codigo de **atuacao simultanea em mais de uma dimensao do IVS**.

**Uso correto:**
- PAIF (atua em CH e RT simultaneamente)
- Situacao de rua (IU + CH + RT)
- Programas que atravessam dimensoes de forma institucional e inequivoca

**Uso incorreto:**
- "nao sei onde encaixar" --> usar `SMIDS_EXT` ou campo vazio
- Programas com repercussao difusa --> restringir ao nucleo de incidencia

> **Regra R05:** Manter na tabela apenas variaveis com incidencia mais defensavel.  
> Efeitos difusos registrar na coluna `observacao` / `justificativa_analitica`.  
> Isso reduz inflacao relacional e preserva poder discriminativo.

---

## 5. Eventos a Remover do Corpus

| Tipo | Criterio |
|---|---|
| Temas politico-institucionais sensiveis | Ex: investigacoes com agentes publicos, PF, CEI de natureza controversa |
| Beneficios de servidores municipais | Publico nao e o vulneravel do CadUnico -- fora do escopo IVS |

> **Regra R06:** Servidores municipais nao sao publico-alvo do IVS. Se mantido, usar campo vazio + `contextual`.

---

## 6. Outros Casos Especiais

| Situacao | Tratamento |
|---|---|
| Politica ainda nao implementada | Manter variavel + registrar na `observacao` |
| Corpus captura presenca estatal positiva | Sinais institucionais de resposta sao validos (contraponto aos problemas) |
| Eventos regionais (RMC, Estado SP) | Usar `localidade = Regional`; `cod_loteamento` vazio; criterio: impacto direto ou provavel em variaveis IVS-H de Hortolandia |

> **Regra R07:** Politica nao implementada: manter variavel + nota na observacao.  
> **Regra R08:** Corpus captura sinais de presenca estatal positivos.

---

## 7. Distincao entre Corpus e `rel_programa_variavel_ivs_v03.md`

| Instrumento | Logica | Funcao |
|---|---|---|
| `rel_programa_variavel_ivs_v03.md` | Relacao conceitual -- mais permissivo | Define o que cada programa **pode** medir |
| Corpus jornalistico | Evento observado -- mais restrito | Registra o que cada evento **efetivamente** mede |

> O arquivo `.md` e a teoria. O corpus e a evidencia empirica.

---

## 8. Nota Arquitetural -- Instancias de Governanca (Pendente)

Os orgaos de controle social (CMAS, CMDCA, COMSEA, CAISAN, Conselhos Tutelares) sao conceitualmente distintos dos programas/servicos com incidencia IVS. Futuramente, considerar tabela separada:

- `REL_INSTANCIA_GOVERNANCA_DIMENSAO`

**Status:** proposta para fase 2. Ate la, manter em `governanca` com `cod_variavel_ivs = NULL`.

---

## Log de Alteracoes

| Versao | Data | Alteracoes |
|---|---|---|
| v01 | "14/04/2026" | Criacao -- regras consolidadas na sessao de revisao metodologica |
| v02 | "15/04/2026" | Framework de 3 camadas (IVS / Governanca / SMIDS_EXT); regra `multidimensional`; regras R01-R08 formalizadas; nota arquitetural sobre instancias de governanca |

---

*Arquivo de governanca -- Atlas Social de Hortolandia*
*00_governanca/corpus_jornalistico/*
as_de_classificacao_v02.md…]()
