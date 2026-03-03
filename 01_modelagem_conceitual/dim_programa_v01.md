# DIM_PROGRAMA — Catálogo de Programas Municipais de Hortolândia
**Versão:** 05
**Data de atualização:** 03/03/2026
**Versão anterior:** 04 (01/03/2026)
**Atualizações v05:** Varredura completa dos serviços da Secretaria de Inclusão e Desenvolvimento Social (site oficial, 02/03/2026) + mapeamento completo dos serviços da Secretaria de Desenvolvimento Econômico, Trabalho, Turismo e Inovação (site oficial, 02/03/2026)
**Responsável:** Ailton Vendramini / Claude (Anthropic)
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Nota metodológica

Este catálogo foi extraído a partir de um levantamento documental cobrindo o 2º semestre de 2023 e o 1º semestre de 2024, complementado pelos tópicos de Assistência Social, Direitos Humanos e Empregabilidade do mesmo documento.

A partir da v02, o catálogo incorpora atualizações obtidas pela leitura sistemática do jornal Tribuna Liberal (radar jornalístico). A partir da v03, incorporamos também varredura direta do site oficial da Prefeitura de Hortolândia. A v04 consolida o ciclo jornalístico de final de dezembro/2025 a meados de janeiro/2026. A v05 registra o mapeamento detalhado dos serviços das Secretarias de Inclusão e Desenvolvimento Econômico, com detalhamento de público-alvo, acesso, fluxos e notas arquiteturais.

**Tipo funcional:**
- **Tipo A — Serviço Direto:** gera atendimento registrável → candidato a FATO_ATENDIMENTO
- **Tipo B — Política Articulada:** define diretrizes, articula setores, não gera atendimento direto

---

## Estrutura proposta do DIM_PROGRAMA

```
id_programa
cod_programa
nome_programa
tipo_programa        (A = Serviço Direto | B = Política Articuladora)
categoria
secretaria_responsavel
departamento_executor
secretarias_parceiras
publico_alvo
faixa_etaria
vinculo_cadunico     (S/N)
nivel_protecao
origem               (Municipal | Estadual | Federal | Intersetorial)
operador_externo     (quando o município é ponto de rede de serviço federal/estadual)
acesso               (Presencial | Digital | Espontâneo | Encaminhamento)
prazo_execucao
contato
ativo                (S/N)
data_inicio
observacoes
```

---

## Grupo 1 — Proteção Social Básica

### PAIF — Serviço de Proteção e Atendimento Integral às Famílias
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Famílias em situação de vulnerabilidade
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Origem:** Federal (SUAS / CNAS 109/2009)
- **Unidades executoras:** 7 CRAS (Amanda, Santa Clara, Novo Ângulo, Jardim Brasil, Primavera, Rosolém, Vila Real)

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
- **Público-alvo:** Crianças, adolescentes, adultos e idosos em situação de vulnerabilidade
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Origem:** Federal (SUAS / CNAS 109/2009)

---

### CCS — Centro de Convivência Social (Jd. Rosolém)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Comunidade geral da área de abrangência
- **Vínculo CadÚnico:** Parcial
- **Nível de proteção:** Básica
- **Origem:** Municipal
- **Endereço:** Rua Guido Rosolém, 177, Jardim Rosolém
- **Observações:** ⚠️ Verificar se o CCS permanece como equipamento distinto do CRAS Rosolém ou foi reintegrado.

---

## Grupo 2 — Proteção Social Especial

### Atendimento Social / População em Situação de Rua *(DETALHADO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Unidade executora:** Centro POP — Rua Maria Bernardes, nº 505, Remanso Campineiro
- **Público-alvo:** Adultos, adolescentes e famílias em situação de rua; vítimas de violação de direitos; uso de substâncias; sem moradia
- **Vínculo CadÚnico:** Parcial — acesso **sem exigência de documentação**
- **Nível de proteção:** Especial — Média Complexidade
- **Origem:** Federal (CNAS 109/2009 + LOAS 8.742/1993)
- **Acesso:** Espontâneo ou encaminhamento — sem exigência de documentação
- **Prazo:** Imediato
- **Contato:** centropop.smids@hortolandia.sp.gov.br / WhatsApp (19) 9 9976-1742 / (19) 3909-4546
- **Serviços ofertados:** Acolhimento e escuta qualificada; higiene pessoal; alimentação diária; encaminhamento para acolhimento; apoio à documentação; recâmbio para cidade de origem; reaproximação familiar
- **⚠️ Nota arquitetural:** pessoas atendidas sem documentação não aparecem no CadÚnico — ponto cego estrutural no modelo de dados.

