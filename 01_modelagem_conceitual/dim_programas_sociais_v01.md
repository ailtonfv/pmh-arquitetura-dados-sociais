# DIM_PROGRAMA — Catálogo de Programas Sociais
**Versão:** 08  
**Data de atualização:** 07/03/2026  
**Versão anterior:** 07 (05/03/2026)  
**Atualizações v08:**
- MCMV Jardim Amanda: documentações atualizadas para 576 (com ressalva — divergência entre edições 05/03 e 06/03/2026); status atualizado para EXECUÇÃO
- Programa Vida Longa: status atualizado para NEGOCIAÇÃO ATIVA (negociação com Estado confirmada)
- Adição do Closet Solidário (novo programa — Dep. da Mulher + Fundo Social, lançamento 09/03/2026)
- UBS Animal: deliberadamente não incluída — equipamento de Meio Ambiente sem vínculo direto com cadeia SUAS

**Responsável:** Ailton Vendramini / Claude (Anthropic)  
**Repositório:** pmh-arquitetura-dados-sociais

---

## Nota Metodológica

Este catálogo foi extraído a partir de levantamento documental cobrindo o 2º semestre de 2023
e o 1º semestre de 2024. A partir da v02, incorpora atualizações via radar jornalístico
(Tribuna Liberal). A partir da v03, incorpora varredura do site oficial da Prefeitura. A v04
consolida ciclo jornalístico dez/2025–jan/2026. A v05 detalha serviços das Secretarias de
Inclusão e Desenvolvimento Econômico. A v06 adiciona `base_legal_principal`. A v07 adiciona
`esfera`, `id_orgao_executor`, `nome_orgao_executor` e `base_legal_municipal`. A v08 incorpora
correções e adições do ciclo jornalístico 04–08/03/2026.

**Tipo funcional:**
- **Tipo A — Serviço Direto:** gera atendimento registrável
- **Tipo B — Política Articulada:** define diretrizes, não gera atendimento direto

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
base_legal_principal     (LOAS | CNAS 109/2009 | PBF | CadÚnico |
                          ECA | Municipal | Estadual | Outro)
