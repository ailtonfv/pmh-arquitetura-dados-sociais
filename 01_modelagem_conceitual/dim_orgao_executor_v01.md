# DIM_ORGAO_EXECUTOR
**Versão:** v01
**Data:** 2026-03-11
**Responsável:** Ailton Vendramini
**Repositório:** Atlas-Social-de-Hortolândia / 01_modelagem_conceitual

> Este documento consolida três arquivos anteriores —
> `dim_osc_v01.md`, `dim_gestores_municipais_v06.md` e
> `dim_unidades_de_atendimento_v01.md` — numa dimensão única e
> consultável, referenciada por FK em `DIM_PROGRAMA` e em
> `FATO_ATENDIMENTO`.

---

## Nota Estrutural

O município de referência deste repositório é exclusivamente
**Hortolândia-SP (IBGE 3519070)**. Todos os órgãos executores
registrados aqui operam nesse território. O código IBGE não é campo
analítico — é constante estrutural do projeto, documentada aqui e
no README raiz.

---

## Estrutura da DIM_ORGAO_EXECUTOR

```
id_orgao_executor      PK — padrão: TIPO_NOME (ex: CRAS_AMANDA, OSC_ESPERANCAR)
nome_completo          nome oficial completo
sigla                  sigla operacional, se houver
tipo                   Equipamento SUAS | Secretaria | Departamento |
                       OSC Conveniada | Operador Externo | Fundo | Conselho
secretaria_mae         secretaria à qual o órgão está subordinado
endereco               endereço completo
telefone
email
coordenador            nome do responsável atual
dimensao_analitica     DIM_UNIDADES_ATENDIMENTO | DIM_GESTORES | DIM_OSC
                       (referência à dimensão de origem — legado)
ativo                  S | N
observacoes
```

**Convenção de `id_orgao_executor`:**

```
CRAS_{NOME}        → unidades CRAS
CREAS_{N}          → CREAS
CENTROPOP_{N}      → Centro POP
CRAM_{N}           → CRAM
CQP_{N}            → Centros de Qualificação
CESP               → Centro de Empreendimentos Solidários
PAT_{N}            → PAT
SEC_{SIGLA}        → secretarias municipais
DEP_{NOME}         → departamentos
FUNDO_{NOME}       → fundos municipais
OSC_{NOME}         → OSCs conveniadas
EXT_{NOME}         → operadores externos (SEBRAE, Desenvolve SP etc.)
```

---

## Bloco 1 — Equipamentos SUAS

| id_orgao_executor | nome_completo | tipo | secretaria_mae | endereço | telefone | email | coordenador | ativo |
|---|---|---|---|---|---|---|---|---|
| CRAS_SANTA_CLARA | CRAS Jardim Santa Clara | Equipamento SUAS | SMIDS | Rua Estados Unidos, 217, Jd. Santa Clara do Lago II | 3865-1133 / 3897-2519 | — | A confirmar | S |
| CRAS_AMANDA | CRAS Jardim Amanda | Equipamento SUAS | SMIDS | Av. Tarsila do Amaral, 540, Jd. Amanda II | 3819-7619 / 3865-7276 | — | A confirmar | S |
| CRAS_NOVO_ANGULO | CRAS Jardim Novo Ângulo | Equipamento SUAS | SMIDS | Rua Francisco Bereta, 330, Jd. Novo Ângulo | 3809-1945 / 3845-7629 | — | A confirmar | S |
| CRAS_ROSOLEM | CRAS Rosolém — Joel Alves Assunção | Equipamento SUAS | SMIDS | Rua Guido Rosolém, 177, Jardim Rosolém | 3809-3164 | — | Joel Alves Assunção | S |
| CRAS_PRIMAVERA | CRAS Primavera — Chico Vigilante | Equipamento SUAS | SMIDS | Rua Amoreira, 35, Jd. Primavera | 3865-1225 / 3819-6899 | — | A confirmar | S |
| CRAS_BRASIL | CRAS Jardim Brasil — Maria Humilde Antunes (Zuma) | Equipamento SUAS | SMIDS | Rua da Amizade, 240, Jardim Brasil | 3909-1398 | — | A confirmar | S |
| CRAS_VILA_REAL | CRAS Vila Real | Equipamento SUAS | SMIDS | Rua Ernesto Bergamasco, 185, Vila Real | 3865-4269 | — | A confirmar | S |
| CREAS_01 | CREAS — Remanso Campineiro | Equipamento SUAS | SMIDS | Rua Francisco Castilho, 298, Remanso Campineiro | (19) 3909-4546 | — | A confirmar | S |
| CENTROPOP_01 | Centro POP — Remanso Campineiro | Equipamento SUAS | SMIDS | Rua Maria Bernardes, 505, Remanso Campineiro | (19) 9 9976-1742 | centropop.smids@hortolandia.sp.gov.br | A confirmar | S |

