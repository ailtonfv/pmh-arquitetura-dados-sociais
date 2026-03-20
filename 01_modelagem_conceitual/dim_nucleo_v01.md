
# DIM_NUCLEO — Núcleos de Cobertura Operacional
**Versão:** v01  
**Data:** 2026-03-15  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 01_modelagem_conceitual

> Esta dimensão define os **núcleos de cobertura operacional** do município —
> unidade analítica que organiza loteamentos sob a referência de uma unidade
> âncora (atualmente os 7 CRAS).
>
> O núcleo não é uma divisão administrativa formal do município.
> É a unidade de análise e planejamento do Atlas Social de Hortolândia.
>
> **Não contém:**
> - Lista de loteamentos por núcleo → `REL_NUCLEO_LOTEAMENTO` (a criar)
> - Indicadores agregados por núcleo → `fato_ivs_loteamento` / `fato_ivs_nucleo`
> - Programas com cobertura por núcleo → `REL_PROGRAMA_NUCLEO` (a criar)

---

## Princípio Estruturante

O núcleo é definido pela **unidade pública de referência** que ancora a
cobertura operacional de serviços públicos em um conjunto de loteamentos.

Na fase atual do projeto, a unidade âncora de cada núcleo é o CRAS.
A arquitetura está preparada para incorporar outras unidades âncora
futuramente — UBS, UPA, escola municipal — sem ruptura do modelo.

**Hierarquia analítica do Atlas Social:**
```
Município (Hortolândia — IBGE 3519071)
    └── Região de Planejamento (6 RPs)
            └── Núcleo (7 ativos — 1 por CRAS)
                    └── Loteamento (141 oficiais)
```

---

## Estrutura da DIM_NUCLEO

```
id_nucleo              PK — padrão: NUCLEO_{NOME} (ex: NUCLEO_AMANDA)
nome_nucleo            nome operacional do núcleo
unidade_ancora         id_orgao_executor da unidade de referência (FK → DIM_ORGAO_EXECUTOR)
tipo_ancora            CRAS | UBS | UPA | Escola | Outro
id_regiao_planejamento FK → DIM_REGIAO_PLANEJAMENTO (a criar)
regiao_planejamento    nome da RP — campo desnormalizado para consulta direta
populacao_estimada     estimativa populacional de cobertura (fonte: IBGE / CadÚnico)
area_km2               área aproximada de cobertura em km²
qtd_loteamentos        número de loteamentos vinculados (de REL_NUCLEO_LOTEAMENTO)
status                 ativo | planejamento | inativo
observacoes
```

---

## Registros — Núcleos Ativos (fase atual)

| id_nucleo | nome_nucleo | unidade_ancora | tipo_ancora | regiao_planejamento | status | observacoes |
|---|---|---|---|---|---|---|
| NUCLEO_SANTA_CLARA | Núcleo Santa Clara | CRAS_SANTA_CLARA | CRAS | A confirmar | ativo | — |
| NUCLEO_AMANDA | Núcleo Amanda | CRAS_AMANDA | CRAS | A confirmar | ativo | Coordenador substituído mar/2026 |
| NUCLEO_NOVO_ANGULO | Núcleo Novo Ângulo | CRAS_NOVO_ANGULO | CRAS | A confirmar | ativo | 12 loteamentos com sobreposição pendente de resolução — reunião Cláudia |
| NUCLEO_ROSOLEM | Núcleo Rosolém | CRAS_ROSOLEM | CRAS | A confirmar | ativo | Coordenador: Joel Alves Assunção |
| NUCLEO_PRIMAVERA | Núcleo Primavera | CRAS_PRIMAVERA | CRAS | A confirmar | ativo | — |
| NUCLEO_BRASIL | Núcleo Brasil | CRAS_BRASIL | CRAS | A confirmar | ativo | CRAS homenageia Maria Humilde Antunes (Zuma) |
| NUCLEO_VILA_REAL | Núcleo Vila Real | CRAS_VILA_REAL | CRAS | A confirmar | ativo | CRAS: Rua Ernesto Bergamasco, 185 — confirmado via PL 15/2026 |