base_legal_municipal     (lei/decreto municipal específico, se houver)
ativo                    (S/N)
data_inicio
observacoes
```

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
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `CRAS_SANTA_CLARA` · `CRAS_AMANDA` · `CRAS_NOVO_ANGULO` · `CRAS_ROSOLEM` · `CRAS_PRIMAVERA` · `CRAS_BRASIL` · `CRAS_VILA_REAL`
- **nome_orgao_executor:** 7 CRAS municipais
- **Público-alvo:** Famílias em situação de vulnerabilidade
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Base legal principal:** CNAS 109/2009
- **Base legal municipal:** Lei 3.911/2021 (SUAS Municipal)

#### Endereços dos CRAS
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
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `CRAS_SANTA_CLARA` · `CRAS_AMANDA` · `CRAS_NOVO_ANGULO` · `CRAS_ROSOLEM` · `CRAS_PRIMAVERA` · `CRAS_BRASIL` · `CRAS_VILA_REAL`
- **nome_orgao_executor:** 7 CRAS municipais
- **Público-alvo:** Crianças, adolescentes, adultos e idosos em vulnerabilidade
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Base legal principal:** CNAS 109/2009
- **Base legal municipal:** Lei 3.911/2021

---

### CCS — Centro de Convivência Social (Jd. Rosolém)

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `CRAS_ROSOLEM`
- **nome_orgao_executor:** CRAS Rosolém / CCS Jd. Rosolém
- **Endereço:** Rua Guido Rosolém, 177, Jardim Rosolém
- **Público-alvo:** Comunidade geral da área de abrangência
- **Vínculo CadÚnico:** Parcial
- **Nível de proteção:** Básica
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** ⚠️ Verificar se permanece como equipamento distinto do CRAS Rosolém ou foi reintegrado.

---

## Grupo 2 — Proteção Social Especial

---

### Atendimento Social / População em Situação de Rua (Centro POP)

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `CENTROPOP_01`
- **nome_orgao_executor:** Centro POP — Remanso Campineiro
- **Endereço:** Rua Maria Bernardes, 505, Remanso Campineiro
- **Contato:** centropop.smids@hortolandia.sp.gov.br / WhatsApp (19) 9 9976-1742
- **Público-alvo:** Adultos, adolescentes e famílias em situação de rua; vítimas de violação de direitos; uso de substâncias; sem moradia
- **Vínculo CadÚnico:** Parcial — acesso sem exigência de documentação
- **Nível de proteção:** Especial — Média Complexidade
- **Acesso:** Espontâneo ou encaminhamento — sem documentação
- **Prazo:** Imediato
- **Base legal principal:** LOAS + CNAS 109/2009
- **Base legal municipal:** Lei 3.911/2021
- **Serviços ofertados:** Acolhimento e escuta; higiene pessoal; alimentação diária; encaminhamento para acolhimento; apoio à documentação; recâmbio para cidade de origem; reaproximação familiar
- **⚠️ Nota arquitetural:** pessoas sem documentação não aparecem no CadÚnico — ponto cego estrutural.

---

### Casa de Passagem e Abrigo

- **Esfera:** `Intersetorial` (Federal/Municipal + OSC)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `OSC_ESPERANCAR`
- **nome_orgao_executor:** Instituto Esperançar (conveniado)
- **Público-alvo:** Pessoas em situação de rua ou vulnerabilidade social
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Acesso:** Encaminhamento obrigatório — fluxo em cadeia: `Centro POP → Casa de Passagem → Abrigo`
- **Base legal principal:** LOAS + CNAS 109/2009
- **Base legal municipal:** A confirmar
- **⚠️ Nota arquitetural:** fluxo em cadeia gera múltiplos registros para a mesma pessoa. CPF é âncora obrigatória.

---

### PAEFI — Serviço de Proteção e Atendimento Especializado a Famílias e Indivíduos

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `CREAS_01`
- **nome_orgao_executor:** CREAS — Remanso Campineiro
- **Endereço:** Rua Francisco Castilho, 298, Remanso Campineiro
- **Contato:** (19) 3909-4546
- **Público-alvo:** Famílias com violação de direitos, violência, situações de risco
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Média Complexidade
- **Base legal principal:** CNAS 109/2009
- **Base legal municipal:** Lei 3.911/2021

---

### Serviço Especializado em Abordagem Social

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `CENTROPOP_01`
- **nome_orgao_executor:** Centro POP
- **Público-alvo:** População em situação de rua
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Base legal principal:** CNAS 109/2009
- **Base legal municipal:** Lei 3.911/2021

---

### Serviço de Proteção Social a Adolescentes em Cumprimento de Medida Socioeducativa (LA e PSC)

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `CREAS_01`
- **nome_orgao_executor:** CREAS
- **Público-alvo:** Adolescentes em cumprimento de LA ou PSC
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Média Complexidade
- **Base legal principal:** ECA + CNAS 109/2009
- **Base legal municipal:** A confirmar

---

### Serviço de Atendimento Domiciliar para PCD e Idosos

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Secretaria de Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas com deficiência e idosos em domicílio
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Especial
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Serviço de Proteção Social Especial para PCD, Idosos e suas Famílias

- **Esfera:** `Intersetorial` (Federal/Municipal)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `CREAS_01`
- **nome_orgao_executor:** CREAS
- **Público-alvo:** Pessoas com deficiência, idosos e famílias
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Especial
- **Base legal principal:** LOAS + CNAS 109/2009
- **Base legal municipal:** Lei 3.911/2021

---

### Serviço de Apoio a Famílias e Pessoas em Situação de Risco

- **Esfera:** `Intersetorial` (Federal/Municipal)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Secretaria de Inclusão e Desenvolvimento Social
- **Público-alvo:** Famílias e pessoas em situação de risco
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial
- **Base legal principal:** LOAS
- **Base legal municipal:** Lei 3.911/2021

---

### Serviços de Emergência do Município

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Secretarias parceiras:** Defesa Civil, Habitação, Saúde
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Secretaria de Inclusão (coordenação intersetorial)
- **Público-alvo:** Famílias desabrigadas por eventos climáticos
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade / Intersetorial
- **Base legal principal:** Municipal
- **Base legal municipal:** Decreto 5.598/2025
- **Observações:** Evento de referência: chuvas 26/02/2026 — 16 famílias acolhidas.

---

### Acolhimento Institucional / Casa de Passagem

- **Esfera:** `Intersetorial` (Municipal + OSC)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `OSC_ESPERANCAR`
- **nome_orgao_executor:** Instituto Esperançar (conveniado)
- **Público-alvo:** População em situação de rua, adultos e famílias
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Base legal principal:** LOAS + CNAS 109/2009
- **Base legal municipal:** A confirmar

---

## Grupo 3 — Programas Municipais Específicos (Inclusão)

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
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** Requisito obrigatório do Programa Ressignifica Hortolândia. Caso Suelen (Tribuna Liberal 08/03/2026): trajetória documentada CRAS → ACERTE → assistente administrativa → emprego no próprio CRAS — evidência empírica da cadeia de emancipação.

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
- **Base legal principal:** Municipal
- **Base legal municipal:** ✅ Lei 3.955/2022

---

### Programa de Apadrinhamento para Crianças e Adolescentes em Acolhimento

- **Esfera:** `Intersetorial` (Federal/Municipal)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Sec. Inclusão / CMDCA
- **Público-alvo:** Crianças e adolescentes em acolhimento institucional
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Base legal principal:** ECA
- **Base legal municipal:** A confirmar
- **Observações:** Vinculado ao CMDCA. Apadrinhamento afetivo e/ou financeiro.

---

### Programa de Enfrentamento ao Trabalho Infantil

- **Esfera:** `Intersetorial` (Federal/Municipal)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `CREAS_01`
- **nome_orgao_executor:** CREAS / Conselho Tutelar
- **Público-alvo:** Crianças e adolescentes em situação de trabalho infantil
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial
- **Base legal principal:** ECA
- **Base legal municipal:** A confirmar
- **Observações:** Interface direta com Conselho Tutelar e CREAS.

---

### Projeto Capacita

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `CQP_I`
- **nome_orgao_executor:** CQP I — Centro de Qualificação Pessoal e Profissional
- **Endereço:** Rua Estados Unidos, 271, Jd. Santa Clara do Lago II
- **Público-alvo:** Pessoas em vulnerabilidade buscando qualificação profissional
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Produtivo
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** ⚠️ Verificar distinção em relação ao "Capacita Hortolândia" do Fundo Social.

---

### Projeto Costura Industrial

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `CQP_II`
- **nome_orgao_executor:** CQP II — Centro de Qualificação — Costura e Moda
- **Endereço:** Rua Eleusina Batista Silva, 14, Jd. Terras de Santo Antônio
- **Público-alvo:** Pessoas em vulnerabilidade buscando inserção no setor têxtil/industrial
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Produtivo
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** Modalidade ativa do ACERTE (fev/2026). Benefício: R$ 710 + cesta básica.

---

### Farmácia Solidária

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Secretaria de Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas em vulnerabilidade socioeconômica
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Básico / Saúde
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** ⚠️ Detalhar critério de acesso e integração com farmácia popular federal.

---

### Feiras de Empreendedores

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `CESP`
- **nome_orgao_executor:** CESP — Centro de Empreendimentos Solidários e Popular
- **Endereço:** Rua Zacarias Costa Camargo, 50, Remanso Campineiro
- **Público-alvo:** Empreendedores em vulnerabilidade / economia solidária
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Produtivo
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** Distinto das Feiras Livres (Desenvolvimento Econômico) — foco em empreendedorismo social.

---

### Programa Ressignifica Hortolândia

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `CENTROPOP_01`
- **nome_orgao_executor:** Centro POP / Rede de Acolhimento
- **Público-alvo:** Moradores em situação de rua
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade / Intersetorial
- **Origem:** Municipal — lançado dezembro/2023
- **Benefício:** Bolsa mensal R$ 700 + cesta básica + auxílio aluguel
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
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Inscrição de OSCs no CMAS

- **Esfera:** `Municipal`
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Sec. Inclusão / CMAS
- **Público-alvo:** Organizações da Sociedade Civil
- **Vínculo CadÚnico:** Não
- **Base legal principal:** LOAS
- **Base legal municipal:** Lei 3.911/2021

---

### Inscrição de OSCs no CMDCA

- **Esfera:** `Municipal`
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Inclusão e Desenvolvimento Social / CMDCA
- **id_orgao_executor:** `SEC_INCLUSAO`
- **nome_orgao_executor:** Sec. Inclusão / CMDCA
- **Público-alvo:** OSCs voltadas à criança e ao adolescente
- **Vínculo CadÚnico:** Não
- **Base legal principal:** ECA
- **Base legal municipal:** A confirmar

---

## Grupo 4 — Segurança Alimentar

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
- **Base legal principal:** Outro (Lei 10.696/2003)
- **Base legal municipal:** A confirmar

---

### Distribuição de Cestas Básicas

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social / Fundo Social
- **id_orgao_executor:** `FUNDO_SOCIAL`
- **nome_orgao_executor:** Fundo Social de Solidariedade
- **Vínculo CadÚnico:** Sim
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
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Cozinha Comunitária

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **id_orgao_executor:** `DEP_SEG_ALIMENTAR`
- **nome_orgao_executor:** Departamento de Segurança Alimentar
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** ⚠️ Verificar se é o mesmo equipamento que a "Escola Comunitária" do Jd. Novo Ângulo.

---

## Grupo 5 — Habitação

---

### Agora a Casa é Sua

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **id_orgao_executor:** `SEC_HABITACAO`
- **nome_orgao_executor:** Secretaria de Habitação (parceria Cidade Legal / Estadual)
- **Vínculo CadÚnico:** Indireto
- **Alcance 2021–2024:** ~3.000 títulos entregues
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Programa Vida Longa (Estadual)

- **Esfera:** `Estadual`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **id_orgao_executor:** `SEC_HABITACAO`
- **nome_orgao_executor:** Secretaria de Habitação (ponto municipal do programa estadual)
- **Público-alvo:** Idosos em vulnerabilidade, residentes há ≥ 2 anos no município
- **Vínculo CadÚnico:** Sim — critério explícito
- **Vagas Hortolândia:** 28 unidades habitacionais
- **Status:** NEGOCIAÇÃO ATIVA — tratativas em andamento com o Governo do Estado (Tribuna Liberal, 04/03/2026)
- **Base legal principal:** Estadual
- **Base legal municipal:** A confirmar

---

### Minha Casa, Minha Vida — Hortolândia

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **id_orgao_executor:** `SEC_HABITACAO`
- **nome_orgao_executor:** Secretaria de Habitação
- **Vínculo CadÚnico:** Sim — critério federal
- **Status:** EXECUÇÃO — 400 unidades em construção no Jardim Amanda (início 2026)
- **Documentações coletadas:** 576 ⚠️ *Número divergente entre edições de 05/03 e 06/03/2026 da Tribuna Liberal — confirmar junto à Secretaria de Habitação antes de usar em indicador*
- **Base legal principal:** PBF / CadÚnico
- **Base legal municipal:** Lei 14.620/2023 (federal)

---

### PHLIS — Plano Municipal de Habitação de Interesse Social

- **Esfera:** `Municipal`
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Habitação
- **id_orgao_executor:** `SEC_HABITACAO`
- **nome_orgao_executor:** Secretaria de Habitação
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

## Grupo 6 — Inserção Produtiva e Qualificação

---

### PAT — Posto de Atendimento ao Trabalhador

- **Esfera:** `Estadual/Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `PAT_01`
- **nome_orgao_executor:** PAT — Posto de Atendimento ao Trabalhador
- **Público-alvo:** Desempregados em geral, incluindo PCD
- **Vínculo CadÚnico:** Indireto
- **Contato:** pat@hortolandia.sp.gov.br / (19) 3965-1400 ramais 8904 ou 8925
- **Base legal principal:** Outro (Lei 7.998/1990)
- **Base legal municipal:** A confirmar

