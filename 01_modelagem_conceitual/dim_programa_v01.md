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
