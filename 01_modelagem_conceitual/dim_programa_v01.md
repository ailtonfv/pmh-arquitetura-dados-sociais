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
