# DIM_PROGRAMA — Catálogo de Programas Sociais
**Versão:** v02  
**Data:** 2026-03-11  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 02_modelagem_lógica  
**Origem:** Extraído e revisado de `dim_programas_sociais_v12.md`

> Este arquivo contém exclusivamente o **núcleo cadastral** de cada programa.
> Destina-se à modelagem relacional e à carga em banco de dados.
>
> **Não contém:**
> - Notas arquiteturais → `00_governanca/notas_arquiteturais_programas_sociais.md`
> - Relação programa × IVS → `02_modelagem_lógica/rel_programa_dimensao_ivs.md`
> - Órgãos executores → `01_modelagem_conceitual/dim_orgao_executor.md`

---

## Estrutura da DIM_PROGRAMA

```
id_programa              PK — sigla operacional
cod_programa             código numérico ou alfanumérico externo (SIBEC, SIGAS etc.)
nome_programa            nome completo
tipo_programa            A = Serviço Direto
                         B = Política / Instrumento
                         C = Equipamento
                         D = Programa de Inserção Produtiva
categoria                assistencia_social | emprego_renda | habitacao |
                         seguranca_alimentar | educacao | saude |
                         direitos_humanos | cultura | governanca
esfera                   Federal | Estadual | Municipal | Intersetorial
secretaria_responsavel   sigla da secretaria responsável
departamento_executor    departamento interno executor, se houver
id_orgao_executor        FK → dim_orgao_executor
publico_alvo             descrição do público
faixa_etaria             ex: '0-5' | '15-29' | '60+' | 'Todas'
vinculo_cadunico         S | N | Parcial | Indireto | A confirmar
nivel_protecao           Básica | Especial-Média | Especial-Alta |
                         Produtivo | Alimentar | Educacional | Intersetorial
acesso                   Presencial | Digital | Espontâneo | Encaminhamento | Misto
prazo_execucao           Imediato | Continuado | Temporário | A confirmar
contato                  telefone / e-mail / endereço de acesso direto
dimensao_ivs             infraestrutura_urbana | capital_humano |
                         renda_trabalho | multidimensional | governanca
base_legal_principal     LOAS | CNAS 109/2009 | PBF | CadÚnico |
                         ECA | Municipal | Estadual | Outro
base_legal_municipal     lei ou decreto municipal específico
status_programa          ativo | suspenso | planejamento |
                         estudo_viabilidade | encerrado
data_inicio              ISO 8601 — YYYY-MM-DD ou YYYY-MM-00 se dia desconhecido
observacoes              nota curta — detalhes em notas_arquiteturais
```

---

## Grupo 1 — Proteção Social Básica

| id_programa | cod_programa | nome_programa | tipo | categoria | esfera | secretaria_responsavel | departamento_executor | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | contato | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| PAIF | — | Serviço de Proteção e Atendimento Integral às Famílias | A | assistencia_social | Federal | SMIDS | — | CRAS_* (7) | Famílias em vulnerabilidade | Todas | S | Básica | Espontâneo / Encaminhamento | Continuado | Ver tabela CRAS | multidimensional | CNAS 109/2009 | Lei 3.911/2021 | ativo | — | Serviço central dos CRAS; caráter preventivo |
| SCFV | — | Serviço de Convivência e Fortalecimento de Vínculos | A | assistencia_social | Federal | SMIDS | — | CRAS_* (7) | Crianças, adolescentes, adultos e idosos em vulnerabilidade | 0-17 / 60+ | S | Básica | Encaminhamento | Continuado | Ver tabela CRAS | capital_humano | CNAS 109/2009 | Lei 3.911/2021 | ativo | — | — |
| CCS | — | Centro de Convivência Social — Jd. Rosolém | A | assistencia_social | Municipal | SMIDS | — | CRAS_ROSOLEM | Comunidade da área de abrangência | Todas | Parcial | Básica | Espontâneo | Continuado | (19) 3809-3164 | capital_humano | Municipal | A confirmar | ativo | — | ⚠️ Verificar se permanece equipamento distinto do CRAS Rosolém |

---

## Grupo 2 — Proteção Social Especial — Média Complexidade

