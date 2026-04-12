[dicionario_v02.md](https://github.com/user-attachments/files/26446292/dicionario_v02.md)[Uploading dicionario_v02.md# Dicionário do Corpus Jornalístico
**Atlas Social de Hortolândia — SMIDS**
Versão: v02 | Data: 2026-04-02

---

## Princípio conceitual

> IVS mede. GOV e SMIDS_EXT explicam.

O corpus jornalístico opera em duas camadas:
- **Núcleo duro (IVS):** mensurável, comparável, replicável
- **Camada expandida (GOV / SMIDS_EXT):** contextual, interpretativa, estratégica

---

## Colunas e valores controlados

### `fonte`
Tipo: string
Valor atual: `Tribuna Liberal`
Regra: nome completo do veículo sem abreviação

---

### `data`
Tipo: date
Formato: `YYYY-MM-DD`
Regra: data de publicação da edição

---

### `item`
Tipo: string
Regra: título descritivo do evento sem acentos; sem caixa alta

---

### `pagina`
Tipo: integer ou string
Valores: número da página ou `s/n` quando não identificada

---

### `dimensao_ivs`
Tipo: string
Valores permitidos:
| valor | descrição |
|---|---|
| `capital_humano` | Dimensão CH do IVS |
| `infraestrutura_urbana` | Dimensão IU do IVS |
| `renda_trabalho` | Dimensão RT do IVS |
| `multidimensional` | Evento cruza duas ou mais dimensões |
| `governanca` | Fora do IVS — capacidade institucional do Estado |

**Nota:** o valor `SMIDS_EXT` foi removido desta coluna a partir de v02.
Eventos anteriormente classificados como `dimensao_ivs = SMIDS_EXT`
devem ser reclassificados para a dimensão IVS mais próxima,
usando `codigo_variavel = SMIDS_EXT` para preservar a distinção de origem.

---

### `codigo_variavel`
Tipo: string
Valores permitidos:
| valor | descrição |
|---|---|
| `IU_01` a `IU_03` | Variáveis Infraestrutura Urbana |
| `CH_01` a `CH_08` | Variáveis Capital Humano |
| `RT_01` a `RT_05` | Variáveis Renda e Trabalho |
| `multidimensional` | Cruza variáveis sem código único |
| `SMIDS_GOV` | Evento de governança institucional — em uso |
| `SMIDS_EXT` | Evento externo ao escopo SMIDS com impacto territorial indireto |

**Regra SMIDS_GOV:** usar quando o evento envolve capacidade institucional,
instrumento de planejamento, certificação ou ação pública formal.
Exemplos: Plano Diretor, Selo FNAS, audiência pública, convênio municipal.

**Regra SMIDS_EXT:** usar quando o evento não mapeia para nenhuma variável IVS
de forma defensável e não é de governança direta.
Exemplos: obra viária de outra secretaria, infraestrutura regional, emenda
parlamentar genérica sem escopo SMIDS.

**Subtipagem futura planejada:** `SMIDS_INFRA`, `SMIDS_EQUIP`

---

### `tipo_relacao_variavel`
Tipo: string
Valores permitidos:
| valor | descrição |
|---|---|
| `direta` | Evento mensura ou evidencia a variável IVS diretamente |
| `indireta` | Evento relaciona-se com a variável por consequência |
| `contextual` | Evento contextualiza sem relação causal defensável |

---

### `resumo`
Tipo: string
Regra: sem acentos; campos separados por `;`; máximo descritivo possível

---

### `localidade`
Tipo: string
Regra: nome do município sem acento

---

### `tipo_evento`
Tipo: string
Valores permitidos:
| valor | descrição |
|---|---|
| `violencia` | Crime ou violência com vítima identificada |
| `vulnerabilidade` | Situação de risco social direto |
| `politica_publica` | Ação ou proposta de política pública |
| `infraestrutura` | Obra, equipamento ou serviço urbano |
| `institucional` | Certificação, convênio, reconhecimento formal |
| `problema` | Problema urbano ou social sem vítima direta |

---

### `gravidade`
Tipo: string
Valores permitidos: `alta` | `media` | `baixa` | `nao_aplicavel`

---

### `observacao`
Tipo: string
Regra: campo livre para anotações metodológicas; sem acentos

---

### `cod_loteamento`
Tipo: integer ou string
Chave: `codbairro` da `dim_loteamento`
Regra: `nao_aplicavel` para eventos de escopo municipal sem loteamento específico

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
| v01 | 2026-04-01 | Criação do dicionário; 17 colunas documentadas |
| v02 | 2026-04-02 | `SMIDS_GOV` promovido de futuro para em uso; `SMIDS_EXT` removido de `dimensao_ivs` com nota de migração; princípio conceitual atualizado |
…]()