---

### Casa de Passagem e Abrigo *(DETALHADO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas em situação de rua ou vulnerabilidade social
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Origem:** Federal (CNAS 109/2009 + LOAS 8.742/1993) / parceria Instituto Esperançar
- **Acesso:** Encaminhamento obrigatório — fluxo em cadeia:
```
Centro POP → Casa de Passagem → Abrigo
```
- **Prazo:** Imediato
- **⚠️ Nota arquitetural:** fluxo em cadeia gera múltiplos registros de atendimento para a mesma pessoa em unidades diferentes. Sem modelagem adequada, aparece como três pessoas distintas. Valida a necessidade de chave Pessoa como âncora central do modelo.

---

### PAEFI — Serviço de Proteção e Atendimento Especializado a Famílias e Indivíduos
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Unidade executora:** CREAS — Rua Francisco Castilho, 298, Remanso Campineiro. Tel: (19) 3909-4546
- **Público-alvo:** Famílias com violação de direitos, violência, situações de risco
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Média Complexidade
- **Origem:** Federal (SUAS)

---

### Serviço Especializado em Abordagem Social
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Unidade executora:** Centro POP
- **Público-alvo:** População em situação de rua
- **Vínculo CadÚnico:** Sim (atualização cadastral como meta)
- **Nível de proteção:** Especial — Alta Complexidade
- **Origem:** Federal (CNAS 109/2009)

---

### Serviço de Proteção Social a Adolescentes em Cumprimento de Medida Socioeducativa (LA e PSC) *(NOVO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Adolescentes em cumprimento de Liberdade Assistida (LA) ou Prestação de Serviço à Comunidade (PSC)
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Média Complexidade
- **Origem:** Federal (CNAS 109/2009 + ECA)

---

### Serviço de Atendimento Domiciliar para Pessoas com Deficiência e Idosas
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas com deficiência e idosos em domicílio
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Especial
- **Origem:** Municipal

---

### Serviço de Proteção Social Especial para Pessoas com Deficiência, Idosas e suas Famílias
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas com deficiência, idosos e suas famílias
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Especial
- **Origem:** Federal (SUAS) / Municipal

---

### Serviço de Apoio a Famílias e Pessoas em Situação de Risco *(NOVO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Famílias e pessoas em situação de risco social
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial
- **Origem:** Municipal / Federal

---

### Serviços de Emergência do Município *(NOVO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Secretarias parceiras:** Defesa Civil, Habitação, Saúde
- **Público-alvo:** Famílias desabrigadas ou afetadas por eventos climáticos
- **Vínculo CadÚnico:** Sim (encaminhamento pós-emergência via CRAS)
- **Nível de proteção:** Especial — Alta Complexidade / Intersetorial
- **Origem:** Municipal
- **Observações:** Evento de referência: chuvas de 26/02/2026 — 16 famílias acolhidas.

---

### Acolhimento Institucional / Casa de Passagem
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** População em situação de rua, adultos e famílias
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Origem:** Municipal / parceria com Instituto Esperançar

---

## Grupo 3 — Programas Municipais Específicos (Inclusão)

### FUNDO SOCIAL — Atendimento Emergencial para Famílias em Vulnerabilidade *(NOVO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Fundo Social de Solidariedade
- **Público-alvo:** Famílias em situação de vulnerabilidade emergencial
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básico / Alimentar
- **Origem:** Municipal

---

### Programa Acerte *(NOVO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas em vulnerabilidade socioeconômica, egressos de programas sociais, população em situação de rua
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Produtivo
- **Origem:** Municipal
- **Observações:** Ver também ACERTE no Grupo 6. Confirmar se são o mesmo programa ou versões distintas.