| id_programa | cod_programa | nome_programa | tipo | categoria | esfera | secretaria_responsavel | departamento_executor | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | contato | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| PAEFI | — | Serviço de Proteção e Atendimento Especializado a Famílias e Indivíduos | A | assistencia_social | Federal | SMIDS | — | CREAS_01 | Famílias com violação de direitos | Todas | S | Especial-Média | Encaminhamento | Continuado | (19) 3909-4546 | multidimensional | CNAS 109/2009 | Lei 3.911/2021 | ativo | — | — |
| CENTROPOP | — | Centro de Referência Especializado para População em Situação de Rua | C | assistencia_social | Federal | SMIDS | — | CENTROPOP_01 | Adultos, adolescentes e famílias em situação de rua | 18+ | Parcial | Especial-Média | Espontâneo | Imediato | (19) 9 9976-1742 / centropop.smids@hortolandia.sp.gov.br | multidimensional | LOAS + CNAS 109/2009 | Lei 3.911/2021 | ativo | — | ⚠️ Sem documentação — ponto cego no CadÚnico |
| ABORDAGEM_SOCIAL | — | Serviço Especializado em Abordagem Social | A | assistencia_social | Federal | SMIDS | — | CENTROPOP_01 | População em situação de rua | Todas | S | Especial-Média | Espontâneo | Imediato | — | multidimensional | CNAS 109/2009 | Lei 3.911/2021 | ativo | — | — |
| MSE_LA_PSC | — | Serviço de Proteção Social a Adolescentes em Cumprimento de Medida Socioeducativa | A | assistencia_social | Federal | SMIDS | — | CREAS_01 | Adolescentes em LA ou PSC | 12-18 | S | Especial-Média | Encaminhamento | Continuado | (19) 3909-4546 | capital_humano | ECA + CNAS 109/2009 | A confirmar | ativo | — | — |
| APOIO_RISCO | — | Serviço de Apoio a Famílias e Pessoas em Situação de Risco | A | assistencia_social | Intersetorial | SMIDS | — | SEC_INCLUSAO | Famílias e pessoas em situação de risco | Todas | S | Especial-Média | Encaminhamento | Continuado | — | multidimensional | LOAS | Lei 3.911/2021 | ativo | — | — |
| EMERGENCIAS | — | Serviços de Emergência do Município | A | assistencia_social | Municipal | SMIDS | — | SEC_INCLUSAO | Famílias desabrigadas por eventos climáticos | Todas | S | Especial-Média | Espontâneo | Imediato | — | multidimensional | Municipal | Decreto 5.598/2025 | ativo | — | Ref: chuvas 26/02/2026 — 16 famílias |

---

## Grupo 3 — Proteção Social Especial — Alta Complexidade

