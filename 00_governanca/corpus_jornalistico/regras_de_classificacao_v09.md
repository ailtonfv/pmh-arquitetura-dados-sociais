[regras_de_classificacao_v09.md](https://github.com/user-attachments/files/26853502/regras_de_classificacao_v09.md)[Uploading# Regras de Classificação — Corpus Jornalístico
**Versão:** v09  
**Data:** "18/04/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolandia / 00_governanca/corpus_jornalistico/

---

## Changelog v08 → v09

| Item | Mudança |
|---|---|
| `tipo_camada` | Campo novo — formaliza a natureza analítica do evento |
| `PRESSAO_SOCIAL` | Novo valor de `tipo_camada` — captura eventos relevantes, recorrentes e mensuráveis fora do IVS clássico |
| `entra_ipst` | Campo novo — pipeline direto entre corpus e IPST-H |
| R16 | Regra nova — independência obrigatória entre `dimensao_analitica` e `tipo_camada` |
| R17 | Regra nova — `dimensao_analitica` obrigatória salvo evento puramente narrativo |
| Framework matricial | Formalizado como princípio analítico estruturante (seção 0.2) |
| Seção 18 | Schema completo v09 consolidado |
| Seção 19 | Exemplo de aplicação — caso feminicídios como referência metodológica |

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

## 0.2 Framework Matricial — Princípio Analítico Estruturante

O corpus é estruturado como uma **matriz analítica de dois eixos ortogonais**:

```
Eixo Y → dimensao_analitica  (onde o evento impacta — eixo estável)
Eixo X → tipo_camada         (como o evento é observado — natureza analítica)
```

Cada registro é um ponto nessa matriz. Os dois eixos são independentes e igualmente obrigatórios.

### Exemplo da matriz preenchida

| | `capital_humano` | `infraestrutura_urbana` | `renda_trabalho` |
|---|---|---|---|
| `IVS` | analfabetismo | saneamento inadequado | desocupação |
| `PRESSAO_SOCIAL` | feminicídio | enchente | informalidade crescente |
| `GOVERNANCA` | programa social | Operação Tapa-Buraco | DECOLA |
| `CONTEXTO` | editorial sobre família | onda de calor regional | carga tributária |

> **Implicações analíticas:**
>
> - A **mesma dimensão** atravessa todas as camadas — a dimensão é o eixo estável
> - **Células vazias** na matriz são informação — indicam ausência de cobertura ou de atuação do Estado
> - **Evolução temporal**: a mesma célula ao longo do tempo vira série histórica
> - **Comparação estrutura vs dinâmica**: `CH + IVS` (o que o Censo mede) vs `CH + PRESSAO_SOCIAL` (o que o jornal revela)

---

## 1. nivel_criticidade

| Valor | Criterio |
|---|---|
| `alta` | Impacto direto relevante na população vulnerável |
| `media` | Impacto indireto |
| `baixa` | Ação institucional ou preventiva |
| `alerta` | Evento crítico (violência, morte, risco grave) |

---

## 2. tipo_camada — Campo Novo (v09)

Indica a **natureza analítica** do evento. Campo obrigatório.

| Valor | Critério |
|---|---|
| `IVS` | Evento que mede ou aproxima variável do IVS clássico (16 variáveis IPEA) |
| `GOVERNANCA` | Ação direta do Estado municipal, estadual ou federal |
| `PRESSAO_SOCIAL` | Evento relevante, recorrente e mensurável, mas fora das 16 variáveis IVS |
| `CONTEXTO` | Pano de fundo sem impacto social identificável direto |

> **Distinção operacional entre `PRESSAO_SOCIAL` e `CONTEXTO`:**
>
> - `PRESSAO_SOCIAL` → fenômeno relevante, mensurável, com potencial de série histórica
> - `CONTEXTO` → pano de fundo narrativo sem métrica defensável

> **Relação com o IPST-H:**  
> Registros `PRESSAO_SOCIAL` são candidatos naturais a variáveis do IPST-H — especialmente quando combinados com `nivel_criticidade = alerta` e `observacao = dado_auditavel`.

---

## 3. tipo_relacao_variavel

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
- **R04:** Sem métrica IVS → `codigo_variavel = vazio`

> **Precedência de R01 sobre R11:**  
> Quando há mensuração objetiva (número verificável, série histórica possível), classificar como `direta` independentemente da presença ou ausência de ação do Estado. R11 é regra de simplificação — entra apenas quando R01 não resolve.

### Regra de simplificação prática

> **R11 (aplicar apenas quando R01 não resolve):**
>
> - Se há ação do Estado → `indireta`
> - Se NÃO há ação do Estado → `contextual`

---

## 4. codigo_variavel

| Situação | Preenchimento |
|---|---|
| Métrica IVS defensável | Código (ex: `IU_01`) |
| Sem métrica IVS | vazio |
| Política recente | código + `latente` |
| Aproximação | código + `observacao = aproximacao_variavel` |
| Governança | `GOV_MUNICIPAL`, `GOV_ESTADUAL`, `GOV_FEDERAL` |
| Contexto | `SMIDS_EXT` |
| Pressão social sem variável IVS | vazio — não forçar código IVS inexistente |

---

## 5. dimensao_analitica — Regras v09

> **R16 — Independência entre camada e dimensão (regra estrutural)**
>
> O campo `dimensao_analitica` deve ser preenchido sempre que houver impacto social identificável, **independentemente do `tipo_camada`**.
>
> A dimensão representa o **eixo de impacto** (IU, CH, RT), enquanto o tipo de camada representa a **natureza analítica** do evento (IVS, GOVERNANCA, CONTEXTO, PRESSAO_SOCIAL).
>
> A coexistência dos dois campos é obrigatória para permitir análises comparativas entre estrutura (IVS) e dinâmica (IPST-H).

> **R17 — Obrigatoriedade de `dimensao_analitica`**
>
> O campo `dimensao_analitica` é obrigatório **exceto** quando o evento for puramente narrativo, sem impacto social identificável em nenhuma dimensão.
>
> Exemplos de `dimensao_analitica = vazio` permitidos:
> - Editorial filosófico sem referência a grupos sociais
> - Coluna de opinião abstrata
>
> Critério prático:  
> *"Este evento afeta algum grupo de pessoas em alguma dimensão da vida social?"*  
> SIM → `dimensao_analitica` obrigatório  
> NÃO → `vazio` permitido

---

## 6. multidimensional

Uso restrito.

**Permitido apenas quando:**
- atuação simultânea clara em mais de uma dimensão

**Exige obrigatoriamente:**
- justificativa na `nota_analista`

> **R05:** sem justificativa → inválido

---

## 7. Rebaixamento (em vez de exclusão)

| Tipo | Tratamento |
|---|---|
| Sem impacto IVS claro | `SMIDS_EXT | contextual | baixa` |
| Tema institucional | manter como governança |
| Evento irrelevante | rebaixar, não excluir |

> **R06:** excluir apenas se comprometer o modelo

---

## 8. Casos especiais

| Situação | Tratamento |
|---|---|
| Política recém-lançada | `latente` |
| Evento regional | `localidade = Regional` |
| Presença estatal positiva | registrar como evidência válida |

---

## 9. Fonte controlada

> **R12 — Fonte principal**
>
> O corpus será composto prioritariamente por dados da **Tribuna Liberal**, visando:
>
> - consistência semântica
> - padronização estrutural
> - reprodutibilidade analítica

---

## 10. Distinção conceitual

| Instrumento | Função |
|---|---|
| `rel_programa_variavel_ivs` | Teoria |
| Corpus jornalístico | Evidência |

---

## 11. Fluxo de Decisão

```
O evento ocorreu em Hortolândia ou tem impacto sobre o município? (R14)
    NÃO → descartar
    SIM ↓

Qual a natureza analítica do evento? → tipo_camada
    IVS            → mede variável das 16 do IPEA
    GOVERNANCA     → ação do Estado
    PRESSAO_SOCIAL → relevante, mensurável, fora do IVS
    CONTEXTO       → pano de fundo

Qual o eixo de impacto? → dimensao_analitica  (R16 — SEMPRE preencher)
    capital_humano | infraestrutura_urbana | renda_trabalho | multidimensional

Existe mensuração objetiva? (R01)
    SIM → tipo_relacao = direta | codigo_variavel = código ou vazio (R04)
    NÃO → aplicar R11

Existe número verificável? → observacao (R15)
    SIM → dado_auditavel
    NÃO → aplicar hierarquia R15

Entra no IPST-H? → entra_ipst
    PRESSAO_SOCIAL + alerta + dado_auditavel → sim
    demais → avaliar caso a caso
```

---

## 12. Escopo Geográfico do Corpus

**R13 — Delimitação territorial (regra estrutural)**

O corpus jornalístico do Atlas Social de Hortolândia não tem como objetivo cobrir integralmente a RMC.

O recorte analítico é definido pela relevância para Hortolândia, e não pela abrangência regional da notícia.

---

## 13. Interoperabilidade Territorial — CadÚnico

Em "16/04/2026", a Secretaria de Inclusão Social informou que o CadÚnico não opera com o código oficial municipal de loteamentos (`codbairro`), mas sim com dados derivados do CEP.

### Implicações para o corpus

- `cod_loteamento` preenchido apenas quando houver correspondência clara com a base oficial
- Em caso de ausência ou ambiguidade → `nao_identificado`
- `nivel_confianca_loteamento` obrigatório
- `nota_analista` deve registrar nomes populares ou referências territoriais relevantes

> O modelo adota a malha territorial oficial da Prefeitura como referência, com tradução de nomenclaturas externas por camadas intermediárias de normalização.

---

## 14. Critérios de Inclusão e Exclusão

### Incluir quando atender ao menos um critério:

1. Evento ocorrido em Hortolândia
2. Evento ocorrido fora de Hortolândia com impacto direto ou plausível sobre o município
3. Evento regional com potencial analítico para o IVS-H

### Excluir quando:

- Não ocorre em Hortolândia
- Não possui impacto identificável sobre o município
- Não contribui para interpretação das variáveis do IVS-H

> **R14 — Pergunta de corte:**  
> *"Este evento ajuda a explicar, medir ou antecipar a vulnerabilidade social em Hortolândia?"*  
> SIM → incluir | NÃO → descartar

---

## 15. Campo `observacao` — Vocabulário Controlado

### Princípio

Campo aceita **um único valor** — o preponderante. Texto analítico livre → `nota_analista`.

### Regra R15 — Hierarquia de classificação

> 1. Sem eixo dominante claro → `sinal_smids_ext`
> 2. Há número verificável → `dado_auditavel`
> 3. Estrutura institucional ou política → `contexto_sociopolitico`

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

## 16. Campo `nota_analista` — Texto Livre

Campo complementar ao `observacao`. Sem restrição de vocabulário.

**Uso:**
- Justificativas de classificação
- Referências cruzadas entre variáveis
- Nomes populares de loteamentos
- Pendências e anotações de processo
- Indicação de candidatos a variáveis do IPST-H ou fases futuras do IVS-H

**Regra:** não alimenta indicadores. Serve exclusivamente para rastreabilidade e auditoria.

---

## 17. Campo `entra_ipst` — Novo (v09)

| Valor | Critério |
|---|---|
| `sim` | `tipo_camada = PRESSAO_SOCIAL` + `nivel_criticidade = alerta` + `observacao = dado_auditavel` |
| `avaliar` | Atende parcialmente os critérios |
| `nao` | Sem relevância para o IPST-H |

> Cria pipeline direto entre corpus jornalístico e IPST-H sem depender de análise posterior.

---

## 18. Schema Completo v09

| Campo | Função | Obrigatório |
|---|---|---|
| `id_evento` | Identificador único do registro | sim |
| `data_publicacao` | Data da matéria | sim |
| `fonte` | Ex.: Tribuna Liberal | sim |
| `titulo` | Título da matéria | sim |
| `pagina` | Página do jornal | sim |
| `municipio` | Hortolândia, Regional etc. | sim |
| `localidade` | Loteamento, bairro, região ou Regional | sim |
| `dimensao_analitica` | Eixo de impacto social (R16, R17) | sim (salvo R17) |
| `tipo_camada` | IVS, GOVERNANCA, CONTEXTO, PRESSAO_SOCIAL | sim |
| `tipo_relacao_variavel` | direta, indireta, contextual, latente | sim |
| `codigo_variavel` | CH_06, RT_01, GOV_MUNICIPAL, SMIDS_EXT etc. | sim |
| `nivel_criticidade` | baixa, media, alta, alerta | sim |
| `observacao` | Vocabulário controlado (15 valores) | sim |
| `aproximacao_variavel` | Código IVS aproximado, se houver | não |
| `nota_analista` | Justificativa livre | não |
| `cod_loteamento` | Loteamento oficial ou nao_identificado | sim |
| `nivel_confianca_loteamento` | alto, medio, baixo | sim |
| `entra_ipst` | sim, avaliar, nao | sim |

---

## 19. Exemplo de Aplicação — Caso Feminicídios (31/12/2025)

Registro que exercitou R01, R04, R11 (descartada), R15 e R16 em sequência.

| Campo | Valor | Regra aplicada |
|---|---|---|
| `tipo_camada` | `PRESSAO_SOCIAL` | fenômeno mensurável fora das 16 variáveis IVS |
| `dimensao_analitica` | `capital_humano` | R16 — dimensão obrigatória independente da camada |
| `tipo_relacao_variavel` | `direta` | R01 — número verificável, série histórica possível |
| `codigo_variavel` | vazio | R04 — sem variável IVS para feminicídio |
| `nivel_criticidade` | `alerta` | morte + risco social grave + impacto direto |
| `observacao` | `dado_auditavel` | R15 — número verificável tem precedência |
| `entra_ipst` | `sim` | PRESSAO_SOCIAL + alerta + dado_auditavel |
| `nota_analista` | "Evento com mensuração clara de violência de gênero na RMC, com concentração em Hortolândia. Embora não exista variável IVS direta, o fenômeno possui forte correlação com dimensões de capital humano e estrutura familiar. Avaliar futura criação de proxy para violência doméstica no IVS-H." | rastreabilidade |

> **Lição metodológica:**  
> O corpus está capturando o **limite empírico do IVS-IPEA** — fenômenos graves e mensuráveis que o modelo nacional não mede. Cada registro `PRESSAO_SOCIAL + alerta + dado_auditavel` é evidência para o argumento do IVS-H como modelo que supera o IPEA localmente.



---

## Fluxo de Decisao

<img width="2570" height="3003" alt="mermaid-diagram (1)" src="https://github.com/user-attachments/assets/fa332cfb-088c-4602-863f-593339c7f749" />


## ou

<img width="2661" height="3003" alt="mermaid-diagram (2)" src="https://github.com/user-attachments/assets/83582364-48fa-4d5c-aa44-5859d81afa47" />

---

*Arquivo de governança — Atlas Social de Hortolândia*  
*00_governanca/corpus_jornalistico/*
 regras_de_classificacao_v09.md…]()
