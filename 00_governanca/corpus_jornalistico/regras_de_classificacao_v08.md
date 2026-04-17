# Regras de Classificação — Corpus Jornalístico
**Versão:** v08  
**Data:** "17/04/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolandia / 00_governanca/corpus_jornalistico/

---

## Changelog v07 → v08

| Item | Mudança |
|---|---|
| `observacao` | Vocabulário controlado expandido de 6 para 15 valores |
| `observacao` | Valor único obrigatório — usar o preponderante quando houver conflito |
| `aproximacao_variavel` | Substitui `variavel_proxima` |
| `nota_analista` | Campo novo para texto livre analítico |
| R15 | Regra nova — hierarquia de classificação do campo `observacao` |

---

## 0. Framework Analítico de 3 Camadas

O corpus registra eventos em três camadas analíticas distintas.

| Camada | Tipo | Códigos | Função |
|---|---|---|---|
| **Camada 1 — IVS** | Vulnerabilidade | `infraestrutura_urbana`, `capital_humano`, `renda_trabalho`, `multidimensional` | Mede vulnerabilidade da população |
| **Camada 2 — Governança** | Resposta do Estado | `GOV_MUNICIPAL`, `GOV_ESTADUAL`, `GOV_FEDERAL` | Explica capacidade de resposta institucional |
| **Camada 3 — Contexto** | Sinais fracos | `SMIDS_EXT` | Captura pressões sociais, narrativas e sinais difusos |

> **Princípio central:**  
> *"IVS mede. Governança e SMIDS_EXT explicam."*

---

## 0.1 Definição Operacional de "Estado"

Para fins deste corpus:

- **Estado = Prefeitura de Hortolândia (nível municipal)**
- Também são considerados:
  - Estado de SP → `GOV_ESTADUAL`
  - União → `GOV_FEDERAL`

> **Regra R00:**  
> Quando houver ação direta da Prefeitura → tratar como `GOV_MUNICIPAL`.

---

## 1. nivel_criticidade

| Valor | Criterio |
|---|---|
| `alta` | Impacto direto relevante na população vulnerável |
| `media` | Impacto indireto |
| `baixa` | Ação institucional ou preventiva |
| `alerta` | Evento crítico (violência, morte, risco grave) |

---

## 2. tipo_relacao_variavel

| Valor | Criterio |
|---|---|
| `direta` | Mede variável IVS (explícita ou estatisticamente defensável) |
| `indireta` | Atua sobre a variável (obra, programa, política pública) |
| `contextual` | Descreve contexto sem atuação direta |
| `latente` | Política com potencial mensurável ainda não observado |

### Regras operacionais

- **R01:** `direta` exige mensuração ou inferência estatística robusta  
- **R02:** Obras, programas e investimentos → normalmente `indireta`  
- **R03:** Políticas públicas → `indireta` ou `latente`  
- **R04:** Sem métrica IVS → `contextual` + `codigo_variavel = vazio`  

### Regra de simplificação prática

> **R11 (regra operacional-chave):**
>
> - Se há acao do Estado → `indireta`
> - Se NÃO há acao do Estado → `contextual`

---

## 3. codigo_variavel

| Situação | Preenchimento |
|---|---|
| Métrica IVS defensável | Código (ex: `IU_01`) |
| Sem métrica | vazio |
| Política recente | código + `latente` |
| Aproximação | código + `observacao = aproximacao_variavel` |
| Governança | `GOV_MUNICIPAL`, `GOV_ESTADUAL`, `GOV_FEDERAL` |
| Contexto | `SMIDS_EXT` |

---

## 4. multidimensional

Uso restrito.

**Permitido apenas quando:**
- atuação simultânea clara em mais de uma dimensão

**Exige obrigatoriamente:**
- justificativa na `nota_analista`

> **R05:** sem justificativa → inválido

---

## 5. Rebaixamento (em vez de exclusão)

| Tipo | Tratamento |
|---|---|
| Sem impacto IVS claro | `SMIDS_EXT | contextual | baixa` |
| Tema institucional | manter como governança |
| Evento irrelevante | rebaixar, não excluir |

> **R06:** excluir apenas se comprometer o modelo

---

## 6. Casos especiais

| Situação | Tratamento |
|---|---|
| Política recém-lançada | `latente` |
| Evento regional | `localidade = Regional` |
| Presença estatal positiva | registrar como evidência válida |

---

## 7. Fonte controlada

> **R12 — Fonte principal**
>
> O corpus será composto prioritariamente por dados da **Tribuna Liberal**, visando:
>
> - consistência semântica  
> - padronização estrutural  
> - reprodutibilidade analítica  

---

## 8. Distinção conceitual

| Instrumento | Função |
|---|---|
| `rel_programa_variavel_ivs` | Teoria |
| Corpus jornalístico | Evidência |

---

## 9. Fluxo de Decisao

<img width="2570" height="3003" alt="mermaid-diagram (1)" src="https://github.com/user-attachments/assets/fa332cfb-088c-4602-863f-593339c7f749" />


## ou

