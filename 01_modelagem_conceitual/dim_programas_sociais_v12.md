# DIM_PROGRAMA — Catálogo de Programas Sociais
**Versão:** 12
**Data de atualização:** 11/03/2026
**Versão anterior:** 11 (10/03/2026)
**Atualizações v12:**
- Adição do programa **PEI — Polo de Empregabilidade Inclusiva** (Grupo 7) — parceria municipal com Estado via Secretaria de Direitos da PCD; iniciado fev/2026 no Paço Municipal. Fonte: Tribuna Liberal, 11/03/2026
- Atualização do **SINE** — inclusão de `data_inicio: fevereiro/2026` (data formal de adesão ao Sistema Nacional de Emprego). Fonte: Tribuna Liberal, 11/03/2026
- Abertura da **Pendência #22**: conflito de fonte sobre local da reunião de estudo de viabilidade da Fatec (09/03/2026) — jornal 10/03 e 11/03 registram "Câmara Municipal"; v11 corrigiu para "SMIDS" com base em Caio [RH PMH]. Verificar com fonte interna.

**Responsável:** Ailton Vendramini
**Repositório:** pmh-arquitetura-dados-sociais
**Fontes das atualizações v12:** Tribuna Liberal nº 9.697, 11/03/2026

---

## Nota Metodológica

Este catálogo foi extraído a partir de levantamento documental cobrindo o 2º semestre de 2023
e o 1º semestre de 2024. A partir da v02, incorpora atualizações via radar jornalístico
(Tribuna Liberal). A partir da v03, incorpora varredura do site oficial da Prefeitura. A v04
consolida ciclo jornalístico dez/2025–jan/2026. A v05 detalha serviços das Secretarias de
Inclusão e Desenvolvimento Econômico. A v06 adiciona `base_legal_principal`. A v07 adiciona
`esfera`, `id_orgao_executor`, `nome_orgao_executor` e `base_legal_municipal`. A v08 incorpora
correções e adições do ciclo jornalístico 04–08/03/2026. A v09 adiciona `dimensao_ivs` a todos
os programas, conectando o catálogo à DIM_VARIAVEL_IVS e ao IVS-H. A v10 incorpora ciclo
jornalístico 10/03/2026. A v11 incorpora correções e adições provenientes da Ata de Reunião
Técnica SMIDS (10/02/2026 v02) e de comunicação direta com Caio [RH PMH], incluindo separação
da Casa de Passagem por nível de complexidade, catalogação das modalidades de Alta Complexidade
e adição de DECOLA e Aprendiz Social. A v12 incorpora ciclo jornalístico 11/03/2026: adição do
PEI, atualização do SINE com data de adesão formal e abertura da Pendência #22 (Fatec —
conflito de fonte sobre local da reunião).

**Tipo funcional:**
- **Tipo A — Serviço Direto:** gera atendimento registrável
- **Tipo B — Política Articulada:** define diretrizes, não gera atendimento direto

---

## Fundamento Metodológico — IVS e IVS-H

O campo `dimensao_ivs` presente em cada programa deste catálogo está
fundamentado no **Índice de Vulnerabilidade Social (IVS)**, desenvolvido
pelo **IPEA em parceria com o IBGE** e publicado no
**Atlas da Vulnerabilidade Social (2015)**. O IVS organiza a
vulnerabilidade social em três dimensões — **Infraestrutura Urbana**,
**Capital Humano** e **Renda e Trabalho** — calculadas a partir de
variáveis do Censo Demográfico por setor censitário.

Para este projeto, as mesmas dimensões e variáveis do IVS nacional foram
aplicadas ao território de **Hortolândia**, gerando o que denominamos
**IVS-H (Índice de Vulnerabilidade Social de Hortolândia)**. Não há
alteração metodológica — o que muda é a escala geográfica: do Brasil
para os setores censitários do município.

A classificação `dimensao_ivs` de cada programa não é arbitrária.
Ela registra **em qual dimensão do IVS-H o programa atua**, permitindo
futuramente cruzar a cobertura programática com a intensidade de
vulnerabilidade territorial — respondendo, por exemplo:
*"Os programas de renda e trabalho estão concentrados nos setores
censitários com maior vulnerabilidade nessa dimensão?"*

A relação completa das variáveis IVS utilizadas está documentada em
`DIM_VARIAVEL_IVS v01`.

---

## Estrutura do DIM_PROGRAMA

```
id_programa
cod_programa
nome_programa
tipo_programa            (A = Serviço Direto | B = Política Articuladora)
categoria
esfera                   (Federal | Estadual | Municipal | Intersetorial)
secretaria_responsavel
departamento_executor
id_orgao_executor        (FK → DIM_UNIDADES_ATENDIMENTO | DIM_GESTORES)
nome_orgao_executor      (legível para consulta humana)
secretarias_parceiras
operador_externo
publico_alvo
faixa_etaria
vinculo_cadunico         (S/N)
nivel_protecao
acesso                   (Presencial | Digital | Espontâneo | Encaminhamento)
prazo_execucao
contato
dimensao_ivs             (infraestrutura_urbana | capital_humano |
                          renda_trabalho | multidimensional | governanca)
base_legal_principal     (LOAS | CNAS 109/2009 | PBF | CadÚnico |
                          ECA | Municipal | Estadual | Outro)
base_legal_municipal     (lei/decreto municipal específico, se houver)
ativo                    (S/N)
data_inicio
observacoes
```

**Valores de `dimensao_ivs`:**

| Valor | Significado | Exemplos |
|-------|-------------|---------|
| `infraestrutura_urbana` | Saneamento, moradia, mobilidade | MCMV, Agora a Casa é Sua, PHLIS |
| `capital_humano` | Educação, saúde, infância, maternidade | SCFV, Cuidar, Bolsa Creche, PAEFI |
| `renda_trabalho` | Emprego, renda, informalidade | ACERTE, PAT, Banco do Povo, BF |
| `multidimensional` | Atua em 2+ dimensões simultaneamente | PAIF, Ressignifica, CRAS/CREAS |
| `governanca` | Conselhos e instrumentos de controle social | CMAS, CMDCA, Conselhos Tutelares |

**Padrão de `id_orgao_executor`:**

```
CRAS_{NOME}         → unidades CRAS
CREAS_01            → CREAS
CENTROPOP_01        → Centro POP
CRAM_01             → CRAM
CQP_I / CQP_II      → Centros de Qualificação
CESP                → Centro de Empreendimentos Solidários
PAT_01              → PAT
OSC_{NOME}          → OSCs conveniadas
EXT_{NOME}          → operadores externos (SEBRAE, Desenvolve SP)
SEC_{SIGLA}         → secretarias
DEP_{NOME}          → departamentos
FUNDO_SOCIAL        → Fundo Social
```

**Nota sobre `base_legal_principal`:**
Campo de referência rápida — denormalização consciente para consultas sem JOIN.
A relação completa norma × programa está em REL_NORMA_PROGRAMA.

---

## Grupo 1 — Proteção Social Básica

---

### PAIF — Serviço de Proteção e Atendimento Integral às Famílias

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `CRAS_SANTA_CLARA` · `CRAS_AMANDA` · `CRAS_NOVO_ANGULO` · `CRAS_ROSOLEM` · `CRAS_PRIMAVERA` · `CRAS_BRASIL` · `CRAS_VILA_REAL`
- **nome_orgao_executor:** 7 CRAS municipais
- **Público-alvo:** Famílias em situação de vulnerabilidade
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Dimensão IVS:** `multidimensional` — atua nas três dimensões simultaneamente: acompanha renda (RT), fortalece capital humano (CH) e articula acesso a moradia e infraestrutura (IU)
- **Base legal principal:** CNAS 109/2009
- **Observações:** Serviço central dos CRAS e porta de entrada da Proteção Social Básica. Tem caráter preventivo — atua junto a famílias em situação de vulnerabilidade antes que ocorra violação de direitos. Fonte: Ata SMIDS 10/02/2026.

| id | Unidade | Endereço | Telefone |
|----|---------|----------|----------|
| CRAS_SANTA_CLARA | CRAS Jardim Santa Clara | Rua Estados Unidos, 217, Jd. Santa Clara do Lago II | 3865-1133 / 3897-2519 |
| CRAS_AMANDA | CRAS Jardim Amanda | Av. Tarsila do Amaral, 540, Jd. Amanda II | 3819-7619 / 3865-7276 |
| CRAS_NOVO_ANGULO | CRAS Jardim Novo Ângulo | Rua Francisco Bereta, 330, Jd. Novo Ângulo | 3809-1945 / 3845-7629 |
| CRAS_ROSOLEM | CRAS Rosolém — Joel Alves Assunção | Rua Guido Rosolém, 177, Jardim Rosolém | 3809-3164 |
| CRAS_PRIMAVERA | CRAS Primavera — Chico Vigilante | Rua Amoreira, 35, Jd. Primavera | 3865-1225 / 3819-6899 |
| CRAS_BRASIL | CRAS Jardim Brasil — Maria Humilde Antunes (Zuma) | Rua da Amizade, 240, Jardim Brasil | 3909-1398 |
| CRAS_VILA_REAL | CRAS Vila Real | Rua Ernesto Bergamasco, 185, Vila Real | 3865-4269 |

