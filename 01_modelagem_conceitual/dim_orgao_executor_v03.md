# DIM_ORGAO_EXECUTOR
**Versão:** v03  
**Data:** 2026-03-13  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 01_modelagem_conceitual

> Este documento consolida `dim_osc_v01.md`, `dim_gestores_municipais_v06.md` e
> `dim_unidades_de_atendimento_v01.md` numa dimensão única e consultável,
> referenciada por FK em `DIM_PROGRAMA` e em `FATO_ATENDIMENTO`.
>
> **Não contém:**
> - Classificação por IVS — em `02_modelagem_lógica/rel_programa_dimensao_ivs.md`
> - Pendências metodológicas de programas — em `00_governanca/notas_arquiteturais_programas_sociais.md`

---

## Nota Estrutural

O município de referência é exclusivamente **Hortolândia-SP (IBGE 3519071)**.
O código IBGE não é campo analítico — é constante estrutural do projeto.

---

## Estrutura da DIM_ORGAO_EXECUTOR

```
id_orgao_executor      PK — padrão: TIPO_NOME (ex: CRAS_AMANDA, OSC_ESPERANCAR)
nome_completo          nome oficial completo
sigla                  sigla operacional, se houver
tipo                   Equipamento SUAS | Equipamento Municipal | Secretaria |
                       Departamento | OSC Conveniada | Operador Externo |
                       Fundo | Conselho
secretaria_mae         secretaria à qual o órgão está subordinado
esfera                 Municipal | Estadual | Federal
endereco               endereço completo
telefone
email
coordenador            nome do responsável atual
nucleo_referencia      id_nucleo do Atlas Social — liga o equipamento à sua
                       área de abrangência territorial (ex: NUCLEO_ROSOLEM)
                       Nulo para secretarias, departamentos e operadores externos
ativo                  S | N
observacoes
```

**Nota sobre `nucleo_referencia`:**
Campo introduzido na v02. Cada CRAS é a sede de um núcleo territorial.
Equipamentos vinculados a um CRAS (ex: CCS Rosolém → CRAS Rosolém)
recebem o mesmo `nucleo_referencia`. Secretarias e operadores externos
recebem NULL — sua atuação é municipal, não territorial.

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

| id_orgao_executor | nome_completo | tipo | secretaria_mae | esfera | endereço | telefone | email | coordenador | nucleo_referencia | ativo |
|---|---|---|---|---|---|---|---|---|---|---|
| CRAS_SANTA_CLARA | CRAS Jardim Santa Clara | Equipamento SUAS | SMIDS | Municipal | Rua Estados Unidos, 217, Jd. Santa Clara do Lago II | 3865-1133 / 3897-2519 | — | A confirmar | NUCLEO_SANTA_CLARA | S |
| CRAS_AMANDA | CRAS Jardim Amanda | Equipamento SUAS | SMIDS | Municipal | Av. Tarsila do Amaral, 540, Jd. Amanda II | 3819-7619 / 3865-7276 | — | A confirmar | NUCLEO_AMANDA | S |
| CRAS_NOVO_ANGULO | CRAS Jardim Novo Ângulo | Equipamento SUAS | SMIDS | Municipal | Rua Francisco Bereta, 330, Jd. Novo Ângulo | 3809-1945 / 3845-7629 | — | A confirmar | NUCLEO_NOVO_ANGULO | S |
| CRAS_ROSOLEM | CRAS Rosolém — Joel Alves Assunção | Equipamento SUAS | SMIDS | Municipal | Rua Guido Rosolém, 177, Jardim Rosolém | 3809-3164 | — | Joel Alves Assunção | NUCLEO_ROSOLEM | S |
| CRAS_PRIMAVERA | CRAS Primavera — Chico Vigilante | Equipamento SUAS | SMIDS | Municipal | Rua Amoreira, 35, Jd. Primavera | 3865-1225 / 3819-6899 | — | A confirmar | NUCLEO_PRIMAVERA | S |
| CRAS_BRASIL | CRAS Jardim Brasil — Maria Humilde Antunes (Zuma) | Equipamento SUAS | SMIDS | Municipal | Rua da Amizade, 240, Jardim Brasil | 3909-1398 | — | A confirmar | NUCLEO_BRASIL | S |
| CRAS_VILA_REAL | CRAS Vila Real | Equipamento SUAS | SMIDS | Municipal | Rua Ernesto Bergamasco, 185, Vila Real | 3865-4269 | — | A confirmar | NUCLEO_VILA_REAL | S |
| CREAS_01 | CREAS — Remanso Campineiro | Equipamento SUAS | SMIDS | Municipal | Rua Francisco Castilho, 298, Remanso Campineiro | (19) 3909-4546 | — | A confirmar | NULL | S |
| CENTROPOP_01 | Centro POP — Remanso Campineiro | Equipamento SUAS | SMIDS | Municipal | Rua Maria Bernardes, 505, Remanso Campineiro | (19) 9 9976-1742 | centropop.smids@hortolandia.sp.gov.br | A confirmar | NULL | S |