| id_programa | cod_programa | nome_programa | tipo | categoria | esfera | secretaria_responsavel | departamento_executor | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | contato | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| SAICA | — | Serviço de Acolhimento Institucional para Crianças e Adolescentes | A | assistencia_social | Intersetorial | SMIDS | — | OSC_A_CONFIRMAR | Crianças e adolescentes com direitos violados | 0-18 | S | Especial-Alta | Encaminhamento | Continuado | A confirmar | capital_humano | ECA + CNAS 109/2009 | A confirmar | ativo | — | ⚠️ Pendência #19 |
| ABRIGO_ADULTOS | — | Abrigo Institucional para Adultos e Famílias em Situação de Rua | A | assistencia_social | Intersetorial | SMIDS | — | OSC_ESPERANCAR | Adultos em situação de rua | 24-59 | S | Especial-Alta | Encaminhamento (via Centro POP) | Continuado | A confirmar | infraestrutura_urbana | LOAS + CNAS 109/2009 | A confirmar | ativo | — | — |
| ABRIGO_MULHERES | — | Abrigo Institucional para Mulheres em Situação de Violência | A | assistencia_social | Intersetorial | SMIDS | DEP_MULHERES | OSC_A_CONFIRMAR | Mulheres em violência doméstica ou sexual | 18+ | S | Especial-Alta | Encaminhamento (sem B.O.) | Continuado | A confirmar | multidimensional | Lei 11.340/2006 + CNAS | A confirmar | ativo | — | ⚠️ Pendência #19 |
| RESIDENCIA_INCLUSIVA | — | Residência Inclusiva para Jovens e Adultos com Deficiência | A | assistencia_social | Intersetorial | SMIDS | — | OSC_A_CONFIRMAR | Jovens e adultos com deficiência | 18+ | S | Especial-Alta | Encaminhamento | Continuado | A confirmar | capital_humano | LOAS + CNAS + Lei 13.146/2015 | A confirmar | ativo | — | ⚠️ Pendência #19 |
| ILPI | — | Casa-Lar e ILPI — Acolhimento para Idosos | A | assistencia_social | Intersetorial | SMIDS | DEP_DIR_HUMANOS | OSC_A_CONFIRMAR | Idosos sem suporte familiar | 60+ | S | Especial-Alta | Encaminhamento | Continuado | A confirmar | capital_humano | LOAS + CNAS + Lei 10.741/2003 | A confirmar | ativo | — | ⚠️ Pendência #19 |
| REPUBLICA | — | República — Acolhimento para Jovens e Adultos em Saída da Rua | A | assistencia_social | Intersetorial | SMIDS | — | OSC_A_CONFIRMAR | Jovens e adultos em saída da situação de rua | 18-35 | S | Especial-Alta | Encaminhamento | Continuado | A confirmar | renda_trabalho | LOAS + CNAS 109/2009 | A confirmar | ativo | — | Modelo de autogestão — ⚠️ Pendência #19 |
| APADRINHAMENTO | — | Programa de Apadrinhamento para Crianças e Adolescentes em Acolhimento | A | assistencia_social | Intersetorial | SMIDS | — | SEC_INCLUSAO | Crianças e adolescentes em acolhimento | 0-18 | S | Especial-Alta | Encaminhamento | Continuado | A confirmar | capital_humano | ECA | A confirmar | ativo | — | Vinculado ao CMDCA |
| TRAB_INFANTIL | — | Programa de Enfrentamento ao Trabalho Infantil | A | assistencia_social | Intersetorial | SMIDS | — | CREAS_01 | Crianças e adolescentes em trabalho infantil | 10-16 | S | Especial-Alta | Encaminhamento | Continuado | (19) 3909-4546 | capital_humano | ECA | A confirmar | ativo | — | Interface Conselho Tutelar |
| ATEND_DOMICILIAR | — | Serviço de Atendimento Domiciliar para PCD e Idosos | A | assistencia_social | Municipal | SMIDS | — | SEC_INCLUSAO | PCD e idosos em domicílio | 60+ / Todas (PCD) | A confirmar | Especial-Alta | Encaminhamento | Continuado | A confirmar | capital_humano | Municipal | A confirmar | ativo | — | — |
| PROTECAO_PCD_IDOSO | — | Serviço de Proteção Social Especial para PCD, Idosos e suas Famílias | A | assistencia_social | Intersetorial | SMIDS | — | CREAS_01 | PCD, idosos e famílias | 60+ / Todas (PCD) | A confirmar | Especial-Alta | Encaminhamento | Continuado | (19) 3909-4546 | capital_humano | LOAS + CNAS 109/2009 | Lei 3.911/2021 | ativo | — | — |

---

## Grupo 4 — Programas Municipais Específicos (Inclusão)