---

### Programa Cuidar
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Fundo Social de Solidariedade
- **Público-alvo:** Gestantes a partir da 34ª semana que realizam pré-natal na rede municipal
- **Vínculo CadÚnico:** Parcial
- **Nível de proteção:** Básico / Intersetorial
- **Origem:** Municipal — lançado outubro/2022

---

### Programa de Apadrinhamento para Crianças e Adolescentes em Situação de Acolhimento *(NOVO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Crianças e adolescentes em situação de acolhimento institucional
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Origem:** Federal (ECA) / Municipal
- **Observações:** Vinculado ao CMDCA. Apadrinhamento afetivo e/ou financeiro.

---

### Programa de Enfrentamento ao Trabalho Infantil *(NOVO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Crianças e adolescentes em situação de trabalho infantil
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial
- **Origem:** Federal / Municipal
- **Observações:** Interface direta com o Conselho Tutelar e o CREAS.

---

### Projeto Capacita *(NOVO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas em vulnerabilidade socioeconômica buscando qualificação profissional
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Produtivo
- **Origem:** Municipal
- **Observações:** ⚠️ Verificar distinção em relação ao "Capacita Hortolândia" do Fundo Social. Podem ser o mesmo programa ou programas complementares.

---

### Projeto Costura Industrial *(NOVO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas em vulnerabilidade buscando inserção no setor têxtil/industrial
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Produtivo
- **Origem:** Municipal
- **Observações:** Modalidade ativa do ACERTE (fev/2026). Benefício: bolsa-auxílio R$ 710 + cesta básica.

---

### Farmácia Solidária *(NOVO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas em vulnerabilidade socioeconômica
- **Vínculo CadÚnico:** A confirmar — verificar se CadÚnico é critério de acesso
- **Nível de proteção:** Básico / Saúde
- **Origem:** Municipal
- **Observações:** ⚠️ Detalhar critério de acesso e se há integração com farmácia popular federal.

---

### Feiras de Empreendedores *(NOVO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Empreendedores em situação de vulnerabilidade / economia solidária
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Produtivo
- **Origem:** Municipal
- **Observações:** Distinto das Feiras Livres (Desenvolvimento Econômico) — foco em empreendedorismo social.

---

### Programa Ressignifica Hortolândia
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Moradores em situação de rua
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade / Intersetorial
- **Benefício:** Bolsa mensal R$ 700 + cesta básica + auxílio aluguel
- **Origem:** Municipal — lançado dezembro/2023

---

### Bolsa Creche
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **Público-alvo:** Crianças de 6 meses a 3 anos e 6 meses sem vaga na rede pública
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Origem:** Municipal

---

### Inscrição de OSCs no CMASH *(NOVO — v05)*
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Organizações da Sociedade Civil
- **Vínculo CadÚnico:** Não
- **Origem:** Municipal
- **Observações:** Requisito para OSCs acessarem recursos e parcerias da assistência social municipal.

---

### Inscrição de OSCs no CMDCA *(NOVO — v05)*
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Inclusão e Desenvolvimento Social / CMDCA
- **Público-alvo:** Organizações da Sociedade Civil voltadas à criança e ao adolescente
- **Vínculo CadÚnico:** Não
- **Origem:** Municipal

---

## Grupo 4 — Segurança Alimentar

### Banco de Alimentos de Hortolândia (BAH)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia (Dep. Segurança Alimentar)
- **Público-alvo:** Pessoas em insegurança alimentar via 19 OSCs parceiras
- **Vínculo CadÚnico:** Indireto
- **Alcance:** 19 organizações sociais / 1.762 pessoas beneficiadas (2024)

---

### PAA — Programa de Aquisição de Alimentos
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **Origem:** Federal

---

### Distribuição de Cestas Básicas
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social / Fundo Social
- **Vínculo CadÚnico:** Sim

---

### CREAN — Centro de Referência em Educação Alimentar e Nutricional
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **Origem:** Municipal — anunciado abr/2023

---

