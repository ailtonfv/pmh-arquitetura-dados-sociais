# DIM_PROGRAMA — Catálogo de Programas Municipais de Hortolândia
**Versão:** 06
**Data de atualização:** 03/03/2026
**Versão anterior:** 05 (03/03/2026)
**Atualizações v06:** Adição do campo `base_legal_principal` na estrutura
**Responsável:** Ailton Vendramini / Claude (Anthropic)
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Nota metodológica

Este catálogo foi extraído a partir de um levantamento documental
cobrindo o 2º semestre de 2023 e o 1º semestre de 2024.
A partir da v02, incorpora atualizações via radar jornalístico
(Tribuna Liberal). A partir da v03, incorpora varredura do site
oficial da Prefeitura. A v04 consolida ciclo jornalístico
dez/2025–jan/2026. A v05 detalha serviços das Secretarias de
Inclusão e Desenvolvimento Econômico. A v06 adiciona o campo
`base_legal_principal` à estrutura — atalho analítico que
complementa (sem substituir) a REL_NORMA_PROGRAMA.

**Tipo funcional:**
- **Tipo A — Serviço Direto:** gera atendimento registrável
- **Tipo B — Política Articulada:** define diretrizes, não gera
  atendimento direto

---

## Estrutura do DIM_PROGRAMA
```
id_programa
cod_programa
nome_programa
tipo_programa          (A = Serviço Direto | B = Política Articuladora)
categoria
secretaria_responsavel
departamento_executor
secretarias_parceiras
publico_alvo
faixa_etaria
vinculo_cadunico       (S/N)
nivel_protecao
origem                 (Municipal | Estadual | Federal | Intersetorial)
operador_externo
acesso                 (Presencial | Digital | Espontâneo | Encaminhamento)
prazo_execucao
contato
base_legal_principal   (LOAS | CNAS 109/2009 | PBF | CadÚnico |
                        ECA | Municipal | Estadual | Outro)
ativo                  (S/N)
data_inicio
observacoes
```

**Nota sobre `base_legal_principal`:**
Campo de referência rápida — denormalização consciente e justificada
para consultas simples e relatórios sem join.
A relação completa norma × programa está em REL_NORMA_PROGRAMA.

---

## Grupo 1 — Proteção Social Básica

### PAIF — Serviço de Proteção e Atendimento Integral às Famílias
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Famílias em situação de vulnerabilidade
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Origem:** Federal
- **Base legal principal:** CNAS 109/2009
- **Unidades executoras:** 7 CRAS

#### Endereços dos CRAS
| # | Unidade | Endereço | Telefone |
|---|---------|----------|----------|
| 1 | CRAS Jardim Santa Clara | Rua Estados Unidos, 217, Jd. Santa Clara do Lago II | 3865-1133 / 3897-2519 |
| 2 | CRAS Jardim Amanda | Av. Tarsila do Amaral, 540, Jd. Amanda II | 3819-7619 / 3865-7276 |
| 3 | CRAS Jardim Novo Ângulo | Rua Francisco Bereta, 330, Jd. Novo Ângulo | 3809-1945 / 3845-7629 |
| 4 | CRAS Rosolém — Joel Alves Assunção | Rua Guido Rosolém, 177, Jardim Rosolém | 3809-3164 |
| 5 | CRAS Primavera — Chico Vigilante | Rua Amoreira, 35, Jd. Primavera | 3865-1225 / 3819-6899 |
| 6 | CRAS Jardim Brasil — Maria Humilde Antunes (Zuma) | Rua da Amizade, 240, Jardim Brasil | 3909-1398 |
| 7 | CRAS Vila Real | Rua Ernesto Bergamasco, 185, Vila Real | 3865-4269 |

---

### SCFV — Serviço de Convivência e Fortalecimento de Vínculos
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Crianças, adolescentes, adultos e idosos
  em situação de vulnerabilidade
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Origem:** Federal
- **Base legal principal:** CNAS 109/2009

---