---

### SCFV — Serviço de Convivência e Fortalecimento de Vínculos

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `CRAS_SANTA_CLARA` · `CRAS_AMANDA` · `CRAS_NOVO_ANGULO` · `CRAS_ROSOLEM` · `CRAS_PRIMAVERA` · `CRAS_BRASIL` · `CRAS_VILA_REAL`
- **nome_orgao_executor:** 7 CRAS municipais
- **Público-alvo:** Crianças, adolescentes, adultos e idosos em vulnerabilidade
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Dimensão IVS:** `capital_humano` — fortalece vínculos, frequência escolar e desenvolvimento de crianças/adolescentes/idosos — IVS CH
- **Base legal principal:** CNAS 109/2009
- **Base legal municipal:** Lei 3.911/2021

---

### CCS — Centro de Convivência Social (Jd. Rosolém)

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `CRAS_ROSOLEM`
- **nome_orgao_executor:** CRAS Rosolém / CCS Jd. Rosolém
- **Endereço:** Rua Guido Rosolém, 177, Jardim Rosolém
- **Público-alvo:** Comunidade geral da área de abrangência
- **Vínculo CadÚnico:** Parcial
- **Nível de proteção:** Básica
- **Dimensão IVS:** `capital_humano` — convivência comunitária e fortalecimento de vínculos — IVS CH
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** ⚠️ Verificar se permanece como equipamento distinto do CRAS Rosolém ou foi reintegrado.

---

## Grupo 2 — Proteção Social Especial — Média Complexidade

> Destinada a casos em que já houve violação de direitos. Opera por meio do CREAS e do Centro POP.
> Fonte: Ata de Reunião Técnica SMIDS, 10/02/2026 v02.

---

### PAEFI — Serviço de Proteção e Atendimento Especializado a Famílias e Indivíduos

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `CREAS_01`
- **nome_orgao_executor:** CREAS — Remanso Campineiro
- **Endereço:** Rua Francisco Castilho, 298, Remanso Campineiro
- **Contato:** (19) 3909-4546
- **Público-alvo:** Famílias com violação de direitos, violência, situações de risco
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Média Complexidade
- **Dimensão IVS:** `multidimensional` — violação de direitos cruza capital humano (CH), renda (RT) e condições de moradia (IU)
- **Base legal principal:** CNAS 109/2009
- **Base legal municipal:** Lei 3.911/2021

---

### Centro POP — Centro de Referência Especializado para População em Situação de Rua

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `CENTROPOP_01`
- **nome_orgao_executor:** Centro POP — Remanso Campineiro
- **Endereço:** Rua Maria Bernardes, 505, Remanso Campineiro
- **Contato:** centropop.smids@hortolandia.sp.gov.br / WhatsApp (19) 9 9976-1742
- **Público-alvo:** Adultos, adolescentes e famílias em situação de rua; vítimas de violação de direitos; uso de substâncias; sem moradia
- **Vínculo CadÚnico:** Parcial — acesso sem exigência de documentação
- **Nível de proteção:** Especial — Média Complexidade
- **Acesso:** Espontâneo ou encaminhamento — sem documentação
- **Prazo:** Imediato
- **Dimensão IVS:** `multidimensional` — população em rua concentra vulnerabilidades extremas nas três dimensões IVS
- **Base legal principal:** LOAS + CNAS 109/2009
- **Base legal municipal:** Lei 3.911/2021
- **Serviços ofertados:** Acolhimento e escuta; higiene pessoal; alimentação diária; encaminhamento para acolhimento; apoio à documentação; recâmbio para cidade de origem; reaproximação familiar
- **Observações:** O Centro POP inclui como subcomponente operacional a **Casa de Passagem de Triagem** (permanência de até 30 dias), onde os técnicos identificam o perfil do usuário para encaminhamento adequado à modalidade de Alta Complexidade correspondente. Esta Casa de Passagem de triagem é distinta da modalidade de acolhimento de Alta Complexidade listada no Grupo 3. Fonte: Ata SMIDS 10/02/2026.
- **⚠️ Nota arquitetural:** pessoas sem documentação não aparecem no CadÚnico — ponto cego estrutural.

---

### Serviço Especializado em Abordagem Social

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `CENTROPOP_01`
- **nome_orgao_executor:** Centro POP
- **Público-alvo:** População em situação de rua
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Média Complexidade
- **Dimensão IVS:** `multidimensional` — abordagem de rua — vulnerabilidade extrema nas três dimensões
- **Base legal principal:** CNAS 109/2009
- **Base legal municipal:** Lei 3.911/2021

---

### Serviço de Proteção Social a Adolescentes em Cumprimento de Medida Socioeducativa (LA e PSC)

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `CREAS_01`
- **nome_orgao_executor:** CREAS
- **Público-alvo:** Adolescentes em cumprimento de LA ou PSC
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Média Complexidade
- **Dimensão IVS:** `capital_humano` — medida socioeducativa incide sobre escolaridade, ocupação e vínculos — IVS CH
- **Base legal principal:** ECA + CNAS 109/2009
- **Base legal municipal:** A confirmar

---

### Serviço de Apoio a Famílias e Pessoas em Situação de Risco

- **Esfera:** `Intersetorial` (Federal/Municipal)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Secretaria de Inclusão e Desenvolvimento Social
- **Público-alvo:** Famílias e pessoas em situação de risco
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Média Complexidade
- **Dimensão IVS:** `multidimensional` — situação de risco — cruzamento das três dimensões IVS
- **Base legal principal:** LOAS
- **Base legal municipal:** Lei 3.911/2021

---

### Serviços de Emergência do Município

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **Secretarias parceiras:** Defesa Civil, Habitação, Saúde
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Secretaria de Inclusão (coordenação intersetorial)
- **Público-alvo:** Famílias desabrigadas por eventos climáticos
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Média Complexidade / Intersetorial
- **Dimensão IVS:** `multidimensional` — emergências sociais — vulnerabilidade aguda transversal
- **Base legal principal:** Municipal
- **Base legal municipal:** Decreto 5.598/2025
- **Observações:** Evento de referência: chuvas 26/02/2026 — 16 famílias acolhidas.

---

## Grupo 3 — Proteção Social Especial — Alta Complexidade

> Serviços de acolhimento institucional. Executados em sua maioria por Organizações da
> Sociedade Civil (OSCs) conveniadas ao município. Abrangem seis públicos e modalidades
> distintas. Fonte: Ata de Reunião Técnica SMIDS, 10/02/2026 v02.

---

### SAICA — Serviço de Acolhimento Institucional para Crianças e Adolescentes

- **Esfera:** `Intersetorial` (Federal/Municipal + OSC)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `OSC_A_CONFIRMAR`
- **nome_orgao_executor:** OSC conveniada — a confirmar
- **Público-alvo:** Crianças e adolescentes em situação de vulnerabilidade ou violação de direitos
- **Modalidades:** Casa-Lar ou Abrigo Institucional
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Dimensão IVS:** `capital_humano` — acolhimento de crianças e adolescentes — IVS CH: escolaridade, vínculo familiar, desenvolvimento
- **Base legal principal:** ECA + CNAS 109/2009
- **Base legal municipal:** A confirmar
- **Observações:** Objetivo principal: desenvolvimento de independência e autocuidado; vínculos de parentesco atendidos na mesma unidade. ⚠️ Pendência #19: identificar OSC executora e confirmar `id_orgao_executor`.

---

### Abrigo Institucional para Adultos e Famílias em Situação de Rua

- **Esfera:** `Intersetorial` (Municipal + OSC)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `OSC_ESPERANCAR`
- **nome_orgao_executor:** Instituto Esperançar (conveniado)
- **Público-alvo:** Adultos de 24 a 59 anos em situação de rua
- **Modalidades:** Abrigo (24–59 anos) + Casa de Passagem (até 30 dias — triagem via Centro POP)
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Acesso:** Encaminhamento obrigatório via Centro POP
- **Dimensão IVS:** `infraestrutura_urbana` — provisão de moradia temporária — IVS IU (domicílio inadequado)
- **Base legal principal:** LOAS + CNAS 109/2009
- **Base legal municipal:** A confirmar
- **Observações:** Objetivo principal: acesso à qualificação profissional e inclusão produtiva. Fluxo operacional: `Centro POP (triagem) → Casa de Passagem (até 30 dias) → Abrigo`. ⚠️ Nota arquitetural: a mesma pessoa gera múltiplos registros ao longo do fluxo — CPF é âncora obrigatória.

---

### Abrigo Institucional para Mulheres em Situação de Violência

- **Esfera:** `Intersetorial` (Municipal + OSC)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **Secretarias parceiras:** Dep. de Políticas Públicas para a Mulher
- **id_orgao_executor:** `OSC_A_CONFIRMAR`
- **nome_orgao_executor:** OSC conveniada — a confirmar
- **Público-alvo:** Mulheres em situação de violência doméstica ou sexual
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Acesso:** Encaminhamento — aceito sem Boletim de Ocorrência
- **Dimensão IVS:** `multidimensional` — violência contra a mulher — CH + RT (dependência econômica) + IU (ausência de moradia segura)
- **Base legal principal:** Outro (Lei 11.340/2006) + CNAS 109/2009
- **Base legal municipal:** A confirmar
- **Observações:** Objetivo principal: proteção e prevenção de continuidade da violência. Acesso sem B.O. é critério explícito — reduz barreira de entrada. ⚠️ Pendência #19: identificar OSC executora.