| id_programa | cod_programa | nome_programa | tipo | categoria | esfera | secretaria_responsavel | departamento_executor | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | contato | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| FUNDO_EMERG | — | Fundo Social — Atendimento Emergencial | A | assistencia_social | Municipal | Fundo Social | — | FUNDO_SOCIAL | Famílias em vulnerabilidade emergencial | Todas | S | Básica/Alimentar | Encaminhamento | Imediato | A confirmar | renda_trabalho | Municipal | Decreto 5.598/2025 | ativo | — | — |
| ACERTE | — | Ação Cidadã de Requalificação, Trabalho e Educação | D | emprego_renda | Municipal | Gov. (Dep. Rel. Inst.) | DEP_DIPGR | DEP_DIPGR | Pessoas em vulnerabilidade, egressos, pop. rua | 18+ | S | Produtivo | Presencial | Temporário | A confirmar | renda_trabalho | Municipal | A confirmar | ativo | — | Bolsa R$ 710 + cesta. Modalidades: Costura, Serviços Gerais |
| CUIDAR | — | Programa Cuidar | A | saude | Municipal | Fundo Social | — | FUNDO_SOCIAL | Gestantes a partir da 34ª semana — pré-natal rede municipal | — | Parcial | Básica/Intersetorial | Encaminhamento | Temporário | A confirmar | capital_humano | Municipal | Lei 3.955/2022 | ativo | 2022-10-00 | — |
| CAPACITA | — | Projeto Capacita | D | emprego_renda | Municipal | SMIDS | — | CQP_I | Pessoas em vulnerabilidade — qualificação | 16+ | S | Produtivo | Presencial | Temporário | A confirmar | renda_trabalho | Municipal | A confirmar | ativo | — | ⚠️ Verificar distinção vs Capacita Hortolândia (Fundo Social) |
| COSTURA_IND | — | Projeto Costura Industrial | D | emprego_renda | Municipal | SMIDS | — | CQP_II | Pessoas em vulnerabilidade — setor têxtil | 18+ | S | Produtivo | Presencial | Temporário | A confirmar | renda_trabalho | Municipal | A confirmar | ativo | — | Modalidade ACERTE. Benefício: R$ 710 + cesta |
| FARMACIA_SOL | — | Farmácia Solidária | A | saude | Municipal | SMIDS | — | SEC_INCLUSAO | Pessoas em vulnerabilidade socioeconômica | Todas | A confirmar | Básica/Saúde | Presencial | Continuado | A confirmar | capital_humano | Municipal | A confirmar | ativo | — | ⚠️ Detalhar critério de acesso |
| FEIRAS_EMPREEND | — | Feiras de Empreendedores | A | emprego_renda | Municipal | SMIDS | — | CESP | Empreendedores em vulnerabilidade | Todas | Indireto | Produtivo | Espontâneo | Continuado | A confirmar | renda_trabalho | Municipal | A confirmar | ativo | — | — |
| RESSIGNIFICA | — | Programa Ressignifica Hortolândia | A | assistencia_social | Municipal | SMIDS | — | CENTROPOP_01 | Moradores em situação de rua | 18+ | S | Especial-Alta/Intersetorial | Encaminhamento | Continuado | A confirmar | multidimensional | Municipal + Decreto 7.053/2009 | A confirmar | ativo | 2023-12-00 | Bolsa R$ 700 + cesta + auxílio aluguel |
| BOLSA_CRECHE | — | Bolsa Creche | A | educacao | Municipal | Educação | — | SEC_EDUCACAO | Crianças sem vaga na rede pública | 6 meses–3a6m | S | Básica | Encaminhamento | Continuado | A confirmar | capital_humano | Municipal | A confirmar | ativo | — | — |
| INSCRICAO_CMAS | — | Inscrição de OSCs no CMAS | B | governanca | Municipal | SMIDS | — | SEC_INCLUSAO | Organizações da Sociedade Civil | — | N | — | Presencial | — | A confirmar | governanca | LOAS | Lei 3.911/2021 | ativo | — | — |
| INSCRICAO_CMDCA | — | Inscrição de OSCs no CMDCA | B | governanca | Municipal | SMIDS | — | SEC_INCLUSAO | OSCs voltadas à criança e adolescente | — | N | — | Presencial | — | A confirmar | governanca | ECA | A confirmar | ativo | — | — |

---

## Grupo 5 — Segurança Alimentar

| id_programa | cod_programa | nome_programa | tipo | categoria | esfera | secretaria_responsavel | departamento_executor | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | contato | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| BAH | — | Banco de Alimentos de Hortolândia | A | seguranca_alimentar | Municipal | Educação | DEP_SEG_ALIMENTAR | DEP_SEG_ALIMENTAR | Pop. em insegurança via 19 OSCs parceiras | Todas | Indireto | Alimentar | Encaminhamento | Continuado | A confirmar | renda_trabalho | Municipal | A confirmar | ativo | 2007-00-00 | 19 org / 1.762 pessoas (2024) |
| PAA | — | Programa de Aquisição de Alimentos | A | seguranca_alimentar | Federal | Educação | DEP_SEG_ALIMENTAR | DEP_SEG_ALIMENTAR | Agricultores familiares + beneficiários BAH | Todas | Indireto | Alimentar | Encaminhamento | Continuado | A confirmar | renda_trabalho | Lei 10.696/2003 | A confirmar | ativo | — | — |
| CESTAS | — | Distribuição de Cestas Básicas | A | seguranca_alimentar | Municipal | SMIDS / Fundo Social | — | FUNDO_SOCIAL | Famílias em vulnerabilidade | Todas | S | Alimentar | Encaminhamento | Imediato | A confirmar | renda_trabalho | Municipal | Decreto 5.598/2025 | ativo | — | — |
| CREAN | — | Centro de Referência em Educação Alimentar e Nutricional | A | seguranca_alimentar | Municipal | Educação | DEP_SEG_ALIMENTAR | DEP_SEG_ALIMENTAR | Comunidade | Todas | — | Alimentar | Presencial | Continuado | A confirmar | capital_humano | Municipal | A confirmar | planejamento | 2023-04-00 | Previsto para Jd. Terras de Santa Maria |
| COZINHA_COM | — | Cozinha Comunitária | A | seguranca_alimentar | Municipal | Educação | DEP_SEG_ALIMENTAR | DEP_SEG_ALIMENTAR | Comunidade | Todas | — | Alimentar | Espontâneo | Continuado | A confirmar | renda_trabalho | Municipal | A confirmar | ativo | — | ⚠️ Verificar distinção vs Escola Comunitária Jd. Novo Ângulo |