---

### Cadastro de Vagas de Trabalho por Empresa — PAT

- **Esfera:** `Estadual/Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `PAT_01`
- **nome_orgao_executor:** PAT
- **Público-alvo:** Empresas (oferta) + trabalhadores cadastrados (demanda)
- **Vínculo CadÚnico:** Indireto
- **Acesso:** Telefone ou e-mail / Prazo: Imediato
- **Base legal principal:** Outro (Lei 7.998/1990)
- **Base legal municipal:** A confirmar
- **⚠️ Nota arquitetural:** PAT é o ponto de cruzamento entre CadÚnico e mercado formal. Cruzamento CadÚnico × vagas PAT × CAGED fecha o triângulo de transição produtiva.

---

### Cadastro no SINE e Encaminhamento para Vagas

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `PAT_01`
- **nome_orgao_executor:** PAT (ponto da rede SINE federal)
- **Operador:** Ministério do Trabalho (SINE / Emprega Brasil)
- **Vínculo CadÚnico:** Indireto
- **Acesso:** Presencial no PAT ou online via Emprega Brasil / app CTPS Digital
- **Prazo:** Imediato
- **Base legal principal:** Outro (Lei 7.998/1990)
- **Base legal municipal:** A confirmar
- **⚠️ Nota arquitetural:** dados ficam no MTE federal. Integração futura requer convênio ou API federal.

---

### Banco do Povo

- **Esfera:** `Estadual`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `EXT_DESENVOLVE_SP`
- **nome_orgao_executor:** Desenvolve SP (ponto municipal de atendimento)
- **Público-alvo:** MEI, ME, EPP, LTDA, EIRELI — formais e informais
- **Vínculo CadÚnico:** A confirmar
- **Acesso:** Presencial — documentação obrigatória / Prazo: 15 dias
- **Contato:** bancodopovo@hortolandia.sp.gov.br / WhatsApp (19) 9 9919-5984
- **Base legal principal:** Outro (Lei 9.533/1997)
- **Base legal municipal:** A confirmar
- **⚠️ Nota arquitetural:** dados de crédito ficam na Desenvolve SP. Cruzamento CadÚnico × Banco do Povo responderia: "Quantos beneficiários acessaram crédito produtivo após saírem de transferência de renda?"

---

### Orientação ao MEI

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `DEP_EMPREEND`
- **nome_orgao_executor:** Departamento de Empreendedorismo e Microempresas
- **Público-alvo:** MEIs — abertura, regularização e obrigações fiscais
- **Vínculo CadÚnico:** Indireto
- **Acesso:** Presencial — documentos + senha GOV.BR / Prazo: Imediato
- **Base legal principal:** Outro (LC 128/2008)
- **Base legal municipal:** A confirmar
- **⚠️ Nota arquitetural:** formalização via MEI não aparece no CAGED — só na Receita Federal. Ponto cego no monitoramento de transição produtiva.

---

### SEBRAE Aqui

- **Esfera:** `Estadual`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `EXT_SEBRAE_SP`
- **nome_orgao_executor:** SEBRAE-SP (ponto municipal de atendimento)
- **Público-alvo:** Empreendedores e futuros empreendedores
- **Vínculo CadÚnico:** Indireto
- **Acesso:** Presencial com RG/CNH + CNPJ se já empresa / Prazo: Imediato
- **Base legal principal:** Outro
- **Base legal municipal:** A confirmar
- **⚠️ Nota arquitetural:** dados ficam nos sistemas do SEBRAE. Integração futura dependeria de convênio.

---

### Seguro Desemprego

- **Esfera:** `Federal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **id_orgao_executor:** `PAT_01`
- **nome_orgao_executor:** PAT (apoio a casos judiciais; operação federal via Gov.br)
- **Operador:** Ministério do Trabalho
- **Público-alvo:** Trabalhador formal dispensado sem justa causa
- **Vínculo CadÚnico:** Indireto
- **Acesso:** Digital (app CTPS ou Gov.br) ou presencial no PAT para casos judiciais
- **Contato:** pat@hortolandia.sp.gov.br / ramais 8904 ou 8925
- **Base legal principal:** Outro (Lei 7.998/1990)
- **Base legal municipal:** A confirmar
- **⚠️ Nota estratégica:** Seguro Desemprego é porta de entrada previsível para o CadÚnico — quando o benefício se esgota sem recolocação, a tendência é buscar assistência social.

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
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar

---

### Programa Meu Emprego — Trabalho em Equipe

- **Esfera:** `Estadual/Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (DIPGR)
- **id_orgao_executor:** `DEP_DIPGR`
- **nome_orgao_executor:** Dep. de Inclusão Produtiva e Gestão de Relações Institucionais
- **Público-alvo:** Jovens 16–20 anos + desempregados +3 meses + beneficiários do seguro-desemprego
- **Vínculo CadÚnico:** Indireto
- **Base legal principal:** Outro
- **Base legal municipal:** A confirmar

---

## Grupo 7 — Públicos Específicos / Direitos Humanos

---

### Cadastro e Políticas para PCD

- **Esfera:** `Municipal`
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo (DPCD)
- **id_orgao_executor:** `DEP_PCD`
- **nome_orgao_executor:** Dep. de Políticas Públicas para a PCD
- **Gestora:** Quézia Garcia
- **Vínculo CadÚnico:** Indireto
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
- **Base legal principal:** Outro (Lei 11.340/2006)
- **Base legal municipal:** A confirmar *(em operação desde 2017)*

---

### Closet Solidário *(novo — v08)*

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. de Políticas Públicas para a Mulher)
- **Secretarias parceiras:** Fundo Social de Solidariedade
- **id_orgao_executor:** `CRAM_01` · `FUNDO_SOCIAL`
- **nome_orgao_executor:** CRAM + Fundo Social de Solidariedade
- **Endereço:** CRAM "Débora Regina Leme dos Santos", Rua Alberto Gomes, 18, Jardim das Paineiras
- **Público-alvo:** Mulheres atendidas pelo CRAM
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Especial / Direitos das Mulheres
- **Status:** EXECUÇÃO — lançamento 09/03/2026
- **Acesso:** Encaminhamento via CRAM
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** Doação de roupas e itens pessoais para mulheres atendidas pelo CRAM. Diretora responsável: Josefa Teixeira (Dep. Políticas Públicas para a Mulher). Fonte: Tribuna Liberal, 06/03/2026 e 08/03/2026.

---

### Viva Mais

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. Relações Institucionais)
- **id_orgao_executor:** `DEP_DIPGR`
- **nome_orgao_executor:** Dep. de Inclusão Produtiva e Gestão de Relações Institucionais
- **Público-alvo:** Comunidade geral
- **Vínculo CadÚnico:** Indireto
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
- **Base legal principal:** Outro (Lei 13.257/2016)
- **Base legal municipal:** A confirmar

---

## Grupo 8 — Formação Cultural

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
- **Base legal principal:** Municipal
- **Base legal municipal:** A confirmar
- **Observações:** ⚠️ Verificar se existe registro de matrículas para modelagem em FATO_ATENDIMENTO.

---

## Grupo 9 — Serviços de Saúde com Interface SUAS

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
- **Base legal principal:** Outro (Lei 8.080/1990)
- **Base legal municipal:** A confirmar

---

### Vila da Saúde *(em planejamento)*

- **Esfera:** `Municipal`
- **Tipo:** A — Serviço Direto *(em planejamento)*
- **Secretaria responsável:** A confirmar
- **id_orgao_executor:** A confirmar
- **nome_orgao_executor:** A confirmar
- **Público-alvo:** População geral de Hortolândia
- **Vínculo CadÚnico:** A confirmar
- **Status:** Intenção declarada pelo prefeito Zezé Gomes (jan/2026). Sem endereço, secretaria ou prazo confirmados.
- **Base legal principal:** A confirmar
- **Base legal municipal:** A confirmar
- **Observações:** Monitorar edições futuras da Tribuna Liberal.

---

## Grupo 10 — Governança e Conselhos

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
| SEC_INCLUSAO | Sec. Inclusão e Desenvolvimento Social | Secretaria | DIM_GESTORES |
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
| EXT_DESENVOLVE_SP | Desenvolve SP | Operador externo estadual | — |
| EXT_SEBRAE_SP | SEBRAE-SP | Operador externo estadual | — |

---

## Notas Arquiteturais Consolidadas (v08)

| # | Nota | Impacto no modelo |
|---|------|-----------------|
| 1 | Centro POP atende sem documentação | Ponto cego no CadÚnico — CPF = PENDENTE |
| 2 | Fluxo Centro POP → Casa de Passagem → Abrigo | Mesma pessoa gera múltiplos registros — CPF é âncora obrigatória |
| 3 | Banco do Povo e SEBRAE: dados nos operadores externos | Integração futura requer convênio |
| 4 | SINE / Seguro Desemprego: dados no MTE federal | Integração futura requer API federal |
| 5 | MEI não aparece no CAGED | Ponto cego no monitoramento de transição produtiva |
| 6 | Seguro Desemprego → CadÚnico | Fluxo de entrada previsível — a modelar |
| 7 | Feiras Livres: renda informal não declarada | Impacto na classificação de vulnerabilidade |
| 8 | `base_legal_principal` é atalho analítico | Não substitui REL_NORMA_PROGRAMA — complementa |
| 9 | `id_orgao_executor` é FK para JOIN | Liga DIM_PROGRAMA → DIM_UNIDADES_ATENDIMENTO e DIM_GESTORES |
| 10 | Operadores externos (EXT_) sem dimensão interna | Integração futura via convênio ou API |
| 11 | MCMV Amanda: divergência 421×576 documentações | Dado a validar junto à Secretaria de Habitação antes de uso em indicador |

---

## Trajetória Típica de Transição Produtiva

```
CadÚnico (entrada)
    ↓