---

### Residência Inclusiva para Jovens e Adultos com Deficiência

- **Esfera:** `Intersetorial` (Federal/Municipal + OSC)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `OSC_A_CONFIRMAR`
- **nome_orgao_executor:** OSC conveniada — a confirmar
- **Público-alvo:** Jovens e adultos com deficiência em situação de dependência ou vulnerabilidade
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Dimensão IVS:** `capital_humano` — PCD em acolhimento — IVS CH (deficiência e inclusão)
- **Base legal principal:** LOAS + CNAS 109/2009 + Lei 13.146/2015
- **Base legal municipal:** A confirmar
- **Observações:** Objetivo principal: desenvolvimento de capacidades adaptativas para vida diária e inclusão produtiva. ⚠️ Pendência #19: identificar OSC executora.

---

### Casa-Lar e ILPI — Acolhimento para Idosos

- **Esfera:** `Intersetorial` (Federal/Municipal + OSC)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **Secretarias parceiras:** Dep. Direitos Humanos e Políticas Públicas
- **id_orgao_executor:** `OSC_A_CONFIRMAR`
- **nome_orgao_executor:** OSC conveniada — a confirmar
- **Público-alvo:** Idosos (60+) em situação de vulnerabilidade ou sem suporte familiar
- **Modalidades:** Casa-Lar / ILPI (Instituição de Longa Permanência para Idosos)
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Dimensão IVS:** `capital_humano` — acolhimento de idosos — IVS CH + RT_04 (dependência de idosos com renda ≤ ½ SM)
- **Base legal principal:** LOAS + CNAS 109/2009 + Lei 10.741/2003
- **Base legal municipal:** A confirmar
- **Observações:** Objetivo principal: protagonismo, independência e autocuidado. ⚠️ Pendência #19: identificar OSC executora.

---

### República — Acolhimento para Jovens e Adultos em Saída da Rua

- **Esfera:** `Intersetorial` (Municipal + OSC)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `OSC_A_CONFIRMAR`
- **nome_orgao_executor:** OSC conveniada — a confirmar
- **Público-alvo:** Jovens (18–21 anos) e adultos em processo de saída da situação de rua
- **Modalidades:** República masculina / República feminina — modelo de autogestão
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Dimensão IVS:** `renda_trabalho` — autonomia e inserção produtiva — IVS RT_02 (desocupação) e RT_03 (informalidade)
- **Base legal principal:** LOAS + CNAS 109/2009
- **Base legal municipal:** A confirmar
- **Observações:** Objetivo principal: autonomia — residentes gerenciam coletivamente a unidade. Perfil típico: já inseridos ou em vias de inserção no mercado de trabalho. Representa o estágio mais avançado da trajetória de saída da rua. ⚠️ Pendência #19: identificar OSC executora.

---

### Programa de Apadrinhamento para Crianças e Adolescentes em Acolhimento

- **Esfera:** `Intersetorial` (Federal/Municipal)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Sec. Inclusão / CMDCA
- **Público-alvo:** Crianças e adolescentes em acolhimento institucional
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Dimensão IVS:** `capital_humano` — crianças em acolhimento — IVS CH: escolaridade, vínculo familiar, desenvolvimento
- **Base legal principal:** ECA
- **Base legal municipal:** A confirmar
- **Observações:** Vinculado ao CMDCA. Apadrinhamento afetivo e/ou financeiro.

---

### Programa de Enfrentamento ao Trabalho Infantil

- **Esfera:** `Intersetorial` (Federal/Municipal)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `CREAS_01`
- **nome_orgao_executor:** CREAS / Conselho Tutelar
- **Público-alvo:** Crianças e adolescentes em situação de trabalho infantil
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Dimensão IVS:** `capital_humano` — combate ao trabalho infantil — IVS CH_08 (atividade de 10–14 anos)
- **Base legal principal:** ECA
- **Base legal municipal:** A confirmar
- **Observações:** Interface direta com Conselho Tutelar e CREAS.

---

### Serviço de Atendimento Domiciliar para PCD e Idosos

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Secretaria de Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas com deficiência e idosos em domicílio
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Especial — Alta Complexidade
- **Dimensão IVS:** `capital_humano` — atenção a PCD e idosos — IVS CH (mortalidade, deficiência) + RT (dependência de idosos)
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Serviço de Proteção Social Especial para PCD, Idosos e suas Famílias

- **Esfera:** `Intersetorial` (Federal/Municipal)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `CREAS_01`
- **nome_orgao_executor:** CREAS
- **Público-alvo:** Pessoas com deficiência, idosos e famílias
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Especial — Alta Complexidade
- **Dimensão IVS:** `capital_humano` — PCD e idosos: IVS CH + RT_04
- **Base legal principal:** LOAS + CNAS 109/2009
- **Base legal municipal:** Lei 3.911/2021

---

## Grupo 4 — Programas Municipais Específicos (Inclusão)

---

### FUNDO SOCIAL — Atendimento Emergencial

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Fundo Social de Solidariedade
- **id_orgao_executor:** `FUNDO_SOCIAL`
- **nome_orgao_executor:** Fundo Social de Solidariedade
- **Público-alvo:** Famílias em vulnerabilidade emergencial
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básico / Alimentar
- **Dimensão IVS:** `renda_trabalho` — transferência emergencial de renda e bens — IVS RT_01
- **Base legal principal:** Municipal
- **Base legal municipal:** Decreto 5.598/2025

---

### ACERTE — Ação Cidadã de Requalificação, Trabalho e Educação

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. Relações Institucionais)
- **id_orgao_executor:** `DEP_DIPGR`
- **nome_orgao_executor:** Dep. de Inclusão Produtiva e Gestão de Relações Institucionais
- **Público-alvo:** Pessoas em vulnerabilidade, egressos de programas sociais, população em situação de rua
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Produtivo
- **Benefício:** Bolsa-auxílio R$ 710 + cesta básica
- **Modalidades ativas (fev/2026):** Costura Industrial, Serviços Gerais
- **Dimensão IVS:** `renda_trabalho` — qualificação + intermediação de emprego — IVS RT_02 e RT_03
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** Requisito obrigatório do Programa Ressignifica Hortolândia. Caso Suelen (Tribuna Liberal 08/03/2026): trajetória documentada CRAS → ACERTE → assistente administrativa → emprego no próprio CRAS.

---

### Programa Cuidar

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Fundo Social de Solidariedade
- **id_orgao_executor:** `FUNDO_SOCIAL`
- **nome_orgao_executor:** Fundo Social de Solidariedade
- **Público-alvo:** Gestantes a partir da 34ª semana que realizam pré-natal na rede municipal
- **Vínculo CadÚnico:** Parcial
- **Nível de proteção:** Básico / Intersetorial
- **Origem:** Municipal — lançado outubro/2022
- **Dimensão IVS:** `capital_humano` — saúde materno-infantil — IVS CH_01 e CH_04
- **Base legal principal:** Municipal
- **Base legal municipal:** ✅ Lei 3.955/2022

---

### Projeto Capacita

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `CQP_I`
- **nome_orgao_executor:** CQP I — Centro de Qualificação Pessoal e Profissional
- **Endereço:** Rua Estados Unidos, 271, Jd. Santa Clara do Lago II
- **Público-alvo:** Pessoas em vulnerabilidade buscando qualificação profissional
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Produtivo
- **Dimensão IVS:** `renda_trabalho` — qualificação profissional — IVS RT_02 e RT_03
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** ⚠️ Verificar distinção em relação ao "Capacita Hortolândia" do Fundo Social.

---

### Projeto Costura Industrial

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `CQP_II`
- **nome_orgao_executor:** CQP II — Centro de Qualificação — Costura e Moda
- **Endereço:** Rua Eleusina Batista Silva, 14, Jd. Terras de Santo Antônio
- **Público-alvo:** Pessoas em vulnerabilidade buscando inserção no setor têxtil/industrial
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Produtivo
- **Dimensão IVS:** `renda_trabalho` — capacitação + inserção produtiva — IVS RT_02 e RT_03
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** Modalidade ativa do ACERTE (fev/2026). Benefício: R$ 710 + cesta básica.

---

### Farmácia Solidária

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Secretaria de Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas em vulnerabilidade socioeconômica
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Básico / Saúde
- **Dimensão IVS:** `capital_humano` — acesso a medicamentos — IVS CH
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** ⚠️ Detalhar critério de acesso e integração com farmácia popular federal.

---

