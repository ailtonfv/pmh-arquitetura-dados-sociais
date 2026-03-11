# DIM_PROGRAMA — Catálogo de Programas Sociais
**Versão:** v01  
**Data:** 2026-03-11  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 02_modelagem_lógica  
**Origem:** Extraído de `dim_programas_sociais_v12.md`

> Este arquivo contém exclusivamente o núcleo estável de cada programa —
> campos de identificação, classificação, vínculo e status.
> Destina-se à modelagem relacional e à carga em banco de dados.
>
> **Não contém:**
> - Notas arquiteturais → `00_governanca/notas_arquiteturais_programas_sociais.md`
> - Relação programa × IVS → `02_modelagem_lógica/rel_programa_dimensao_ivs.md`
> - Órgãos executores → `01_modelagem_conceitual/dim_orgao_executor_v01.md`

---

## Estrutura da DIM_PROGRAMA

```
id_programa              PK — sigla operacional do programa
nome_programa            nome completo
tipo_programa            A = Serviço Direto
                         B = Política / Instrumento
                         C = Equipamento
                         D = Programa de Inserção Produtiva
categoria                assistencia_social | emprego_renda | habitacao |
                         seguranca_alimentar | educacao | saude |
                         direitos_humanos | cultura | governanca
esfera                   Federal | Estadual | Municipal | Intersetorial
id_orgao_executor        FK → dim_orgao_executor
secretaria_responsavel   nome ou sigla
publico_alvo             texto descritivo
vinculo_cadunico         S | N | Parcial | Indireto | A confirmar
nivel_protecao           Básica | Especial-Média | Especial-Alta |
                         Produtivo | Alimentar | Educacional | Intersetorial
dimensao_ivs             infraestrutura_urbana | capital_humano |
                         renda_trabalho | multidimensional | governanca
base_legal_principal     LOAS | CNAS 109/2009 | PBF | CadÚnico |
                         ECA | Municipal | Estadual | Outro
base_legal_municipal     lei/decreto municipal, se houver
status_programa          ativo | suspenso | planejamento |
                         estudo_viabilidade | encerrado
data_inicio              ISO 8601 (YYYY-MM-DD) ou YYYY-MM-00 se dia desconhecido
grupo                    1=Proteção Básica | 2=Média Complexidade |
                         3=Alta Complexidade | 4=Municipal Inclusão |
                         5=Segurança Alimentar | 6=Habitação |
                         7=Inserção Produtiva | 8=Públicos Específicos |
                         9=Cultura | 10=Saúde | 11=Governança
observacoes              nota curta — detalhes longos em NOTAS_ARQUITETURAIS
```

---

## Grupo 1 — Proteção Social Básica

| id_programa | nome_programa | tipo | categoria | esfera | id_orgao_executor | secretaria_responsavel | publico_alvo | vinculo_cadunico | nivel_protecao | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| PAIF | Serviço de Proteção e Atendimento Integral às Famílias | A | assistencia_social | Federal | CRAS_* (7 unidades) | SMIDS | Famílias em vulnerabilidade | S | Básica | multidimensional | CNAS 109/2009 | Lei 3.911/2021 | ativo | — | Serviço central dos CRAS; caráter preventivo |
| SCFV | Serviço de Convivência e Fortalecimento de Vínculos | A | assistencia_social | Federal | CRAS_* (7 unidades) | SMIDS | Crianças, adolescentes, adultos e idosos em vulnerabilidade | S | Básica | capital_humano | CNAS 109/2009 | Lei 3.911/2021 | ativo | — | — |
| CCS | Centro de Convivência Social — Jd. Rosolém | A | assistencia_social | Municipal | CRAS_ROSOLEM | SMIDS | Comunidade da área de abrangência | Parcial | Básica | capital_humano | Municipal | A confirmar | ativo | — | ⚠️ Verificar se permanece equipamento distinto do CRAS Rosolém |