PAIF — acompanhamento familiar (CRAS)
    ↓
Projeto Capacita / Costura Industrial — qualificação
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

> ⚠️ 12 OSCs parceiras dos CRAS ainda sem id individual — catalogação pendente (aguarda Mapa OSC completo).

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
| 7 | DECOLA Juventude — verificar status atual | Média |
| 8 | Vila da Saúde — monitorar confirmação de secretaria e prazo | Baixa |
| 9 | Cruzar cobertura territorial dos 7 CRAS com loteamentosregiao.xls | Alta |
| 10 | Levantar leis municipais de criação dos CRAS, Centro POP, ACERTE e Ressignifica | Alta |
| 11 | Confirmar `id_orgao_executor` para ESPACO_INCLUIR e EMPORIO_JACUBA | Média |
| 12 | Catalogar 12 OSCs parceiras dos CRAS individualmente | Média |
| 13 | MCMV Amanda: confirmar número oficial de documentações (576?) junto à Secretaria de Habitação | Alta |
| 14 | Closet Solidário: confirmar base legal municipal e critérios formais de acesso | Média |
| 15 | Confirmar `id_orgao_executor` DEP_MULHERES — verificar se é departamento formal ou vinculado ao Dep. de Governo | Média |
| 16 | Programa Vida Longa: monitorar resultado das negociações com o Estado | Média |