### CCS — Centro de Convivência Social (Jd. Rosolém)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Comunidade geral da área de abrangência
- **Vínculo CadÚnico:** Parcial
- **Nível de proteção:** Básica
- **Origem:** Municipal
- **Base legal principal:** Municipal
- **Endereço:** Rua Guido Rosolém, 177, Jardim Rosolém
- **Observações:** ⚠️ Verificar se permanece como equipamento
  distinto do CRAS Rosolém ou foi reintegrado.

---

## Grupo 2 — Proteção Social Especial

### Atendimento Social / População em Situação de Rua
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Unidade executora:** Centro POP — Rua Maria Bernardes,
  nº 505, Remanso Campineiro
- **Público-alvo:** Adultos, adolescentes e famílias em situação
  de rua; vítimas de violação de direitos; uso de substâncias;
  sem moradia
- **Vínculo CadÚnico:** Parcial — acesso sem exigência
  de documentação
- **Nível de proteção:** Especial — Média Complexidade
- **Origem:** Federal
- **Base legal principal:** LOAS + CNAS 109/2009
- **Acesso:** Espontâneo ou encaminhamento — sem documentação
- **Prazo:** Imediato
- **Contato:** centropop.smids@hortolandia.sp.gov.br /
  WhatsApp (19) 9 9976-1742
- **Serviços ofertados:** Acolhimento e escuta; higiene pessoal;
  alimentação diária; encaminhamento para acolhimento;
  apoio à documentação; recâmbio para cidade de origem;
  reaproximação familiar
- **⚠️ Nota arquitetural:** pessoas sem documentação não
  aparecem no CadÚnico — ponto cego estrutural.

---

### Casa de Passagem e Abrigo
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas em situação de rua ou
  vulnerabilidade social
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Origem:** Federal / parceria Instituto Esperançar
- **Base legal principal:** LOAS + CNAS 109/2009
- **Acesso:** Encaminhamento obrigatório — fluxo em cadeia:
```
Centro POP → Casa de Passagem → Abrigo
```
- **⚠️ Nota arquitetural:** fluxo em cadeia gera múltiplos
  registros para a mesma pessoa. CPF é âncora obrigatória.

---

### PAEFI
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Unidade executora:** CREAS — Rua Francisco Castilho, 298,
  Remanso Campineiro. Tel: (19) 3909-4546
- **Público-alvo:** Famílias com violação de direitos,
  violência, situações de risco
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Média Complexidade
- **Origem:** Federal
- **Base legal principal:** CNAS 109/2009

---

### Serviço Especializado em Abordagem Social
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Unidade executora:** Centro POP
- **Público-alvo:** População em situação de rua
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Origem:** Federal
- **Base legal principal:** CNAS 109/2009

---

### Serviço de Proteção Social a Adolescentes em
### Cumprimento de Medida Socioeducativa (LA e PSC)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Adolescentes em cumprimento de LA ou PSC
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Média Complexidade
- **Origem:** Federal
- **Base legal principal:** ECA + CNAS 109/2009

---

### Serviço de Atendimento Domiciliar para PCD e Idosos
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas com deficiência e idosos
  em domicílio
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Especial
- **Origem:** Municipal
- **Base legal principal:** Municipal

---

### Serviço de Proteção Social Especial para PCD,
### Idosos e suas Famílias
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas com deficiência, idosos e famílias
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Especial
- **Origem:** Federal / Municipal
- **Base legal principal:** LOAS + CNAS 109/2009

---

### Serviço de Apoio a Famílias e Pessoas em Situação de Risco
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Famílias e pessoas em situação de risco
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial
- **Origem:** Municipal / Federal
- **Base legal principal:** LOAS

---

### Serviços de Emergência do Município
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Secretarias parceiras:** Defesa Civil, Habitação, Saúde
- **Público-alvo:** Famílias desabrigadas por eventos climáticos
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade /
  Intersetorial
- **Origem:** Municipal
- **Base legal principal:** Municipal
- **Observações:** Evento de referência: chuvas 26/02/2026
  — 16 famílias acolhidas.