---

## Grupo 2 — Proteção Social Especial — Média Complexidade

| id_programa | nome_programa | tipo | categoria | esfera | id_orgao_executor | secretaria_responsavel | publico_alvo | vinculo_cadunico | nivel_protecao | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| PAEFI | Serviço de Proteção e Atendimento Especializado a Famílias e Indivíduos | A | assistencia_social | Federal | CREAS_01 | SMIDS | Famílias com violação de direitos, violência, risco | S | Especial-Média | multidimensional | CNAS 109/2009 | Lei 3.911/2021 | ativo | — | — |
| CENTROPOP | Centro de Referência Especializado para População em Situação de Rua | C | assistencia_social | Federal | CENTROPOP_01 | SMIDS | Adultos, adolescentes e famílias em situação de rua | Parcial | Especial-Média | multidimensional | LOAS + CNAS 109/2009 | Lei 3.911/2021 | ativo | — | ⚠️ Sem documentação — ponto cego no CadÚnico |
| ABORDAGEM_SOCIAL | Serviço Especializado em Abordagem Social | A | assistencia_social | Federal | CENTROPOP_01 | SMIDS | População em situação de rua | S | Especial-Média | multidimensional | CNAS 109/2009 | Lei 3.911/2021 | ativo | — | — |
| MSE_LA_PSC | Serviço de Proteção Social a Adolescentes em Cumprimento de Medida Socioeducativa | A | assistencia_social | Federal | CREAS_01 | SMIDS | Adolescentes em cumprimento de LA ou PSC | S | Especial-Média | capital_humano | ECA + CNAS 109/2009 | A confirmar | ativo | — | — |
| APOIO_RISCO | Serviço de Apoio a Famílias e Pessoas em Situação de Risco | A | assistencia_social | Intersetorial | SEC_INCLUSAO | SMIDS | Famílias e pessoas em situação de risco | S | Especial-Média | multidimensional | LOAS | Lei 3.911/2021 | ativo | — | — |
| EMERGENCIAS | Serviços de Emergência do Município | A | assistencia_social | Municipal | SEC_INCLUSAO | SMIDS + Defesa Civil + Habitação + Saúde | Famílias desabrigadas por eventos climáticos | S | Especial-Média | multidimensional | Municipal | Decreto 5.598/2025 | ativo | — | Ref: chuvas 26/02/2026 — 16 famílias acolhidas |

---

## Grupo 3 — Proteção Social Especial — Alta Complexidade