<img width="2661" height="3003" alt="mermaid-diagram (2)" src="https://github.com/user-attachments/assets/83582364-48fa-4d5c-aa44-5859d81afa47" />

---

## 10. Escopo Geográfico do Corpus

**R13 — Delimitação territorial (regra estrutural)**

O corpus jornalístico do Atlas Social de Hortolândia não tem como objetivo cobrir integralmente a RMC (Região Metropolitana de Campinas).

O recorte analítico é definido pela relevância para Hortolândia, e não pela abrangência regional da notícia.

---

## 11. Interoperabilidade Territorial — CadÚnico

Em 16/04/2026, a Secretaria de Inclusão Social informou que o sistema utilizado pelo Cadastro Único (CadÚnico) não opera com o código oficial municipal de loteamentos (`codbairro`), mas sim com dados derivados do CEP cadastrado no endereço.

Isso implica que:

- O recorte territorial do CadÚnico pode não coincidir com a malha oficial de loteamentos da Prefeitura
- Nomes de bairros podem refletir convenções postais ou uso popular
- Não há garantia de correspondência direta com `descbairro` ou `codbairro`

### Implicações para o corpus

- O campo `cod_loteamento` deve ser preenchido apenas quando houver correspondência clara com a base oficial
- Em caso de ausência ou ambiguidade, utilizar `nao_identificado`
- O campo `nivel_confianca_loteamento` torna-se obrigatório para indicar a qualidade da correspondência
- O campo `nota_analista` deve registrar nomes populares, bairros informais ou referências territoriais relevantes

### Diretriz geral

> O modelo analítico do Atlas Social adota a malha territorial oficial da Prefeitura como referência, realizando a tradução de nomenclaturas oriundas de sistemas externos (como o CadÚnico) por meio de camadas intermediárias de normalização.

---

## 12. Critérios de Inclusão e Exclusão

### Incluir quando atender ao menos um critério:

1. Evento ocorrido em Hortolândia — independente do tema ou dimensão IVS
2. Evento ocorrido fora de Hortolândia com impacto direto ou plausível sobre o município
3. Evento regional com potencial analítico para o IVS-H

### Excluir quando:

- Não ocorre em Hortolândia
- Não possui impacto identificável sobre o município
- Não contribui para interpretação das variáveis do IVS-H

### Regra prática

> **R14 — Pergunta de corte:**
>
> *"Este evento ajuda a explicar, medir ou antecipar a vulnerabilidade social em Hortolândia?"*
>
> Se SIM → incluir  
> Se NÃO → descartar

> *Escopo deliberadamente restrito para garantir profundidade analítica e reprodutibilidade.*

---

## 13. Campo `observacao` — Vocabulário Controlado

### Princípio

O campo `observacao` aceita **um único valor** — o preponderante quando houver mais de uma interpretação possível. Texto analítico livre deve ser registrado no campo `nota_analista`.

### Regra R15 — Hierarquia de classificação

Quando houver ambiguidade na escolha do valor:

> 1. Quando não há eixo dominante claro → `sinal_smids_ext` (não forçar classificação)
> 2. Quando há número verificável → `dado_auditavel`
> 3. Quando é estrutura institucional ou política → `contexto_sociopolitico`

### Vocabulário

| # | Valor | O que captura |
|---|---|---|
| 1 | `sinal_smids_ext` | Evento sem variável IVS mapeável ou sem eixo dominante claro |
| 2 | `multiplos_loteamentos` | Impacto difuso em mais de um loteamento |
| 3 | `impacto_latente` | Efeito futuro não imediato |
| 4 | `impacto_regional_hortolandia` | Evento externo com reflexo local |
| 5 | `aproximacao_variavel` | Indicador substituto de variável IVS não oficial |
| 6 | `caso_ilustrativo` | Evento pontual em loteamento identificado |
| 7 | `interface_ch` | Cruzamento com dimensão Capital Humano |
| 8 | `interface_rt` | Cruzamento com dimensão Renda e Trabalho |
| 9 | `interface_iu` | Cruzamento com dimensão Infraestrutura Urbana |
| 10 | `dado_auditavel` | Fonte com dado mensurável para série temporal |
| 11 | `fora_escopo_smids` | Equipamento ou ação fora do radar SMIDS |
| 12 | `acao_institucional_smids` | Ação direta da secretaria |
| 13 | `duvida_metodologica` | Incerteza sobre classificação ou variável |
| 14 | `tarefa_pendente` | Ação operacional a executar |
| 15 | `contexto_sociopolitico` | Contexto sem impacto IVS direto |

---

## 14. Campo `nota_analista` — Texto Livre

Campo complementar ao `observacao`. Sem restrição de vocabulário.

**Uso:**
- Justificativas de classificação
- Referências cruzadas entre variáveis
- Nomes populares de loteamentos
- Pendências e anotações de processo
- Contexto narrativo do evento

**Regra:** não é campo analítico — não alimenta indicadores. Serve exclusivamente para rastreabilidade e auditoria.

---

*Arquivo de governança — Atlas Social de Hortolândia*  
*00_governanca/corpus_jornalistico/*


