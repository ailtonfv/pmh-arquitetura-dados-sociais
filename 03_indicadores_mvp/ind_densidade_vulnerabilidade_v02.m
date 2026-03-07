# Indicador de Densidade de Vulnerabilidade Territorial
**Arquivo:** `ind_densidade_vulnerabilidade_v02.md`  
**Localização no repositório:** `03_indicadores_mvp/`  
**Versão:** 02 | **Data:** 07/03/2026  
**Versão anterior:** v01 (07/03/2026)  
**Responsável:** Ailton Vendramini / Claude (Anthropic)

**Atualizações v02:**
- Estrutura reescrita com base nas dimensões oficiais do projeto
- `codbairro` adotado como chave de integração (alinhado com `dim_municipio_regioes_loteamentos_v02`)
- `DIM_DOMICILIO` incorporada como fonte do denominador — elimina dependência do IBGE
- Coabitação reconhecida como variável amplificadora de vulnerabilidade
- Indicador de gap incorporado via `FATO_ATENDIMENTO`
- Cobertura executora ampliada: CRAS + OSC (via `DIM_OSC_v02`)
- Indicador decomposto em três camadas progressivas

---

## 1. Conceito

O **Indicador de Densidade de Vulnerabilidade** mede a intensidade da vulnerabilidade social em cada loteamento, cruzando famílias registradas no CadÚnico com o total de domicílios do mesmo endereço.

Ele responde à pergunta central da política socioassistencial:

> *Onde a vulnerabilidade está concentrada — com que intensidade — e quem está cobrindo?*

**Princípio estruturante (alinhado com `glossario_conceitual_v01.md`):**

```
Domicílio não é família. Família não é pessoa.
A densidade mede a relação entre as três entidades no espaço do loteamento.
```

---

## 2. Posição na Cadeia Relacional do Projeto

```
DIM_REGIAO_PLANEJAMENTO (RP_1 a RP_6)
    ↓
DIM_LOTEAMENTO (codbairro = chave oficial)
    ↓
DIM_DOMICILIO ←── denominator do indicador
    ↓
DIM_FAMILIA ←── numerador do indicador (famílias CadÚnico)
    ↓
DIM_PESSOA (CPF)

DIM_LOTEAMENTO
    ↓
REL_LOTEAMENTO_NUCLEO ←→ DIM_NUCLEO ←→ REL_NUCLEO_EXECUTOR
                                          ↓
                          DIM_UNIDADES_ATENDIMENTO (CRAS/CREAS)
                          + DIM_OSC (cobertura complementar)

FATO_ATENDIMENTO ←── gap do indicador
```

---

## 3. Estrutura do Indicador — Três Camadas

O indicador é decomposto em três camadas progressivas, cada uma respondendo uma pergunta distinta.

---

### Camada 1 — Densidade Bruta

**Pergunta:** Qual proporção dos domicílios do loteamento tem famílias no CadÚnico?

```
Densidade_Bruta (%) =
    (Famílias_CadÚnico_no_loteamento / Total_Domicílios_no_loteamento) × 100
```

**Fonte do numerador:** `DIM_FAMILIA` → famílias com `id_loteamento` vinculado via `TAB_NORMALIZA_LOCALIDADE`  
**Fonte do denominador:** `DIM_DOMICILIO` → contagem de `id_domicilio` por `id_loteamento`

> ✅ Esta camada não depende do IBGE. Ambas as fontes são internas ao projeto.

---

### Camada 2 — Densidade de Coabitação

**Pergunta:** Em quantos domicílios coabitam múltiplas famílias?

```
Coabitação (%) =
    (Domicílios_com_mais_de_1_família / Total_Domicílios_no_loteamento) × 100
```

**Por que importa:** Coabitação é sinal de vulnerabilidade amplificada — não apenas adensamento. Três famílias num mesmo endereço no CadÚnico representam uma situação qualitativamente diferente de três famílias em endereços distintos.

**Fonte:** `DIM_DOMICILIO` × `DIM_FAMILIA` — agrupamento por `id_domicilio`, contagem de `id_familia`.

---

### Camada 3 — Gap de Cobertura

**Pergunta:** Das famílias vulneráveis no loteamento, quantas estão sendo efetivamente atendidas — por quem?

```
Gap (famílias) =
    Famílias_CadÚnico_no_loteamento
    − Famílias_com_atendimento_ativo_no_loteamento

Cobertura (%) =
    (Famílias_com_atendimento_ativo / Famílias_CadÚnico) × 100
```

**Desagregação da cobertura:**

| Executor | Fonte |
|----------|-------|
| CRAS (setor Inclusão) | `FATO_ATENDIMENTO` × `DIM_UNIDADES_ATENDIMENTO` |
| CREAS (proteção especial) | `FATO_ATENDIMENTO` × `DIM_UNIDADES_ATENDIMENTO` |
| OSC conveniada | `FATO_ATENDIMENTO` × `DIM_OSC` (potencial_relacao = ALTA) |
| Descoberto (sem cobertura) | gap residual |