| id_programa | nome_programa | tipo | categoria | esfera | id_orgao_executor | secretaria_responsavel | publico_alvo | vinculo_cadunico | nivel_protecao | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| SAICA | Serviço de Acolhimento Institucional para Crianças e Adolescentes | A | assistencia_social | Intersetorial | OSC_A_CONFIRMAR | SMIDS | Crianças e adolescentes com direitos violados | S | Especial-Alta | capital_humano | ECA + CNAS 109/2009 | A confirmar | ativo | — | ⚠️ Pendência #19: identificar OSC executora |
| ABRIGO_ADULTOS | Abrigo Institucional para Adultos e Famílias em Situação de Rua | A | assistencia_social | Intersetorial | OSC_ESPERANCAR | SMIDS | Adultos 24–59 anos em situação de rua | S | Especial-Alta | infraestrutura_urbana | LOAS + CNAS 109/2009 | A confirmar | ativo | — | Acesso via Centro POP obrigatório |
| ABRIGO_MULHERES | Abrigo Institucional para Mulheres em Situação de Violência | A | assistencia_social | Intersetorial | OSC_A_CONFIRMAR | SMIDS + Dep. Mulheres | Mulheres em violência doméstica ou sexual | S | Especial-Alta | multidimensional | Outro (Lei 11.340/2006) + CNAS | A confirmar | ativo | — | Acesso sem B.O. — ⚠️ Pendência #19 |
| RESIDENCIA_INCLUSIVA | Residência Inclusiva para Jovens e Adultos com Deficiência | A | assistencia_social | Intersetorial | OSC_A_CONFIRMAR | SMIDS | Jovens e adultos com deficiência | S | Especial-Alta | capital_humano | LOAS + CNAS + Lei 13.146/2015 | A confirmar | ativo | — | ⚠️ Pendência #19 |
| ILPI | Casa-Lar e ILPI — Acolhimento para Idosos | A | assistencia_social | Intersetorial | OSC_A_CONFIRMAR | SMIDS + Dep. Dir. Humanos | Idosos 60+ sem suporte familiar | S | Especial-Alta | capital_humano | LOAS + CNAS + Lei 10.741/2003 | A confirmar | ativo | — | ⚠️ Pendência #19 |
| REPUBLICA | República — Acolhimento para Jovens e Adultos em Saída da Rua | A | assistencia_social | Intersetorial | OSC_A_CONFIRMAR | SMIDS | Jovens 18–21 e adultos em saída da rua | S | Especial-Alta | renda_trabalho | LOAS + CNAS 109/2009 | A confirmar | ativo | — | Autogestão — ⚠️ Pendência #19 |
| APADRINHAMENTO | Programa de Apadrinhamento para Crianças e Adolescentes em Acolhimento | A | assistencia_social | Intersetorial | SEC_INCLUSAO | SMIDS / CMDCA | Crianças e adolescentes em acolhimento | S | Especial-Alta | capital_humano | ECA | A confirmar | ativo | — | — |
| TRAB_INFANTIL | Programa de Enfrentamento ao Trabalho Infantil | A | assistencia_social | Intersetorial | CREAS_01 | SMIDS / Conselho Tutelar | Crianças e adolescentes em trabalho infantil | S | Especial-Alta | capital_humano | ECA | A confirmar | ativo | — | — |
| ATEND_DOMICILIAR | Serviço de Atendimento Domiciliar para PCD e Idosos | A | assistencia_social | Municipal | SEC_INCLUSAO | SMIDS | PCD e idosos em domicílio | A confirmar | Especial-Alta | capital_humano | Municipal | A confirmar | ativo | — | — |
| PROTECAO_PCD_IDOSO | Serviço de Proteção Social Especial para PCD, Idosos e suas Famílias | A | assistencia_social | Intersetorial | CREAS_01 | SMIDS | PCD, idosos e famílias | A confirmar | Especial-Alta | capital_humano | LOAS + CNAS 109/2009 | Lei 3.911/2021 | ativo | — | — |

---

## Grupo 4 — Programas Municipais Específicos (Inclusão)

