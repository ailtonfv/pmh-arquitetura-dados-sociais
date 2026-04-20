[dicionario_v04.md](https://github.com/user-attachments/files/26859742/dicionario_v04.md)[Uploading d# Dicionário do Corpus Jornalístico
**Atlas Social de Hortolândia — SMIDS**
Versão: v04 | Data: "18/04/2026"

---

## Princípio conceitual

> IVS mede. Governança e SMIDS_EXT explicam.

O corpus jornalístico opera em três camadas analíticas:
- **Camada IVS:** mensurável, comparável, replicável
- **Camada GOVERNANCA:** resposta institucional do Estado
- **Camada SMIDS_EXT:** pressão social e contexto externo ao IVS clássico

---

## Colunas e valores controlados

### `fonte`
Tipo: string
Valor atual: `Tribuna Liberal`
Regra: nome completo do veículo sem abreviação

---

### `data_publicacao`
Tipo: date
Formato: `DD/MM/YYYY`
Regra: data de publicação da edição

---

### `titulo`
Tipo: string
Regra: título descritivo do evento

---

### `pagina`
Tipo: integer ou string
Valores: número da página ou `s/n` quando não identificada

---

### `municipio`
Tipo: string
Valores: `Hortolândia` | `Regional` | nome do município de origem (eventos externos)

---

### `localidade`
Tipo: string
Regra: nome do loteamento, bairro ou `Regional` para eventos sem localização específica

---

### `tipo_camada` *(novo — v04)*
Tipo: string
**Campo obrigatório.**

Valores permitidos:
| valor | descrição |
|---|---|
| `IVS` | Evento que mede ou aproxima variável das 16 do IVS/IPEA |
| `GOVERNANCA` | Ação direta do Estado municipal, estadual ou federal |
| `PRESSAO_SOCIAL` | Fenômeno relevante, mensurável, fora das 16 variáveis IVS |
| `CONTEXTO` | Pano de fundo sem impacto social identificável direto |

**Relação com `codigo_variavel`:**
- `IVS` → código IVS (ex: `CH_06`, `RT_01`)
- `GOVERNANCA` → `GOV_MUNICIPAL`, `GOV_ESTADUAL` ou `GOV_FEDERAL`
- `PRESSAO_SOCIAL` → `SMIDS_EXT`
- `CONTEXTO` → `SMIDS_EXT`

**Distinção PRESSAO_SOCIAL vs CONTEXTO:**
- `PRESSAO_SOCIAL` → mensurável, com potencial de série histórica, candidato ao IPST-H
- `CONTEXTO` → narrativo, sem métrica defensável

---

### `dimensao_analitica` *(renomeado de `dimensao_ivs` — v04)*
Tipo: string
**Campo obrigatório** salvo evento puramente narrativo sem impacto social identificável.

Valores permitidos:
| valor | descrição |
|---|---|
| `capital_humano` | Dimensão CH |
| `infraestrutura_urbana` | Dimensão IU |
| `renda_trabalho` | Dimensão RT |
| `multidimensional` | Evento cruza duas ou mais dimensões (exige justificativa em `nota_analista`) |

**Regra R16:** `dimensao_analitica` é independente de `tipo_camada` — deve ser preenchido mesmo para GOVERNANCA, PRESSAO_SOCIAL e CONTEXTO.

**Nota de migração:** o valor `governanca` foi removido desta coluna a partir de v04. Eventos anteriormente classificados com `dimensao_ivs = governanca` devem receber `tipo_camada = GOVERNANCA` + `dimensao_analitica` correspondente ao eixo de impacto.

---

### `tipo_relacao_variavel`
Tipo: string
Valores permitidos:
| valor | descrição |
|---|---|
| `direta` | Evento mensura ou evidencia a variável IVS diretamente — R01 tem precedência sobre R11 |
| `indireta` | Evento relaciona-se com a variável por consequência ou ação do Estado |
| `contextual` | Evento contextualiza sem relação causal defensável |
| `latente` | Política com potencial mensurável ainda não observado |

**Regra R21:** violência letal nunca é `contextual` — sempre `direta` ou `indireta`.

**Regra R11 (simplificação — aplicar apenas quando R01 não resolve):**
- há ação do Estado → `indireta`
- sem ação do Estado → `contextual`

---

### `codigo_variavel`
Tipo: string
Valores permitidos:
| valor | descrição |
|---|---|
| `IU_01` a `IU_03` | Variáveis Infraestrutura Urbana |
| `CH_01` a `CH_08` | Variáveis Capital Humano |
| `RT_01` a `RT_05` | Variáveis Renda e Trabalho |
| `GOV_MUNICIPAL` | Ação direta da Prefeitura de Hortolândia |
| `GOV_ESTADUAL` | Ação do Governo do Estado de SP |
| `GOV_FEDERAL` | Ação da União |
| `SMIDS_EXT` | Fenômeno externo ao IVS clássico e à governança, analiticamente relevante |

**Nota SMIDS_EXT:** não é gaveta residual. Designa eventos, sinais ou fenômenos que não correspondem nem ao IVS clássico nem à governança, mas permanecem relevantes para interpretação da vulnerabilidade. Todo registro com `SMIDS_EXT` exige `tipo_camada`, `dimensao_analitica`, `observacao` e `entra_ipst` preenchidos.

**Nota de migração:** `SMIDS_GOV` foi descontinuado. Substituir por `GOV_MUNICIPAL` + `tipo_camada = GOVERNANCA`.

---

### `nivel_criticidade`
Tipo: string
Valores permitidos:
| valor | descrição |
|---|---|
| `alta` | Impacto direto relevante na população vulnerável |
| `media` | Impacto indireto |
| `baixa` | Ação institucional ou preventiva |
| `alerta` | Evento crítico — violência, morte, risco grave |

---

### `observacao`
Tipo: string
Regra: **vocabulário controlado — valor único obrigatório.**
Quando houver mais de uma interpretação possível, usar o valor preponderante.
Para texto analítico livre, usar o campo `nota_analista`.

Valores permitidos:
| valor | o que captura |
|---|---|
| `sinal_smids_ext` | Sem variável IVS mapeável ou sem eixo dominante claro |
| `multiplos_loteamentos` | Impacto difuso em mais de um loteamento |
| `impacto_latente` | Efeito futuro não imediato |
| `impacto_regional_hortolandia` | Evento externo com reflexo local |
| `aproximacao_variavel` | Indicador substituto de variável IVS não oficial |
| `caso_ilustrativo` | Evento pontual em loteamento identificado |
| `interface_ch` | Cruzamento com dimensão Capital Humano |
| `interface_rt` | Cruzamento com dimensão Renda e Trabalho |
| `interface_iu` | Cruzamento com dimensão Infraestrutura Urbana |
| `dado_auditavel` | Fonte com dado mensurável para série temporal |
| `fora_escopo_smids` | Equipamento ou ação fora do radar SMIDS |
| `acao_institucional_smids` | Ação direta da secretaria |
| `duvida_metodologica` | Incerteza sobre classificação ou variável |
| `tarefa_pendente` | Ação operacional a executar |
| `contexto_sociopolitico` | Contexto sem impacto IVS direto |

**Regra R15 — Hierarquia de classificação:**
1. Há número verificável → `dado_auditavel`
2. Sem eixo dominante claro → `sinal_smids_ext`
3. Estrutura institucional ou política → `contexto_sociopolitico`

---

### `aproximacao_variavel`
Tipo: string
Regra: código IVS aproximado quando o evento é proxy de variável sem medição direta
Exemplo: `CH_04` para violência doméstica

---

### `nota_analista`
Tipo: string
Regra: campo de texto livre sem restrição de vocabulário.

**Uso:**
- Justificativas de classificação
- Referências cruzadas entre variáveis
- Nomes populares de loteamentos
- Pendências e anotações de processo
- Candidatos a variáveis do IPST-H ou fases futuras do IVS-H

**Regra:** não alimenta indicadores. Serve exclusivamente para rastreabilidade e auditoria.

---

### `cod_loteamento`
Tipo: integer ou string
Chave: `codbairro` da `dim_loteamento`
Regra: `nao_identificado` quando loteamento não for identificável com segurança;
`nao_aplicavel` para eventos de escopo municipal sem loteamento específico

---

### `nivel_confianca_loteamento`
Tipo: string
Valores permitidos:
| valor | descrição |
|---|---|
| `alto` | Loteamento mencionado explicitamente na notícia |
| `medio` | Loteamento inferido por referência geográfica próxima |
| `baixo` | Loteamento inferido por contexto indireto |
| `nao_aplicavel` | Evento sem loteamento específico |

---

### `papel_no_ciclo` *(novo — v04)*
Tipo: string
**Campo obrigatório.**

Posição do registro no ciclo de pressão social:

| valor | descrição |
|---|---|
| `emergencia` | Primeiro sinal do problema — aparecimento da pressão |
| `resposta` | Ação do Estado em reação a pressão identificável (R22) |
| `agravamento` | Pressão volta a subir ou progride (R20: válido com base interna à matéria) |
| `sinal_desfecho` | Indício jornalístico de atenuação ou resolução |
| `nao_aplicavel` | O registro não participa de nenhum ciclo de pressão por natureza |

**Regra R19:** `nao_aplicavel` só quando o registro não participa por natureza de nenhum ciclo. Proibido como substituto de incerteza.

**Regra R22:** `GOVERNANCA` só recebe `resposta` se houver pressão identificável como gatilho.

**Regra R20:** `agravamento` válido mesmo sem histórico no corpus, quando a própria matéria documenta progressão mensurável.

**Tabela de referência:**
| `tipo_camada` | `papel_no_ciclo` |
|---|---|
| `PRESSAO_SOCIAL` | SEMPRE `emergencia` ou `agravamento` — NUNCA `nao_aplicavel` |
| `GOVERNANCA` | `resposta` (se reativa) ou `nao_aplicavel` (se estrutural) |
| `CONTEXTO` | geralmente `nao_aplicavel` |
| `IVS` | geralmente `nao_aplicavel` |

---

### `id_caso_pressao` *(novo — v04)*
Tipo: string
Obrigatório: não
Formato sugerido: `[DIMENSAO]_[TEMA]_[ANO]`
Exemplo: `CH_VIOLENCIA_GENERO_2025`

Regra: agrupa registros que pertencem ao mesmo ciclo temático.
Preenchido → corpus sugere relação.
Vazio → camada analítica infere posteriormente.

---

### `entra_ipst` *(novo — v04)*
Tipo: string
**Campo obrigatório.**

| valor | critério |
|---|---|
| `sim` | `PRESSAO_SOCIAL` + `nivel_criticidade = alerta` + `observacao = dado_auditavel` |
| `avaliar` | Atende parcialmente os critérios |
| `nao` | Sem relevância para o IPST-H |

Pipeline direto entre corpus e IPST-H sem depender de análise posterior.

---

### `polaridade_evento`
Tipo: string
Valores permitidos:
| valor | descrição |
|---|---|
| `positivo` | Evento alivia ou reduz vulnerabilidade |
| `negativo` | Evento pressiona ou evidencia vulnerabilidade |

---

### `tipo_origem_evento`
Tipo: string
Valores permitidos:
| valor | descrição |
|---|---|
| `assistencial` | Origem na rede socioassistencial |
| `infraestrutura` | Obra, equipamento, serviço urbano |
| `seguranca` | Crime, violência, ocorrência policial |
| `institucional` | Governança, certificação, convênio |
| `economico` | Pressão de custo de vida, renda, preços |

---

## Changelog
| versão | data | alteração |
|---|---|---|
| v01 | "01/04/2026" | Criação do dicionário; 17 colunas documentadas |
| v02 | "02/04/2026" | `SMIDS_GOV` promovido; `SMIDS_EXT` removido de `dimensao_ivs` |
| v03 | "17/04/2026" | `observacao` migrado para vocabulário controlado + R15; `nota_analista` adicionado; `gravidade` → `nivel_criticidade` |
| v04 | "18/04/2026" | `tipo_camada` adicionado (IVS, GOVERNANCA, PRESSAO_SOCIAL, CONTEXTO); `papel_no_ciclo` adicionado + R19/R20/R22; `id_caso_pressao` adicionado; `entra_ipst` adicionado; `dimensao_ivs` renomeado para `dimensao_analitica` com remoção do valor `governanca`; `SMIDS_GOV` descontinuado em favor de `GOV_MUNICIPAL/GOV_ESTADUAL/GOV_FEDERAL`; R21 documentada em `tipo_relacao_variavel` |

---

*Arquivo de governança — Atlas Social de Hortolândia*
*00_governanca/corpus_jornalistico/*
icionario_v04.md…]()