> **Nota:** Um loteamento descoberto pelo CRAS pode estar sendo parcialmente coberto por OSC. O indicador deve enxergar os dois — conforme a lógica da `REL_NUCLEO_EXECUTOR` do `dim_nucleo_v01.md`.

---

## 4. Classificação dos Loteamentos

Combinando as três camadas, cada loteamento é classificado em uma de quatro categorias:

| Categoria | Critério | Implicação Operacional |
|-----------|----------|------------------------|
| 🔴 Crítico | Densidade_Bruta ≥ 40% **ou** Gap > 60% | Prioridade máxima — expansão de cobertura |
| 🟠 Atenção | Densidade_Bruta 20–39% **ou** Gap 40–59% | Monitoramento ativo — reforço de cobertura |
| 🟡 Estável | Densidade_Bruta 10–19% **ou** Gap 20–39% | Cobertura de manutenção |
| 🟢 Baixo | Densidade_Bruta < 10% **e** Gap < 20% | Demanda residual |

**Atenção especial — loteamentos de fronteira:**  
Os 11 loteamentos com `fronteira = S` no `dim_municipio_regioes_loteamentos_v02` devem ser analisados considerando ambas as RPs envolvidas, pois a cobertura do CRAS pode estar ancorada na RP adjacente.

---

## 5. Modelo de Dados

### 5.1 Tabela de fato do indicador

```sql
CREATE TABLE FATO_DENSIDADE_VULNERABILIDADE (
    id                      INTEGER PRIMARY KEY,
    codbairro               INTEGER NOT NULL,     -- FK → DIM_LOTEAMENTO (chave oficial)
    id_loteamento           TEXT,                 -- ex: LOT_351
    id_rp                   TEXT,                 -- ex: RP_3
    competencia             TEXT NOT NULL,        -- ex: '2026-01'

    -- Camada 1: Densidade Bruta
    familias_cadunico       INTEGER,
    domicilios_total        INTEGER,
    densidade_bruta_pct     REAL,                 -- Camada 1

    -- Camada 2: Coabitação
    domicilios_coabitados   INTEGER,              -- domicílios com > 1 família
    coabitacao_pct          REAL,                 -- Camada 2

    -- Camada 3: Gap de Cobertura
    familias_atendidas_cras INTEGER,
    familias_atendidas_osc  INTEGER,
    familias_atendidas_total INTEGER,
    gap_familias            INTEGER,              -- Camada 3
    cobertura_pct           REAL,                 -- Camada 3

    -- Classificação final
    classificacao           TEXT,                 -- Crítico | Atenção | Estável | Baixo
    fronteira               TEXT DEFAULT 'N'      -- S/N — loteamentos de divisa entre RPs
);
```

### 5.2 View de ranking por Região de Planejamento

```sql
CREATE VIEW VW_DENSIDADE_POR_RP AS
SELECT
    l.id_rp,
    COUNT(DISTINCT f.codbairro)         AS total_loteamentos,
    SUM(f.familias_cadunico)            AS familias_cadunico,
    SUM(f.domicilios_total)             AS domicilios_total,
    SUM(f.domicilios_coabitados)        AS domicilios_coabitados,
    SUM(f.gap_familias)                 AS gap_familias,
    ROUND(
        CAST(SUM(f.familias_cadunico) AS REAL) /
        NULLIF(SUM(f.domicilios_total), 0) * 100, 1
    )                                   AS densidade_bruta_pct,
    ROUND(
        CAST(SUM(f.familias_atendidas_total) AS REAL) /
        NULLIF(SUM(f.familias_cadunico), 0) * 100, 1
    )                                   AS cobertura_pct
FROM FATO_DENSIDADE_VULNERABILIDADE f
JOIN DIM_LOTEAMENTO l ON f.codbairro = l.codbairro
GROUP BY l.id_rp
ORDER BY densidade_bruta_pct DESC;
```

### 5.3 View da ficha analítica do loteamento

```sql
-- Responde: "Qual o perfil completo deste loteamento?"
CREATE VIEW VW_FICHA_LOTEAMENTO AS
SELECT
    l.codbairro,
    l.nome_loteamento,
    l.tipo_loteamento,
    l.id_rp,
    l.fronteira,

    -- Vulnerabilidade
    f.familias_cadunico,
    f.domicilios_total,
    f.densidade_bruta_pct,
    f.domicilios_coabitados,
    f.coabitacao_pct,

    -- Cobertura
    f.familias_atendidas_cras,
    f.familias_atendidas_osc,
    f.familias_atendidas_total,
    f.gap_familias,
    f.cobertura_pct,
    f.classificacao

FROM DIM_LOTEAMENTO l
LEFT JOIN FATO_DENSIDADE_VULNERABILIDADE f
    ON l.codbairro = f.codbairro;
```

