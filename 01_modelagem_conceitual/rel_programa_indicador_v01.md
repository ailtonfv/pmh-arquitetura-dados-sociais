[rel_programa_indicador_v01.md](https://github.com/user-attachments/files/26027802/rel_programa_indicador_v01.md)
# REL_PROGRAMA_INDICADOR — Relação Programa × Indicador
**Versão:** v01  
**Data:** 2026-03-15  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 01_modelagem_conceitual

> Este documento define conceitualmente a relação N:M entre programas e indicadores.
> É a **Camada 3 do catálogo** — transforma descrição em avaliação de política pública.
>
> **Implementação executável:** `02_modelagem_lógica/rel_programa_indicador_v01.sql`  
> **Não contém:**
> - Valores medidos no tempo → `FATO_INDICADOR` (a criar)
> - Estrutura dos programas → `DIM_PROGRAMA`
> - Executores → `DIM_ORGAO_EXECUTOR`

---

## 1. As Três Camadas do Catálogo

| Camada | Pergunta | Arquivo |
|--------|----------|---------|
| 1 — Inventário Institucional | Quais programas existem? | `DIM_PROGRAMA` |
| 2 — Governança | Quem executa e sob qual base legal? | `DIM_ORGAO_EXECUTOR` + `base_legal` |
| 3 — Avaliação | Qual indicador mede o resultado? | `REL_PROGRAMA_INDICADOR` + `FATO_INDICADOR` |

> Sem a Camada 3, o Atlas Social **descreve** a política pública.  
> Com ela, o Atlas Social **avalia** a política pública.

---

## 2. Por que REL_PROGRAMA_INDICADOR é necessária

O campo `indicador_principal` em `DIM_PROGRAMA` (texto curto, campo único) foi suficiente
para a primeira versão do catálogo. Porém, programas complexos exigem múltiplos indicadores
de naturezas distintas.

**Exemplo concreto — CENTROPOP:**

| indicador | tipo | o que mede |
|-----------|------|------------|
| atendimentos/mês | produto | volume de entregas |
| encaminhamentos | processo | qualidade do fluxo assistencial |
| reinserção social | resultado | mudança real na vida da pessoa |

Colocar apenas um desses no campo `indicador_principal` apagaria a distinção entre
"fazer" (produto) e "mudar" (resultado) — distinção que é exatamente o que o Atlas Social
precisa capturar.

**Princípio:**
- Um programa pode ter N indicadores
- Um indicador pode ser compartilhado por M programas
- `REL_PROGRAMA_INDICADOR` é a ponte N:M

---

## 3. Tipos de Indicador — Lógica de Classificação

| tipo | definição | exemplo |
|------|-----------|---------|
| insumo | recursos disponibilizados | vagas ofertadas, valor do repasse |
| processo | atividades durante a execução | encaminhamentos, visitas domiciliares |
| produto | entregas diretas ao público-alvo | famílias acompanhadas, atendimentos |
| resultado | mudança observada no público-alvo | inserção formal, saída da situação de rua |
| impacto | mudança estrutural de longo prazo | redução do IVS-H do núcleo |

**Hierarquia de relevância para o Atlas Social:**
```
resultado > produto > processo > insumo
```
> `impacto` é medido por `FATO_IVS_LOTEAMENTO`, não aqui.

---

## 4. Estrutura da REL_PROGRAMA_INDICADOR

```
id_rel              PK — autoincremento
id_programa         FK → DIM_PROGRAMA
id_nucleo           FK → DIM_NUCLEO (NULL = Municipal)
                    Quando preenchido: indicador calculado apenas para aquele núcleo

indicador           nome padronizado (texto curto)
descricao           descrição completa da fórmula / critério

tipo_indicador      insumo | processo | produto | resultado | impacto
unidade_medida      famílias | atendimentos | % | R$ | vagas | pessoas | meses | índice

periodicidade       mensal | trimestral | semestral | anual | por_evento
fonte_dado          CadÚnico | SIGAS | CRAS | CAGED | IBGE | Secretaria | OSC | A confirmar

dimensao_ivs        infraestrutura_urbana | capital_humano |
                    renda_trabalho | multidimensional | governanca

prioritario         1 = indicador principal do programa (substitui campo indicador_principal)
                    0 = indicador complementar

data_criacao        data de inserção
observacoes
```

**Restrição de unicidade:** um programa não pode ter o mesmo indicador registrado duas vezes.

---

## 5. Indicadores Transversais do Sistema

Estes indicadores não pertencem a um único programa. São calculados em `FATO_INDICADOR`
cruzando múltiplas fontes. Registrados com `id_programa = 'SISTEMA'`.

> `id_programa = 'SISTEMA'` requer linha correspondente em `DIM_PROGRAMA` — **pendência P01**.

| indicador | tipo | periodicidade | fonte |
|-----------|------|---------------|-------|
| taxa de cobertura SUAS | resultado | semestral | CadÚnico + SIGAS |
| taxa de emancipação assistida | resultado | anual | SIGAS + CAGED |
| tempo médio até inserção formal | resultado | anual | SIGAS + CAGED |
| taxa de reincidência | resultado | anual | SIGAS |
| permanência média no benefício | resultado | semestral | SIGAS + CadÚnico |
| concentração de vulnerabilidade por núcleo | resultado | anual | CadÚnico + IBGE |
| gap de cobertura por núcleo | resultado | semestral | CadÚnico + SIGAS |

---

## 6. Carga Inicial — Resumo por Grupo

| grupo | programas cobertos | indicadores registrados |
|-------|--------------------|------------------------|
| 1 — Proteção Social Básica | PAIF, SCFV, CCS | 8 |
| 2 — Especial Média Complexidade | PAEFI, CENTROPOP, ABORDAGEM_SOCIAL, MSE_LA_PSC, EMERGENCIAS | 11 |
| 3 — Especial Alta Complexidade | SAICA, ABRIGO_ADULTOS, REPUBLICA, RESSIGNIFICA | 10 |
| 4 — Programas Municipais | ACERTE, CRIANCA_FELIZ | 5 |
| 5 — Segurança Alimentar | BAH, PAA, CESTAS | 6 |
| 7 — Inserção Produtiva | PAT, SINE, PEI, SEG_DESEMPREGO | 9 |
| 8 — Direitos Humanos | CRAM, POL_PCD | 5 |
| 11 — Governança | CMAS, PMAS, COMISSAO_VD | 4 |
| SISTEMA — Transversais | — | 7 |
| **Total** | **27 programas** | **65 indicadores** |

---

## 7. Relação com Outros Componentes do Modelo

```
DIM_PROGRAMA
    └─ REL_PROGRAMA_INDICADOR ←→ DIM_NUCLEO
            └─ FATO_INDICADOR (valores no tempo — a criar)
                    └─ Dashboard gerencial
                            └─ Camada 3 do Atlas Social
```

**Fluxo de dados:**
```
REL_PROGRAMA_INDICADOR (estrutura — o que medir)
    → FATO_INDICADOR (valores no tempo — quanto mediu)
        → dashboard gerencial
```

---

## 8. Queries Analíticas de Referência

As seguintes queries estão implementadas no `.sql` como comentários executáveis:

1. Todos os indicadores de resultado do SUAS
2. Indicador principal de cada programa (`prioritario = 1`)
3. Programas sem indicador de resultado — lacuna de avaliação
4. Indicadores por dimensão IVS
5. Indicadores cuja fonte é CAGED — cruzamento com mercado formal

---

## 9. Evolução para FATO_INDICADOR

Esta tabela define **o que medir** por programa.
Os valores reais medidos no tempo pertencem a `FATO_INDICADOR` (a criar):

```
FATO_INDICADOR
--------------
id_rel              FK → rel_programa_indicador
id_nucleo           FK → dim_nucleo (NULL = municipal)
periodo_referencia  YYYY | YYYY-SN | YYYY-MM
valor               REAL
fonte_carga         TEXT
data_extracao       TEXT
observacoes         TEXT
```

---

## Pendências

| # | pendência | prioridade |
|---|-----------|------------|
| P01 | Criar linha `id_programa = 'SISTEMA'` em DIM_PROGRAMA para indicadores transversais | Alta |
| P02 | Expandir carga para grupos 6 (Habitação), 9 (Cultura) e 10 (Saúde/interface SUAS) | Média |
| P03 | Criar FATO_INDICADOR e iniciar carga com dados disponíveis | Alta |
| P04 | Definir metas para cada indicador prioritário — viabiliza semáforo no dashboard | Média |

---

## Log de Alterações

| versão | data | alterações |
|--------|------|------------|
| v01 | 2026-03-15 | Criação — formalização das três camadas do catálogo; 65 indicadores em 27 programas + 7 transversais do sistema; estrutura DDL em `.sql`; queries analíticas de referência; nota arquitetural sobre FATO_INDICADOR |

---

*Documento de modelagem conceitual — 01_modelagem_conceitual/*  
*Atlas Social de Hortolândia — uso interno*