---

## Bloco 2 — Equipamentos Municipais de Apoio

| id_orgao_executor | nome_completo | tipo | secretaria_mae | endereço | telefone | email | coordenador | ativo |
|---|---|---|---|---|---|---|---|---|
| CRAM_01 | CRAM "Débora Regina Leme dos Santos" | Equipamento Municipal | Dep. de Políticas Públicas para a Mulher | Rua Alberto Gomes, 18, Jardim das Paineiras | A confirmar | — | A confirmar | S |
| CQP_I | CQP I — Centro de Qualificação Pessoal e Profissional | Equipamento Municipal | SMIDS | Rua Estados Unidos, 271, Jd. Santa Clara do Lago II | A confirmar | — | A confirmar | S |
| CQP_II | CQP II — Centro de Qualificação — Costura e Moda | Equipamento Municipal | SMIDS | Rua Eleusina Batista Silva, 14, Jd. Terras de Santo Antônio | A confirmar | — | A confirmar | S |
| CESP | CESP — Centro de Empreendimentos Solidários e Popular | Equipamento Municipal | SMIDS | Rua Zacarias Costa Camargo, 50, Remanso Campineiro | A confirmar | — | A confirmar | S |
| PAT_01 | Posto de Atendimento ao Trabalhador | Equipamento Municipal | Sec. Desenvolvimento Econômico | A confirmar | (19) 3965-1400 r. 8904/8925 | pat@hortolandia.sp.gov.br | A confirmar | S |

---

## Bloco 3 — Secretarias Municipais

| id_orgao_executor | nome_completo | tipo | secretaria_mae | coordenador | ativo |
|---|---|---|---|---|---|
| SEC_INCLUSAO | Secretaria Municipal de Inclusão e Desenvolvimento Social (SMIDS) | Secretaria | Prefeitura Municipal | A confirmar | S |
| SEC_EDUCACAO | Secretaria de Educação, Ciência e Tecnologia | Secretaria | Prefeitura Municipal | A confirmar | S |
| SEC_HABITACAO | Secretaria de Habitação | Secretaria | Prefeitura Municipal | A confirmar | S |
| SEC_SAUDE | Secretaria Municipal de Saúde | Secretaria | Prefeitura Municipal | Renato Lopes Machado | S |
| SEC_DES_ECONOMICO | Secretaria de Desenvolvimento Econômico, Trabalho, Turismo e Inovação | Secretaria | Prefeitura Municipal | Dimas Corrêa Pádua | S |

---

## Bloco 4 — Departamentos Municipais

| id_orgao_executor | nome_completo | tipo | secretaria_mae | coordenador | ativo |
|---|---|---|---|---|---|
| DEP_DIPGR | Dep. de Inclusão Produtiva e Gestão de Relações Institucionais | Departamento | SMIDS | A confirmar | S |
| DEP_SEG_ALIMENTAR | Departamento de Segurança Alimentar | Departamento | SEC_EDUCACAO | A confirmar | S |
| DEP_PCD | Dep. de Políticas Públicas para a Pessoa com Deficiência | Departamento | Prefeitura Municipal | Quézia Garcia | S |
| DEP_DIR_HUMANOS | Dep. de Direitos Humanos e Políticas Públicas | Departamento | Prefeitura Municipal | A confirmar | S |
| DEP_EMPREEND | Dep. de Empreendedorismo e Microempresas | Departamento | SEC_DES_ECONOMICO | A confirmar | S |
| DEP_CULTURA | Departamento de Cidadania Cultural | Departamento | Prefeitura Municipal | A confirmar | S |
| DEP_MULHERES | Dep. de Políticas Públicas para a Mulher | Departamento | Prefeitura Municipal | A confirmar | S |

---

## Bloco 5 — Fundos e Órgãos Colegiados de Gestão

| id_orgao_executor | nome_completo | tipo | secretaria_mae | coordenador | ativo |
|---|---|---|---|---|---|
| FUNDO_SOCIAL | Fundo Social de Solidariedade de Hortolândia | Fundo | Prefeitura Municipal (Primeira-Dama) | A confirmar | S |

---

## Bloco 6 — OSCs Conveniadas (Identificadas)

