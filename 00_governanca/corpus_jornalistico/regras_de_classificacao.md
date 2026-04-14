# Regras de Classificação — Corpus Jornalístico
**Versão:** v01  
**Data:** 14/04/2026  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 00_governanca/corpus_jornalistico/

---

## 1. nivel_criticidade

| Valor | Critério |
|---|---|
| `alta` | Impacto direto na populacao |
| `media` | Impacto indireto |
| `baixa` | Ação institucional / preventiva |
| `alerta` | Evento crítico — violência, risco grave |

---

## 2. tipo_relacao_variavel

| Valor | Critério |
|---|---|
| `direta` | O evento **mede** a variável IVS — não apenas a sinaliza |
| `indireta` | O evento contribui por via secundária — obra, investimento, política pública |
| `contextual` | O evento fornece contexto sem métrica IVS defensável |

> **Regra prática:** obra / investimento / programa → quase sempre `indireta`.  
> `direta` é raro — exige que o evento produza um dado mensurável sobre a variável.

---

## 3. codigo_variavel

| Situação | Preenchimento |
|---|---|
| Evento tem métrica IVS defensável | Código da variável (ex: `IU_01`, `CH_05`) |
| Evento não tem métrica IVS defensável | Campo vazio |
| Política ainda não implementada | Código da variável + nota em `observacao`: "impacto potencial — política ainda não implementada" |

---

## 4. Eventos a Remover do Corpus

| Tipo | Critério |
|---|---|
| Temas político-institucionais sensíveis | Ex: CEI Coffee Break, investigações com vice-prefeito, PF |
| Benefícios de servidores municipais | Público não é o vulnerável do CadÚnico — fora do escopo IVS |

---

## 5. Distinção entre Corpus e `rel_programa_variavel_ivs_v03.md`

| Instrumento | Lógica | Função |
|---|---|---|
| `rel_programa_variavel_ivs_v03.md` | Relação conceitual — mais permissivo | Define o que cada programa **pode** medir |
| Corpus jornalístico | Evento observado — mais restrito | Registra o que cada evento **efetivamente** mede |

> O arquivo `.md` é a teoria. O corpus é a evidência empírica.

---

## Log de Alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | 14/04/2026 | Criação — regras consolidadas na sessão de revisão metodológica |

---

*Arquivo de governança — Atlas Social de Hortolândia*  
*00_governanca/corpus_jornalistico/*