### Feiras de Empreendedores

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `CESP`
- **nome_orgao_executor:** CESP — Centro de Empreendimentos Solidários e Popular
- **Endereço:** Rua Zacarias Costa Camargo, 50, Remanso Campineiro
- **Público-alvo:** Empreendedores em vulnerabilidade / economia solidária
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Produtivo
- **Dimensão IVS:** `renda_trabalho` — geração de renda informal — IVS RT_01 e RT_03
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Programa Ressignifica Hortolândia

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `CENTROPOP_01`
- **nome_orgao_executor:** Centro POP / Rede de Acolhimento
- **Público-alvo:** Moradores em situação de rua
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade / Intersetorial
- **Origem:** Municipal — lançado dezembro/2023
- **Benefício:** Bolsa mensal R$ 700 + cesta básica + auxílio aluguel
- **Dimensão IVS:** `multidimensional` — reintegração social ampla — renda (RT) + capital humano (CH) + condições de vida
- **Base legal principal:** Municipal + Decreto 7.053/2009
- **Base legal municipal:** A confirmar

---

### Bolsa Creche

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **id_orgao_executor:** `SEC_EDUCACAO`
- **nome_orgao_executor:** Secretaria de Educação, Ciência e Tecnologia
- **Público-alvo:** Crianças de 6 meses a 3 anos e 6 meses sem vaga na rede pública
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Dimensão IVS:** `capital_humano` — acesso à educação infantil — IVS CH_02
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Inscrição de OSCs no CMAS

- **Esfera:** `Municipal`
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Sec. Inclusão / CMAS
- **Público-alvo:** Organizações da Sociedade Civil
- **Vínculo CadÚnico:** Não
- **Dimensão IVS:** `governanca`
- **Base legal principal:** LOAS
- **Base legal municipal:** Lei 3.911/2021

---

### Inscrição de OSCs no CMDCA

- **Esfera:** `Municipal`
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS) / CMDCA
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Sec. Inclusão / CMDCA
- **Público-alvo:** OSCs voltadas à criança e ao adolescente
- **Vínculo CadÚnico:** Não
- **Dimensão IVS:** `governanca`
- **Base legal principal:** ECA
- **Base legal municipal:** A confirmar

---

## Grupo 5 — Segurança Alimentar

---

### Banco de Alimentos de Hortolândia (BAH)

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia (Dep. Segurança Alimentar)
- **id_orgao_executor:** `DEP_SEG_ALIMENTAR`
- **nome_orgao_executor:** Departamento de Segurança Alimentar
- **Público-alvo:** Pessoas em insegurança alimentar via 19 OSCs parceiras
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal — criado em 2007
- **Alcance:** 19 organizações / 1.762 pessoas (2024)
- **Dimensão IVS:** `renda_trabalho` — redução de insegurança alimentar — IVS RT_01
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### PAA — Programa de Aquisição de Alimentos

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **id_orgao_executor:** `DEP_SEG_ALIMENTAR`
- **nome_orgao_executor:** Departamento de Segurança Alimentar
- **Público-alvo:** Agricultores familiares (fornecedores) + beneficiários do BAH
- **Vínculo CadÚnico:** Indireto
- **Dimensão IVS:** `renda_trabalho` — transferência indireta de renda via alimentação — IVS RT_01
- **Base legal principal:** Outro (Lei 10.696/2003)
- **Base legal municipal:** A confirmar

---

### Distribuição de Cestas Básicas

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS) / Fundo Social
- **id_orgao_executor:** `FUNDO_SOCIAL`
- **nome_orgao_executor:** Fundo Social de Solidariedade
- **Vínculo CadÚnico:** Sim
- **Dimensão IVS:** `renda_trabalho` — complemento alimentar de emergência — IVS RT_01
- **Base legal principal:** Municipal
- **Base legal municipal:** Decreto 5.598/2025

---

### CREAN — Centro de Referência em Educação Alimentar e Nutricional

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **id_orgao_executor:** `DEP_SEG_ALIMENTAR`
- **nome_orgao_executor:** Departamento de Segurança Alimentar
- **Origem:** Municipal — anunciado abr/2023
- **Localização prevista:** Jd. Terras de Santa Maria
- **Dimensão IVS:** `capital_humano` — educação alimentar e nutricional — IVS CH
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Cozinha Comunitária

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **id_orgao_executor:** `DEP_SEG_ALIMENTAR`
- **nome_orgao_executor:** Departamento de Segurança Alimentar
- **Dimensão IVS:** `renda_trabalho` — refeição subsidiada — IVS RT_01
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** ⚠️ Verificar se é o mesmo equipamento que a "Escola Comunitária" do Jd. Novo Ângulo.

---

## Grupo 6 — Habitação

---

### Agora a Casa é Sua

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **id_orgao_executor:** `SEC_HABITACAO`
- **nome_orgao_executor:** Secretaria de Habitação (parceria Cidade Legal / Estadual)
- **Vínculo CadÚnico:** Indireto
- **Alcance 2021–2024:** ~3.000 títulos entregues
- **Dimensão IVS:** `infraestrutura_urbana` — regularização fundiária e melhoria habitacional — IVS IU_01 e IU_02
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações — Monte Sinai (v10):** Em 07/03/2026, cerimônia da Sabesp em Paulínia registrou conclusão da rede de esgoto subterrânea no Monte Sinai — ~650 famílias beneficiadas. Em parceria com CDHU, 152 unidades habitacionais em construção. Área doada ~220 mil m². Infraestrutura complementar: 117 postes LED, 5.700m de cabos, kits cavaletes, abertura de 7 vias. Fonte: Tribuna Liberal, 10/03/2026, p. 04. ⚠️ Pendência #18: confirmar número oficial de famílias.

---

### Programa Vida Longa (Estadual)

- **Esfera:** `Estadual`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **id_orgao_executor:** `SEC_HABITACAO`
- **nome_orgao_executor:** Secretaria de Habitação
- **Público-alvo:** Idosos em vulnerabilidade, residentes há ≥ 2 anos no município
- **Vínculo CadÚnico:** Sim
- **Vagas Hortolândia:** 28 unidades habitacionais
- **Status:** NEGOCIAÇÃO ATIVA (Tribuna Liberal, 04/03/2026)
- **Dimensão IVS:** `infraestrutura_urbana` — habitação para idosos — IVS IU + RT_04
- **Base legal principal:** Estadual
- **Base legal municipal:** A confirmar

---

### Minha Casa, Minha Vida — Hortolândia

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **id_orgao_executor:** `SEC_HABITACAO`
- **nome_orgao_executor:** Secretaria de Habitação
- **Vínculo CadÚnico:** Sim
- **Status:** EXECUÇÃO — 400 unidades em construção no Jardim Amanda (início 2026)
- **Documentações coletadas:** 576 ⚠️ *divergência a confirmar*
- **Dimensão IVS:** `infraestrutura_urbana` — provisão habitacional — IVS IU_01, IU_02
- **Base legal principal:** PBF / CadÚnico
- **Base legal municipal:** Lei 14.620/2023 (federal)

---

### PHLIS — Plano Municipal de Habitação de Interesse Social

- **Esfera:** `Municipal`
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Habitação
- **id_orgao_executor:** `SEC_HABITACAO`
- **nome_orgao_executor:** Secretaria de Habitação
- **Dimensão IVS:** `infraestrutura_urbana` — política habitacional estruturante — IVS IU
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

## Grupo 7 — Inserção Produtiva e Qualificação

---

### PAT — Posto de Atendimento ao Trabalhador

- **Esfera:** `Estadual/Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `PAT_01`
- **nome_orgao_executor:** PAT
- **Público-alvo:** Desempregados em geral, incluindo PCD
- **Vínculo CadÚnico:** Indireto
- **Contato:** pat@hortolandia.sp.gov.br / (19) 3965-1400 ramais 8904 ou 8925
- **Dimensão IVS:** `renda_trabalho` — intermediação de emprego — IVS RT_02
- **Base legal principal:** Outro (Lei 7.998/1990)
- **Base legal municipal:** A confirmar
- **⚠️ Nota arquitetural:** PAT é o ponto de cruzamento entre CadÚnico e mercado formal.

---

### Cadastro de Vagas de Trabalho por Empresa — PAT

- **Esfera:** `Estadual/Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `PAT_01`
- **nome_orgao_executor:** PAT
- **Público-alvo:** Empresas (oferta) + trabalhadores cadastrados (demanda)
- **Vínculo CadÚnico:** Indireto
- **Dimensão IVS:** `renda_trabalho` — intermediação de emprego — IVS RT_02
- **Base legal principal:** Outro (Lei 7.998/1990)
- **Base legal municipal:** A confirmar

---

### Cadastro no SINE e Encaminhamento para Vagas

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `PAT_01`
- **nome_orgao_executor:** PAT (ponto da rede SINE federal)
- **Operador:** Ministério do Trabalho (SINE / Emprega Brasil)
- **Vínculo CadÚnico:** Indireto
- **data_inicio:** Fevereiro/2026 — data formal de adesão de Hortolândia ao Sistema Nacional de Emprego. Fonte: Tribuna Liberal, 11/03/2026
- **Dimensão IVS:** `renda_trabalho` — intermediação federal de emprego — IVS RT_02 e RT_03
- **Base legal principal:** Outro (Lei 7.998/1990)
- **Base legal municipal:** A confirmar
- **⚠️ Nota arquitetural:** dados ficam no MTE federal — integração futura requer API federal.

---

### PEI — Polo de Empregabilidade Inclusiva *(novo — v12)*