| id_orgao_executor | nome_completo | tipo | foco | convênio ativo | observações |
|---|---|---|---|---|---|
| OSC_ESPERANCAR | Instituto Esperançar | OSC Conveniada | Abrigo institucional — população em situação de rua (adultos 24–59 anos) | S | Executor do Abrigo Institucional para Adultos e Famílias em Situação de Rua |
| OSC_AMAAH | AMAAH | OSC Conveniada | Autismo | A confirmar | Parceira dos CRAS |
| OSC_APAE | APAE Hortolândia | OSC Conveniada | Deficiência intelectual | A confirmar | Parceira dos CRAS |
| OSC_CADEFI | CADEFI / CENDEFI | OSC Conveniada | Deficiência | A confirmar | Parceira dos CRAS |
| OSC_AHDV | AHDV | OSC Conveniada | Deficiência visual | A confirmar | Parceira dos CRAS |
| OSC_PERNAS_VOL | Instituto Pernas Voluntárias | OSC Conveniada | PCD | A confirmar | Parceira dos CRAS |
| OSC_TODOS_AUTISMO | Todos Pelo Autismo | OSC Conveniada | Autismo | A confirmar | Parceira dos CRAS |
| OSC_LUTA_VIDA | Luta pela Vida Hortolândia | OSC Conveniada | PCD / esporte | A confirmar | Parceira dos CRAS |
| OSC_PATRULHEIROS | Assoc. Patrulheiros e Guarda Mirim | OSC Conveniada | Juventude | A confirmar | Parceira dos CRAS |
| OSC_A_CONFIRMAR | OSC executora Alta Complexidade — a identificar | OSC Conveniada | SAICA / Abrigo Mulheres / Residência Inclusiva / ILPI / República | A confirmar | ⚠️ Pendência #19 — identificar e cadastrar as OSCs executoras de cada modalidade de Alta Complexidade |

> ⚠️ 12 OSCs parceiras dos CRAS ainda sem `id_orgao_executor` individual — Pendência #12 de `NOTAS_ARQUITETURAIS_E_PENDENCIAS`.

---

## Bloco 7 — Operadores Externos (Estaduais e Federais)

| id_orgao_executor | nome_completo | tipo | esfera | contato | observações |
|---|---|---|---|---|---|
| EXT_DESENVOLVE_SP | Desenvolve SP | Operador Externo | Estadual | bancodopovo@hortolandia.sp.gov.br / (19) 9 9919-5984 | Executor do Banco do Povo em Hortolândia |
| EXT_SEBRAE_SP | SEBRAE-SP | Operador Externo | Estadual | A confirmar | Executor do SEBRAE Aqui |
| EXT_CENTRO_PAULA_SOUZA | Centro Paula Souza — Governo do Estado de SP | Operador Externo | Estadual | A confirmar | Gestor das Fatecs e Etecs estaduais — estudo de viabilidade para Fatec Hortolândia |
| EXT_SEC_DIREITOS_PCD_SP | Secretaria Estadual de Direitos da Pessoa com Deficiência | Operador Externo | Estadual | A confirmar | Parceira no PEI — Polo de Empregabilidade Inclusiva (Termo de Cooperação Técnica, fev/2026) |

---

## Dado de Contexto — Rede Municipal SUAS

| Indicador | Valor |
|-----------|-------|
| CRAS ativos | 7 |
| CREAS ativos | 1 |
| Centro POP ativo | 1 |
| CRAM ativo | 1 |
| Centros de Qualificação (CQP) | 2 |
| OSCs conveniadas identificadas | 9 (+ pendências) |
| OSCs parceiras CRAS não catalogadas individualmente | 12 (Pendência #12) |

---

## Pendências Abertas

| # | Pendência | Prioridade |
|---|-----------|------------|
| P01 | Levantar coordenadores atuais de todos os 7 CRAS | Alta |
| P02 | Confirmar endereço e telefone do CRAM_01 | Média |
| P03 | Confirmar endereço e telefone do CQP_I e CQP_II | Média |
| P04 | Identificar e catalogar as 12 OSCs parceiras dos CRAS (Pendência #12 do NOTAS) | Média |
| P05 | Identificar OSCs executoras das modalidades de Alta Complexidade (SAICA, Abrigo Mulheres, Residência Inclusiva, ILPI, República) — substituir `OSC_A_CONFIRMAR` (Pendência #19 do NOTAS) | Alta |
| P06 | Confirmar `id_orgao_executor` definitivo para o PEI (hoje `DEP_PCD` provisório) | Alta |
| P07 | Confirmar endereço e contato do CESP | Média |
| P08 | Confirmar endereço e contato do PAT | Média |

---

## Log de Alterações

| Versão | Data | Alterações |
|--------|------|-----------|
| v01 | 2026-03-11 | Criação — consolida `dim_osc_v01.md`, `dim_gestores_municipais_v06.md` e `dim_unidades_de_atendimento_v01.md`; 7 blocos estruturados; pendências mapeadas |

---

*Documento de modelagem conceitual — 01_modelagem_conceitual/*
*Atlas Social de Hortolândia — uso interno*

