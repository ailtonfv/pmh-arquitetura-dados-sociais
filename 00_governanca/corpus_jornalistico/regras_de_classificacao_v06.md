# Regras de Classificação — Corpus Jornalístico
**Versão:** v05  
**Data:** "16/04/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolandia / 00_governanca/corpus_jornalistico/

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

## 0.1 Definição Operacional de “Estado”

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

---

### Regras operacionais

- **R01:** `direta` exige mensuração ou inferência estatística robusta  
- **R02:** Obras, programas e investimentos → normalmente `indireta`  
- **R03:** Políticas públicas → `indireta` ou `latente`  
- **R04:** Sem métrica IVS → `contextual` + `codigo_variavel = vazio`  

---

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
| Aproximação | código + observação obrigatória |
| Governança | `GOV_MUNICIPAL`, `GOV_ESTADUAL`, `GOV_FEDERAL` |
| Contexto | `SMIDS_EXT` |

---

## 4. multidimensional

Uso restrito.

**Permitido apenas quando:**
- atuação simultânea clara em mais de uma dimensão

**Exige obrigatoriamente:**
- justificativa na `observacao`

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
ou
<img width="2661" height="3003" alt="mermaid-diagram (2)" src="https://github.com/user-attachments/assets/83582364-48fa-4d5c-aa44-5859d81afa47" />

---

## 10. Escopo Geográfico do Corpus

R13 — Delimitação territorial (regra estrutural)

O corpus jornalístico do Atlas Social de Hortolândia não tem como objetivo cobrir integralmente a RMC (Região Metropolitana de Campinas).

O recorte analítico é definido pela relevância para Hortolândia, e não pela abrangência regional da notícia.

---

🎯 Critérios de inclusão

Um evento DEVE ser incluído se atender a pelo menos um dos critérios:

1. Evento ocorrido em Hortolândia
Independente do tema
Independentemente da dimensão IVS

✔ Exemplo:

Obra de drenagem no Jardim Novo Ângulo
Atendimento no CRAS
Violência em bairro local
2. Evento ocorrido fora de Hortolândia com impacto direto ou plausível sobre o município

✔ Exemplo:

Hospital Estadual de Sumaré atendendo população de Hortolândia
Política estadual que afeta repasses ao município
Mercado de trabalho regional com forte integração (ex: CAGED regional)
3. Evento regional com potencial analítico para o IVS-H

✔ Critério:

Afeta dinâmica estrutural relevante (saúde, mobilidade, trabalho, assistência)

✔ Exemplo:

Surto epidemiológico regional
Mudança em política estadual de habitação
Infraestrutura que altera fluxos pendulares
🚫 Critérios de exclusão

Um evento NÃO deve ser incluído quando:

Não ocorre em Hortolândia
Não possui impacto identificável sobre o município
Não contribui para interpretação das variáveis do IVS-H

✔ Exemplo:

Política municipal de outra cidade sem conexão
Evento cultural local sem relação com Hortolândia
Crime isolado em município sem vínculo territorial
🧠 Regra prática (para uso rápido)

R14 — Pergunta de corte:

“Este evento ajuda a explicar, medir ou antecipar a vulnerabilidade social em Hortolândia?”

Se SIM → incluir
Se NÃO → descartar
⚠️ Observação metodológica

O objetivo do corpus não é cobertura jornalística,
mas sim modelagem analítica da vulnerabilidade social local.

---

“Escopo deliberadamente restrito para garantir profundidade analítica e reprodutibilidade.”


---

*Arquivo de governança — Atlas Social de Hortolândia*  
*00_governanca/corpus_jornalistico/*