---

## Log de Alterações

| Versão | Data | Alterações |
|--------|------|-----------|
| v01 | 27/02/2026 | Criação do catálogo — levantamento documental 2023–2024 |
| v02 | 28/02/2026 | Correção ACERTE; Atendimento Emergencial (26/02/2026); MCMV Jd. Amanda |
| v03 | 01/03/2026 | Varredura site oficial: Viva Mais, PCD/Idosos, Banco do Povo, Cozinha Comunitária, Formações Culturais |
| v04 | 01/03/2026 | Ciclo jornalístico dez/2025–jan/2026: Vila da Saúde, SAMU Regional, Fundo Social cursos jan/2026 |
| v05 | 03/03/2026 | Varredura Sec. Inclusão (22 serviços); Sec. Desenvolvimento Econômico (7 serviços); notas arquiteturais |
| v06 | 03/03/2026 | Campo `base_legal_principal`; base legal dos conselhos (G10) |
| v07 | 05/03/2026 | Campos `esfera`, `id_orgao_executor`, `nome_orgao_executor`, `base_legal_municipal`; glossário FK completo |
| v08 | 07/03/2026 | Ciclo jornalístico 04–08/03/2026: MCMV Amanda → status EXECUÇÃO, 576 documentações (⚠️ divergência a confirmar); Programa Vida Longa → status NEGOCIAÇÃO ATIVA; adição Closet Solidário (novo programa, Dep. Mulheres + Fundo Social, lançamento 09/03/2026); ACERTE → nota caso Suelen (evidência empírica da cadeia de emancipação); nome oficial CRAM atualizado; DEP_MULHERES adicionado ao glossário FK; Cons. Direitos da Mulher adicionado ao G10; CAGED jan/2026 adicionado ao dado de contexto; pendências 13–16 abertas |

---

*Documento de registro interno — Projeto de Inteligência Territorial — Hortolândia, março de 2026*