| id_programa | nome_programa | tipo | categoria | esfera | id_orgao_executor | secretaria_responsavel | publico_alvo | vinculo_cadunico | nivel_protecao | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| FUNDO_EMERG | Fundo Social — Atendimento Emergencial | A | assistencia_social | Municipal | FUNDO_SOCIAL | Fundo Social | Famílias em vulnerabilidade emergencial | S | Básica/Alimentar | renda_trabalho | Municipal | Decreto 5.598/2025 | ativo | — | — |
| ACERTE | Ação Cidadã de Requalificação, Trabalho e Educação | D | emprego_renda | Municipal | DEP_DIPGR | Gov. (Dep. Relações Institucionais) | Pessoas em vulnerabilidade, egressos de programas, pop. rua | S | Produtivo | renda_trabalho | Municipal | A confirmar | ativo | — | Bolsa R$ 710 + cesta. Modalidades: Costura, Serviços Gerais (fev/2026) |
| CUIDAR | Programa Cuidar | A | saude | Municipal | FUNDO_SOCIAL | Fundo Social | Gestantes a partir da 34ª semana — pré-natal na rede municipal | Parcial | Básica/Intersetorial | capital_humano | Municipal | Lei 3.955/2022 | ativo | 2022-10-00 | — |
| CAPACITA | Projeto Capacita | D | emprego_renda | Municipal | CQP_I | SMIDS | Pessoas em vulnerabilidade — qualificação profissional | S | Produtivo | renda_trabalho | Municipal | A confirmar | ativo | — | ⚠️ Verificar distinção vs Capacita Hortolândia (Fundo Social) |
| COSTURA_IND | Projeto Costura Industrial | D | emprego_renda | Municipal | CQP_II | SMIDS | Pessoas em vulnerabilidade — setor têxtil | S | Produtivo | renda_trabalho | Municipal | A confirmar | ativo | — | Modalidade ACERTE. Benefício: R$ 710 + cesta |
| FARMACIA_SOL | Farmácia Solidária | A | saude | Municipal | SEC_INCLUSAO | SMIDS | Pessoas em vulnerabilidade socioeconômica | A confirmar | Básica/Saúde | capital_humano | Municipal | A confirmar | ativo | — | ⚠️ Detalhar critério de acesso |
| FEIRAS_EMPREEND | Feiras de Empreendedores | A | emprego_renda | Municipal | CESP | SMIDS | Empreendedores em vulnerabilidade / economia solidária | Indireto | Produtivo | renda_trabalho | Municipal | A confirmar | ativo | — | — |
| RESSIGNIFICA | Programa Ressignifica Hortolândia | A | assistencia_social | Municipal | CENTROPOP_01 | SMIDS | Moradores em situação de rua | S | Especial-Alta/Intersetorial | multidimensional | Municipal + Decreto 7.053/2009 | A confirmar | ativo | 2023-12-00 | Bolsa R$ 700 + cesta + auxílio aluguel |
| BOLSA_CRECHE | Bolsa Creche | A | educacao | Municipal | SEC_EDUCACAO | Educação | Crianças 6 meses–3a6m sem vaga na rede pública | S | Básica | capital_humano | Municipal | A confirmar | ativo | — | — |
| INSCRICAO_CMAS | Inscrição de OSCs no CMAS | B | governanca | Municipal | SEC_INCLUSAO | SMIDS / CMAS | Organizações da Sociedade Civil | N | — | governanca | LOAS | Lei 3.911/2021 | ativo | — | — |
| INSCRICAO_CMDCA | Inscrição de OSCs no CMDCA | B | governanca | Municipal | SEC_INCLUSAO | SMIDS / CMDCA | OSCs voltadas à criança e ao adolescente | N | — | governanca | ECA | A confirmar | ativo | — | — |

---

## Grupo 5 — Segurança Alimentar

| id_programa | nome_programa | tipo | categoria | esfera | id_orgao_executor | secretaria_responsavel | publico_alvo | vinculo_cadunico | nivel_protecao | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| BAH | Banco de Alimentos de Hortolândia | A | seguranca_alimentar | Municipal | DEP_SEG_ALIMENTAR | Educação (Dep. Seg. Alimentar) | Pessoas em insegurança via 19 OSCs parceiras | Indireto | Alimentar | renda_trabalho | Municipal | A confirmar | ativo | 2007-00-00 | Alcance: 19 org / 1.762 pessoas (2024) |
| PAA | Programa de Aquisição de Alimentos | A | seguranca_alimentar | Federal | DEP_SEG_ALIMENTAR | Educação | Agricultores familiares + beneficiários do BAH | Indireto | Alimentar | renda_trabalho | Outro (Lei 10.696/2003) | A confirmar | ativo | — | — |
| CESTAS | Distribuição de Cestas Básicas | A | seguranca_alimentar | Municipal | FUNDO_SOCIAL | SMIDS / Fundo Social | Famílias em vulnerabilidade | S | Alimentar | renda_trabalho | Municipal | Decreto 5.598/2025 | ativo | — | — |
| CREAN | Centro de Referência em Educação Alimentar e Nutricional | A | seguranca_alimentar | Municipal | DEP_SEG_ALIMENTAR | Educação | Comunidade | — | Alimentar | capital_humano | Municipal | A confirmar | planejamento | 2023-04-00 | Previsto para Jd. Terras de Santa Maria |
| COZINHA_COM | Cozinha Comunitária | A | seguranca_alimentar | Municipal | DEP_SEG_ALIMENTAR | Educação | Comunidade | — | Alimentar | renda_trabalho | Municipal | A confirmar | ativo | — | ⚠️ Verificar se é o mesmo equipamento que a "Escola Comunitária" do Jd. Novo Ângulo |