---

## 6. Conexão com o SUAS e as Perguntas da Secretaria

Este indicador responde diretamente às perguntas formuladas pela Secretaria de Inclusão:

| Pergunta (Eixo) | Camada do Indicador |
|-----------------|---------------------|
| Famílias com múltiplos fatores de vulnerabilidade | Camada 1 + Coabitação |
| Concentração territorial de dependência de benefícios | Camada 1 — Densidade Bruta |
| Bairros com maior reincidência de atendimento | Camada 3 + `FATO_ATENDIMENTO` |
| Correlação território × tipo de demanda | Camada 1 × `DIM_PROGRAMAS_SOCIAIS` |
| Famílias que recebem benefício sem acompanhamento | Camada 3 — Gap |

---

## 7. Produto para a Apresentação de Março

### Mapa 1 — Densidade Bruta por Região de Planejamento (macro)

```
RP_1 (4 lot.)   [░░░░░░░░░░░░░░░░░░░░] X% — X famílias
RP_2 (42 lot.)  [░░░░░░░░░░░░░░░░░░░░] X% — X famílias
RP_3 (16 lot.)  [░░░░░░░░░░░░░░░░░░░░] X% — X famílias
RP_4 (18 lot.)  [░░░░░░░░░░░░░░░░░░░░] X% — X famílias
RP_5 (32 lot.)  [░░░░░░░░░░░░░░░░░░░░] X% — X famílias
RP_6 (24 lot.)  [░░░░░░░░░░░░░░░░░░░░] X% — X famílias
```

### Mapa 2 — Gap de Cobertura por Loteamento (micro)

Cada loteamento como ponto: tamanho = volume de famílias CadÚnico, cor = classificação 🔴🟠🟡🟢.

### Slide de descoberta

> *"Encontramos loteamentos onde famílias vulneráveis levam o CadÚnico à UBS — não ao CRAS — porque o CRAS está muito distante."*  
> **Fonte empírica confirmada:** Jardim São Bento (LOT_341) — Tribuna Liberal, 16/01/2026.

Esse slide ancora o dado técnico num fato real já documentado.

---

## 8. Relação com Outras Dimensões — Mapa de Intersecções

```
ind_densidade_vulnerabilidade_v02
    ↓ usa como base
    ├── dim_municipio_regioes_loteamentos_v02  (codbairro, id_rp, fronteira)
    ├── dim_domicilios_hortolandenses_v01      (denominador + coabitação)
    ├── dim_familia                             (numerador — famílias CadÚnico)
    ├── fato_atendimento_v01                   (gap de cobertura)
    ├── dim_unidades_de_atendimento_v01        (cobertura CRAS/CREAS)
    └── dim_osc_v02                            (cobertura complementar OSC)
```

---

## 9. Pendências

| # | Pendência | Prioridade | Origem |
|---|-----------|------------|--------|
| P01 | Vincular endereços CadÚnico aos `codbairro` via `TAB_NORMALIZA_LOCALIDADE` | Alta | dim_municipio v02 — P08 |
| P02 | Popular `DIM_DOMICILIO` com campos do CadÚnico V7 (estrutura habitacional) | Alta | dim_domicilios v01 |
| P03 | Cruzar 141 loteamentos com cobertura real dos 7 CRAS | Alta | dim_municipio v02 — P01 |
| P04 | Verificar OSCs com `potencial_relacao = ALTA` cobrindo loteamentos sem CRAS | Alta | dim_osc v02 |
| P05 | Investigar "Taquara Branca" — confirmar se tem `codbairro` ou é nome popular | Alta | dim_municipio v02 — P06 |
| P06 | Confirmar RP correta dos 11 loteamentos de fronteira | Média | dim_municipio v02 — P09 |
| P07 | Verificar cobertura dos 15 loteamentos aprovados entre 2021–2025 | Alta | dim_municipio v02 — P10 |

---

## Log de Alterações

| Versão | Data | Alterações |
|--------|------|-----------|
| v01 | 07/03/2026 | Criação — estrutura inicial com fórmula básica e classificação em 4 faixas |
| v02 | 07/03/2026 | Reescrita completa. `codbairro` como chave. `DIM_DOMICILIO` incorporada como denominador. Coabitação como Camada 2. Gap de cobertura como Camada 3. OSC incorporada na cobertura. Intersecções com dims do projeto mapeadas. Pendências consolidadas. |

---

*Documento técnico vivo — Projeto Atlas Social de Hortolândia*  
*Versão 02 — alinhada com a arquitetura do projeto em 07/03/2026*