### Cozinha Comunitária
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **Origem:** Municipal
- **Observações:** ⚠️ Verificar se é o mesmo equipamento que a "Escola Comunitária" do Jd. Novo Ângulo.

---

## Grupo 5 — Habitação

### Agora a Casa é Sua
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **Vínculo CadÚnico:** Indireto
- **Alcance 2021–2024:** ~3.000 títulos entregues

---

### Programa Vida Longa (Estadual)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **Vínculo CadÚnico:** Sim — critério explícito de elegibilidade
- **Vagas Hortolândia:** 28 unidades habitacionais

---

### Minha Casa, Minha Vida — Hortolândia
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **Vínculo CadÚnico:** Sim
- **Status:** 400 unidades em construção no Jardim Amanda (início 2026)

---

### PHLIS — Plano Municipal de Habitação de Interesse Social
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Habitação
- **Origem:** Municipal + consultoria Demacamp

---

## Grupo 6 — Inserção Produtiva e Qualificação

### ACERTE — Ação Cidadã de Requalificação, Trabalho e Educação
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. Relações Institucionais)
- **Público-alvo:** Pessoas em vulnerabilidade, egressos de programas sociais, pop. em situação de rua
- **Vínculo CadÚnico:** Sim
- **Benefício:** Bolsa-auxílio R$ 710 + cesta básica
- **Modalidades ativas (fev/2026):** Costura Industrial, Serviços Gerais

---

### PAT — Posto de Atendimento ao Trabalhador
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **Público-alvo:** Desempregados em geral, incluindo PCD
- **Vínculo CadÚnico:** Indireto
- **Contato:** pat@hortolandia.sp.gov.br / (19) 3965-1400 ramais 8904 ou 8925

---

### Cadastro de Vagas de Trabalho por Empresa — PAT *(DETALHADO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **Unidade executora:** PAT
- **Público-alvo:** Empresas (lado oferta) + trabalhadores cadastrados (lado demanda)
- **Acesso:** Telefone ou e-mail
- **Prazo:** Imediato
- **⚠️ Nota arquitetural:** PAT é o ponto de cruzamento entre CadÚnico e mercado formal. Cruzamento CadÚnico × vagas PAT × CAGED fecha o triângulo de transição produtiva.

---

### Cadastro no SINE e Encaminhamento para Vagas *(DETALHADO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **Unidade executora:** PAT
- **Operador:** Ministério do Trabalho (SINE / Emprega Brasil) — município é ponto da rede
- **Acesso:** Presencial no PAT ou online via Emprega Brasil / app CTPS Digital
- **Prazo:** Imediato
- **⚠️ Nota arquitetural:** dados de cadastro e encaminhamento ficam no MTE, não no município. Integração futura requer convênio ou API federal.

---

### Banco do Povo *(DETALHADO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação (Dep. Empreendedorismo e Microempresas)
- **Operador:** Desenvolve SP — município é ponto de atendimento
- **Público-alvo:** MEI, ME, EPP, LTDA, EIRELI — formais e informais
- **Base legal:** Lei nº 9.533/1997
- **Acesso:** Presencial no Paço Municipal — documentação obrigatória
- **Prazo:** 15 dias
- **Contato:** bancodopovo@hortolandia.sp.gov.br / WhatsApp (19) 9 9919-5984
- **⚠️ Nota arquitetural:** dados de crédito ficam na Desenvolve SP. Cruzamento CadÚnico × Banco do Povo responderia: "Quantos beneficiários acessaram crédito produtivo após saírem de transferência de renda?"

---

### Orientação ao MEI *(DETALHADO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação (Dep. Empreendedorismo e Microempresas)
- **Base legal:** Lei Complementar nº 128/2008
- **Público-alvo:** MEIs — abertura, regularização e obrigações fiscais
- **Acesso:** Presencial na Praça de Atendimento com documentos + senha GOV.BR
- **Prazo:** Imediato
- **⚠️ Nota arquitetural:** formalização via MEI não aparece no CAGED — só na Receita Federal. Ponto cego no monitoramento de transição produtiva. Trajetória possível: CadÚnico → Qualificação → Orientação MEI → CNPJ → saída do perfil CadÚnico.

---