---

## Grupo 6 — Habitação

| id_programa | nome_programa | tipo | categoria | esfera | id_orgao_executor | secretaria_responsavel | publico_alvo | vinculo_cadunico | nivel_protecao | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| AGORA_CASA | Agora a Casa é Sua | A | habitacao | Municipal | SEC_HABITACAO | Habitação | Famílias em situação irregular | Indireto | — | infraestrutura_urbana | Municipal | A confirmar | ativo | — | ~3.000 títulos 2021–2024 |
| VIDA_LONGA | Programa Vida Longa (Estadual) | A | habitacao | Estadual | SEC_HABITACAO | Habitação | Idosos ≥ 60 anos — residentes ≥ 2 anos | S | — | infraestrutura_urbana | Estadual | A confirmar | planejamento | — | 28 unidades — NEGOCIAÇÃO ATIVA (mar/2026) |
| MCMV | Minha Casa, Minha Vida — Hortolândia | A | habitacao | Federal | SEC_HABITACAO | Habitação | Famílias em vulnerabilidade | S | — | infraestrutura_urbana | PBF / CadÚnico | Lei 14.620/2023 | ativo | 2026-00-00 | 400 unidades em construção — Jd. Amanda |
| PHLIS | Plano Municipal de Habitação de Interesse Social | B | habitacao | Municipal | SEC_HABITACAO | Habitação | Município | — | — | infraestrutura_urbana | Municipal | A confirmar | ativo | — | — |

---

## Grupo 7 — Inserção Produtiva e Qualificação