---

### Acolhimento Institucional / Casa de Passagem
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** População em situação de rua, adultos
  e famílias
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Origem:** Municipal / Instituto Esperançar
- **Base legal principal:** LOAS + CNAS 109/2009

## Grupo 3 — Programas Municipais Específicos (Inclusão)

### FUNDO SOCIAL — Atendimento Emergencial
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Fundo Social de Solidariedade
- **Público-alvo:** Famílias em vulnerabilidade emergencial
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básico / Alimentar
- **Origem:** Municipal
- **Base legal principal:** Municipal

---

### ACERTE — Ação Cidadã de Requalificação, Trabalho e Educação
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. Relações Institucionais)
- **Público-alvo:** Pessoas em vulnerabilidade, egressos de
  programas sociais, população em situação de rua
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Produtivo
- **Origem:** Municipal
- **Base legal principal:** Municipal
- **Benefício:** Bolsa-auxílio R$ 710 + cesta básica
- **Modalidades ativas (fev/2026):** Costura Industrial,
  Serviços Gerais
- **Observações:** Requisito obrigatório do Programa
  Ressignifica Hortolândia.

---

### Programa Cuidar
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Fundo Social de Solidariedade
- **Público-alvo:** Gestantes a partir da 34ª semana que
  realizam pré-natal na rede municipal
- **Vínculo CadÚnico:** Parcial
- **Nível de proteção:** Básico / Intersetorial
- **Origem:** Municipal — lançado outubro/2022
- **Base legal principal:** Municipal

---

### Programa de Apadrinhamento para Crianças e
### Adolescentes em Situação de Acolhimento
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Crianças e adolescentes em acolhimento
  institucional
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Origem:** Federal / Municipal
- **Base legal principal:** ECA
- **Observações:** Vinculado ao CMDCA. Apadrinhamento
  afetivo e/ou financeiro.

---

### Programa de Enfrentamento ao Trabalho Infantil
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Crianças e adolescentes em situação
  de trabalho infantil
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial
- **Origem:** Federal / Municipal
- **Base legal principal:** ECA
- **Observações:** Interface direta com Conselho Tutelar
  e CREAS.

---

### Projeto Capacita
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas em vulnerabilidade buscando
  qualificação profissional
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Produtivo
- **Origem:** Municipal
- **Base legal principal:** Municipal
- **Observações:** ⚠️ Verificar distinção em relação ao
  "Capacita Hortolândia" do Fundo Social.

---

### Projeto Costura Industrial
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas em vulnerabilidade buscando
  inserção no setor têxtil/industrial
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Produtivo
- **Origem:** Municipal
- **Base legal principal:** Municipal
- **Observações:** Modalidade ativa do ACERTE (fev/2026).
  Benefício: bolsa-auxílio R$ 710 + cesta básica.

---

### Farmácia Solidária
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas em vulnerabilidade socioeconômica
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Básico / Saúde
- **Origem:** Municipal
- **Base legal principal:** Municipal
- **Observações:** ⚠️ Detalhar critério de acesso e
  integração com farmácia popular federal.

---

### Feiras de Empreendedores
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Empreendedores em vulnerabilidade /
  economia solidária
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Produtivo
- **Origem:** Municipal
- **Base legal principal:** Municipal
- **Observações:** Distinto das Feiras Livres
  (Desenvolvimento Econômico) — foco em empreendedorismo
  social.

---

### Programa Ressignifica Hortolândia
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Moradores em situação de rua
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade /
  Intersetorial
- **Origem:** Municipal — lançado dezembro/2023
- **Base legal principal:** Municipal + Decreto 7.053/2009
- **Benefício:** Bolsa mensal R$ 700 + cesta básica +
  auxílio aluguel

---

### Bolsa Creche
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **Público-alvo:** Crianças de 6 meses a 3 anos e 6 meses
  sem vaga na rede pública
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Origem:** Municipal
- **Base legal principal:** Municipal

