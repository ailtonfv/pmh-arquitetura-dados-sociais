[README_corpus_v1.5.md](https://github.com/user-attachments/files/27318242/README_corpus_v1.5.md)
# CORPUS JORNALÍSTICO — IPSO-H
## Pressão Social Observada em Hortolândia

**Versão:** v1.5  
**Data:** "03/05/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolandia / 00_governanca/corpus_jornalistico/

---

## Changelog v1.4 → v1.5

| Item | Mudança |
|---|---|
| Título | Corpus reposicionado como IPSO-H — instrumento autônomo |
| Seção 1 | Separação metodológica explícita: IPSO-H ≠ IPST-H |
| Seção 2 | Arquitetura dos três instrumentos formalizada |
| Seção 3 | Usos legítimos do IPSO-H detalhados |
| Seção 4 | Limitação territorial formalizada (loteamento não identificável via jornal) |
| Motivação | Decisão de 03/05/2026 após 4 meses de coleta: corpus tem valor como inteligência institucional narrativa, não como insumo direto de índices quantitativos |

---

## 1. O que é o IPSO-H

O **IPSO-H — Índice de Pressão Social Observada de Hortolândia** é a camada qualitativa do Atlas Social de Hortolândia.

Ele é construído a partir da classificação estruturada de notícias da **Tribuna Liberal**, organizadas em registros analíticos que capturam eventos, ciclos de pressão e respostas do Estado ao longo do tempo.

> **O IPSO-H responde à pergunta que nenhum banco de dados estruturado responde:**
> *"O que está acontecendo agora em Hortolândia?"*

---

## 2. Separação Metodológica Obrigatória

O Atlas Social opera com três instrumentos distintos. Eles se complementam narrativamente mas **não se mesclam metodologicamente**.

```
┌──────────────────────────────────────────────────────┐
│  IVS-H                                               │
│  Onde está a vulnerabilidade?                        │
│  Base: CadÚnico, IBGE — quantitativo, estrutural     │
└──────────────────────────────────────────────────────┘
                    ↕ interface narrativa
┌──────────────────────────────────────────────────────┐
│  IPST-H                                              │
│  Onde há pressão mensurável sobre o Estado?          │
│  Base: dados administrativos — quantitativo          │
└──────────────────────────────────────────────────────┘
                    ↕ interface narrativa
┌──────────────────────────────────────────────────────┐
│  IPSO-H  ← este documento                           │
│  O que está acontecendo agora?                       │
│  Base: corpus jornalístico — qualitativo, narrativo  │
└──────────────────────────────────────────────────────┘
```

> ⚠️ **O corpus jornalístico não compõe diretamente o cálculo do IPST-H.**
>
> Misturar as duas metodologias geraria:
> - subjetividade no índice
> - perda de credibilidade técnica
> - dificuldade de replicação
>
> A integração entre IPSO-H e IPST-H é **narrativa**, não **estatística**.

---

## 3. Para que serve o IPSO-H

### 3.1 Abertura de apresentações institucionais
> *"Nas últimas semanas, observamos aumento de eventos relacionados a violência contra crianças e adolescentes, com novo inquérito aberto e operação interestadual ativa."*

### 3.2 Validação narrativa de indicadores
> *"O nível elevado de RT_01 no IVS-H é consistente com os eventos de exclusão bancária e informalidade observados no corpus desde janeiro."*

### 3.3 Argumento de pressão institucional
> *"O ciclo CH_VIOLENCIA_GENERO_2025 está ativo desde dezembro sem sinal de desfecho. A rede municipal registra resposta, mas a pressão persiste."*

### 3.4 Linha do tempo de ciclos
```
emergência → agravamento → resposta → persistência / sinal_desfecho
```

### 3.5 Memória institucional datada
Quando a gestão mudar, o corpus documenta o que estava acontecendo, quando o Estado respondeu e quais pressões nunca tiveram desfecho. Isso é raro na administração pública.

---

## 4. O que o IPSO-H não faz

> ❌ Não alimenta fórmulas do IPST-H
> ❌ Não substitui dados administrativos
> ❌ Não produz índices numéricos comparáveis
> ❌ Não identifica loteamentos via jornalismo — o jornal não opera com `codbairro`

### Nota sobre identificação territorial

A Tribuna Liberal nomeia bairros populares e referências locais — nunca o código oficial de loteamento. Esse gap é estrutural e não será resolvido. O corpus opera como **sensor temático e temporal**, não como sensor territorial.

A dimensão territorial do Atlas é responsabilidade do **IVS-H** (via CadÚnico + CEP) e do **IPST-H** (via dados administrativos).

---

## 5. Escopo Geográfico

O corpus registra exclusivamente eventos enquadrados em um dos três casos:

| Caso | Critério |
|---|---|
| 1 | Evento ocorrido em Hortolândia |
| 2 | Evento externo com impacto direto e identificável sobre Hortolândia |
| 3 | Evento de Hortolândia com impacto identificável na região |

> Regra operacional completa: ver **R27** em `regras_de_classificacao_v10.4.md`

---

## 6. Estrutura dos Registros

Cada notícia é convertida em um registro CSV com 20 campos estruturados:

| Campo | O que captura |
|---|---|
| `tipo_camada` | Natureza analítica: IVS, GOVERNANCA, PRESSAO_SOCIAL, CONTEXTO |
| `dimensao_analitica` | Eixo de impacto: capital_humano, infraestrutura_urbana, renda_trabalho |
| `tipo_relacao_variavel` | Como o evento se conecta ao IVS: direta, indireta, contextual, latente |
| `codigo_variavel` | Variável IVS, código de governança ou SMIDS_EXT |
| `nivel_criticidade` | baixa, media, alta, alerta |
| `papel_no_ciclo` | emergencia, resposta, agravamento, sinal_desfecho, nao_aplicavel |
| `id_caso_pressao` | Agrupamento temático do ciclo (ex: CH_VIOLENCIA_GENERO_2025) |
| `entra_ipst` | Entrada no IPSO-H: sim, avaliar, nao |

> Schema completo: ver Seção 22 de `regras_de_classificacao_v10.4.md`

---

## 7. Ciclos Ativos

Os ciclos de pressão social são o principal produto analítico do IPSO-H.

**Formato:** `[DIMENSAO]_[TEMA]_[ANO]`

Ciclos em aberto são rastreados por `papel_no_ciclo` ao longo do tempo:
- `emergencia` — primeiro registro do fenômeno
- `agravamento` — pressão volta a subir
- `resposta` — Estado reage
- `sinal_desfecho` — indício de atenuação

> O desfecho definitivo não pode ser inferido pelo corpus — requer triangulação com dados administrativos e IVS-H. Ver **R26**.

---

## 8. Limitações

- Tendência a registrar eventos extremos (viés do jornalismo)
- Cobertura parcial e irregular do município
- Loteamento raramente identificável
- Ausência de registro não equivale a ausência do fenômeno

> O IPSO-H deve ser interpretado como complemento qualitativo — nunca como fonte primária de cálculo.

---

## 9. Governança

| Documento | Função |
|---|---|
| `regras_de_classificacao_v10.4.md` | Regras operacionais completas |
| `dicionario_v04.md` | Definições de campos e valores |
| `fechamento_dia_XX_XX_XXXX.md` | Memória de sessão — continuidade entre conversas |
| CSVs em `series_jornalisticas/` | Dados classificados por edição |

**Fonte primária:** Tribuna Liberal  
**Frequência de coleta:** por edição disponível  
**LGPD:** nenhum dado pessoal é registrado — apenas eventos publicados

---

*Arquivo de governança — Atlas Social de Hortolândia*  
*00_governanca/corpus_jornalistico/*