---

## Grupo 6 — Habitação

| id_programa | cod_programa | nome_programa | tipo | categoria | esfera | secretaria_responsavel | departamento_executor | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | contato | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| AGORA_CASA | — | Agora a Casa é Sua | A | habitacao | Municipal | Habitação | — | SEC_HABITACAO | Famílias em situação irregular | Todas | Indireto | — | Encaminhamento | Temporário | A confirmar | infraestrutura_urbana | Municipal | A confirmar | ativo | — | ~3.000 títulos 2021–2024 |
| VIDA_LONGA | — | Programa Vida Longa (Estadual) | A | habitacao | Estadual | Habitação | — | SEC_HABITACAO | Idosos ≥ 60 anos residentes ≥ 2 anos | 60+ | S | — | Encaminhamento | A confirmar | A confirmar | infraestrutura_urbana | Estadual | A confirmar | planejamento | — | 28 unidades — NEGOCIAÇÃO ATIVA |
| MCMV | — | Minha Casa, Minha Vida — Hortolândia | A | habitacao | Federal | Habitação | — | SEC_HABITACAO | Famílias em vulnerabilidade | Todas | S | — | Encaminhamento | Temporário | A confirmar | infraestrutura_urbana | PBF / CadÚnico | Lei 14.620/2023 | ativo | 2026-00-00 | 400 unidades — Jd. Amanda |
| PHLIS | — | Plano Municipal de Habitação de Interesse Social | B | habitacao | Municipal | Habitação | — | SEC_HABITACAO | Município | Todas | — | — | — | Continuado | A confirmar | infraestrutura_urbana | Municipal | A confirmar | ativo | — | Instrumento de planejamento |

---

## Grupo 7 — Inserção Produtiva e Qualificação

