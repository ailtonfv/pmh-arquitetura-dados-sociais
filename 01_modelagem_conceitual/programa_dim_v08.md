[programa_dim_v08.md](https://github.com/user-attachments/files/26359769/programa_dim_v08.md)[Uploading programa_d# DIM_PROGRAMA — Catálogo de Programas Sociais
**Versão:** v08  
**Data:** "31/03/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 01_modelagem_conceitual  
**Origem:** Atualizado a partir de `programa_dim_v07.md` — enriquecimento de CENTROPOP, EMERGENCIAS e FUNDO_EMERG com dados operacionais do SIGAS (ata de levantamento técnico mar/2026)

> Este arquivo contém exclusivamente o **núcleo cadastral** de cada programa.
> Destina-se à modelagem relacional e à carga em banco de dados.
>
> **Não contém:**
> - Notas arquiteturais → `00_governanca/notas_arquiteturais_programas_sociais.md`
> - Relação programa × IVS → `02_modelagem_lógica/rel_programa_dimensao_ivs.md`
> - Órgãos executores → `01_modelagem_conceitual/dim_orgao_executor.md`
> - Cobertura por núcleo → `REL_PROGRAMA_NUCLEO` (a criar)

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
tipo_entrega             servico       — atendimento direto à pessoa/família
                         beneficio     — transferência monetária ou em espécie
                         equipamento   — espaço físico de referência
                         qualificacao  — formação profissional ou educacional
                         transferencia — repasse a OSC ou outro ente
                         instrumento   — norma, plano, conselho (tipo B)
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
indicador_principal      indicador primário de monitoramento do programa
                         (texto curto — migrar para REL_PROGRAMA_INDICADOR futuramente)
abrangencia_nucleo       Municipal — programa cobre todos os núcleos
                         id_nucleo  — cobertura restrita a núcleo(s) específico(s)
                         (detalhamento multi-núcleo em REL_PROGRAMA_NUCLEO)
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

| id_programa | nome_programa | tipo | tipo_entrega | categoria | esfera | secretaria_responsavel | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | dimensao_ivs | indicador_principal | abrangencia_nucleo | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PAIF | Serviço de Proteção e Atendimento Integral às Famílias | A | servico | assistencia_social | Federal | SMIDS | CRAS_* (7) | Famílias em vulnerabilidade | Todas | S | Básica | Espontâneo / Encaminhamento | Continuado | multidimensional | famílias acompanhadas / famílias vulneráveis | Municipal | CNAS 109/2009 | Lei 3.911/2021 | ativo | — | Serviço central dos CRAS. FEAS 2026: R$ 94.947,37 para lanches PAIF |
| SCFV | Serviço de Convivência e Fortalecimento de Vínculos | A | servico | assistencia_social | Federal | SMIDS | CRAS_* (7) | Crianças, adolescentes, adultos e idosos em vulnerabilidade | 0-17 / 60+ | S | Básica | Encaminhamento | Continuado | capital_humano | cobertura por núcleo / evasão escolar | Municipal | CNAS 109/2009 | Lei 3.911/2021 | ativo | — | Chamamento 01/2026: Instituto Recrie 1º lugar. Gaps por núcleo questionados pelo CMDCA (Ofício 001/2026) |
| CCS | Centro de Convivência Social — Jd. Rosolém | A | equipamento | assistencia_social | Municipal | SMIDS | CRAS_ROSOLEM | Comunidade da área de abrangência | Todas | Parcial | Básica | Espontâneo | Continuado | capital_humano | participantes ativos / mês | NUCLEO_ROSOLEM | Municipal | A confirmar | ativo | — | Verificar se permanece equipamento distinto do CRAS Rosolém |

---

## Grupo 2 — Proteção Social Especial — Média Complexidade

| id_programa | nome_programa | tipo | tipo_entrega | categoria | esfera | secretaria_responsavel | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | dimensao_ivs | indicador_principal | abrangencia_nucleo | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PAEFI | Serviço de Proteção e Atendimento Especializado a Famílias e Indivíduos | A | servico | assistencia_social | Federal | SMIDS | CREAS_01 | Famílias com violação de direitos | Todas | S | Especial-Média | Encaminhamento | Continuado | multidimensional | famílias em acompanhamento ativo | Municipal | CNAS 109/2009 | Lei 3.911/2021 | ativo | — | — |
| CENTROPOP | Centro de Referência Especializado para População em Situação de Rua | C | equipamento | assistencia_social | Federal | SMIDS | CENTROPOP_01 | Adultos, adolescentes e famílias em situação de rua | 18+ | Parcial | Especial-Média | Espontâneo | Imediato | multidimensional | atendimentos / mês | Municipal | LOAS + CNAS 109/2009 | Lei 3.911/2021 | ativo | — | Ponto cego no CadÚnico. SIGAS registra benefícios individuais por refeição (Almoço, Jantar, Café), Banho e Lavanderia — granularidade disponível para FATO_ATENDIMENTO futuro |
| ABORDAGEM_SOCIAL | Serviço Especializado em Abordagem Social | A | servico | assistencia_social | Federal | SMIDS | CENTROPOP_01 | População em situação de rua | Todas | S | Especial-Média | Espontâneo | Imediato | multidimensional | abordagens realizadas / mês | Municipal | CNAS 109/2009 | Lei 3.911/2021 | ativo | — | — |
| MSE_LA_PSC | Serviço de Proteção Social a Adolescentes em Cumprimento de Medida Socioeducativa | A | servico | assistencia_social | Federal | SMIDS | CREAS_01 | Adolescentes em LA ou PSC | 12-18 | S | Especial-Média | Encaminhamento | Continuado | capital_humano | adolescentes em acompanhamento | Municipal | ECA + CNAS 109/2009 | A confirmar | ativo | — | — |
| APOIO_RISCO | Serviço de Apoio a Famílias e Pessoas em Situação de Risco | A | servico | assistencia_social | Intersetorial | SMIDS | SEC_INCLUSAO | Famílias e pessoas em situação de risco | Todas | S | Especial-Média | Encaminhamento | Continuado | multidimensional | famílias atendidas | Municipal | LOAS | Lei 3.911/2021 | ativo | — | — |
| EMERGENCIAS | Serviços de Emergência do Município | A | servico | assistencia_social | Municipal | SMIDS | SEC_INCLUSAO | Famílias desabrigadas por eventos climáticos | Todas | S | Especial-Média | Espontâneo | Imediato | multidimensional | famílias atendidas por evento | Municipal | Municipal | Decreto 5.598/2025 | ativo | — | Ref: chuvas 26/02/2026 — 16 famílias. SIGAS registra sub-tipos de Benefício Eventual: Pecúnia, Recâmbio, Transporte, Funeral Social, Isenção de Sepultamento, Auxílio Funeral |

---

## Grupo 3 — Proteção Social Especial — Alta Complexidade

| id_programa | nome_programa | tipo | tipo_entrega | categoria | esfera | secretaria_responsavel | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | dimensao_ivs | indicador_principal | abrangencia_nucleo | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| SAICA | Serviço de Acolhimento Institucional para Crianças e Adolescentes | A | servico | assistencia_social | Intersetorial | SMIDS | OSC_SAO_PEDRO | Crianças e adolescentes com direitos violados | 0-18 | S | Especial-Alta | Encaminhamento | Continuado | capital_humano | crianças acolhidas / desligamentos para família | Municipal | ECA + CNAS 109/2009 | A confirmar | ativo | — | Executor transferido da OSC Esperançar (encerrada fev/2026) — Res. CMAS 007/2026. Saldo: R$ 964.288,20 |
| ABRIGO_ADULTOS | Abrigo Institucional para Adultos e Famílias em Situação de Rua | A | servico | assistencia_social | Intersetorial | SMIDS | OSC_SAO_PEDRO | Adultos em situação de rua | 24-59 | S | Especial-Alta | Encaminhamento (via Centro POP) | Continuado | infraestrutura_urbana | vagas ocupadas / tempo médio de permanência | Municipal | LOAS + CNAS 109/2009 | A confirmar | ativo | — | Executor atualizado — OSC Esperançar encerrada fev/2026 |
| ABRIGO_MULHERES | Abrigo Institucional para Mulheres em Situação de Violência | A | servico | assistencia_social | Intersetorial | SMIDS | OSC_A_CONFIRMAR | Mulheres em violência doméstica ou sexual | 18+ | S | Especial-Alta | Encaminhamento (sem B.O.) | Continuado | multidimensional | mulheres acolhidas | Municipal | Lei 11.340/2006 + CNAS | A confirmar | ativo | — | Interface Comissão Intersetorial VD — Decreto 5.810/2026 |
| RESIDENCIA_INCLUSIVA | Residência Inclusiva para Jovens e Adultos com Deficiência | A | servico | assistencia_social | Intersetorial | SMIDS | OSC_A_CONFIRMAR | Jovens e adultos com deficiência | 18+ | S | Especial-Alta | Encaminhamento | Continuado | capital_humano | vagas ocupadas | Municipal | LOAS + CNAS + Lei 13.146/2015 | A confirmar | ativo | — | Pendência #19 |
| ILPI | Casa-Lar e ILPI — Acolhimento para Idosos | A | servico | assistencia_social | Intersetorial | SMIDS | OSC_A_CONFIRMAR | Idosos sem suporte familiar | 60+ | S | Especial-Alta | Encaminhamento | Continuado | capital_humano | vagas ocupadas | Municipal | LOAS + CNAS + Lei 10.741/2003 | A confirmar | ativo | — | Pendência #19 |
| REPUBLICA | República — Acolhimento para Jovens e Adultos em Saída da Rua | A | servico | assistencia_social | Intersetorial | SMIDS | OSC_SAO_PEDRO | Jovens e adultos em saída da situação de rua | 18-35 | S | Especial-Alta | Encaminhamento | Continuado | renda_trabalho | residentes com vínculo formal de emprego | Municipal | LOAS + CNAS 109/2009 | A confirmar | ativo | — | Executor transferido da OSC Esperançar — Res. CMAS 007/2026 |
| APADRINHAMENTO | Programa de Apadrinhamento para Crianças e Adolescentes em Acolhimento | A | servico | assistencia_social | Intersetorial | SMIDS | SEC_INCLUSAO | Crianças e adolescentes em acolhimento | 0-18 | S | Especial-Alta | Encaminhamento | Continuado | capital_humano | vínculos de apadrinhamento ativos | Municipal | ECA | A confirmar | ativo | — | Vinculado ao CMDCA |
| TRAB_INFANTIL | Programa de Enfrentamento ao Trabalho Infantil | A | servico | assistencia_social | Intersetorial | SMIDS | CREAS_01 | Crianças e adolescentes em trabalho infantil | 10-16 | S | Especial-Alta | Encaminhamento | Continuado | capital_humano | casos identificados / casos encerrados | Municipal | ECA | A confirmar | ativo | — | Interface Conselho Tutelar |
| ATEND_DOMICILIAR | Serviço de Atendimento Domiciliar para PCD e Idosos | A | servico | assistencia_social | Municipal | SMIDS | SEC_INCLUSAO | PCD e idosos em domicílio | 60+ / Todas (PCD) | A confirmar | Especial-Alta | Encaminhamento | Continuado | capital_humano | visitas domiciliares / mês | Municipal | Municipal | A confirmar | ativo | — | — |
| PROTECAO_PCD_IDOSO | Serviço de Proteção Social Especial para PCD, Idosos e suas Famílias | A | servico | assistencia_social | Intersetorial | SMIDS | CREAS_01 | PCD, idosos e famílias | 60+ / Todas (PCD) | A confirmar | Especial-Alta | Encaminhamento | Continuado | capital_humano | famílias em acompanhamento | Municipal | LOAS + CNAS 109/2009 | Lei 3.911/2021 | ativo | — | — |

---

## Grupo 4 — Programas Municipais Específicos (Inclusão)

| id_programa | nome_programa | tipo | tipo_entrega | categoria | esfera | secretaria_responsavel | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | dimensao_ivs | indicador_principal | abrangencia_nucleo | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| FUNDO_EMERG | Fundo Social — Atendimento Emergencial | A | beneficio | assistencia_social | Municipal | Fundo Social | FUNDO_SOCIAL | Famílias em vulnerabilidade emergencial | Todas | S | Básica/Alimentar | Encaminhamento | Imediato | renda_trabalho | atendimentos emergenciais / mês | Municipal | Municipal | Decreto 5.598/2025 | ativo | — | SIGAS registra benefícios em espécie sem programa próprio: Kit Higiene, Kit Absorventes, Fralda Adulto, Leite Fórmula, Roupas, Cobertor, Colchão — a catalogar futuramente |
| ACERTE | Ação Cidadã de Requalificação, Trabalho e Educação | D | qualificacao | emprego_renda | Municipal | Gov. (Dep. Rel. Inst.) | DEP_DIPGR | Pessoas em vulnerabilidade, egressos, pop. rua | 18+ | S | Produtivo | Presencial | Temporário | renda_trabalho | inserção formal pós-programa | Municipal | Municipal | A confirmar | ativo | — | Bolsa R$ 710 + cesta. Modalidades: Costura, Serviços Gerais |
| CUIDAR | Programa Cuidar | A | servico | saude | Municipal | Fundo Social | FUNDO_SOCIAL | Gestantes a partir da 34ª semana | — | Parcial | Básica/Intersetorial | Encaminhamento | Temporário | capital_humano | gestantes acompanhadas | Municipal | Municipal | Lei 3.955/2022 | ativo | 2022-10-00 | — |
| CAPACITA | Projeto Capacita | D | qualificacao | emprego_renda | Municipal | SMIDS | CQP_I | Pessoas em vulnerabilidade — qualificação | 16+ | S | Produtivo | Presencial | Temporário | renda_trabalho | concluintes com certificado | Municipal | Municipal | A confirmar | ativo | — | Verificar distinção vs Capacita Hortolândia (Fundo Social) |
| COSTURA_IND | Projeto Costura Industrial | D | qualificacao | emprego_renda | Municipal | SMIDS | CQP_II | Pessoas em vulnerabilidade — setor têxtil | 18+ | S | Produtivo | Presencial | Temporário | renda_trabalho | concluintes com vínculo formal | Municipal | Municipal | A confirmar | ativo | — | Modalidade ACERTE. Benefício: R$ 710 + cesta |
| FARMACIA_SOL | Farmácia Solidária | A | beneficio | saude | Municipal | SMIDS | SEC_INCLUSAO | Pessoas em vulnerabilidade socioeconômica | Todas | A confirmar | Básica/Saúde | Presencial | Continuado | capital_humano | medicamentos dispensados / mês | Municipal | Municipal | A confirmar | ativo | — | Detalhar critério de acesso |
| FEIRAS_EMPREEND | Feiras de Empreendedores | A | servico | emprego_renda | Municipal | SMIDS | CESP | Empreendedores em vulnerabilidade | Todas | Indireto | Produtivo | Espontâneo | Continuado | renda_trabalho | feirantes ativos / edição | Municipal | Municipal | A confirmar | ativo | — | — |
| RESSIGNIFICA | Programa Ressignifica Hortolândia | A | servico | assistencia_social | Intersetorial | SMIDS | CENTROPOP_01 | Moradores em situação de rua | 18+ (perfil: 29-48a, masc., fund. incompleto, +1 ano rua) | S | Especial-Alta/Intersetorial | Encaminhamento | Continuado | multidimensional | beneficiários com inserção produtiva ou moradia estável | Municipal | Municipal + Decreto 7.053/2009 | A confirmar | ativo | 2023-12-05 | Programa guarda-chuva intersetorial (Gov, Inclusão, Habitação, Seg. Pública, Educação, Esportes, Saúde). Lançado no CFPF Remanso Campineiro. Cap. inicial: 30 vagas com expansão prevista. Elegibilidade: metas — frequência saúde + cursos capacitação + oficinas planejamento familiar. Ativa os programas: CENTROPOP, ABORDAGEM_SOCIAL, ABRIGO_ADULTOS, REPUBLICA, ACERTE. Inclui bolsa + cesta + auxílio aluguel. Nota arquitetural: atendimento RESSIGNIFICA gera atendimentos-filho em programas ativados — modelar em FATO_ATENDIMENTO. |
| BOLSA_CRECHE | Bolsa Creche | A | beneficio | educacao | Municipal | Educação | SEC_EDUCACAO | Crianças sem vaga na rede pública | 6 meses-3a6m | S | Básica | Encaminhamento | Continuado | capital_humano | crianças beneficiadas | Municipal | Municipal | A confirmar | ativo | — | — |
| INSCRICAO_CMAS | Inscrição de OSCs no CMAS | B | instrumento | governanca | Municipal | SMIDS | SEC_INCLUSAO | Organizações da Sociedade Civil | — | N | — | Presencial | — | governanca | OSCs inscritas e ativas | Municipal | LOAS | Lei 3.911/2021 | ativo | — | — |
| INSCRICAO_CMDCA | Inscrição de OSCs no CMDCA | B | instrumento | governanca | Municipal | SMIDS | SEC_INCLUSAO | OSCs voltadas à criança e adolescente | — | N | — | Presencial | — | governanca | OSCs inscritas e ativas | Municipal | ECA | A confirmar | ativo | — | — |
| CRIANCA_FELIZ | Programa Criança Feliz | A | servico | educacao | Federal | SMIDS | OSC_A_CONFIRMAR | Gestantes, crianças 0-6 anos em vulnerabilidade | 0-6 | S | Básica/Intersetorial | Encaminhamento | Continuado | capital_humano | visitas domiciliares realizadas / mês | Municipal | Decreto Federal 8.869/2016 | A confirmar | ativo | — | Atendimento domiciliar primeira infância. OSC executora a identificar. CMDCA solicitou dados operacionais via ofício mar/2026 |

---

## Grupo 5 — Segurança Alimentar

| id_programa | nome_programa | tipo | tipo_entrega | categoria | esfera | secretaria_responsavel | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | dimensao_ivs | indicador_principal | abrangencia_nucleo | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| BAH | Banco de Alimentos de Hortolândia | A | transferencia | seguranca_alimentar | Municipal | Educação | DEP_SEG_ALIMENTAR | Pop. em insegurança via 19 OSCs parceiras | Todas | Indireto | Alimentar | Encaminhamento | Continuado | renda_trabalho | pessoas atendidas / toneladas distribuídas | Municipal | Municipal | A confirmar | ativo | 2007-00-00 | 19 org / 1.762 pessoas (2024) |
| PAA | Programa de Aquisição de Alimentos | A | transferencia | seguranca_alimentar | Federal | Educação | DEP_SEG_ALIMENTAR | Agricultores familiares + beneficiários BAH | Todas | Indireto | Alimentar | Encaminhamento | Continuado | renda_trabalho | agricultores credenciados / famílias beneficiadas | Municipal | Lei 10.696/2003 | A confirmar | ativo | — | Credenciamento publicado DO MAR06/2026 — ciclo ativo |
| CESTAS | Distribuição de Cestas Básicas | A | beneficio | seguranca_alimentar | Municipal | SMIDS / Fundo Social | FUNDO_SOCIAL | Famílias em vulnerabilidade | Todas | S | Alimentar | Encaminhamento | Imediato | renda_trabalho | cestas distribuídas / mês | Municipal | Municipal | Decreto 5.598/2025 | ativo | — | — |
| CREAN | Centro de Referência em Educação Alimentar e Nutricional | A | equipamento | seguranca_alimentar | Municipal | Educação | DEP_SEG_ALIMENTAR | Comunidade | Todas | — | Alimentar | Presencial | Continuado | capital_humano | atendimentos realizados | A confirmar | Municipal | A confirmar | planejamento | 2023-04-00 | Previsto para Jd. Terras de Santa Maria |
| COZINHA_COM | Cozinha Comunitária | A | servico | seguranca_alimentar | Municipal | Educação | DEP_SEG_ALIMENTAR | Comunidade | Todas | — | Alimentar | Espontâneo | Continuado | renda_trabalho | refeições servidas / mês | A confirmar | Municipal | A confirmar | ativo | — | Verificar distinção vs Escola Comunitária Jd. Novo Ângulo |

---

## Grupo 6 — Habitação

| id_programa | nome_programa | tipo | tipo_entrega | categoria | esfera | secretaria_responsavel | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | dimensao_ivs | indicador_principal | abrangencia_nucleo | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| AGORA_CASA | Agora a Casa é Sua | A | beneficio | habitacao | Municipal | Habitação | SEC_HABITACAO | Famílias em situação irregular | Todas | Indireto | — | Encaminhamento | Temporário | infraestrutura_urbana | títulos emitidos | Municipal | Municipal | A confirmar | ativo | — | ~3.000 títulos 2021-2024 |
| VIDA_LONGA | Programa Vida Longa (Estadual) | A | beneficio | habitacao | Estadual | Habitação | SEC_HABITACAO | Idosos >= 60 anos residentes >= 2 anos | 60+ | S | — | Encaminhamento | A confirmar | infraestrutura_urbana | unidades habitacionais entregues | Municipal | Estadual | A confirmar | planejamento | — | 28 unidades — negociação ativa |
| MCMV | Minha Casa, Minha Vida — Hortolândia | A | beneficio | habitacao | Federal | Habitação | SEC_HABITACAO | Famílias em vulnerabilidade | Todas | S | — | Encaminhamento | Temporário | infraestrutura_urbana | unidades entregues | Municipal | PBF / CadÚnico | Lei 14.620/2023 | ativo | 2026-00-00 | 400 unidades — Jd. Amanda |
| PHLIS | Plano Municipal de Habitação de Interesse Social | B | instrumento | habitacao | Municipal | Habitação | SEC_HABITACAO | Município | Todas | — | — | — | Continuado | infraestrutura_urbana | metas do plano cumpridas | Municipal | Municipal | A confirmar | ativo | — | Instrumento de planejamento |

---

## Grupo 7 — Inserção Produtiva e Qualificação

| id_programa | nome_programa | tipo | tipo_entrega | categoria | esfera | secretaria_responsavel | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | dimensao_ivs | indicador_principal | abrangencia_nucleo | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PAT | Posto de Atendimento ao Trabalhador | C | equipamento | emprego_renda | Estadual/Municipal | Sec. Des. Econômico | PAT_01 | Desempregados em geral, PCD | 18+ | Indireto | Produtivo | Presencial | Continuado | renda_trabalho | encaminhamentos com inserção formal | Municipal | Lei 7.998/1990 | A confirmar | ativo | — | Cruzamento CadÚnico x mercado formal |
| PAT_VAGAS | Cadastro de Vagas por Empresa — PAT | A | servico | emprego_renda | Estadual/Municipal | Sec. Des. Econômico | PAT_01 | Empresas (oferta) + trabalhadores (demanda) | 18+ | Indireto | Produtivo | Presencial | Continuado | renda_trabalho | vagas preenchidas / mês | Municipal | Lei 7.998/1990 | A confirmar | ativo | — | — |
| SINE | Cadastro no SINE e Encaminhamento para Vagas | A | servico | emprego_renda | Federal | Sec. Des. Econômico | PAT_01 | Trabalhadores desempregados | 18+ | Indireto | Produtivo | Presencial | Continuado | renda_trabalho | trabalhadores inseridos via SINE | Municipal | Lei 7.998/1990 | A confirmar | ativo | 2026-02-00 | Adesão formal fev/2026 |
| PEI | Polo de Empregabilidade Inclusiva | D | qualificacao | emprego_renda | Estadual/Municipal | SMIDS | DEP_PCD | PCD em busca de inserção no mercado | 18+ | A confirmar | Produtivo | Presencial | Continuado | renda_trabalho | PCD com vínculo formal após programa | Municipal | Estadual + Municipal | A confirmar | ativo | 2026-02-00 | Pendência #23 |
| BANCO_POVO | Banco do Povo | A | beneficio | emprego_renda | Estadual | Sec. Des. Econômico | EXT_DESENVOLVE_SP | MEI, ME, EPP, LTDA, EIRELI | 18+ | A confirmar | Produtivo | Presencial | — | renda_trabalho | crédito concedido / empregos gerados | Municipal | Lei 9.533/1997 | A confirmar | ativo | — | Executor: Desenvolve SP |
| ORIENT_MEI | Orientação ao MEI | A | servico | emprego_renda | Municipal | Sec. Des. Econômico | DEP_EMPREEND | MEIs | 18+ | Indireto | Produtivo | Presencial | Continuado | renda_trabalho | MEIs orientados / formalizados | Municipal | LC 128/2008 | A confirmar | ativo | — | — |
| SEBRAE_AQUI | SEBRAE Aqui | A | servico | emprego_renda | Estadual | Sec. Des. Econômico | EXT_SEBRAE_SP | Empreendedores | 18+ | Indireto | Produtivo | Presencial | Continuado | renda_trabalho | empreendedores atendidos | Municipal | Outro | A confirmar | ativo | — | — |
| SEG_DESEMPREGO | Seguro Desemprego | A | beneficio | emprego_renda | Federal | Sec. Des. Econômico | PAT_01 | Trabalhador formal dispensado sem justa causa | 18+ | Indireto | Produtivo | Presencial | Temporário | renda_trabalho | beneficiários ativos | Municipal | Lei 7.998/1990 | A confirmar | ativo | — | Esgotamento leva a entrada previsível no CadÚnico |
| FEIRAS_LIVRES | Feiras Livres e Noturnas | A | servico | emprego_renda | Municipal | Sec. Des. Econômico | SEC_DES_ECONOMICO | Feirantes + população geral | Todas | Indireto | Produtivo | Espontâneo | Continuado | renda_trabalho | feirantes ativos | Municipal | Municipal | A confirmar | ativo | — | 7 núcleos; 5 coincidem com áreas de CRAS |
| FUNDO_CURSOS | Fundo Social — Cursos Profissionalizantes | D | qualificacao | emprego_renda | Municipal | Fundo Social | FUNDO_SOCIAL | Pessoas 16+ em vulnerabilidade | 16+ | Indireto | Produtivo | Presencial | Temporário | renda_trabalho | concluintes com certificado | Municipal | Municipal | A confirmar | ativo | — | SENAI (alvenaria + assist. RH) jan/2026 |
| MEU_EMPREGO | Programa Meu Emprego — Trabalho em Equipe | D | qualificacao | emprego_renda | Estadual/Municipal | SMIDS | DEP_DIPGR | Jovens 16-20 + desempregados +3 meses | 16-35 | Indireto | Produtivo | Presencial | Continuado | renda_trabalho | inserção formal pós-programa | Municipal | Outro | A confirmar | ativo | — | — |
| DECOLA | DECOLA | D | qualificacao | emprego_renda | Municipal | SMIDS | DEP_DIPGR | A confirmar — empregabilidade | 18+ | A confirmar | Produtivo | Presencial | Continuado | renda_trabalho | A confirmar | Municipal | Municipal | A confirmar | ativo | — | Pendência #20 |
| APRENDIZ_SOCIAL | Aprendiz Social | D | qualificacao | emprego_renda | Municipal | SMIDS | DEP_DIPGR | Jovens — formação para o mercado | 16-24 | A confirmar | Produtivo | Presencial | Continuado | renda_trabalho | jovens com primeiro emprego | Municipal | Municipal | A confirmar | ativo | — | Pendência #20 |
| FATEC | Fatec Hortolândia | B | instrumento | educacao | Estadual | Sec. Des. Econômico | EXT_CENTRO_PAULA_SOUZA | Jovens e adultos — ensino superior tecnológico | 18+ | Indireto | Educacional | Presencial | Continuado | renda_trabalho | matrículas de residentes em Hortolândia | Municipal | Estadual | A confirmar | estudo_viabilidade | — | Pendências #17 e #22. Fórum 17/03/2026: presidente Centro Paula Souza confirma sem prazo definido |
| EMPREGA_HORTOLANDIA | Emprega Hortolândia — Política Pública de Empregabilidade | B | instrumento | emprego_renda | Municipal | Sec. Des. Econômico | SEC_DES_ECONOMICO | Trabalhadores residentes e empresas instaladas | Todas | Indireto | Produtivo | Misto | Continuado | renda_trabalho | trabalhadores inseridos formalmente / vagas preenchidas | Municipal | Municipal | A confirmar | ativo | 2025-00-00 | Política guarda-chuva com três pilares: PAT (divulgação de vagas), Feirão do Emprego (evento semestral) e App de Currículos (fase de testes). Anunciada no 1º Fórum de Empregabilidade em 17/03/2026. Secretário responsável: Dimas Corrêa Pádua |
| FEIRAO_EMPREGO | Feirão do Emprego | A | servico | emprego_renda | Municipal | Sec. Des. Econômico | SEC_DES_ECONOMICO | Trabalhadores em busca de emprego + empresas | 18+ | Indireto | Produtivo | Presencial | Temporário | renda_trabalho | trabalhadores atendidos / contratações realizadas no evento | Municipal | Municipal | A confirmar | ativo | 2025-00-00 | Pilar 2 da política Emprega Hortolândia. 2ª edição (out/2025): 2.000 pessoas atendidas. Periodicidade semestral. Interface direta com RT_02 (taxa de desocupação) |
| APP_CURRICULOS | Aplicativo de Banco de Currículos — Emprega Hortolândia | B | instrumento | emprego_renda | Municipal | Sec. Des. Econômico | SEC_DES_ECONOMICO | Trabalhadores residentes + empresas locais e regionais | 18+ | Indireto | Produtivo | Digital | Continuado | renda_trabalho | currículos cadastrados / vagas preenchidas via app | Municipal | Municipal | A confirmar | planejamento | 2026-05-00 | Pilar 3 da política Emprega Hortolândia. Anunciado no 1º Fórum de Empregabilidade (17/03/2026). Em fase de testes — pré-cadastro de empresas disponível. Lançamento oficial previsto para maio/2026, mês do trabalhador, em comemoração aos 35 anos de emancipação. Link pré-cadastro: https://bitily.me/IZsZR |

---

## Grupo 8 — Públicos Específicos / Direitos Humanos

| id_programa | nome_programa | tipo | tipo_entrega | categoria | esfera | secretaria_responsavel | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | dimensao_ivs | indicador_principal | abrangencia_nucleo | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| POL_PCD | Cadastro e Políticas para PCD | B | instrumento | direitos_humanos | Municipal | Gov. (DPCD) | DEP_PCD | Pessoas com deficiência | Todas | Indireto | — | Presencial | Continuado | capital_humano | PCD cadastradas | Municipal | Lei 13.146/2015 | A confirmar | ativo | — | Res. Consolidação e Ampliação PCD em análise no CMAS (mar/2026) |
| POL_IDOSO | Políticas para Pessoa Idosa | B | instrumento | direitos_humanos | Municipal | Gov. (Dep. Dir. Humanos) | DEP_DIR_HUMANOS | Idosos em vulnerabilidade | 60+ | Indireto | — | — | Continuado | capital_humano | idosos atendidos na rede | Municipal | Lei 10.741/2003 | A confirmar | ativo | — | — |
| CCMI | Centro de Convivência da Melhor Idade | A | equipamento | direitos_humanos | Municipal | Gov. (Dep. Dir. Humanos) | DEP_DIR_HUMANOS | Idosos 60+ | 60+ | Indireto | — | Presencial | Continuado | capital_humano | frequentadores ativos / mês | Municipal | Municipal | A confirmar | ativo | — | Coord.: psicóloga Fernanda Fadiga |
| POL_JUVENTUDE | Políticas para a Juventude | B | instrumento | direitos_humanos | Municipal | Gov. (Dep. Dir. Humanos) | DEP_DIR_HUMANOS | Jovens 15-29 anos | 15-29 | — | — | — | Continuado | capital_humano | jovens atendidos na rede | Municipal | Lei 12.852/2013 | A confirmar | ativo | — | — |
| IGUALDADE_RACIAL | Políticas de Igualdade Racial | B | instrumento | direitos_humanos | Municipal | Gov. (Dep. Dir. Humanos) | DEP_DIR_HUMANOS | Pop. negra, indígena, comunidades tradicionais | Todas | — | — | — | Continuado | multidimensional | A confirmar | Municipal | Lei 12.288/2010 | A confirmar | ativo | — | — |
| CRAM | CRAM — Centro de Referência de Atendimento à Mulher | C | equipamento | direitos_humanos | Municipal | Gov. (Dep. Mulheres) | CRAM_01 | Mulheres em situação de violência | 18+ | Indireto | — | Espontâneo / Encaminhamento | Continuado | multidimensional | atendimentos / medidas protetivas solicitadas | Municipal | Lei 11.340/2006 | A confirmar | ativo | — | 293 atend. jan-mar/2026; 94 medidas protetivas jan-fev/2026 |
| CLOSET_SOL | Closet Solidário | A | beneficio | direitos_humanos | Municipal | Gov. (Dep. Mulheres) | CRAM_01 + FUNDO_SOCIAL | Mulheres atendidas pelo CRAM | 18+ | Indireto | — | Encaminhamento (via CRAM) | Continuado | capital_humano | peças doadas / mulheres atendidas | Municipal | Municipal | A confirmar | ativo | 2026-03-09 | — |
| VIVA_MAIS | Viva Mais | A | servico | saude | Municipal | Gov. (Dep. Rel. Inst.) | DEP_DIPGR | Comunidade geral | Todas | Indireto | — | Espontâneo | Continuado | capital_humano | A confirmar | Municipal | Municipal | A confirmar | ativo | — | — |
| AMBULATORIO_TRANS | Ambulatório Trans | A | servico | saude | Municipal | Saúde | SEC_SAUDE | População transexual | 18+ | Indireto | — | Espontâneo | Continuado | capital_humano | atendimentos / mês | Municipal | Municipal | A confirmar | ativo | 2024-01-00 | — |
| COM_PRIMEIRA_INF | Comitê Intersetorial de Políticas para a Primeira Infância | B | instrumento | educacao | Municipal | Educação | SEC_EDUCACAO | Crianças 0-6 anos | 0-6 | — | — | — | Continuado | capital_humano | deliberações implementadas | Municipal | Lei 13.257/2016 | A confirmar | ativo | — | — |
| CASA_MULHER_BR | Casa da Mulher Brasileira — Hortolândia | C | equipamento | direitos_humanos | Federal | Gov. (Dep. Mulheres) | OSC_A_CONFIRMAR | Mulheres em situação de violência — acolhimento integrado | 18+ | Indireto | Especial-Alta/Intersetorial | Encaminhamento | Continuado | multidimensional | mulheres atendidas / encaminhamentos realizados | Municipal | Federal — Programa Mulher Viver | A confirmar | planejamento | — | Ministra Márcia Lopes confirmou apoio à implantação em 18/03/2026 (agenda Jardim Amanda). Integra acolhimento, triagem, apoio psicossocial, delegacia, juizado, MP, defensoria, autonomia econômica, brinquedoteca, alojamento de passagem e central de transportes. Hortolândia pode liderar consórcio regional. Prefeito protocolou ofício à ministra. |
| ELES_ELAS | Movimento Eles Por Elas Hortolândia | B | instrumento | direitos_humanos | Municipal | Gov. (Dep. Mulheres) | DEP_MULHERES | População masculina — conscientização contra violência | Todas (foco 10-29) | N | — | Presencial / Espontâneo | Continuado | multidimensional | ações educativas realizadas / comunidades alcançadas | Municipal | Municipal | A confirmar | ativo | 2026-03-00 | Iniciativa do vereador Nei Prazeres + voluntários (saúde mental, advogados, lideranças). Conscientização masculina para prevenir violência contra mulheres. Apresentado à ministra Márcia Lopes em 18/03/2026. Atuação em comunidades religiosas, escolas, empresas. |

---

## Grupo 9 — Formação Cultural

| id_programa | nome_programa | tipo | tipo_entrega | categoria | esfera | secretaria_responsavel | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | dimensao_ivs | indicador_principal | abrangencia_nucleo | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| FORMACOES_CULT | Formações Culturais (bloco) | A | servico | cultura | Municipal | Cultura | DEP_CULTURA | Comunidade geral — acesso universal e gratuito | Todas | Indireto | — | Presencial / Espontâneo | Continuado | capital_humano | matrículas ativas | Municipal | Municipal | A confirmar | ativo | — | Verificar registro de matrículas para FATO_ATENDIMENTO |

---

## Grupo 10 — Serviços de Saúde com Interface SUAS

| id_programa | nome_programa | tipo | tipo_entrega | categoria | esfera | secretaria_responsavel | id_orgao_executor | publico_alvo | faixa_etaria | vinculo_cadunico | nivel_protecao | acesso | prazo_execucao | dimensao_ivs | indicador_principal | abrangencia_nucleo | base_legal_principal | base_legal_municipal | status_programa | data_inicio | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| SAMU | SAMU Regional Hortolândia e Sumaré | A | servico | saude | Federal/Municipal | Saúde | SEC_SAUDE | Pop. geral em urgência/emergência | Todas | Indireto | — | Espontâneo | Imediato | capital_humano | ocorrências atendidas / tempo médio resposta | Municipal | Lei 8.080/1990 | A confirmar | ativo | — | Abrangência: Hortolândia + Sumaré |
| VILA_SAUDE | Vila da Saúde | A | equipamento | saude | Municipal | A confirmar | A confirmar | Pop. geral | Todas | A confirmar | — | — | — | capital_humano | A confirmar | Municipal | A confirmar | A confirmar | planejamento | — | Intenção declarada jan/2026 — sem prazo |

---

## Grupo 11 — Governança e Conselhos

| id_programa | nome_programa | tipo | tipo_entrega | categoria | esfera | id_orgao_executor | secretaria_responsavel | vinculo_cadunico | dimensao_ivs | indicador_principal | abrangencia_nucleo | base_legal_principal | base_legal_municipal | status_programa |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COMSEA | Conselho Municipal de Segurança Alimentar | B | instrumento | governanca | Municipal | SEC_EDUCACAO | Educação | N | governanca | reuniões realizadas / deliberações implementadas | Municipal | Municipal | A confirmar | ativo |
| CAISAN | Câmara Intersetorial de Segurança Alimentar | B | instrumento | governanca | Municipal | SEC_EDUCACAO | Educação | N | governanca | planos de ação aprovados | Municipal | Municipal | A confirmar | ativo |
| CMPcD | Conselho Municipal da PCD | B | instrumento | governanca | Municipal | DEP_PCD | Gov. (DPCD) | N | governanca | deliberações implementadas | Municipal | Lei 13.146/2015 | A confirmar | ativo |
| CMDCA | Conselho Direitos da Criança e Adolescente | B | instrumento | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | governanca | deliberações implementadas | Municipal | ECA | A confirmar | ativo |
| CMAS | Conselho Municipal de Assistência Social | B | instrumento | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | governanca | resoluções publicadas / planos aprovados | Municipal | LOAS | Lei 3.911/2021 | ativo |
| CMI | Conselho Municipal do Idoso | B | instrumento | governanca | Municipal | DEP_DIR_HUMANOS | Gov. (Dep. Dir. Humanos) | N | governanca | deliberações implementadas | Municipal | Lei 10.741/2003 | A confirmar | ativo |
| COMJUV | Conselho Municipal da Juventude | B | instrumento | governanca | Municipal | DEP_DIR_HUMANOS | Gov. (Dep. Dir. Humanos) | N | governanca | deliberações implementadas | Municipal | Lei 12.852/2013 | A confirmar | ativo |
| COMPIR | Fórum Municipal de Igualdade Racial | B | instrumento | governanca | Municipal | DEP_DIR_HUMANOS | Gov. (Dep. Dir. Humanos) | N | governanca | deliberações implementadas | Municipal | Lei 12.288/2010 | A confirmar | ativo |
| CT_I | Conselho Tutelar I | C | servico | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | governanca | medidas aplicadas / casos encerrados | Municipal | ECA | A confirmar | ativo |
| CT_II | Conselho Tutelar II | C | servico | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | governanca | medidas aplicadas / casos encerrados | Municipal | ECA | A confirmar | ativo |
| CMDM | Conselho Municipal Direitos da Mulher | B | instrumento | governanca | Municipal | DEP_MULHERES | Gov. (Dep. Mulheres) | N | governanca | deliberações implementadas | Municipal | Municipal | A confirmar | ativo |
| PMAS | Plano Municipal de Assistência Social 2026-2029 | B | instrumento | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | governanca | metas do PMAS cumpridas | Municipal | LOAS | Lei 3.911/2021 | ativo |
| COMISSAO_VD | Comissão Intersetorial — Plano de Metas de Enfrentamento à Violência Doméstica | B | instrumento | governanca | Municipal | SEC_INCLUSAO | SMIDS | N | governanca | metas do Plano cumpridas | Municipal | Lei 11.340/2006 + Lei Federal 14.899/2024 | Decreto 5.810/2026 | ativo |

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "11/03/2026" | Criação — extraído de `dim_programas_sociais_v12.md` |
| v02 | "11/03/2026" | Adição dos campos: cod_programa, departamento_executor, faixa_etaria, acesso, prazo_execucao, contato |
| v03 | "15/03/2026" | Atualizações DO (edições 2691, 2712, 2715): OSC_ESPERANCAR encerrada; OSC_SAO_PEDRO como executor consolidado; Instituto Recrie; CRIANCA_FELIZ; PMAS; COMISSAO_VD |
| v04 | "15/03/2026" | Três novos campos: tipo_entrega, indicador_principal, abrangencia_nucleo; remoção de contato e departamento_executor das colunas visíveis; atualização FEIRAS_LIVRES |
| v05 | "18/03/2026" | Grupo 7: EMPREGA_HORTOLANDIA, FEIRAO_EMPREGO e APP_CURRICULOS adicionados. Total: 67. |
| v06 | "19/03/2026" | Grupo 8: dois novos programas — CASA_MULHER_BR e ELES_ELAS. Total: 69. |
| v07 | "26/03/2026" | RESSIGNIFICA enriquecido com dados do portal da prefeitura. Total: 69. |
| v08 | "31/03/2026" | CENTROPOP, EMERGENCIAS e FUNDO_EMERG: campo observacoes enriquecido com dados operacionais do SIGAS (ata de levantamento técnico mar/2026). Total: 69. |

---

*Documento de modelagem relacional — 01_modelagem_conceitual/*  
*Atlas Social de Hortolândia — uso interno*
im_v08.md…]()