- **Esfera:** `Estadual/Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **Secretarias parceiras:** Secretaria Estadual de Direitos da Pessoa com Deficiência
- **id_orgao_executor:** `DEP_PCD` *(provisório)*
- **nome_orgao_executor:** Dep. de Políticas Públicas para a PCD
- **Público-alvo:** Pessoas com deficiência (PCD) em busca de inserção no mercado de trabalho
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Produtivo
- **Status:** EXECUÇÃO — atendimentos iniciados em fevereiro/2026
- **data_inicio:** Fevereiro/2026
- **Acesso:** Presencial — Paço Municipal
- **Dimensão IVS:** `renda_trabalho` — inclusão produtiva de PCD — IVS RT_02 (desocupação) e CH (deficiência e inclusão)
- **Base legal principal:** Estadual + Municipal (Termo de Cooperação Técnica)
- **Base legal municipal:** A confirmar
- **Observações:** Um dos três programas formalizados via Termo de Cooperação Técnica entre a Prefeitura de Hortolândia e o Governo do Estado de SP, com presença do secretário estadual Marcos da Costa, em fevereiro/2026. Fonte: Tribuna Liberal, 11/03/2026. ⚠️ Pendência #23: confirmar `id_orgao_executor` definitivo, base legal municipal, critérios formais de acesso e se há outros dois programas do Termo de Cooperação ainda não catalogados.

---

### Banco do Povo

- **Esfera:** `Estadual`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `EXT_DESENVOLVE_SP`
- **nome_orgao_executor:** Desenvolve SP
- **Público-alvo:** MEI, ME, EPP, LTDA, EIRELI — formais e informais
- **Vínculo CadÚnico:** A confirmar
- **Contato:** bancodopovo@hortolandia.sp.gov.br / WhatsApp (19) 9 9919-5984
- **Dimensão IVS:** `renda_trabalho` — crédito para formalização e empreendedorismo — IVS RT_03
- **Base legal principal:** Outro (Lei 9.533/1997)
- **Base legal municipal:** A confirmar

---

### Orientação ao MEI

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `DEP_EMPREEND`
- **nome_orgao_executor:** Departamento de Empreendedorismo e Microempresas
- **Público-alvo:** MEIs — abertura, regularização e obrigações fiscais
- **Vínculo CadÚnico:** Indireto
- **Dimensão IVS:** `renda_trabalho` — formalização de MEI — IVS RT_03
- **Base legal principal:** Outro (LC 128/2008)
- **Base legal municipal:** A confirmar
- **⚠️ Nota arquitetural:** formalização via MEI não aparece no CAGED — ponto cego no monitoramento de transição produtiva.

---

### SEBRAE Aqui

- **Esfera:** `Estadual`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `EXT_SEBRAE_SP`
- **nome_orgao_executor:** SEBRAE-SP
- **Público-alvo:** Empreendedores e futuros empreendedores
- **Vínculo CadÚnico:** Indireto
- **Dimensão IVS:** `renda_trabalho` — capacitação empresarial — IVS RT_03 e RT_02
- **Base legal principal:** Outro
- **Base legal municipal:** A confirmar

---

### Seguro Desemprego

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `PAT_01`
- **nome_orgao_executor:** PAT (apoio a casos judiciais)
- **Operador:** Ministério do Trabalho
- **Público-alvo:** Trabalhador formal dispensado sem justa causa
- **Vínculo CadÚnico:** Indireto
- **Dimensão IVS:** `renda_trabalho` — proteção temporária de renda — IVS RT_01 e RT_02
- **Base legal principal:** Outro (Lei 7.998/1990)
- **Base legal municipal:** A confirmar
- **⚠️ Nota estratégica:** quando o benefício se esgota sem recolocação, a tendência é buscar assistência social — fluxo de entrada previsível no CadÚnico.

---

### Feiras Livres e Noturnas

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `SEC_DES_ECONOMICO`
- **nome_orgao_executor:** Secretaria de Desenvolvimento Econômico
- **Público-alvo:** Feirantes + população em geral
- **Vínculo CadÚnico:** Indireto
- **Cobertura territorial:** Santa Clara, Nova Hortolândia, Parque Ortolândia, São Sebastião, Santo André, Vila Real, Amanda
- **Frequência:** Quarta a domingo — rotatividade por bairro
- **Dimensão IVS:** `renda_trabalho` — geração de renda informal — IVS RT_01 e RT_03
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **⚠️ Nota para DIM_TERRITORIO:** 5 territórios coincidem com áreas de abrangência de CRAS.

---

### Fundo Social — Cursos Profissionalizantes

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Fundo Social de Solidariedade)
- **id_orgao_executor:** `FUNDO_SOCIAL`
- **nome_orgao_executor:** Fundo Social / Capacita Hortolândia
- **Endereço base:** Rua Estados Unidos, 217, Jd. Santa Clara do Lago II
- **Público-alvo:** Pessoas a partir de 16 anos, foco em vulnerabilidade socioeconômica
- **Vínculo CadÚnico:** Indireto
- **Cursos jan/2026:** Alvenaria Estrutural (SENAI, 20 vagas, Remanso Campineiro); Assistente de RH (SENAI, CRAS Amanda)
- **Dimensão IVS:** `renda_trabalho` — qualificação profissional — IVS RT_02 e RT_03
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Programa Meu Emprego — Trabalho em Equipe

- **Esfera:** `Estadual/Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS — DIPGR)
- **id_orgao_executor:** `DEP_DIPGR`
- **nome_orgao_executor:** Dep. de Inclusão Produtiva e Gestão de Relações Institucionais
- **Público-alvo:** Jovens 16–20 anos + desempregados +3 meses + beneficiários do seguro-desemprego
- **Vínculo CadÚnico:** Indireto
- **Dimensão IVS:** `renda_trabalho` — empregabilidade e intermediação — IVS RT_02
- **Base legal principal:** Outro
- **Base legal municipal:** A confirmar

---

### DECOLA

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `DEP_DIPGR`
- **nome_orgao_executor:** Dep. de Inclusão Produtiva e Gestão de Relações Institucionais
- **Público-alvo:** A confirmar — foco em empregabilidade e inserção produtiva
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Produtivo
- **Dimensão IVS:** `renda_trabalho` — empregabilidade e inserção produtiva — IVS RT_02 e RT_03
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** ⚠️ Pendência #20: verificar se "Aprendiz Social" é denominação atual do DECOLA Juventude ou programa distinto.

---

### Aprendiz Social

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (SMIDS)
- **id_orgao_executor:** `DEP_DIPGR`
- **nome_orgao_executor:** Dep. de Inclusão Produtiva e Gestão de Relações Institucionais
- **Público-alvo:** Jovens — foco em formação para o mercado de trabalho
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Produtivo
- **Dimensão IVS:** `renda_trabalho` — formação de jovens para o mercado — IVS RT_02 (desocupação) e CH_08 (nem-nem)
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** ⚠️ Pendência #20: confirmar se é programa distinto do DECOLA ou modalidade interna.

---

### Fatec Hortolândia

- **Esfera:** `Estadual`
- **Tipo:** B — Política Articulada *(fase atual: estudo de viabilidade)*
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `EXT_CENTRO_PAULA_SOUZA`
- **nome_orgao_executor:** Centro Paula Souza — Governo do Estado de São Paulo
- **Operador:** Centro Paula Souza
- **Público-alvo:** Jovens e adultos buscando ensino superior tecnológico gratuito; demanda do setor produtivo local
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Produtivo / Educacional
- **Status:** ESTUDO DE VIABILIDADE — reunião oficial realizada em 09/03/2026; sem prazo definido para implantação
- **Possível localização:** Terreno ao lado da Etec de Hortolândia, região do Remanso Campineiro
- **Dimensão IVS:** `renda_trabalho` — ensino superior tecnológico gratuito como vetor de mobilidade social — IVS RT_02 e RT_03
- **Base legal principal:** Estadual
- **Base legal municipal:** A confirmar
- **Observações:** ⚠️ Pendência #22: conflito de fonte sobre local da reunião de 09/03/2026. Tribuna Liberal (10/03/2026 e 11/03/2026) registra "Câmara Municipal"; v11 corrigiu para "SMIDS" com base em Caio [RH PMH Lima], 10/03/2026. Verificar com fonte interna. ⚠️ Pendência #17: monitorar evolução do estudo de viabilidade.

---

## Grupo 8 — Públicos Específicos / Direitos Humanos

---

### Cadastro e Políticas para PCD

- **Esfera:** `Municipal`
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo (DPCD)
- **id_orgao_executor:** `DEP_PCD`
- **nome_orgao_executor:** Dep. de Políticas Públicas para a PCD
- **Gestora:** Quézia Garcia
- **Vínculo CadÚnico:** Indireto
- **Dimensão IVS:** `capital_humano` — políticas para PCD — IVS CH
- **Base legal principal:** Outro (Lei 13.146/2015)
- **Base legal municipal:** A confirmar

---

### Políticas para Pessoa Idosa