| id_programa | cod_programa | nome_programa | tipo | categoria | esfera | secretaria_responsavel | departamento_executor | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | contato | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| PAT | — | Posto de Atendimento ao Trabalhador | C | emprego_renda | Estadual/Municipal | Sec. Des. Econômico | — | PAT_01 | Desempregados em geral, PCD | 18+ | Indireto | Produtivo | Presencial | Continuado | pat@hortolandia.sp.gov.br / (19) 3965-1400 r.8904/8925 | renda_trabalho | Lei 7.998/1990 | A confirmar | ativo | — | Cruzamento CadÚnico × mercado formal |
| PAT_VAGAS | — | Cadastro de Vagas por Empresa — PAT | A | emprego_renda | Estadual/Municipal | Sec. Des. Econômico | — | PAT_01 | Empresas (oferta) + trabalhadores (demanda) | 18+ | Indireto | Produtivo | Presencial | Continuado | pat@hortolandia.sp.gov.br | renda_trabalho | Lei 7.998/1990 | A confirmar | ativo | — | — |
| SINE | — | Cadastro no SINE e Encaminhamento para Vagas | A | emprego_renda | Federal | Sec. Des. Econômico | — | PAT_01 | Trabalhadores desempregados | 18+ | Indireto | Produtivo | Presencial | Continuado | pat@hortolandia.sp.gov.br | renda_trabalho | Lei 7.998/1990 | A confirmar | ativo | 2026-02-00 | Adesão formal Hortolândia: fev/2026 |
| PEI | — | Polo de Empregabilidade Inclusiva | D | emprego_renda | Estadual/Municipal | SMIDS | DEP_PCD (provisório) | DEP_PCD | PCD em busca de inserção no mercado | 18+ | A confirmar | Produtivo | Presencial | Continuado | Paço Municipal | renda_trabalho | Estadual + Municipal (Termo Cooperação) | A confirmar | ativo | 2026-02-00 | ⚠️ Pendência #23 |
| BANCO_POVO | — | Banco do Povo | A | emprego_renda | Estadual | Sec. Des. Econômico | — | EXT_DESENVOLVE_SP | MEI, ME, EPP, LTDA, EIRELI | 18+ | A confirmar | Produtivo | Presencial | — | bancodopovo@hortolandia.sp.gov.br / (19) 9 9919-5984 | renda_trabalho | Lei 9.533/1997 | A confirmar | ativo | — | Executor: Desenvolve SP |
| ORIENT_MEI | — | Orientação ao MEI | A | emprego_renda | Municipal | Sec. Des. Econômico | DEP_EMPREEND | DEP_EMPREEND | MEIs | 18+ | Indireto | Produtivo | Presencial | Continuado | A confirmar | renda_trabalho | LC 128/2008 | A confirmar | ativo | — | — |
| SEBRAE_AQUI | — | SEBRAE Aqui | A | emprego_renda | Estadual | Sec. Des. Econômico | — | EXT_SEBRAE_SP | Empreendedores | 18+ | Indireto | Produtivo | Presencial | Continuado | A confirmar | renda_trabalho | Outro | A confirmar | ativo | — | — |
| SEG_DESEMPREGO | — | Seguro Desemprego | A | emprego_renda | Federal | Sec. Des. Econômico | — | PAT_01 | Trabalhador formal dispensado sem justa causa | 18+ | Indireto | Produtivo | Presencial | Temporário | pat@hortolandia.sp.gov.br | renda_trabalho | Lei 7.998/1990 | A confirmar | ativo | — | Esgotamento → entrada previsível no CadÚnico |
| FEIRAS_LIVRES | — | Feiras Livres e Noturnas | A | emprego_renda | Municipal | Sec. Des. Econômico | — | SEC_DES_ECONOMICO | Feirantes + população geral | Todas | Indireto | Produtivo | Espontâneo | Continuado | A confirmar | renda_trabalho | Municipal | A confirmar | ativo | — | 7 territórios; 5 coincidem com áreas de CRAS |
| FUNDO_CURSOS | — | Fundo Social — Cursos Profissionalizantes | D | emprego_renda | Municipal | Fundo Social | — | FUNDO_SOCIAL | Pessoas 16+ em vulnerabilidade | 16+ | Indireto | Produtivo | Presencial | Temporário | A confirmar | renda_trabalho | Municipal | A confirmar | ativo | — | SENAI (alvenaria + assist. RH) jan/2026 |
| MEU_EMPREGO | — | Programa Meu Emprego — Trabalho em Equipe | D | emprego_renda | Estadual/Municipal | SMIDS | DEP_DIPGR | DEP_DIPGR | Jovens 16–20 + desempregados +3 meses | 16-35 | Indireto | Produtivo | Presencial | Continuado | A confirmar | renda_trabalho | Outro | A confirmar | ativo | — | — |
| DECOLA | — | DECOLA | D | emprego_renda | Municipal | SMIDS | DEP_DIPGR | DEP_DIPGR | A confirmar — empregabilidade | 18+ | A confirmar | Produtivo | Presencial | Continuado | A confirmar | renda_trabalho | Municipal | A confirmar | ativo | — | ⚠️ Pendência #20 |
| APRENDIZ_SOCIAL | — | Aprendiz Social | D | emprego_renda | Municipal | SMIDS | DEP_DIPGR | DEP_DIPGR | Jovens — formação para o mercado | 16-24 | A confirmar | Produtivo | Presencial | Continuado | A confirmar | renda_trabalho | Municipal | A confirmar | ativo | — | ⚠️ Pendência #20 |
| FATEC | — | Fatec Hortolândia | B | educacao | Estadual | Sec. Des. Econômico | — | EXT_CENTRO_PAULA_SOUZA | Jovens e adultos — ensino superior tecnológico | 18+ | Indireto | Educacional | Presencial | Continuado | A confirmar | renda_trabalho | Estadual | A confirmar | estudo_viabilidade | — | ⚠️ Pendências #17 e #22 |

