[regras_de_classificacao_v10_1.md](https://github.com/user-attachments/files/26859356/regras_de_classificacao_v10_1.md)[Uploa# Regras de Classificação — Corpus Jornalístico
**Versão:** v10.1  
**Data:** "18/04/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolandia / 00_governanca/corpus_jornalistico/

---

## Changelog v10 → v10.1

| Item | Mudança |
|---|---|
| R20 | Regra nova — agravamento com base interna à matéria |
| R21 | Regra nova — violência letal nunca contextual |
| R22 | Regra nova — GOVERNANCA só é "resposta" se houver pressão identificável |
| R23 | Regra nova — PRESSAO_SOCIAL deve sempre ser potencialmente agregável em série |
| Nota conceitual | Registro formal de candidato a tipo_camada futuro: PRESSAO_INSTITUCIONAL |

---

## 0. Princípio Central

> *"IVS mede. Governança e SMIDS_EXT explicam."*

> *"O corpus não é o lugar onde o ciclo se resolve. É o lugar onde o ciclo começa a ser visível."*

---

## 0.1 Framework Analítico — Três Camadas de Decisão

Todo registro do corpus percorre três camadas de decisão em sequência obrigatória:

```
CAMADA 1 — Classificação estrutural
    O que é este evento e onde impacta?
    → tipo_camada + dimensao_analitica

CAMADA 2 — Qualificação analítica
    Como este evento se relaciona com o modelo?
    → tipo_relacao_variavel + codigo_variavel + observacao

CAMADA 3 — Integração dinâmica
    Como este evento se conecta ao território ao longo do tempo?
    → papel_no_ciclo + id_caso_pressao + entra_ipst
```

A Camada 3 não pode ser respondida sem que a Camada 1 esteja resolvida.

---

## 0.2 Framework Matricial — Princípio Analítico Estruturante

O corpus é estruturado como uma **matriz analítica de dois eixos ortogonais**:

```
Eixo Y → dimensao_analitica  (onde o evento impacta — eixo estável)
Eixo X → tipo_camada         (como o evento é observado — natureza analítica)
```

### Exemplo da matriz preenchida

| | `capital_humano` | `infraestrutura_urbana` | `renda_trabalho` |
|---|---|---|---|
| `IVS` | analfabetismo | saneamento inadequado | desocupação |
| `PRESSAO_SOCIAL` | feminicídio | enchente | informalidade crescente |
| `GOVERNANCA` | programa social | Operação Tapa-Buraco | DECOLA |
| `CONTEXTO` | editorial sobre família | onda de calor regional | carga tributária |

> **Implicações analíticas:**
> - A mesma dimensão atravessa todas as camadas
> - Células vazias são informação — ausência de cobertura ou de atuação do Estado
> - A mesma célula ao longo do tempo vira série histórica

---

## 0.3 Arquitetura de Ciclo — Três Níveis

O ciclo de pressão social vive fora do corpus, em camada analítica derivada.

```
Nível A — Corpus jornalístico
    Registro unitário do evento
    Função: capturar emergência, resposta, rastreabilidade

Nível B — FATO_CICLO_PRESSAO_SOCIAL (tabela derivada)
    Agrupamento de eventos relacionados
    Função: ligar pressão e resposta, organizar janelas temporais, preparar IPST-H

Nível C — Painel gerencial
    Leitura agregada por território e dimensão
    Função: mostrar status do ciclo (ativa, em_resposta, atenuada, recorrente)
```

> O corpus **sugere** relações. A camada analítica as **consolida**.

---

## 0.4 Definição Operacional de "Estado"

- **Estado = Prefeitura de Hortolândia** → `GOV_MUNICIPAL`
- Estado de SP → `GOV_ESTADUAL`
- União → `GOV_FEDERAL`

> **R00:** Ação direta da Prefeitura → `GOV_MUNICIPAL`.

---

## 1. Fluxo de Decisão

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ENTRADA
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

O evento ocorre em Hortolândia ou tem impacto sobre o município? (R14)
    NÃO → descartar
    SIM ↓
    Ocorreu em Hortolândia?
        SIM → municipio = Hortolândia | localidade = loteamento/bairro
        NÃO → municipio = origem | localidade = Regional
               observacao = impacto_regional_hortolandia

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CAMADA 1 — Classificação estrutural
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Qual a natureza analítica? → tipo_camada
    IVS | GOVERNANCA | PRESSAO_SOCIAL | CONTEXTO
    ↓

Qual o eixo de impacto? → dimensao_analitica (R16, R17)
    capital_humano | infraestrutura_urbana | renda_trabalho
    (obrigatório salvo evento puramente narrativo)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CAMADA 2 — Qualificação analítica
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Existe mensuração objetiva? (R01)
    SIM → tipo_relacao = direta
          codigo_variavel = código IVS ou vazio (R04)
    NÃO → aplicar R11 (simplificação)
              ação do Estado → indireta
              sem ação       → contextual

⚠ R21: violência letal → tipo_relacao nunca contextual
    ↓

Classificar observacao → R15 (hierarquia obrigatória)
    há número verificável      → dado_auditavel
    sem eixo dominante claro   → sinal_smids_ext
    contexto institucional     → contexto_sociopolitico

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CAMADA 3 — Integração dinâmica
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Este evento participa de um ciclo de pressão? → papel_no_ciclo (R19)

    tipo_camada = PRESSAO_SOCIAL?
        → SEMPRE emergencia ou agravamento
        → NUNCA nao_aplicavel
        → R20: agravamento válido mesmo sem histórico no corpus
               se a própria matéria documenta progressão

    tipo_camada = GOVERNANCA?
        → R22: só é "resposta" se houver pressão identificável
        → estrutural, sem gatilho? → nao_aplicavel

    tipo_camada = CONTEXTO ou IVS?
        → verificar impacto social
            SIM → atribuir papel adequado (casos raros)
            NÃO → nao_aplicavel
    ↓

Pertence a ciclo temático? → id_caso_pressao (opcional)
    ex: CH_VIOLENCIA_GENERO_2025
    ↓

Entra no IPST-H? → entra_ipst
    PRESSAO_SOCIAL + alerta + dado_auditavel → sim
    demais → avaliar caso a caso
```

---

## 2. nivel_criticidade

| Valor | Critério |
|---|---|
| `baixa` | Ação institucional ou preventiva |
| `media` | Impacto indireto |
| `alta` | Impacto direto relevante na população vulnerável |
| `alerta` | Evento crítico (violência, morte, risco grave) |

---

## 3. tipo_camada

Natureza analítica do evento. **Campo obrigatório.**

| Valor | Critério |
|---|---|
| `IVS` | Mede ou aproxima variável do IVS clássico (16 variáveis IPEA) |
| `GOVERNANCA` | Ação direta do Estado municipal, estadual ou federal |
| `PRESSAO_SOCIAL` | Evento relevante, recorrente e mensurável, fora das 16 variáveis IVS |
| `CONTEXTO` | Pano de fundo sem impacto social identificável direto |

> **Distinção entre `PRESSAO_SOCIAL` e `CONTEXTO`:**
> - `PRESSAO_SOCIAL` → mensurável, com potencial de série histórica, candidato ao IPST-H
> - `CONTEXTO` → narrativo, sem métrica defensável

> **Relação entre `codigo_variavel` e `tipo_camada`:**
> `codigo_variavel` identifica o **universo analítico de referência**.
> `tipo_camada` especifica a **natureza do registro dentro desse universo**.

### Arquitetura lógica

| `tipo_camada` | `codigo_variavel` |
|---|---|
| `IVS` | `CH_06`, `RT_01` etc. |
| `GOVERNANCA` | `GOV_MUNICIPAL`, `GOV_ESTADUAL`, `GOV_FEDERAL` |
| `PRESSAO_SOCIAL` | `SMIDS_EXT` |
| `CONTEXTO` | `SMIDS_EXT` |

---

## 4. tipo_relacao_variavel

| Valor | Critério |
|---|---|
| `direta` | Mede variável IVS (explícita ou estatisticamente defensável) |
| `indireta` | Atua sobre a variável (obra, programa, política pública) |
| `contextual` | Descreve contexto sem atuação direta |
| `latente` | Política com potencial mensurável ainda não observado |

### Regras operacionais

- **R01:** `direta` exige mensuração ou inferência estatística robusta — tem precedência sobre R11
- **R02:** Obras, programas e investimentos → normalmente `indireta`
- **R03:** Políticas públicas → `indireta` ou `latente`
- **R04:** Sem métrica IVS → `codigo_variavel = vazio`
- **R11** (simplificação — aplicar apenas quando R01 não resolve):
  - ação do Estado → `indireta`
  - sem ação do Estado → `contextual`

> **R21 — Violência letal nunca contextual**
>
> Eventos envolvendo violência com morte, arma de fogo ou risco grave à integridade física são sempre `direta` ou `indireta` — nunca `contextual`.
>
> Violência letal é mensurável, tem série histórica possível e impacto direto sobre a população vulnerável.

---

## 5. dimensao_analitica

> **R16 — Independência entre camada e dimensão**
>
> `dimensao_analitica` deve ser preenchido sempre que houver impacto social identificável, independentemente do `tipo_camada`.

> **R17 — Obrigatoriedade**
>
> `dimensao_analitica = vazio` permitido apenas quando o evento for puramente narrativo, sem impacto em nenhuma dimensão da vida social.

---

## 6. codigo_variavel

| Situação | Preenchimento |
|---|---|
| Métrica IVS defensável | Código (ex: `CH_06`) |
| Sem métrica IVS | vazio |
| Política recente | código + `latente` |
| Aproximação | código + `observacao = aproximacao_variavel` |
| Governança | `GOV_MUNICIPAL`, `GOV_ESTADUAL`, `GOV_FEDERAL` |
| PRESSAO_SOCIAL ou CONTEXTO | `SMIDS_EXT` |

---

## 7. SMIDS_EXT — Redefinição (R18)

> **R18 — Redefinição operacional de `SMIDS_EXT`**
>
> `SMIDS_EXT` designa eventos, sinais ou fenômenos analíticos que não correspondem nem a variáveis do IVS clássico nem a códigos de governança, mas que permanecem relevantes para interpretação da vulnerabilidade social em Hortolândia.
>
> Seu uso é obrigatório para registros classificados como `PRESSAO_SOCIAL` ou `CONTEXTO`.
>
> **Regra de integridade:** todo registro com `codigo_variavel = SMIDS_EXT` exige preenchimento obrigatório de `tipo_camada`, `dimensao_analitica`, `observacao` e `entra_ipst`. Sem esses quatro campos, o registro é inválido.

---

## 8. multidimensional

Uso restrito. Permitido apenas com atuação simultânea clara em mais de uma dimensão.

> **R05:** exige justificativa obrigatória em `nota_analista`. Sem ela → inválido.

---

## 9. observacao — Vocabulário Controlado

**R15 — Hierarquia obrigatória:**

> 1. Há número verificável → `dado_auditavel`
> 2. Sem eixo dominante claro → `sinal_smids_ext`
> 3. Estrutura institucional ou política → `contexto_sociopolitico`

| # | Valor | O que captura |
|---|---|---|
| 1 | `sinal_smids_ext` | Sem variável IVS mapeável ou sem eixo dominante claro |
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

## 10. papel_no_ciclo

Posição do registro no ciclo de pressão social. **Campo obrigatório.**

| Valor | Critério |
|---|---|
| `emergencia` | Primeiro sinal do problema — aparecimento da pressão |
| `resposta` | Ação do Estado em reação a pressão identificada |
| `agravamento` | Pressão volta a subir após período de resposta |
| `sinal_desfecho` | Indício jornalístico de atenuação ou resolução |
| `nao_aplicavel` | O registro não participa de nenhum ciclo de pressão por natureza |

### R19 — Uso restrito de `nao_aplicavel`

> `nao_aplicavel` deve ser utilizado apenas quando o registro **não participa, por natureza, de nenhum ciclo de pressão social identificável**.
>
> É proibido seu uso como substituto de incerteza analítica ou ausência de classificação.

### R20 — Agravamento com base interna

> Um evento pode ser classificado como `agravamento` quando a **própria matéria documenta progressão mensurável no tempo**, mesmo na ausência de registros anteriores no corpus.
>
> O histórico interno à matéria é evidência suficiente para classificar a tendência.

### R22 — GOVERNANCA e o critério de resposta

> `GOVERNANCA` só recebe `papel_no_ciclo = resposta` quando houver **pressão social identificável** como gatilho da ação estatal.
>
> Ações estruturais, preventivas ou de rotina sem evento detonador → `papel_no_ciclo = nao_aplicavel`.

### R23 — Agregabilidade de PRESSAO_SOCIAL

> Todo registro classificado como `PRESSAO_SOCIAL` deve ser potencialmente **agregável em série temporal**.
>
> Se o fenômeno não puder ser contado, comparado ou rastreado ao longo do tempo, reavaliar a classificação para `CONTEXTO`.

### Regra de ouro

*"Este evento pode estar ligado a um problema social que surge, evolui ou é respondido?"*
- SIM → nunca usar `nao_aplicavel`
- NÃO → pode usar `nao_aplicavel`

### Tabela de referência rápida

| `tipo_camada` | `papel_no_ciclo` |
|---|---|
| `PRESSAO_SOCIAL` | **SEMPRE** `emergencia` ou `agravamento` — **NUNCA** `nao_aplicavel` |
| `GOVERNANCA` | `resposta` (se reativa, R22) ou `nao_aplicavel` (se estrutural) |
| `CONTEXTO` | verificar impacto — geralmente `nao_aplicavel` |
| `IVS` | verificar impacto — geralmente `nao_aplicavel` |

---

## 11. id_caso_pressao

Campo opcional. Agrupa registros que pertencem ao mesmo ciclo temático.

**Formato sugerido:** `[DIMENSAO]_[TEMA]_[ANO]`
Exemplo: `CH_VIOLENCIA_GENERO_2025`

> Preenchido → corpus sugere relação entre registros
> Vazio → camada analítica infere a relação posteriormente

---

## 12. entra_ipst

| Valor | Critério |
|---|---|
| `sim` | `PRESSAO_SOCIAL` + `nivel_criticidade = alerta` + `observacao = dado_auditavel` |
| `avaliar` | Atende parcialmente os critérios |
| `nao` | Sem relevância para o IPST-H |

---

## 13. Rebaixamento (em vez de exclusão)

| Tipo | Tratamento |
|---|---|
| Sem impacto IVS claro | `SMIDS_EXT + contextual + baixa` |
| Tema institucional | manter como governança |
| Evento irrelevante | rebaixar, não excluir |

> **R06:** excluir apenas se comprometer o modelo.

---

## 14. Casos especiais

| Situação | Tratamento |
|---|---|
| Política recém-lançada | `latente` |
| Evento regional | `localidade = Regional` |
| Presença estatal positiva | registrar como evidência válida |

---

## 15. Fonte controlada

> **R12:** O corpus será composto prioritariamente por dados da **Tribuna Liberal**, visando consistência semântica, padronização estrutural e reprodutibilidade analítica.

---

## 16. Escopo Geográfico

> **R13:** O recorte analítico é definido pela relevância para Hortolândia, não pela abrangência regional da notícia.

---

## 17. Critérios de Inclusão e Exclusão

> **R14 — Pergunta de corte:**
> *"Este evento ajuda a explicar, medir ou antecipar a vulnerabilidade social em Hortolândia?"*
> SIM → incluir | NÃO → descartar

**Incluir quando:**
1. Evento ocorrido em Hortolândia
2. Evento externo com impacto direto ou plausível sobre o município
3. Evento regional com potencial analítico para o IVS-H

---

## 18. Interoperabilidade Territorial — CadÚnico

Em "16/04/2026", confirmado que o CadÚnico opera com CEP, não com `codbairro`.

- `cod_loteamento` → preencher apenas com correspondência clara; caso contrário `nao_identificado`
- `nivel_confianca_loteamento` → obrigatório
- `nota_analista` → registrar nomes populares e referências territoriais relevantes

---

## 19. Limite do Corpus como Instrumento de Desfecho

> **R20 (desfecho) — Limite do corpus**
>
> O corpus jornalístico não é fonte confiável para inferir resolução de fenômenos sociais. A ausência de registros não equivale a desfecho positivo.
>
> O desfecho de ciclos `PRESSAO_SOCIAL` deve ser aferido pela triangulação entre:
> 1. **Corpus** — frequência e criticidade dos eventos (curto prazo)
> 2. **Dados administrativos** — CadÚnico, registros de segurança, saúde (médio prazo)
> 3. **IVS-H** — mudança estrutural (longo prazo)

---

## 20. nota_analista — Texto Livre

Complementar ao `observacao`. Sem restrição de vocabulário.

**Uso:** justificativas, referências cruzadas, nomes populares de loteamentos, pendências, candidatos a variáveis do IPST-H ou fases futuras do IVS-H.

**Regra:** não alimenta indicadores. Serve exclusivamente para rastreabilidade e auditoria.

---

## 21. Nota Conceitual — Candidato a tipo_camada Futuro

> **PRESSAO_INSTITUCIONAL — registro prospectivo**
>
> Eventos que atacam diretamente o aparato institucional do Estado (invasões a órgãos públicos, sabotagem de processos administrativos, ataques a equipamentos de gestão pública) constituem categoria analítica distinta da `PRESSAO_SOCIAL` clássica.
>
> - `PRESSAO_SOCIAL` → pressiona a população vulnerável
> - `PRESSAO_INSTITUCIONAL` → pressiona a capacidade do Estado de responder
>
> **Tratamento atual:** classificar como `PRESSAO_SOCIAL + observacao = sinal_smids_ext`, com `nota_analista` registrando o caráter institucional do evento.
>
> **Condição de promoção:** criar `PRESSAO_INSTITUCIONAL` como valor formal quando houver série suficiente de eventos desta natureza no corpus.

---

## 22. Schema Completo v10.1

| Campo | Função | Camada | Obrigatório |
|---|---|---|---|
| `id_evento` | Identificador único | — | sim |
| `data_publicacao` | Data da matéria | — | sim |
| `fonte` | Ex.: Tribuna Liberal | — | sim |
| `titulo` | Título da matéria | — | sim |
| `pagina` | Página do jornal | — | sim |
| `municipio` | Hortolândia, Regional etc. | — | sim |
| `localidade` | Loteamento, bairro ou Regional | — | sim |
| `tipo_camada` | IVS, GOVERNANCA, PRESSAO_SOCIAL, CONTEXTO | 1 | sim |
| `dimensao_analitica` | Eixo de impacto social (R16, R17) | 1 | sim (salvo R17) |
| `tipo_relacao_variavel` | direta, indireta, contextual, latente | 2 | sim |
| `codigo_variavel` | CH_06, RT_01, GOV_MUNICIPAL, SMIDS_EXT etc. | 2 | sim |
| `nivel_criticidade` | baixa, media, alta, alerta | 2 | sim |
| `observacao` | Vocabulário controlado (15 valores) | 2 | sim |
| `aproximacao_variavel` | Código IVS aproximado, se houver | 2 | não |
| `nota_analista` | Justificativa livre | 2 | não |
| `cod_loteamento` | Loteamento oficial ou nao_identificado | — | sim |
| `nivel_confianca_loteamento` | alto, medio, baixo | — | sim |
| `papel_no_ciclo` | emergencia, resposta, agravamento, sinal_desfecho, nao_aplicavel | 3 | sim |
| `id_caso_pressao` | Agrupamento temático do ciclo | 3 | não |
| `entra_ipst` | sim, avaliar, nao | 3 | sim |

---

## 23. Exemplo de Aplicação — Feminicídios (31/12/2025)

Registro canônico — exercitou R01, R04, R11 (descartada), R15, R16, R18, R19 em sequência.

| Campo | Valor | Regra |
|---|---|---|
| `tipo_camada` | `PRESSAO_SOCIAL` | fenômeno mensurável fora das 16 variáveis IVS |
| `dimensao_analitica` | `capital_humano` | R16 — obrigatório independente da camada |
| `tipo_relacao_variavel` | `direta` | R01 — número verificável, série histórica possível |
| `codigo_variavel` | `SMIDS_EXT` | R18 — PRESSAO_SOCIAL → SMIDS_EXT |
| `nivel_criticidade` | `alerta` | morte + risco social grave + impacto direto |
| `observacao` | `dado_auditavel` | R15 — número verificável tem precedência |
| `papel_no_ciclo` | `emergencia` | R19 — PRESSAO_SOCIAL nunca é nao_aplicavel |
| `id_caso_pressao` | `CH_VIOLENCIA_GENERO_2025` | agrupamento temático |
| `entra_ipst` | `sim` | PRESSAO_SOCIAL + alerta + dado_auditavel |

---

## 24. Distinção conceitual

| Instrumento | Função |
|---|---|
| `rel_programa_variavel_ivs` | Teoria |
| Corpus jornalístico | Evidência |
| `FATO_CICLO_PRESSAO_SOCIAL` | Derivação analítica |

---

*Arquivo de governança — Atlas Social de Hortolândia*  
*00_governanca/corpus_jornalistico/*
ding regras_de_classificacao_v10_1.md…]()

---

<img width="1194" height="3373" alt="fluxo_v10_v2" src="https://github.com/user-attachments/assets/f82a0694-039e-4b54-a476-06c22a214322" />



---

*Arquivo de governança — Atlas Social de Hortolândia*  
*00_governanca/corpus_jornalistico/*
ing regras_de_classificacao_v10.1md…]()