- **Esfera:** `Municipal`
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo (Dep. Direitos Humanos e Políticas Públicas)
- **id_orgao_executor:** `DEP_DIR_HUMANOS`
- **nome_orgao_executor:** Dep. de Direitos Humanos e Políticas Públicas
- **Público-alvo:** Idosos, especialmente em vulnerabilidade
- **Vínculo CadÚnico:** Indireto
- **Dimensão IVS:** `capital_humano` — atenção ao idoso — IVS CH + RT_04
- **Base legal principal:** Outro (Lei 10.741/2003)
- **Base legal municipal:** A confirmar

---

### CCMI — Centro de Convivência da Melhor Idade

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. Direitos Humanos e Políticas Públicas)
- **id_orgao_executor:** `DEP_DIR_HUMANOS`
- **nome_orgao_executor:** Dep. de Direitos Humanos e Políticas Públicas
- **Coordenação:** Psicóloga Fernanda Fadiga
- **Público-alvo:** Idosos 60+
- **Vínculo CadÚnico:** Indireto
- **Dimensão IVS:** `capital_humano` — convivência e saúde do idoso — IVS CH + RT_04
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Políticas para a Juventude

- **Esfera:** `Municipal`
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo (Dep. Direitos Humanos e Políticas Públicas)
- **id_orgao_executor:** `DEP_DIR_HUMANOS`
- **nome_orgao_executor:** Dep. de Direitos Humanos e Políticas Públicas
- **Público-alvo:** Jovens de 15 a 29 anos
- **Dimensão IVS:** `capital_humano` — juventude — IVS CH_08 e CH_03
- **Base legal principal:** Outro (Lei 12.852/2013)
- **Base legal municipal:** A confirmar

---

### Políticas de Igualdade Racial

- **Esfera:** `Municipal`
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo (Dep. Direitos Humanos e Políticas Públicas)
- **id_orgao_executor:** `DEP_DIR_HUMANOS`
- **nome_orgao_executor:** Dep. de Direitos Humanos e Políticas Públicas
- **Público-alvo:** População negra, indígena, comunidades tradicionais
- **Dimensão IVS:** `multidimensional` — desigualdade racial cruza todas as dimensões IVS
- **Base legal principal:** Outro (Lei 12.288/2010)
- **Base legal municipal:** A confirmar

---

### CRAM — Centro de Referência de Atendimento à Mulher

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Departamento de Mulheres)
- **id_orgao_executor:** `CRAM_01`
- **nome_orgao_executor:** CRAM "Débora Regina Leme dos Santos"
- **Endereço:** Rua Alberto Gomes, 18, Jardim das Paineiras
- **Público-alvo:** Mulheres em situação de violência ou vulnerabilidade
- **Vínculo CadÚnico:** Indireto
- **Atendimentos:** 293 no período jan–mar/2026; 101 casos novos
- **Dimensão IVS:** `multidimensional` — violência contra a mulher — CH + RT
- **Base legal principal:** Outro (Lei 11.340/2006)
- **Base legal municipal:** A confirmar *(em operação desde 2017)*
- **Observações:** Em 08/03/2026 registrados dois casos de violência doméstica em Hortolândia. Caso 1: filho do casal sob acompanhamento do Conselho Tutelar — fluxo CRAM → CT ativado. Caso 2: companheiro preso em flagrante; vítima buscou medida protetiva — fluxo CRAM → CREAS ativado. ⚠️ Nota arquitetural: confirma o fluxo CRAM → Conselho Tutelar → CREAS como cadeia operacional real — modelar campo `id_encaminhamento_destino` em FATO_ATENDIMENTO.

---

### Closet Solidário

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. de Políticas Públicas para a Mulher)
- **Secretarias parceiras:** Fundo Social de Solidariedade
- **id_orgao_executor:** `CRAM_01` · `FUNDO_SOCIAL`
- **nome_orgao_executor:** CRAM + Fundo Social de Solidariedade
- **Endereço:** CRAM "Débora Regina Leme dos Santos", Rua Alberto Gomes, 18, Jardim das Paineiras
- **Público-alvo:** Mulheres atendidas pelo CRAM
- **Vínculo CadÚnico:** Indireto
- **Status:** EXECUÇÃO — lançamento 09/03/2026
- **Acesso:** Encaminhamento via CRAM
- **Dimensão IVS:** `capital_humano` — acesso a vestuário para mulheres atendidas — IVS CH
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Viva Mais

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. Relações Institucionais)
- **id_orgao_executor:** `DEP_DIPGR`
- **nome_orgao_executor:** Dep. de Inclusão Produtiva e Gestão de Relações Institucionais
- **Público-alvo:** Comunidade geral
- **Vínculo CadÚnico:** Indireto
- **Dimensão IVS:** `capital_humano` — saúde e bem-estar — IVS CH
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Ambulatório Trans

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Saúde
- **id_orgao_executor:** `SEC_SAUDE`
- **nome_orgao_executor:** Secretaria Municipal de Saúde
- **Público-alvo:** População transexual
- **Vínculo CadÚnico:** Indireto
- **Início:** Janeiro/2024
- **Dimensão IVS:** `capital_humano` — saúde de população vulnerável — IVS CH
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Comitê Intersetorial de Políticas para a Primeira Infância

- **Esfera:** `Municipal`
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Educação (coordenação)
- **id_orgao_executor:** `SEC_EDUCACAO`
- **nome_orgao_executor:** Secretaria de Educação, Ciência e Tecnologia
- **Público-alvo:** Crianças de 0 a 6 anos
- **Dimensão IVS:** `capital_humano` — primeira infância — IVS CH_01, CH_02
- **Base legal principal:** Outro (Lei 13.257/2016)
- **Base legal municipal:** A confirmar

---

## Grupo 9 — Formação Cultural

---

### Formações Culturais — Secretaria de Cultura (bloco)

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Cultura (Dep. Cidadania Cultural)
- **id_orgao_executor:** `DEP_CULTURA`
- **nome_orgao_executor:** Departamento de Cidadania Cultural
- **Público-alvo:** Comunidade geral, acesso universal e gratuito
- **Vínculo CadÚnico:** Indireto
- **Modalidades:** Música, Artes Cênicas, Artes Visuais, Artes Urbanas, Literatura, Audiovisual, Cursos Livres
- **Dimensão IVS:** `capital_humano` — cultura como fator de capital humano e coesão social — IVS CH
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** ⚠️ Verificar registro de matrículas para FATO_ATENDIMENTO.

---

## Grupo 10 — Serviços de Saúde com Interface SUAS

---

### SAMU Regional Hortolândia e Sumaré

- **Esfera:** `Federal/Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Saúde
- **id_orgao_executor:** `SEC_SAUDE`
- **nome_orgao_executor:** Secretaria Municipal de Saúde
- **Gestor:** Renato Lopes Machado
- **Público-alvo:** População geral em urgência e emergência
- **Vínculo CadÚnico:** Indireto
- **Abrangência:** Hortolândia + Sumaré
- **Dimensão IVS:** `capital_humano` — urgência e emergência em saúde — IVS CH_01
- **Base legal principal:** Outro (Lei 8.080/1990)
- **Base legal municipal:** A confirmar

---

### Vila da Saúde *(em planejamento)*

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto *(em planejamento)*
- **Secretaria responsável:** A confirmar
- **id_orgao_executor:** A confirmar
- **Público-alvo:** População geral de Hortolândia
- **Vínculo CadÚnico:** A confirmar
- **Status:** Intenção declarada pelo prefeito Zezé Gomes (jan/2026). Sem endereço, secretaria ou prazo confirmados.
- **Dimensão IVS:** `capital_humano` — equipamento de saúde comunitária — IVS CH
- **Base legal principal:** A confirmar
- **Base legal municipal:** A confirmar
- **Observações:** Monitorar edições futuras da Tribuna Liberal.

---

## Grupo 11 — Governança e Conselhos

| Conselho | Sigla | id_orgao_executor | Esfera | Base legal principal | Base legal municipal |
|----------|-------|-------------------|--------|---------------------|---------------------|
| Cons. Municipal de Seg. Alimentar | COMSEA | `SEC_EDUCACAO` | Municipal | Municipal | A confirmar |
| Câmara Intersetorial Seg. Alimentar | CAISAN | `SEC_EDUCACAO` | Municipal | Municipal | A confirmar |
| Cons. Municipal da PCD | CMPcD | `DEP_PCD` | Municipal | Lei 13.146/2015 | A confirmar |
| Cons. Dir. Criança e Adolescente | CMDCA | `SEC_INCLUSAO` | Municipal | ECA | A confirmar |
| Cons. Municipal de Assistência Social | CMAS | `SEC_INCLUSAO` | Municipal | LOAS | Lei 3.911/2021 |
| Cons. Municipal do Idoso | CMI | `DEP_DIR_HUMANOS` | Municipal | Lei 10.741/2003 | A confirmar |
| Cons. Municipal da Juventude | COMJUV | `DEP_DIR_HUMANOS` | Municipal | Lei 12.852/2013 | A confirmar |
| Fórum Municipal Igualdade Racial | COMPIR | `DEP_DIR_HUMANOS` | Municipal | Lei 12.288/2010 | A confirmar |
| Conselho Tutelar I | CT I | `SEC_INCLUSAO` | Municipal | ECA | A confirmar |
| Conselho Tutelar II | CT II | `SEC_INCLUSAO` | Municipal | ECA | A confirmar |
| Cons. Municipal Direitos da Mulher | CMDM | `DEP_MULHERES` | Municipal | Municipal | A confirmar |

> Cross-reference completo: `dim_colegiados_v01.md`

---

## Distribuição dos Programas por Dimensão IVS

| Dimensão IVS | Qtd | % | Programas principais |
|-------------|-----|---|---------------------|
| `capital_humano` | 22 | 33,8% | SCFV, Cuidar, SAICA, Residência Inclusiva, ILPI, Bolsa Creche, CCMI, CRAM, Primeira Infância, CREAN, SAMU, Vila da Saúde |
| `renda_trabalho` | 24 | 36,9% | ACERTE, PAT, Banco do Povo, SINE, MEI, BAH, Cestas, Seguro Desemprego, PAA, Cozinha, Feiras, Costura, Capacita, DECOLA, Aprendiz Social, Fatec, República, **PEI** |
| `multidimensional` | 10 | 15,4% | PAIF, PAEFI, Abordagem Social, Risco Social, Pop. Rua, Ressignifica, Igualdade Racial, CRAM, Emergências, Abrigo Mulheres |
| `infraestrutura_urbana` | 6 | 9,2% | MCMV, Agora a Casa é Sua, Vida Longa, PHLIS, Abrigo Adultos/Rua, Acolhimento |
| `governanca` | 2 | 3,1% | Inscrição OSCs CMAS, Inscrição OSCs CMDCA |
| **TOTAL** | **64** | **100%** | — |

> **Leitura analítica:** A v12 passa a 64 programas com a adição do PEI. A dimensão
> Renda e Trabalho avança para 36,9%, reflexo da incorporação progressiva dos
> programas de inclusão produtiva — SINE (adesão fev/2026), PEI (início fev/2026),
> DECOLA e Aprendiz Social. A cobertura em Infraestrutura Urbana permanece em ~9%,
> confirmando dependência de parceiros estaduais e federais nessa dimensão.

---

## Fluxo Institucional do SUAS em Hortolândia

```
Entrada (3 vias):
  Busca Ativa | Demanda Espontânea | Encaminhamento
       ↓