---

### Inscrição de OSCs no CMASH
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Organizações da Sociedade Civil
- **Vínculo CadÚnico:** Não
- **Origem:** Municipal
- **Base legal principal:** LOAS

---

### Inscrição de OSCs no CMDCA
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Inclusão e Desenvolvimento
  Social / CMDCA
- **Público-alvo:** OSCs voltadas à criança e ao adolescente
- **Vínculo CadÚnico:** Não
- **Origem:** Municipal
- **Base legal principal:** ECA

---

## Grupo 4 — Segurança Alimentar

### Banco de Alimentos de Hortolândia (BAH)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
  (Dep. Segurança Alimentar)
- **Público-alvo:** Pessoas em insegurança alimentar
  via 19 OSCs parceiras
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal — criado em 2007
- **Base legal principal:** Municipal
- **Alcance:** 19 organizações / 1.762 pessoas (2024)

---

### PAA — Programa de Aquisição de Alimentos
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **Público-alvo:** Agricultores familiares (fornecedores) +
  beneficiários do Banco de Alimentos
- **Vínculo CadÚnico:** Indireto
- **Origem:** Federal
- **Base legal principal:** Outro (Lei 10.696/2003)

---

### Distribuição de Cestas Básicas
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento
  Social / Fundo Social
- **Vínculo CadÚnico:** Sim
- **Origem:** Municipal
- **Base legal principal:** Municipal

---

### CREAN — Centro de Referência em Educação
### Alimentar e Nutricional
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **Origem:** Municipal — anunciado abr/2023
- **Base legal principal:** Municipal
- **Localização prevista:** Jd. Terras de Santa Maria

---

### Cozinha Comunitária
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **Origem:** Municipal
- **Base legal principal:** Municipal
- **Observações:** ⚠️ Verificar se é o mesmo equipamento
  que a "Escola Comunitária" do Jd. Novo Ângulo.

---

## Grupo 5 — Habitação

### Agora a Casa é Sua
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal + parceria estadual (Cidade Legal)
- **Base legal principal:** Municipal
- **Alcance 2021–2024:** ~3.000 títulos entregues

---

### Programa Vida Longa (Estadual)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **Público-alvo:** Idosos em vulnerabilidade, residentes
  há ≥ 2 anos no município
- **Vínculo CadÚnico:** Sim — critério explícito
- **Origem:** Estadual
- **Base legal principal:** Estadual
- **Vagas Hortolândia:** 28 unidades habitacionais

---

### Minha Casa, Minha Vida — Hortolândia
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **Vínculo CadÚnico:** Sim — critério federal
- **Origem:** Federal
- **Base legal principal:** PBF / CadÚnico
- **Status:** 400 unidades em construção no Jardim Amanda
  (início 2026)

---

### PHLIS — Plano Municipal de Habitação de
### Interesse Social
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Habitação
- **Origem:** Municipal + consultoria Demacamp
- **Base legal principal:** Municipal

- ## Grupo 6 — Inserção Produtiva e Qualificação

### PAT — Posto de Atendimento ao Trabalhador
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico,
  Trabalho, Turismo e Inovação (Dep. do Trabalho)
- **Público-alvo:** Desempregados em geral, incluindo PCD
- **Vínculo CadÚnico:** Indireto
- **Origem:** Estadual / Municipal
- **Base legal principal:** Outro (Lei 7.998/1990)
- **Contato:** pat@hortolandia.sp.gov.br /
  (19) 3965-1400 ramais 8904 ou 8925

---

### Cadastro de Vagas de Trabalho por Empresa — PAT
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico,
  Trabalho, Turismo e Inovação
- **Unidade executora:** PAT
- **Público-alvo:** Empresas (oferta) +
  trabalhadores cadastrados (demanda)