| id_programa | nome_programa | tipo | categoria | esfera | id_orgao_executor | secretaria_responsavel | publico_alvo | vinculo_cadunico | nivel_protecao | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| PAT | Posto de Atendimento ao Trabalhador | C | emprego_renda | Estadual/Municipal | PAT_01 | Sec. Des. Econômico | Desempregados em geral, PCD | Indireto | Produtivo | renda_trabalho | Outro (Lei 7.998/1990) | A confirmar | ativo | — | Ponto de cruzamento CadÚnico × mercado formal |
| PAT_VAGAS | Cadastro de Vagas por Empresa — PAT | A | emprego_renda | Estadual/Municipal | PAT_01 | Sec. Des. Econômico | Empresas (oferta) + trabalhadores (demanda) | Indireto | Produtivo | renda_trabalho | Outro (Lei 7.998/1990) | A confirmar | ativo | — | — |
| SINE | Cadastro no SINE e Encaminhamento para Vagas | A | emprego_renda | Federal | PAT_01 | Sec. Des. Econômico | Trabalhadores desempregados | Indireto | Produtivo | renda_trabalho | Outro (Lei 7.998/1990) | A confirmar | ativo | 2026-02-00 | Adesão formal Hortolândia: fev/2026 |
| PEI | Polo de Empregabilidade Inclusiva | D | emprego_renda | Estadual/Municipal | DEP_PCD (provisório) | SMIDS + Sec. Est. Direitos PCD | PCD em busca de inserção no mercado | A confirmar | Produtivo | renda_trabalho | Estadual + Municipal (Termo Cooperação) | A confirmar | ativo | 2026-02-00 | ⚠️ Pendência #23: id_orgao_executor, base legal municipal, outros programas do Termo |
| BANCO_POVO | Banco do Povo | A | emprego_renda | Estadual | EXT_DESENVOLVE_SP | Sec. Des. Econômico | MEI, ME, EPP, LTDA, EIRELI | A confirmar | Produtivo | renda_trabalho | Outro (Lei 9.533/1997) | A confirmar | ativo | — | Executor: Desenvolve SP |
| ORIENT_MEI | Orientação ao MEI | A | emprego_renda | Municipal | DEP_EMPREEND | Sec. Des. Econômico | MEIs — abertura, regularização, obrigações | Indireto | Produtivo | renda_trabalho | Outro (LC 128/2008) | A confirmar | ativo | — | Formalização via MEI não aparece no CAGED |
| SEBRAE_AQUI | SEBRAE Aqui | A | emprego_renda | Estadual | EXT_SEBRAE_SP | Sec. Des. Econômico | Empreendedores e futuros empreendedores | Indireto | Produtivo | renda_trabalho | Outro | A confirmar | ativo | — | — |
| SEG_DESEMPREGO | Seguro Desemprego | A | emprego_renda | Federal | PAT_01 | Sec. Des. Econômico | Trabalhador formal dispensado sem justa causa | Indireto | Produtivo | renda_trabalho | Outro (Lei 7.998/1990) | A confirmar | ativo | — | Esgotamento do benefício → entrada previsível no CadÚnico |
| FEIRAS_LIVRES | Feiras Livres e Noturnas | A | emprego_renda | Municipal | SEC_DES_ECONOMICO | Sec. Des. Econômico | Feirantes + população geral | Indireto | Produtivo | renda_trabalho | Municipal | A confirmar | ativo | — | 7 territórios; 5 coincidem com áreas de CRAS |
| FUNDO_CURSOS | Fundo Social — Cursos Profissionalizantes | D | emprego_renda | Municipal | FUNDO_SOCIAL | Governo (Fundo Social) | Pessoas 16+ em vulnerabilidade socioeconômica | Indireto | Produtivo | renda_trabalho | Municipal | A confirmar | ativo | — | SENAI (alvenaria + assistente RH) jan/2026 |
| MEU_EMPREGO | Programa Meu Emprego — Trabalho em Equipe | D | emprego_renda | Estadual/Municipal | DEP_DIPGR | SMIDS (DIPGR) | Jovens 16–20 + desempregados +3 meses + seg-desemprego | Indireto | Produtivo | renda_trabalho | Outro | A confirmar | ativo | — | — |
| DECOLA | DECOLA | D | emprego_renda | Municipal | DEP_DIPGR | SMIDS | A confirmar — empregabilidade e inserção produtiva | A confirmar | Produtivo | renda_trabalho | Municipal | A confirmar | ativo | — | ⚠️ Pendência #20: relação com Aprendiz Social |
| APRENDIZ_SOCIAL | Aprendiz Social | D | emprego_renda | Municipal | DEP_DIPGR | SMIDS | Jovens — formação para o mercado de trabalho | A confirmar | Produtivo | renda_trabalho | Municipal | A confirmar | ativo | — | ⚠️ Pendência #20: confirmar se distinto do DECOLA |
| FATEC | Fatec Hortolândia | B | educacao | Estadual | EXT_CENTRO_PAULA_SOUZA | Sec. Des. Econômico | Jovens e adultos — ensino superior tecnológico gratuito | Indireto | Educacional | renda_trabalho | Estadual | A confirmar | estudo_viabilidade | — | ⚠️ Pendência #22 (local reunião) + #17 (monitorar) |

---

## Grupo 8 — Públicos Específicos / Direitos Humanos