🟢 PROTEÇÃO BÁSICA (CRAS × 7)
   PAIF · SCFV · BPC · Bolsa Família · Cesta Básica
       ↓ (violação de direitos)
🟡 PROTEÇÃO ESPECIAL — MÉDIA COMPLEXIDADE (CREAS / Centro POP)
   PAEFI · Medida Socioeducativa · Abordagem Social
   Centro POP → Casa de Passagem Triagem (até 30 dias)
       ↓ (acolhimento necessário)
🔴 PROTEÇÃO ESPECIAL — ALTA COMPLEXIDADE (OSCs conveniadas)
   SAICA (crianças/adolescentes)
   Abrigo Adultos / Famílias em situação de rua
   Abrigo Mulheres em situação de violência
   Residência Inclusiva (PCD)
   Casa-Lar / ILPI (idosos)
   República (jovens/adultos em saída da rua)
```

---

## Glossário de IDs de Órgão Executor (FK)

| id_orgao_executor | nome completo | tipo | dimensão |
|-------------------|--------------|------|----------|
| CRAS_SANTA_CLARA | CRAS Jardim Santa Clara | Equipamento SUAS | DIM_UNIDADES_ATENDIMENTO |
| CRAS_AMANDA | CRAS Jardim Amanda | Equipamento SUAS | DIM_UNIDADES_ATENDIMENTO |
| CRAS_NOVO_ANGULO | CRAS Jardim Novo Ângulo | Equipamento SUAS | DIM_UNIDADES_ATENDIMENTO |
| CRAS_ROSOLEM | CRAS Rosolém | Equipamento SUAS | DIM_UNIDADES_ATENDIMENTO |
| CRAS_PRIMAVERA | CRAS Primavera | Equipamento SUAS | DIM_UNIDADES_ATENDIMENTO |
| CRAS_BRASIL | CRAS Jardim Brasil | Equipamento SUAS | DIM_UNIDADES_ATENDIMENTO |
| CRAS_VILA_REAL | CRAS Vila Real | Equipamento SUAS | DIM_UNIDADES_ATENDIMENTO |
| CREAS_01 | CREAS Remanso Campineiro | Equipamento SUAS | DIM_UNIDADES_ATENDIMENTO |
| CENTROPOP_01 | Centro POP Remanso Campineiro | Equipamento SUAS | DIM_UNIDADES_ATENDIMENTO |
| CRAM_01 | CRAM "Débora Regina Leme dos Santos" | Equipamento municipal | DIM_UNIDADES_ATENDIMENTO |
| CQP_I | CQP I — Capacita | Equipamento municipal | DIM_UNIDADES_ATENDIMENTO |
| CQP_II | CQP II — Costura | Equipamento municipal | DIM_UNIDADES_ATENDIMENTO |
| CESP | CESP — Empreendimentos Solidários | Equipamento municipal | DIM_UNIDADES_ATENDIMENTO |
| PAT_01 | PAT | Equipamento municipal | DIM_UNIDADES_ATENDIMENTO |
| FUNDO_SOCIAL | Fundo Social de Solidariedade | Órgão municipal | DIM_GESTORES |
| SEC_INCLUSAO | Sec. Inclusão e Desenvolvimento Social (SMIDS) | Secretaria | DIM_GESTORES |
| SEC_EDUCACAO | Sec. Educação, Ciência e Tecnologia | Secretaria | DIM_GESTORES |
| SEC_HABITACAO | Secretaria de Habitação | Secretaria | DIM_GESTORES |
| SEC_SAUDE | Secretaria Municipal de Saúde | Secretaria | DIM_GESTORES |
| SEC_DES_ECONOMICO | Sec. Desenvolvimento Econômico | Secretaria | DIM_GESTORES |
| DEP_DIPGR | Dep. Inclusão Produtiva e Gestão Relações Inst. | Departamento | DIM_GESTORES |
| DEP_SEG_ALIMENTAR | Dep. Segurança Alimentar | Departamento | DIM_GESTORES |
| DEP_PCD | Dep. Políticas Públicas para a PCD | Departamento | DIM_GESTORES |
| DEP_DIR_HUMANOS | Dep. Direitos Humanos e Políticas Públicas | Departamento | DIM_GESTORES |
| DEP_EMPREEND | Dep. Empreendedorismo e Microempresas | Departamento | DIM_GESTORES |
| DEP_CULTURA | Dep. Cidadania Cultural | Departamento | DIM_GESTORES |
| DEP_MULHERES | Dep. de Políticas Públicas para a Mulher | Departamento | DIM_GESTORES |
| OSC_ESPERANCAR | Instituto Esperançar | OSC conveniada | DIM_OSC (futuro) |
| OSC_A_CONFIRMAR | OSC executora Alta Complexidade — a identificar | OSC conveniada | DIM_OSC (futuro) |
| EXT_DESENVOLVE_SP | Desenvolve SP | Operador externo estadual | — |
| EXT_SEBRAE_SP | SEBRAE-SP | Operador externo estadual | — |
| EXT_CENTRO_PAULA_SOUZA | Centro Paula Souza — Gov. Estado de SP | Operador externo estadual | — |

---

## Notas Arquiteturais Consolidadas (v12)

| # | Nota | Impacto no modelo |
|---|------|-----------------|
| 1 | Centro POP atende sem documentação | Ponto cego no CadÚnico — CPF = PENDENTE |
| 2 | Fluxo Centro POP → Casa de Passagem (triagem) → Alta Complexidade | Mesma pessoa gera múltiplos registros — CPF é âncora obrigatória |
| 3 | Banco do Povo e SEBRAE: dados nos operadores externos | Integração futura requer convênio |
| 4 | SINE / Seguro Desemprego: dados no MTE federal | Integração futura requer API federal |
| 5 | MEI não aparece no CAGED | Ponto cego no monitoramento de transição produtiva |
| 6 | Seguro Desemprego → CadÚnico | Fluxo de entrada previsível — a modelar |
| 7 | Feiras Livres: renda informal não declarada | Impacto na classificação de vulnerabilidade |
| 8 | `base_legal_principal` é atalho analítico | Não substitui REL_NORMA_PROGRAMA |
| 9 | `id_orgao_executor` é FK para JOIN | Liga DIM_PROGRAMA → DIM_UNIDADES_ATENDIMENTO e DIM_GESTORES |
| 10 | Operadores externos (EXT_) sem dimensão interna | Integração futura via convênio ou API |
| 11 | MCMV Amanda: divergência 421×576 documentações | Validar junto à Secretaria de Habitação |
| 12 | Fluxo CRAM → Conselho Tutelar → CREAS confirmado (08/03/2026) | Modelar campo `id_encaminhamento_destino` em FATO_ATENDIMENTO |
| 13 | Fatec: dados de matrícula ficam no Centro Paula Souza | Cruzamento CadÚnico × matrículas Fatec futuro — requer convênio estadual |
| 14 | Alta Complexidade executada por OSCs — maioria sem `id_orgao_executor` definido | Pendência #19: identificar e cadastrar OSCs executoras |
| 15 | PEI: dados ficam no Estado (Sec. Direitos da PCD) | Parceria via Termo de Cooperação — integração futura requer convênio estadual |

---

## Trajetória Típica de Transição Produtiva

```
CadÚnico (entrada)
    ↓