---

## Bloco 2 — Equipamentos Municipais de Apoio

| id_orgao_executor | nome_completo | tipo | secretaria_mae | esfera | endereço | telefone | email | coordenador | nucleo_referencia | ativo |
|---|---|---|---|---|---|---|---|---|---|---|
| CRAM_01 | CRAM "Débora Regina Leme dos Santos" | Equipamento Municipal | Dep. de Políticas Públicas para a Mulher | Municipal | Rua Alberto Gomes, 18, Jardim das Paineiras | A confirmar | — | A confirmar | NULL | S |
| CQP_I | CQP I — Centro de Qualificação Pessoal e Profissional | Equipamento Municipal | SMIDS | Municipal | Rua Estados Unidos, 271, Jd. Santa Clara do Lago II | A confirmar | — | A confirmar | NUCLEO_SANTA_CLARA | S |
| CQP_II | CQP II — Centro de Qualificação — Costura e Moda | Equipamento Municipal | SMIDS | Municipal | Rua Eleusina Batista Silva, 14, Jd. Terras de Santo Antônio | A confirmar | — | A confirmar | NULL | S |
| CESP | CESP — Centro de Empreendimentos Solidários e Popular | Equipamento Municipal | SMIDS | Municipal | Rua Zacarias Costa Camargo, 50, Remanso Campineiro | A confirmar | — | A confirmar | NULL | S |
| PAT_01 | Posto de Atendimento ao Trabalhador | Equipamento Municipal | Sec. Desenvolvimento Econômico | Municipal | A confirmar | (19) 3965-1400 r. 8904/8925 | pat@hortolandia.sp.gov.br | A confirmar | NULL | S |

---

## Bloco 3 — Secretarias Municipais

| id_orgao_executor | nome_completo | tipo | secretaria_mae | esfera | coordenador | nucleo_referencia | ativo |
|---|---|---|---|---|---|---|---|
| SEC_INCLUSAO | Secretaria Municipal de Inclusão e Desenvolvimento Social (SMIDS) | Secretaria | Prefeitura Municipal | Municipal | A confirmar | NULL | S |
| SEC_EDUCACAO | Secretaria de Educação, Ciência e Tecnologia | Secretaria | Prefeitura Municipal | Municipal | A confirmar | NULL | S |
| SEC_HABITACAO | Secretaria de Habitação | Secretaria | Prefeitura Municipal | Municipal | A confirmar | NULL | S |
| SEC_SAUDE | Secretaria Municipal de Saúde | Secretaria | Prefeitura Municipal | Municipal | Renato Lopes Machado | NULL | S |
| SEC_DES_ECONOMICO | Secretaria de Desenvolvimento Econômico, Trabalho, Turismo e Inovação | Secretaria | Prefeitura Municipal | Municipal | Dimas Corrêa Pádua | NULL | S |

---

## Bloco 4 — Departamentos Municipais

| id_orgao_executor | nome_completo | tipo | secretaria_mae | esfera | coordenador | nucleo_referencia | ativo |
|---|---|---|---|---|---|---|---|
| DEP_DIPGR | Dep. de Inclusão Produtiva e Gestão de Relações Institucionais | Departamento | SMIDS | Municipal | A confirmar | NULL | S |
| DEP_SEG_ALIMENTAR | Departamento de Segurança Alimentar | Departamento | SEC_EDUCACAO | Municipal | A confirmar | NULL | S |
| DEP_PCD | Dep. de Políticas Públicas para a Pessoa com Deficiência | Departamento | Prefeitura Municipal | Municipal | Quézia Garcia | NULL | S |
| DEP_DIR_HUMANOS | Dep. de Direitos Humanos e Políticas Públicas | Departamento | Prefeitura Municipal | Municipal | A confirmar | NULL | S |
| DEP_EMPREEND | Dep. de Empreendedorismo e Microempresas | Departamento | SEC_DES_ECONOMICO | Municipal | A confirmar | NULL | S |
| DEP_CULTURA | Departamento de Cidadania Cultural | Departamento | Prefeitura Municipal | Municipal | A confirmar | NULL | S |
| DEP_MULHERES | Dep. de Políticas Públicas para a Mulher | Departamento | Prefeitura Municipal | Municipal | A confirmar | NULL | S |

---

## Bloco 5 — Fundos

| id_orgao_executor | nome_completo | tipo | secretaria_mae | esfera | coordenador | nucleo_referencia | ativo |
|---|---|---|---|---|---|---|---|
| FUNDO_SOCIAL | Fundo Social de Solidariedade de Hortolândia | Fundo | Prefeitura Municipal (Primeira-Dama) | Municipal | A confirmar | NULL | S |

---