---

## Grupo 8 — Públicos Específicos / Direitos Humanos

| id_programa | cod_programa | nome_programa | tipo | categoria | esfera | secretaria_responsavel | departamento_executor | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | contato | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| POL_PCD | — | Cadastro e Políticas para PCD | B | direitos_humanos | Municipal | Gov. (DPCD) | DEP_PCD | DEP_PCD | Pessoas com deficiência | Todas | Indireto | — | Presencial | Continuado | A confirmar | capital_humano | Lei 13.146/2015 | A confirmar | ativo | — | — |
| POL_IDOSO | — | Políticas para Pessoa Idosa | B | direitos_humanos | Municipal | Gov. (Dep. Dir. Humanos) | DEP_DIR_HUMANOS | DEP_DIR_HUMANOS | Idosos em vulnerabilidade | 60+ | Indireto | — | — | Continuado | A confirmar | capital_humano | Lei 10.741/2003 | A confirmar | ativo | — | — |
| CCMI | — | Centro de Convivência da Melhor Idade | A | direitos_humanos | Municipal | Gov. (Dep. Dir. Humanos) | DEP_DIR_HUMANOS | DEP_DIR_HUMANOS | Idosos 60+ | 60+ | Indireto | — | Presencial | Continuado | A confirmar | capital_humano | Municipal | A confirmar | ativo | — | Coord.: psicóloga Fernanda Fadiga |
| POL_JUVENTUDE | — | Políticas para a Juventude | B | direitos_humanos | Municipal | Gov. (Dep. Dir. Humanos) | DEP_DIR_HUMANOS | DEP_DIR_HUMANOS | Jovens 15–29 anos | 15-29 | — | — | — | Continuado | A confirmar | capital_humano | Lei 12.852/2013 | A confirmar | ativo | — | — |
| IGUALDADE_RACIAL | — | Políticas de Igualdade Racial | B | direitos_humanos | Municipal | Gov. (Dep. Dir. Humanos) | DEP_DIR_HUMANOS | DEP_DIR_HUMANOS | Pop. negra, indígena, comunidades tradicionais | Todas | — | — | — | Continuado | A confirmar | multidimensional | Lei 12.288/2010 | A confirmar | ativo | — | — |
| CRAM | — | CRAM — Centro de Referência de Atendimento à Mulher | C | direitos_humanos | Municipal | Gov. (Dep. Mulheres) | DEP_MULHERES | CRAM_01 | Mulheres em situação de violência | 18+ | Indireto | — | Espontâneo / Encaminhamento | Continuado | Rua Alberto Gomes, 18, Jd. das Paineiras | multidimensional | Lei 11.340/2006 | A confirmar | ativo | — | 293 atend. jan–mar/2026 |
| CLOSET_SOL | — | Closet Solidário | A | direitos_humanos | Municipal | Gov. (Dep. Mulheres) | DEP_MULHERES | CRAM_01 + FUNDO_SOCIAL | Mulheres atendidas pelo CRAM | 18+ | Indireto | — | Encaminhamento (via CRAM) | Continuado | CRAM — Rua Alberto Gomes, 18 | capital_humano | Municipal | A confirmar | ativo | 2026-03-09 | — |
| VIVA_MAIS | — | Viva Mais | A | saude | Municipal | Gov. (Dep. Rel. Inst.) | DEP_DIPGR | DEP_DIPGR | Comunidade geral | Todas | Indireto | — | Espontâneo | Continuado | A confirmar | capital_humano | Municipal | A confirmar | ativo | — | — |
| AMBULATORIO_TRANS | — | Ambulatório Trans | A | saude | Municipal | Saúde | — | SEC_SAUDE | População transexual | 18+ | Indireto | — | Espontâneo | Continuado | A confirmar | capital_humano | Municipal | A confirmar | ativo | 2024-01-00 | — |
| COM_PRIMEIRA_INF | — | Comitê Intersetorial de Políticas para a Primeira Infância | B | educacao | Municipal | Educação | — | SEC_EDUCACAO | Crianças 0–6 anos | 0-6 | — | — | — | Continuado | A confirmar | capital_humano | Lei 13.257/2016 | A confirmar | ativo | — | — |

---

## Grupo 9 — Formação Cultural