| id_programa | nome_programa | tipo | categoria | esfera | id_orgao_executor | secretaria_responsavel | publico_alvo | vinculo_cadunico | nivel_protecao | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| POL_PCD | Cadastro e Políticas para PCD | B | direitos_humanos | Municipal | DEP_PCD | Gov. (DPCD) | Pessoas com deficiência | Indireto | — | capital_humano | Outro (Lei 13.146/2015) | A confirmar | ativo | — | — |
| POL_IDOSO | Políticas para Pessoa Idosa | B | direitos_humanos | Municipal | DEP_DIR_HUMANOS | Gov. (Dep. Dir. Humanos) | Idosos em vulnerabilidade | Indireto | — | capital_humano | Outro (Lei 10.741/2003) | A confirmar | ativo | — | — |
| CCMI | Centro de Convivência da Melhor Idade | A | direitos_humanos | Municipal | DEP_DIR_HUMANOS | Gov. (Dep. Dir. Humanos) | Idosos 60+ | Indireto | — | capital_humano | Municipal | A confirmar | ativo | — | Coord.: psicóloga Fernanda Fadiga |
| POL_JUVENTUDE | Políticas para a Juventude | B | direitos_humanos | Municipal | DEP_DIR_HUMANOS | Gov. (Dep. Dir. Humanos) | Jovens 15–29 anos | — | — | capital_humano | Outro (Lei 12.852/2013) | A confirmar | ativo | — | — |
| IGUALDADE_RACIAL | Políticas de Igualdade Racial | B | direitos_humanos | Municipal | DEP_DIR_HUMANOS | Gov. (Dep. Dir. Humanos) | Pop. negra, indígena, comunidades tradicionais | — | — | multidimensional | Outro (Lei 12.288/2010) | A confirmar | ativo | — | — |
| CRAM | CRAM — Centro de Referência de Atendimento à Mulher | C | direitos_humanos | Municipal | CRAM_01 | Gov. (Dep. Mulheres) | Mulheres em situação de violência ou vulnerabilidade | Indireto | — | multidimensional | Outro (Lei 11.340/2006) | A confirmar | ativo | — | 293 atend. jan–mar/2026; 101 casos novos |
| CLOSET_SOL | Closet Solidário | A | direitos_humanos | Municipal | CRAM_01 + FUNDO_SOCIAL | Gov. (Dep. Mulheres) + Fundo Social | Mulheres atendidas pelo CRAM | Indireto | — | capital_humano | Municipal | A confirmar | ativo | 2026-03-09 | Encaminhamento via CRAM |
| VIVA_MAIS | Viva Mais | A | saude | Municipal | DEP_DIPGR | Gov. (Dep. Relações Institucionais) | Comunidade geral | Indireto | — | capital_humano | Municipal | A confirmar | ativo | — | — |
| AMBULATORIO_TRANS | Ambulatório Trans | A | saude | Municipal | SEC_SAUDE | Saúde | População transexual | Indireto | — | capital_humano | Municipal | A confirmar | ativo | 2024-01-00 | — |
| COM_PRIMEIRA_INF | Comitê Intersetorial de Políticas para a Primeira Infância | B | educacao | Municipal | SEC_EDUCACAO | Educação | Crianças 0–6 anos | — | — | capital_humano | Outro (Lei 13.257/2016) | A confirmar | ativo | — | — |

---

## Grupo 9 — Formação Cultural

| id_programa | nome_programa | tipo | categoria | esfera | id_orgao_executor | secretaria_responsavel | publico_alvo | vinculo_cadunico | nivel_protecao | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| FORMACOES_CULT | Formações Culturais (bloco) | A | cultura | Municipal | DEP_CULTURA | Cultura (Dep. Cidadania Cultural) | Comunidade geral — acesso universal e gratuito | Indireto | — | capital_humano | Municipal | A confirmar | ativo | — | ⚠️ Verificar registro de matrículas para FATO_ATENDIMENTO |

---

## Grupo 10 — Serviços de Saúde com Interface SUAS