## Bloco 6 — OSCs Conveniadas (Identificadas)

| id_orgao_executor | nome_completo | tipo | esfera | foco | nucleo_referencia | convênio ativo | observações |
|---|---|---|---|---|---|---|---|
| OSC_ESPERANCAR | Instituto Esperançar | OSC Conveniada | Municipal | Abrigo institucional — pop. em situação de rua (adultos 24–59 anos) | NULL | S | Executor do Abrigo Institucional para Adultos e Famílias em Situação de Rua |
| OSC_AMAAH | AMAAH | OSC Conveniada | Municipal | Autismo | NULL | A confirmar | Parceira dos CRAS |
| OSC_APAE | APAE Hortolândia | OSC Conveniada | Municipal | Deficiência intelectual | NULL | A confirmar | Parceira dos CRAS |
| OSC_CADEFI | CADEFI / CENDEFI | OSC Conveniada | Municipal | Deficiência | NULL | A confirmar | Parceira dos CRAS |
| OSC_AHDV | AHDV | OSC Conveniada | Municipal | Deficiência visual | NULL | A confirmar | Parceira dos CRAS |
| OSC_PERNAS_VOL | Instituto Pernas Voluntárias | OSC Conveniada | Municipal | PCD | NULL | A confirmar | Parceira dos CRAS |
| OSC_TODOS_AUTISMO | Todos Pelo Autismo | OSC Conveniada | Municipal | Autismo | NULL | A confirmar | Parceira dos CRAS |
| OSC_LUTA_VIDA | Luta pela Vida Hortolândia | OSC Conveniada | Municipal | PCD / esporte | NULL | A confirmar | Parceira dos CRAS |
| OSC_PATRULHEIROS | Assoc. Patrulheiros e Guarda Mirim | OSC Conveniada | Municipal | Juventude | NULL | A confirmar | Parceira dos CRAS |
| OSC_A_CONFIRMAR | OSC executora Alta Complexidade — a identificar | OSC Conveniada | Municipal | SAICA / Abrigo Mulheres / Residência Inclusiva / ILPI / República | NULL | A confirmar | ⚠️ Pendência #19 |

> ⚠️ 12 OSCs parceiras dos CRAS ainda sem `id_orgao_executor` individual — Pendência #12.

---

## Bloco 7 — Operadores Externos (Estaduais e Federais)

| id_orgao_executor | nome_completo | tipo | esfera | contato | nucleo_referencia | observações |
|---|---|---|---|---|---|---|
| EXT_DESENVOLVE_SP | Desenvolve SP | Operador Externo | Estadual | bancodopovo@hortolandia.sp.gov.br / (19) 9 9919-5984 | NULL | Executor do Banco do Povo em Hortolândia |
| EXT_SEBRAE_SP | SEBRAE-SP | Operador Externo | Estadual | A confirmar | NULL | Executor do SEBRAE Aqui |
| EXT_CENTRO_PAULA_SOUZA | Centro Paula Souza — Governo do Estado de SP | Operador Externo | Estadual | A confirmar | NULL | Gestor das Fatecs e Etecs estaduais — estudo de viabilidade Fatec Hortolândia |
| EXT_SEC_DIREITOS_PCD_SP | Secretaria Estadual de Direitos da Pessoa com Deficiência | Operador Externo | Estadual | A confirmar | NULL | Parceira no PEI — Termo de Cooperação Técnica, fev/2026 |

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
|---|---|---|
| P01 | Levantar coordenadores atuais de todos os 7 CRAS | Alta |
| P02 | Confirmar endereço e telefone do CRAM_01 | Média |
| P03 | Confirmar endereço e telefone do CQP_I e CQP_II | Média |
| P04 | Confirmar endereço e telefone do CESP | Média |
| P05 | Confirmar endereço e contato do PAT_01 | Média |
| P06 | Catalogar 12 OSCs parceiras dos CRAS individualmente | Média |
| P07 | Identificar OSCs executoras das 5 modalidades de Alta Complexidade (Pendência #19) | Alta |
| P08 | Confirmar `id_orgao_executor` definitivo para o PEI (hoje DEP_PCD provisório) | Alta |
| P09 | Definir `nucleo_referencia` para CREAS_01, CENTROPOP_01, CESP e CQP_II | Média |

---

## Log de Alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | 2026-03-11 | Criação — consolida dim_osc, dim_gestores e dim_unidades; 7 blocos |
| v02 | 2026-03-11 | Campo `nucleo_referencia` adicionado à estrutura e a todos os blocos; campo `esfera` explicitado em todos os blocos; classificação por IVS e pendências metodológicas de programas removidas |
| v03 | 2026-03-13 | Correção crítica: código IBGE corrigido de 3519070 para 3519071 na Nota Estrutural |

---

*Documento de modelagem conceitual — 01_modelagem_conceitual/*  
*Atlas Social de Hortolândia — uso interno*