---

## Núcleos Planejados

| id_nucleo | nome_nucleo | unidade_ancora | tipo_ancora | status | observacoes |
|---|---|---|---|---|---|
| NUCLEO_NOVO_CRAS | Núcleo a definir — novo CRAS | A definir | CRAS | planejamento | R$ 515.984,27 do FEAS 2026 reservados para criação de novo CRAS (Res. CMAS 008/2026). Localização não definida. O IVS-H deve subsidiar a decisão locacional |

---

## Diretrizes para Expansão

A estrutura da DIM_NUCLEO está preparada para incorporar
outras unidades âncora sem alteração do modelo.

**Expansão prevista — fase futura:**

| tipo_ancora | unidade âncora | finalidade analítica |
|---|---|---|
| UBS | Unidade Básica de Saúde | Cobertura de saúde primária por loteamento |
| UPA | Unidade de Pronto Atendimento | Cobertura de urgência |
| Escola | Escola municipal de referência | Cobertura educacional, evasão |
| CREAS | CREAS | Cobertura de proteção especial |

Cada expansão gera novos registros em DIM_NUCLEO com
`tipo_ancora` distinto. Um mesmo loteamento pode pertencer
a múltiplos núcleos de tipos diferentes — isso é esperado
e correto, pois cada tipo responde a uma política pública
distinta.

---

## Tabelas Relacionadas (a criar)

**REL_NUCLEO_LOTEAMENTO**
```
id_nucleo          FK → DIM_NUCLEO
id_loteamento      FK → DIM_LOTEAMENTO
data_inicio        início da vigência da vinculação
data_fim           fim da vigência (null = atual)
fonte              planilha CRAS Brasil | planilha CRAS Novo Ângulo |
                   PMH/SIG | Jesus José Ribeiro da Costa (sign-off)
observacoes
```
> Controle temporal obrigatório: reorganizações de cobertura
> são registradas com data_fim na relação anterior e nova
> relação com data_inicio — o histórico nunca é sobrescrito.

**REL_PROGRAMA_NUCLEO**
```
id_programa        FK → DIM_PROGRAMA
id_nucleo          FK → DIM_NUCLEO
abrangencia        prioritario | presente | ausente
fonte              chamamento | portaria | levantamento_campo
data_referencia
observacoes
```
> Permite mapear gaps de cobertura por programa e por núcleo —
> responde à pergunta: "em qual núcleo o SCFV está ausente?"

---

## Pendências

| # | Pendência | Prioridade |
|---|---|---|
| P01 | Vincular cada núcleo à sua Região de Planejamento (campo `id_regiao_planejamento`) | Alta |
| P02 | Resolver 12 loteamentos sobrepostos entre CRAS Brasil e CRAS Novo Ângulo — reunião Cláudia | Alta |
| P03 | Resolver 39 loteamentos não encontrados no SIG/PMH | Alta |
| P04 | Popular REL_NUCLEO_LOTEAMENTO após resolução das sobreposições e sign-off Jesus | Alta |
| P05 | Definir localização do novo CRAS planejado — IVS-H como subsídio locacional | Alta |
| P06 | Levantar `populacao_estimada` por núcleo — cruzar CadÚnico dez/2025 com loteamentos | Média |
| P07 | Criar DIM_REGIAO_PLANEJAMENTO com os 6 RPs do Plano Diretor | Média |
| P08 | Criar REL_NUCLEO_LOTEAMENTO após P02 e P03 resolvidos | Alta |
| P09 | Criar REL_PROGRAMA_NUCLEO após REL_NUCLEO_LOTEAMENTO populada | Média |

---

## Log de Alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | 2026-03-15 | Criação — 7 núcleos ativos (1 por CRAS) + 1 planejado; estrutura para expansão a UBS, UPA e escolas; tabelas relacionadas REL_NUCLEO_LOTEAMENTO e REL_PROGRAMA_NUCLEO esboçadas |

---

*Documento de modelagem conceitual — 01_modelagem_conceitual/*  
*Atlas Social de Hortolândia — uso interno*