- **Vínculo CadÚnico:** Indireto
- **Origem:** Estadual / Municipal
- **Base legal principal:** Outro (Lei 7.998/1990)
- **Acesso:** Telefone ou e-mail
- **Prazo:** Imediato
- **⚠️ Nota arquitetural:** PAT é o ponto de cruzamento
  entre CadÚnico e mercado formal. Cruzamento
  CadÚnico × vagas PAT × CAGED fecha o triângulo
  de transição produtiva.

---

### Cadastro no SINE e Encaminhamento para Vagas
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico,
  Trabalho, Turismo e Inovação
- **Unidade executora:** PAT
- **Operador:** Ministério do Trabalho (SINE / Emprega Brasil)
  — município é ponto da rede
- **Vínculo CadÚnico:** Indireto
- **Origem:** Federal
- **Base legal principal:** Outro (Lei 7.998/1990)
- **Acesso:** Presencial no PAT ou online via
  Emprega Brasil / app CTPS Digital
- **Prazo:** Imediato
- **⚠️ Nota arquitetural:** dados ficam no MTE federal.
  Integração futura requer convênio ou API federal.

---

### Banco do Povo
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico,
  Trabalho, Turismo e Inovação
  (Dep. Empreendedorismo e Microempresas)
- **Operador:** Desenvolve SP — município é ponto
  de atendimento
- **Público-alvo:** MEI, ME, EPP, LTDA, EIRELI
  — formais e informais
- **Vínculo CadÚnico:** A confirmar
- **Origem:** Estadual
- **Base legal principal:** Outro (Lei 9.533/1997)
- **Acesso:** Presencial — documentação obrigatória
- **Prazo:** 15 dias
- **Contato:** bancodopovo@hortolandia.sp.gov.br /
  WhatsApp (19) 9 9919-5984
- **⚠️ Nota arquitetural:** dados de crédito ficam
  na Desenvolve SP. Cruzamento CadÚnico × Banco do Povo
  responderia: "Quantos beneficiários acessaram crédito
  produtivo após saírem de transferência de renda?"

---

### Orientação ao MEI
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico,
  Trabalho, Turismo e Inovação
  (Dep. Empreendedorismo e Microempresas)
- **Público-alvo:** MEIs — abertura, regularização
  e obrigações fiscais
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal
- **Base legal principal:** Outro (LC 128/2008)
- **Acesso:** Presencial — documentos + senha GOV.BR
- **Prazo:** Imediato
- **⚠️ Nota arquitetural:** formalização via MEI não
  aparece no CAGED — só na Receita Federal. Ponto cego
  no monitoramento de transição produtiva.

---

### SEBRAE Aqui
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico,
  Trabalho, Turismo e Inovação
- **Operador:** SEBRAE-SP — município é ponto
  de atendimento
- **Público-alvo:** Empreendedores e futuros
  empreendedores
- **Vínculo CadÚnico:** Indireto
- **Origem:** Estadual (SEBRAE-SP)
- **Base legal principal:** Outro
- **Acesso:** Presencial com RG/CNH + CNPJ se já empresa
- **Prazo:** Imediato
- **⚠️ Nota arquitetural:** dados ficam nos sistemas
  do SEBRAE. Integração futura dependeria de convênio.

---

### Seguro Desemprego
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico,
  Trabalho, Turismo e Inovação
- **Unidade executora:** PAT
- **Operador:** Ministério do Trabalho (Gov.br)
  — município apoia casos judiciais
- **Público-alvo:** Trabalhador formal dispensado
  sem justa causa
- **Vínculo CadÚnico:** Indireto
- **Origem:** Federal
- **Base legal principal:** Outro (Lei 7.998/1990)
- **Acesso:** Digital (app CTPS ou Gov.br) ou
  presencial no PAT para casos judiciais
- **Prazo:** Imediato
- **Contato:** pat@hortolandia.sp.gov.br /
  ramais 8904 ou 8925
- **⚠️ Nota estratégica:** Seguro Desemprego é porta
  de entrada previsível para o CadÚnico — quando o
  benefício se esgota sem recolocação, a tendência é
  buscar assistência social.

---