PAIF — acompanhamento familiar (CRAS)
    ↓
Projeto Capacita / Costura Industrial / DECOLA — qualificação
    ↓
PEI — inclusão produtiva para PCD (quando aplicável)
    ↓
[futuro] Fatec Hortolândia — ensino superior tecnológico
    ↓
PAT / SINE — intermediação de mão de obra
    ↓
BIFURCAÇÃO:
  → Inserção formal (CAGED registra)
  → OU Formalização MEI (Receita Federal registra)
    ↓
Banco do Povo — crédito produtivo (opcional)
    ↓
Saída do perfil CadÚnico
(resultado_final = Emancipado em FATO_PARTICIPACAO_PROGRAMA)
```

---

## Trajetória Típica de Saída da Situação de Rua

```
Busca Ativa / Demanda Espontânea
    ↓
Centro POP — acolhimento, higiene, alimentação, documentação
    ↓
Casa de Passagem Triagem (até 30 dias) — identificação de perfil
    ↓
BIFURCAÇÃO por perfil:
  → Adulto 24–59 anos         → Abrigo Institucional (OSC)
  → Mulher em violência       → Abrigo Mulheres (OSC)
  → PCD                       → Residência Inclusiva (OSC)
  → Idoso 60+                 → Casa-Lar / ILPI (OSC)
  → Jovem/adulto com trabalho → República masc./fem. (OSC)
    ↓
Programa Ressignifica — bolsa + cesta + auxílio aluguel
    ↓
ACERTE / DECOLA — qualificação e inserção produtiva
    ↓
Autonomia
```

---

## Entidades Parceiras (OSCs) Identificadas

| id | Entidade | Foco |
|----|----------|------|
| OSC_ESPERANCAR | Instituto Esperançar | Abrigo Institucional (pop. rua) |
| OSC_AMAAH | AMAAH | Autismo |
| OSC_APAE | APAE | Deficiência intelectual |
| OSC_CADEFI | CADEFI / CENDEFI | Deficiência |
| OSC_AHDV | AHDV | Deficiência visual |
| OSC_PERNAS_VOL | Instituto Pernas Voluntárias | PCD |
| OSC_TODOS_AUTISMO | Todos Pelo Autismo | Autismo |
| OSC_LUTA_VIDA | Luta pela Vida Hortolândia | PCD / esporte |
| OSC_PATRULHEIROS | Assoc. Patrulheiros e Guarda Mirim | Juventude |

> ⚠️ OSCs executoras das modalidades de Alta Complexidade (SAICA, Abrigo Mulheres,
> Residência Inclusiva, ILPI, República) ainda não identificadas — Pendência #19.
> 12 OSCs parceiras dos CRAS ainda sem id individual — Pendência #12.

---

## Dado de Contexto — Mercado Formal e CadÚnico

- Empregos formais: 49.100 (CAGED, jan–mar/2023)
- Remuneração média formal: R$ 4.700
- CAGED jan/2026: saldo +140 vagas em Hortolândia (+57,3% vs jan/2025)
- CadÚnico out/2022: 29.698 famílias / 70.456 pessoas
- CadÚnico dez/2025: ~73.000 pessoas
- População estimada: ~240.000 habitantes

---

## Pendências Abertas

| # | pendência | prioridade |
|---|-----------|------------|
| 1 | Confirmar distinção Projeto Capacita × Capacita Hortolândia (Fundo Social) | Alta |
| 2 | Confirmar distinção Escola Comunitária × Cozinha Comunitária | Média |
| 3 | Confirmar se Atendimento Domiciliar e Proteção Especial PCD/Idosos são modalidades distintas | Média |
| 4 | Detalhar critério de acesso da Farmácia Solidária — vínculo CadÚnico? | Média |
| 5 | Verificar registro de matrículas nas Formações Culturais para FATO_ATENDIMENTO | Baixa |
| 6 | Confirmar vínculo CadÚnico para acesso ao Banco do Povo | Média |
| 7 | DECOLA Juventude — confirmar relação com Aprendiz Social (ver #20) | Alta |
| 8 | Vila da Saúde — monitorar confirmação de secretaria e prazo | Baixa |
| 9 | Cruzar cobertura territorial dos 7 CRAS com loteamentosregiao.xls | Alta |
| 10 | Levantar leis municipais de criação dos CRAS, Centro POP, ACERTE e Ressignifica | Alta |
| 11 | Confirmar `id_orgao_executor` para ESPACO_INCLUIR e EMPORIO_JACUBA | Média |
| 12 | Catalogar 12 OSCs parceiras dos CRAS individualmente | Média |
| 13 | MCMV Amanda: confirmar número oficial de documentações (576?) | Alta |
| 14 | Closet Solidário: confirmar base legal municipal e critérios formais de acesso | Média |
| 15 | Confirmar `id_orgao_executor` DEP_MULHERES | Média |
| 16 | Programa Vida Longa: monitorar negociações com o Estado | Média |
| 17 | Fatec Hortolândia: monitorar evolução do estudo de viabilidade | Alta |
| 18 | Monte Sinai: confirmar número oficial de famílias beneficiadas (~650) | Média |
| 19 | Identificar OSCs executoras das 5 modalidades de Alta Complexidade (SAICA, Abrigo Mulheres, Residência Inclusiva, ILPI, República) e atualizar `id_orgao_executor` | Alta |
| 20 | Confirmar se Aprendiz Social é denominação atual do DECOLA Juventude ou programa distinto; confirmar status operacional de ambos | Alta |
| 21 | Sistemas de registro de Alta Complexidade: confirmar quais dados vão ao SIGAS e quais ao CadÚnico | Alta |
| 22 | Fatec — conflito de fonte sobre local da reunião de 09/03/2026: Tribuna Liberal (10/03 e 11/03) registra "Câmara Municipal"; v11 corrigiu para "SMIDS" com base em Caio [RH PMH Lima]. Verificar com fonte interna para resolução definitiva | Média |
| 23 | PEI — confirmar `id_orgao_executor` definitivo (DEP_PCD provisório), base legal municipal, critérios formais de acesso e se há outros dois programas do Termo de Cooperação ainda não catalogados | Alta |

---

## Log de Alterações

| Versão | Data | Alterações |
|--------|------|-----------|
| v01 | 27/02/2026 | Criação do catálogo — levantamento documental 2023–2024 |
| v02 | 28/02/2026 | Correção ACERTE; Atendimento Emergencial (26/02/2026); MCMV Jd. Amanda |
| v03 | 01/03/2026 | Varredura site oficial: Viva Mais, PCD/Idosos, Banco do Povo, Cozinha Comunitária, Formações Culturais |
| v04 | 01/03/2026 | Ciclo jornalístico dez/2025–jan/2026: Vila da Saúde, SAMU Regional, Fundo Social cursos jan/2026 |
| v05 | 03/03/2026 | Varredura Sec. Inclusão (22 serviços); Sec. Desenvolvimento Econômico (7 serviços); notas arquiteturais |
| v06 | 03/03/2026 | Campo `base_legal_principal`; base legal dos conselhos (G11) |
| v07 | 05/03/2026 | Campos `esfera`, `id_orgao_executor`, `nome_orgao_executor`, `base_legal_municipal`; glossário FK completo |
| v08 | 07/03/2026 | Ciclo jornalístico 04–08/03/2026: MCMV Amanda, Vida Longa, Closet Solidário, ACERTE caso Suelen, CRAM, DEP_MULHERES, CMDM, CAGED jan/2026; pendências 13–16 |
| v09 | 09/03/2026 | Campo `dimensao_ivs` em todos os programas; tabela de distribuição por dimensão; DIM_VARIAVEL_IVS v01 |
| v10 | 10/03/2026 | Fatec Hortolândia (G7, ESTUDO DE VIABILIDADE); Monte Sinai em Agora a Casa é Sua; CRAM 08/03/2026; notas arquiteturais #12 e #13; pendências #17 e #18 |
| v11 | 10/03/2026 | Bloco Fundamento Metodológico IVS/IVS-H; correção local reunião Fatec: Câmara → SMIDS (fonte: Caio [RH PMH]); separação Casa de Passagem por nível de complexidade; 6 modalidades de Alta Complexidade; DECOLA e Aprendiz Social (G7); Fluxo SUAS; Trajetória de Saída da Rua; total 62 programas; pendências #19, #20, #21 |
| v12 | 11/03/2026 | Ciclo jornalístico 11/03/2026: adição PEI — Polo de Empregabilidade Inclusiva (G7); atualização SINE com `data_inicio` fev/2026; PEI inserido na Trajetória de Transição Produtiva; nota arquitetural #15 (PEI/Estado); tabela distribuição IVS atualizada (64 programas, RT=36,9%); pendências #22 (Fatec conflito de fonte) e #23 (PEI detalhamento). Fonte: Tribuna Liberal nº 9.697, 11/03/2026 |

---

*Documento de registro interno — Projeto Atlas Social de Hortolândia — março de 2026*