### SEBRAE Aqui *(DETALHADO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **Operador:** SEBRAE-SP — município é ponto de atendimento
- **Público-alvo:** Empreendedores e futuros empreendedores
- **Serviços:** Orientação sobre formalização, planejamento, gestão; palestras, oficinas, cursos
- **Acesso:** Presencial com RG/CNH + CNPJ se já empresa
- **Prazo:** Imediato
- **⚠️ Nota arquitetural:** dados de atendimento ficam nos sistemas do SEBRAE. Integração futura dependeria de convênio.

---

### Seguro Desemprego *(DETALHADO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **Unidade executora:** PAT
- **Operador:** Ministério do Trabalho (Gov.br) — município apoia casos judiciais
- **Público-alvo:** Trabalhador formal dispensado sem justa causa
- **Acesso:** Digital (app CTPS ou Gov.br) ou presencial no PAT para casos judiciais
- **Prazo:** Imediato
- **Contato:** pat@hortolandia.sp.gov.br / ramais 8904 ou 8925
- **⚠️ Nota estratégica:** Seguro Desemprego é porta de entrada previsível para o CadÚnico — quando o benefício se esgota sem recolocação, a tendência é buscar assistência social. Pergunta: "Quantos chegaram ao CadÚnico vindos do Seguro Desemprego?"

---

### Feiras Livres e Noturnas *(DETALHADO — v05)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **Público-alvo:** Feirantes (produtores e comerciantes) + população em geral
- **Cobertura territorial:** Santa Clara, Nova Hortolândia, Parque Ortolândia, São Sebastião, Santo André, Vila Real, Amanda
- **Frequência:** Quarta a domingo — rotatividade por bairro
- **⚠️ Nota para DIM_TERRITORIO:** 5 territórios coincidem com áreas de abrangência de CRAS. Feirante informal pode ser beneficiário do CadÚnico com renda declarada como autônomo.

---

### Fundo Social de Solidariedade — Cursos Profissionalizantes
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Fundo Social de Solidariedade)
- **Público-alvo:** Pessoas a partir de 16 anos, foco em vulnerabilidade socioeconômica
- **Vínculo CadÚnico:** Indireto
- **Espaço base:** "Capacita Hortolândia" — Rua Estados Unidos, 217, Jd. Santa Clara do Lago II

---

### Programa Meu Emprego — Trabalho em Equipe
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (DIPGR)
- **Público-alvo:** Jovens 16–20 anos + desempregados +3 meses + beneficiários do seguro-desemprego
- **Vínculo CadÚnico:** Indireto

---

## Grupo 7 — Públicos Específicos / Direitos Humanos

### Cadastro e Políticas para PCD
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo (DPCD — Dep. Políticas Públicas para a PCD)
- **Gestora:** Quézia Garcia

---

### CRAM — Centro de Referência de Atendimento à Mulher
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Departamento de Mulheres)
- **Público-alvo:** Mulheres em situação de violência ou vulnerabilidade
- **Vínculo CadÚnico:** Indireto

---

### CCMI — Centro de Convivência da Melhor Idade
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. Direitos Humanos e Políticas Públicas)
- **Público-alvo:** Idosos 60+
- **Coordenação:** Psicóloga Fernanda Fadiga

---

### Viva Mais
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. Relações Institucionais)
- **Público-alvo:** Comunidade geral

---

### Ambulatório Trans
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Saúde
- **Público-alvo:** População transexual
- **Início:** Janeiro/2024

---

### Comitê Intersetorial de Políticas para a Primeira Infância
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Educação (coordenação)
- **Público-alvo:** Crianças de 0 a 6 anos

---

## Grupo 8 — Formação Cultural

### Formações Culturais — Secretaria de Cultura (bloco)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Cultura (Dep. Cidadania Cultural)
- **Público-alvo:** Comunidade geral, acesso universal e gratuito
- **Modalidades:** Música, Artes Cênicas, Artes Visuais, Artes Urbanas, Literatura, Audiovisual, Cursos Livres

---

## Grupo 9 — Serviços de Saúde com Interface SUAS