### Feiras Livres e Noturnas
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico,
  Trabalho, Turismo e Inovação
- **Público-alvo:** Feirantes + população em geral
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal
- **Base legal principal:** Municipal
- **Cobertura territorial:** Santa Clara, Nova Hortolândia,
  Parque Ortolândia, São Sebastião, Santo André,
  Vila Real, Amanda
- **Frequência:** Quarta a domingo — rotatividade por bairro
- **⚠️ Nota para DIM_TERRITORIO:** 5 territórios coincidem
  com áreas de abrangência de CRAS.

---

### Fundo Social — Cursos Profissionalizantes
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo
  (Fundo Social de Solidariedade)
- **Público-alvo:** Pessoas a partir de 16 anos,
  foco em vulnerabilidade socioeconômica
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal
- **Base legal principal:** Municipal
- **Espaço base:** "Capacita Hortolândia" —
  Rua Estados Unidos, 217, Jd. Santa Clara do Lago II
- **Cursos jan/2026:** Alvenaria Estrutural (SENAI,
  20 vagas, Remanso Campineiro); Assistente de RH
  (SENAI, CRAS Amanda)

---

### Programa Meu Emprego — Trabalho em Equipe
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento
  Social (DIPGR)
- **Público-alvo:** Jovens 16–20 anos + desempregados
  +3 meses + beneficiários do seguro-desemprego
- **Vínculo CadÚnico:** Indireto
- **Origem:** Estadual + Municipal
- **Base legal principal:** Outro

---

## Grupo 7 — Públicos Específicos / Direitos Humanos

### Cadastro e Políticas para PCD
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo
  (DPCD — Dep. Políticas Públicas para a PCD)
- **Gestora:** Quézia Garcia
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal
- **Base legal principal:** Outro (Lei 13.146/2015
  — Estatuto da PCD)

---

### Políticas para Pessoa Idosa
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo
  (Dep. Direitos Humanos e Políticas Públicas)
- **Público-alvo:** Idosos, especialmente em vulnerabilidade
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal
- **Base legal principal:** Outro (Lei 10.741/2003
  — Estatuto do Idoso)

---

### CCMI — Centro de Convivência da Melhor Idade
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo
  (Dep. Direitos Humanos e Políticas Públicas)
- **Público-alvo:** Idosos 60+
- **Coordenação:** Psicóloga Fernanda Fadiga
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal
- **Base legal principal:** Municipal

---

### Políticas para a Juventude
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo
  (Dep. Direitos Humanos e Políticas Públicas)
- **Público-alvo:** Jovens de 15 a 29 anos
- **Origem:** Municipal
- **Base legal principal:** Outro (Lei 12.852/2013
  — Estatuto da Juventude)

---

### Políticas de Igualdade Racial
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo
  (Dep. Direitos Humanos e Políticas Públicas)
- **Público-alvo:** População negra, indígena,
  comunidades tradicionais
- **Origem:** Municipal
- **Base legal principal:** Outro (Lei 12.288/2010
  — Estatuto da Igualdade Racial)

---

### CRAM — Centro de Referência de Atendimento à Mulher
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo
  (Departamento de Mulheres)
- **Público-alvo:** Mulheres em situação de violência
  ou vulnerabilidade
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal
- **Base legal principal:** Outro (Lei 11.340/2006
  — Lei Maria da Penha)

---

### Viva Mais
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo
  (Dep. Relações Institucionais)
- **Público-alvo:** Comunidade geral
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal
- **Base legal principal:** Municipal

---

### Ambulatório Trans
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Saúde
- **Público-alvo:** População transexual
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal
- **Base legal principal:** Municipal
- **Início:** Janeiro/2024

---

### Comitê Intersetorial de Políticas para
### a Primeira Infância
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Educação (coordenação)
- **Público-alvo:** Crianças de 0 a 6 anos
- **Origem:** Municipal
- **Base legal principal:** Outro (Lei 13.257/2016
  — Marco Legal da Primeira Infância)

  ## Grupo 8 — Formação Cultural