| id_programa | nome_programa | tipo | categoria | esfera | id_orgao_executor | secretaria_responsavel | publico_alvo | vinculo_cadunico | nivel_protecao | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| SAMU | SAMU Regional Hortolândia e Sumaré | A | saude | Federal/Municipal | SEC_SAUDE | Saúde | Pop. geral em urgência/emergência | Indireto | — | capital_humano | Outro (Lei 8.080/1990) | A confirmar | ativo | — | Abrangência: Hortolândia + Sumaré |
| VILA_SAUDE | Vila da Saúde | A | saude | Municipal | A confirmar | A confirmar | Pop. geral | A confirmar | — | capital_humano | A confirmar | A confirmar | planejamento | — | ⚠️ Intenção declarada jan/2026 — sem prazo |

---

## Grupo 11 — Governança e Conselhos

| id_programa | nome_programa | tipo | categoria | esfera | id_orgao_executor | secretaria_responsavel | vinculo_cadunico | dimensao_ivs | base_legal_principal | base_legal_municipal | status_programa |
|---|---|---|---|---|---|---|---|---|---|---|---|
| COMSEA | Conselho Municipal de Segurança Alimentar | B | governanca | Municipal | SEC_EDUCACAO | Educação | N | governanca | Municipal | A confirmar | ativo |
| CAISAN | Câmara Intersetorial de Segurança Alimentar | B | governanca | Municipal | SEC_EDUCACAO | Educação | N | governanca | Municipal | A confirmar | ativo |
| CMPcD | Conselho Municipal da PCD | B | governanca | Municipal | DEP_PCD | Gov. (DPCD) | N | governanca | Lei 13.146/2015 | A confirmar | ativo |
| CMDCA | Conselho Direitos da Criança e Adolescente | B | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | governanca | ECA | A confirmar | ativo |
| CMAS | Conselho Municipal de Assistência Social | B | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | governanca | LOAS | Lei 3.911/2021 | ativo |
| CMI | Conselho Municipal do Idoso | B | governanca | Municipal | DEP_DIR_HUMANOS | Gov. (Dep. Dir. Humanos) | N | governanca | Lei 10.741/2003 | A confirmar | ativo |
| COMJUV | Conselho Municipal da Juventude | B | governanca | Municipal | DEP_DIR_HUMANOS | Gov. (Dep. Dir. Humanos) | N | governanca | Lei 12.852/2013 | A confirmar | ativo |
| COMPIR | Fórum Municipal de Igualdade Racial | B | governanca | Municipal | DEP_DIR_HUMANOS | Gov. (Dep. Dir. Humanos) | N | governanca | Lei 12.288/2010 | A confirmar | ativo |
| CT_I | Conselho Tutelar I | C | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | governanca | ECA | A confirmar | ativo |
| CT_II | Conselho Tutelar II | C | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | governanca | ECA | A confirmar | ativo |
| CMDM | Conselho Municipal Direitos da Mulher | B | governanca | Municipal | DEP_MULHERES | Gov. (Dep. Mulheres) | N | governanca | Municipal | A confirmar | ativo |

---

## Distribuição por Dimensão IVS

| dimensao_ivs | qtd | % |
|---|---|---|
| capital_humano | 22 | 33,8% |
| renda_trabalho | 24 | 36,9% |
| multidimensional | 10 | 15,4% |
| infraestrutura_urbana | 6 | 9,2% |
| governanca | 2 | 3,1% |
| **TOTAL** | **64** | **100%** |

---

## Log de Alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | 2026-03-11 | Criação — extraído de `dim_programas_sociais_v12.md`; campo `tipo_programa` expandido (A/B/C/D); campo `categoria` criado; `data_inicio` padronizado para ISO 8601; `ativo` → `status_programa` com 5 valores; 64 programas catalogados |

---

*Documento de modelagem relacional — 02_modelagem_lógica/*  
*Atlas Social de Hortolândia — uso interno*