| id_programa | cod_programa | nome_programa | tipo | categoria | esfera | secretaria_responsavel | departamento_executor | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | contato | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| FORMACOES_CULT | — | Formações Culturais (bloco) | A | cultura | Municipal | Cultura | DEP_CULTURA | DEP_CULTURA | Comunidade geral — acesso universal e gratuito | Todas | Indireto | — | Presencial / Espontâneo | Continuado | A confirmar | capital_humano | Municipal | A confirmar | ativo | — | ⚠️ Verificar registro de matrículas para FATO_ATENDIMENTO |

---

## Grupo 10 — Serviços de Saúde com Interface SUAS

| id_programa | cod_programa | nome_programa | tipo | categoria | esfera | secretaria_responsavel | departamento_executor | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | contato | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| SAMU | — | SAMU Regional Hortolândia e Sumaré | A | saude | Federal/Municipal | Saúde | — | SEC_SAUDE | Pop. geral em urgência/emergência | Todas | Indireto | — | Espontâneo | Imediato | 192 | capital_humano | Lei 8.080/1990 | A confirmar | ativo | — | Abrangência: Hortolândia + Sumaré |
| VILA_SAUDE | — | Vila da Saúde | A | saude | Municipal | A confirmar | — | A confirmar | Pop. geral | Todas | A confirmar | — | — | — | A confirmar | capital_humano | A confirmar | A confirmar | planejamento | — | ⚠️ Intenção declarada jan/2026 — sem prazo |

---

## Grupo 11 — Governança e Conselhos

| id_programa | cod_programa | nome_programa | tipo | categoria | esfera | id_orgao_executor | secretaria_responsavel | vinculo_cadunico | acesso | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COMSEA | — | Conselho Municipal de Segurança Alimentar | B | governanca | Municipal | SEC_EDUCACAO | Educação | N | — | governanca | Municipal | A confirmar | ativo |
| CAISAN | — | Câmara Intersetorial de Segurança Alimentar | B | governanca | Municipal | SEC_EDUCACAO | Educação | N | — | governanca | Municipal | A confirmar | ativo |
| CMPcD | — | Conselho Municipal da PCD | B | governanca | Municipal | DEP_PCD | Gov. (DPCD) | N | — | governanca | Lei 13.146/2015 | A confirmar | ativo |
| CMDCA | — | Conselho Direitos da Criança e Adolescente | B | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | — | governanca | ECA | A confirmar | ativo |
| CMAS | — | Conselho Municipal de Assistência Social | B | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | — | governanca | LOAS | Lei 3.911/2021 | ativo |
| CMI | — | Conselho Municipal do Idoso | B | governanca | Municipal | DEP_DIR_HUMANOS | Gov. (Dep. Dir. Humanos) | N | — | governanca | Lei 10.741/2003 | A confirmar | ativo |
| COMJUV | — | Conselho Municipal da Juventude | B | governanca | Municipal | DEP_DIR_HUMANOS | Gov. (Dep. Dir. Humanos) | N | — | governanca | Lei 12.852/2013 | A confirmar | ativo |
| COMPIR | — | Fórum Municipal de Igualdade Racial | B | governanca | Municipal | DEP_DIR_HUMANOS | Gov. (Dep. Dir. Humanos) | N | — | governanca | Lei 12.288/2010 | A confirmar | ativo |
| CT_I | — | Conselho Tutelar I | C | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | — | governanca | ECA | A confirmar | ativo |
| CT_II | — | Conselho Tutelar II | C | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | — | governanca | ECA | A confirmar | ativo |
| CMDM | — | Conselho Municipal Direitos da Mulher | B | governanca | Municipal | DEP_MULHERES | Gov. (Dep. Mulheres) | N | — | governanca | Municipal | A confirmar | ativo |

---

## Log de Alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | 2026-03-11 | Criação — extraído de `dim_programas_sociais_v12.md`; tipo_programa A/B/C/D; campo categoria; status_programa; data_inicio ISO 8601 |
| v02 | 2026-03-11 | Adição dos campos ausentes: cod_programa, departamento_executor, faixa_etaria, acesso, prazo_execucao, contato — estrutura alinhada à especificação completa da DIM_PROGRAMA |

---

*Documento de modelagem relacional — 02_modelagem_lógica/*  
*Atlas Social de Hortolândia — uso in