### Formações Culturais — Secretaria de Cultura (bloco)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Cultura
  (Dep. Cidadania Cultural)
- **Público-alvo:** Comunidade geral, acesso universal
  e gratuito
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal
- **Base legal principal:** Municipal
- **Modalidades:** Música, Artes Cênicas, Artes Visuais,
  Artes Urbanas, Literatura, Audiovisual, Cursos Livres
- **Observações:** ⚠️ Verificar se existe registro de
  matrículas para modelagem em FATO_ATENDIMENTO.

---

## Grupo 9 — Serviços de Saúde com Interface SUAS

### SAMU Regional Hortolândia e Sumaré
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Saúde
- **Gestor:** Renato Lopes Machado
- **Público-alvo:** População geral em urgência
  e emergência
- **Vínculo CadÚnico:** Indireto
- **Origem:** Federal / Municipal
- **Base legal principal:** Outro (Lei 8.080/1990)
- **Abrangência:** Hortolândia + Sumaré

---

### Vila da Saúde *(em planejamento)*
- **Tipo:** A — Serviço Direto (em planejamento)
- **Secretaria responsável:** A confirmar
- **Público-alvo:** População geral de Hortolândia
- **Vínculo CadÚnico:** A confirmar
- **Origem:** Municipal
- **Base legal principal:** A confirmar
- **Status:** Intenção declarada publicamente pelo
  prefeito Zezé Gomes (jan/2026). Sem endereço,
  secretaria ou prazo confirmados.
- **Observações:** Monitorar edições futuras da
  Tribuna Liberal.

---

## Grupo 10 — Governança e Conselhos

| Conselho | Sigla | Vínculo | Base legal principal |
|----------|-------|---------|---------------------|
| Conselho Municipal de Segurança Alimentar | COMSEA | Sec. Educação | Municipal |
| Câmara Intersetorial de Seg. Alimentar | CAISAN | Intersetorial | Municipal |
| Conselho Municipal da PCD | CMPD | Sec. Governo | Lei 13.146/2015 |
| Conselho Municipal dos Direitos da Criança e Adolescente | CMDCA | Sec. Governo | ECA |
| Conselho Municipal de Assistência Social | CMAS | Sec. Inclusão | LOAS |
| Conselho Municipal do Idoso | CMI | Sec. Governo | Lei 10.741/2003 |
| Conselho Municipal da Juventude | CMJ | Sec. Governo | Lei 12.852/2013 |
| Fórum Municipal de Promoção da Igualdade Racial | FOMPIR | Sec. Governo | Lei 12.288/2010 |
| Conselho Tutelar I | CT I | Sec. Governo / CMDCA | ECA |
| Conselho Tutelar II | CT II | Sec. Governo / CMDCA | ECA |
| Conselho Municipal de Assistência Social de Hortolândia | CMASH | Sec. Inclusão | LOAS |

---

## Notas arquiteturais consolidadas (v06)

| # | Nota | Impacto no modelo |
|---|------|------------------|
| 1 | Centro POP atende sem documentação | Ponto cego no CadÚnico — CPF = PENDENTE |
| 2 | Fluxo Centro POP → Casa de Passagem → Abrigo | Mesma pessoa gera múltiplos registros — CPF é âncora obrigatória |
| 3 | Banco do Povo e SEBRAE: dados nos operadores externos | Integração futura requer convênio |
| 4 | SINE / Seguro Desemprego: dados no MTE federal | Integração futura requer API federal |
| 5 | MEI não aparece no CAGED | Ponto cego no monitoramento de transição produtiva |
| 6 | Seguro Desemprego → CadÚnico | Fluxo de entrada previsível — a modelar |
| 7 | Feiras Livres: renda informal não declarada | Impacto na classificação de vulnerabilidade |
| 8 | `base_legal_principal` é atalho analítico | Não substitui REL_NORMA_PROGRAMA — complementa |

---

## Trajetória típica de transição produtiva