### SAMU Regional Hortolândia e Sumaré
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Saúde
- **Gestor:** Renato Lopes Machado
- **Público-alvo:** População geral em urgência e emergência
- **Abrangência:** Hortolândia + Sumaré

---

## Grupo 10 — Governança e Conselhos

| Conselho | Sigla | Vínculo |
|----------|-------|---------|
| Conselho Municipal de Segurança Alimentar | COMSEA | Sec. Educação |
| Câmara Intersetorial de Seg. Alimentar | CAISAN | Intersetorial |
| Conselho Municipal da PCD | CMPD | Sec. Governo |
| Conselho Municipal dos Direitos da Criança e Adolescente | CMDCA | Sec. Governo |
| Conselho Municipal de Assistência Social | CMAS | Sec. Inclusão |
| Conselho Municipal do Idoso | CMI | Sec. Governo |
| Conselho Municipal da Juventude | CMJ | Sec. Governo |
| Fórum Municipal de Promoção da Igualdade Racial | FOMPIR | Sec. Governo |
| Conselho Tutelar I | CT I | Sec. Governo / CMDCA |
| Conselho Tutelar II | CT II | Sec. Governo / CMDCA |
| Conselho Municipal de Assistência Social de Hortolândia | CMASH | Sec. Inclusão |

---

## Notas arquiteturais consolidadas (v05)

| # | Nota | Impacto no modelo |
|---|------|------------------|
| 1 | Centro POP atende sem documentação | Ponto cego no CadÚnico — pessoas sem NIS/CPF |
| 2 | Fluxo Centro POP → Casa de Passagem → Abrigo | Mesma pessoa gera múltiplos registros — chave Pessoa é âncora obrigatória |
| 3 | Banco do Povo e SEBRAE: dados ficam nos operadores externos | Integração futura requer convênio |
| 4 | SINE / Seguro Desemprego: dados ficam no MTE federal | Integração futura requer API federal |
| 5 | MEI não aparece no CAGED | Ponto cego no monitoramento de transição produtiva |
| 6 | Seguro Desemprego → CadÚnico | Fluxo de entrada previsível — a modelar |
| 7 | Feiras Livres: renda informal não declarada | Impacto na classificação de vulnerabilidade |

---

## Pendências abertas

1. Confirmar distinção Projeto Capacita × Capacita Hortolândia (Fundo Social)
2. Confirmar distinção Escola Comunitária × Cozinha Comunitária
3. Confirmar se Serviço de Atendimento Domiciliar e Serviço de Proteção Especial PCD/Idosos são modalidades distintas
4. Detalhar critério de acesso da Farmácia Solidária — vinculação ao CadÚnico?
5. Verificar se há registro de matrículas nas Formações Culturais para FATO_ATENDIMENTO
6. Confirmar vínculo CadÚnico para acesso ao Banco do Povo
7. DECOLA Juventude — verificar status atual
8. Vila da Saúde — monitorar confirmação de secretaria e prazo
9. Cobertura territorial dos 7 CRAS — cruzar com loteamentosregiao.xls

---

## Log de alterações

| Versão | Data | Alterações |
|--------|------|-----------|
| v01 | 27/02/2026 | Criação do catálogo — levantamento documental 2023–2024 |
| v02 | 28/02/2026 | Correção ACERTE; Atendimento Emergencial (26/02/2026); MCMV Jd. Amanda; Escolinhas Esportivas |
| v03 | 01/03/2026 | Varredura site oficial: Viva Mais, Serviços PCD/Idosos, Banco do Povo, Cozinha Comunitária, Formações Culturais |
| v04 | 01/03/2026 | Ciclo jornalístico dez/2025–jan/2026: Vila da Saúde, SAMU Regional, Fundo Social cursos jan/2026, subcoberturas territoriais |
| v05 | 03/03/2026 | Varredura completa Secretaria de Inclusão (22 serviços mapeados, 2 detalhados com fluxo e notas arquiteturais); mapeamento completo Secretaria de Desenvolvimento Econômico (7 serviços detalhados); notas arquiteturais consolidadas; novas pendências adicionadas |

---

*Documento de registro interno. Uso restrito ao projeto.*
