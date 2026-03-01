# DIM_PROGRAMA — Catálogo de Programas Municipais de Hortolândia
**Versão:** 03  
**Data de atualização:** 01/03/2026  
**Versão anterior:** 02 (28/02/2026)  
**Fonte primária:** Levantamento documental 2023–2024 (Ailton Vendramini)  
**Atualizações v02:** Ciclo jornalístico — Tribuna Liberal, edições 21/02, 24/02 e 01/03/2026  
**Atualizações v03:** Site oficial Prefeitura de Hortolândia — varredura sistemática de secretarias em 01/03/2026  
**Responsável:** Ailton Vendramini / Claude (Anthropic)  
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Nota metodológica

Este catálogo foi extraído a partir de um levantamento documental cobrindo o 2º semestre de 2023 e o 1º semestre de 2024, complementado pelos tópicos de Assistência Social, Direitos Humanos e Empregabilidade do mesmo documento.

A partir da v02, o catálogo incorpora atualizações obtidas por leitura sistemática do jornal Tribuna Liberal (radar jornalístico). A partir da v03, incorpora também varredura direta do site oficial da Prefeitura de Hortolândia.

**Classificação funcional:**
- **Tipo A — Serviço Direto:** gera atendimento registrável → candidato a `FATO_ATENDIMENTO`
- **Tipo B — Política Articulada:** define diretrizes, articula setores, não gera atendimento direto

---

## Estrutura proposta do DIM_PROGRAMA

```
id_programa          (chave surrogate)
cod_programa         (código interno a definir)
nome_programa
tipo_programa        (A = Serviço Direto | B = Política Articuladora)
categoria            (ver grupos abaixo)
secretaria_responsavel
departamento_executor
secretarias_parceiras
publico_alvo
faixa_etaria
vinculo_cadunico     (S/N — CadÚnico é critério de elegibilidade?)
nivel_protecao       (Básica | Especial | Habitação | Alimentar | Produtiva | Direitos | Cultural | N/A)
origem               (Municipal | Estadual | Federal | Intersetorial)
ativo                (S/N)
data_inicio
observacoes
```

---

## Grupo 1 — Proteção Social Básica

### PAIF — Serviço de Atendimento e Proteção Integral às Famílias
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Departamento executor:** Departamento de Assistência Social
- **Público-alvo:** Famílias em situação de vulnerabilidade
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Origem:** Federal (SUAS)
- **Unidades executoras:** CRAS Amanda, CRAS Santa Clara, CRAS Novo Ângulo, CRAS Jardim Brasil, CRAS Primavera, CRAS Rosolém, CRAS Vila Real
- **Observações:** Serviço principal do CRAS. Escuta, encaminhamentos, fortalecimento de vínculos.

#### Endereços dos CRAS
*(Fonte: Secretaria de Inclusão e Desenvolvimento Social — atualizado em 02/06/2025)*
*(⚠️ Loteamentos de abrangência por CRAS estão em processo de padronização — ver dim_territorio_cras_v01.md)*

| # | Unidade | Homenageado | Endereço | Telefone |
|---|---------|------------|---------|---------|
| 1 | CRAS Jardim Santa Clara | — | Rua Estados Unidos, 217, Jd. Santa Clara do Lago II | 3865-1133 / 3897-2519 |
| 2 | CRAS Jardim Amanda | — | Av. Tarsila do Amaral, 540, Jd. Amanda II | 3819-7619 / 3865-7276 |
| 3 | CRAS Jardim Novo Ângulo | — | Rua Francisco Bereta, 330, Jd. Novo Ângulo | 3809-1945 / 3845-7629 |
| 4 | CRAS Rosolém | Joel Alves Assunção | Rua Guido Rosolém, 177, Jardim Rosolém | 3809-3164 |
| 5 | CRAS Primavera | Chico Vigilante | Rua Amoreira, 35, Jd. Primavera | 3865-1225 / 3819-6899 |
| 6 | CRAS Jardim Brasil | Maria Humilde Antunes (Zuma) | Rua da Amizade, 240, Jardim Brasil | 3909-1398 |
| 7 | CRAS Vila Real | — | Rua Ernesto Bergamasco, 185, Vila Real | 3865-4269 |

---

### CCS — Centro de Convivência Social (Jd. Rosolém)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Comunidade geral da área de abrangência
- **Vínculo CadÚnico:** Parcial
- **Nível de proteção:** Básica
- **Origem:** Municipal
- **Endereço:** Rua Guido Rosolém, 177, Jardim Rosolém
- **Observações:** Transformado de CRAS para CCS em 2021 com foco em atividades socioeducativas, cultura, arte, esporte e inclusão digital. ⚠️ O endereço (Rua Guido Rosolém, 177) consta na planilha oficial de 02/06/2025 como CRAS Rosolém — Joel Alves Assunção. Verificar se o CCS permanece como equipamento distinto ou foi reintegrado ao CRAS.

---

## Grupo 2 — Proteção Social Especial

### PAEFI — Serviço de Proteção e Atendimento Especializado a Famílias e Indivíduos
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Famílias com violação de direitos, violência, situações de risco
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Média Complexidade
- **Origem:** Federal (SUAS)
- **Unidade executora:** CREAS — Rua Francisco Castilho, 298, Remanso Campineiro. Tel: (19) 3909-4546

---

### Serviço Especializado em Abordagem Social (Pop. Rua)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** População em situação de rua
- **Vínculo CadÚnico:** Sim (atualização cadastral como meta)
- **Nível de proteção:** Especial — Alta Complexidade
- **Origem:** Federal (Decreto 7.053/2009)
- **Unidade executora:** Centro POP

---

### Acolhimento Institucional / Casa de Passagem
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** População em situação de rua, adultos e famílias
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Origem:** Municipal / parceria com Instituto Esperançar
- **Observações:** Abrigo Institucional operado pelo Instituto Esperançar. Casa de Passagem vinculada ao Centro POP.

---

### Atendimento Emergencial — Famílias em Situação de Risco (Chuvas/Desastres)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (Dep. Assistência Social)
- **Secretarias parceiras:** Fundo Social de Solidariedade, Dep. de Políticas Públicas para PCD, Saúde, Habitação, Serviços Urbanos, Defesa Civil
- **Público-alvo:** Famílias desabrigadas ou afetadas por eventos climáticos
- **Vínculo CadÚnico:** Sim (encaminhamento pós-emergência via CRAS)
- **Nível de proteção:** Especial — Alta Complexidade / Intersetorial
- **Origem:** Municipal
- **Gatilho de acionamento:** Defesa Civil (199) aciona SUAS após evento
- **Entregas documentadas:** Água potável, cestas básicas, cobertores, colchões, produtos de limpeza
- **Evento de referência (v02):** Chuva de 26/02/2026 — 16 famílias acolhidas: Jd. Ricardo (8), Jd. Sumarezinho (5), Jd. Adelaide (2), Jd. Santa Clara do Lago (1)
- **Observações:** (Incluído na v02 — fonte: Tribuna Liberal 01/03/2026) Estrutura de FATO_ATENDIMENTO aplicável com data, território e quantidade de famílias.

---

### Serviço de Atendimento Domiciliar para Pessoas com Deficiência e Idosas *(NOVO — v03)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (a confirmar departamento executor)
- **Público-alvo:** Pessoas com deficiência e idosos em domicílio
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Especial
- **Origem:** Municipal
- **Observações:** (Incluído na v03 — fonte: site oficial, página "Todos os Serviços", categoria "60+"). Interface direta com o cadastro municipal de PCD e com o CadÚnico. Verificar departamento executor (Dep. Assistência Social ou Dep. Direitos Humanos/PCD).

---

### Serviço de Proteção Social Especial para Pessoas com Deficiência, Idosas e suas Famílias *(NOVO — v03)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Pessoas com deficiência, idosos e suas famílias
- **Vínculo CadÚnico:** A confirmar
- **Nível de proteção:** Especial
- **Origem:** Federal (SUAS) / Municipal
- **Observações:** (Incluído na v03 — fonte: site oficial, página "Todos os Serviços"). Distinto do PAEFI — foco específico em PCD e idoso. Verificar se é o mesmo que o "Serviço de Atendimento Domiciliar" acima ou equipamento/modalidade diferente.

---

## Grupo 3 — Programas Municipais Específicos

### Programa Cuidar
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Fundo Social de Solidariedade
- **Secretarias parceiras:** Inclusão e Desenvolvimento Social, Saúde, Secretaria de Governo
- **Público-alvo:** Gestantes a partir da 34ª semana que realizam pré-natal na rede municipal
- **Faixa etária:** Gestantes (todas as idades)
- **Vínculo CadÚnico:** Parcial (atendidas pelos CRAS)
- **Nível de proteção:** Básico/Intersetorial
- **Origem:** Municipal — lançado outubro/2022
- **Entregas acumuladas:** ~2.800 kits maternidade até abr/2024
- **Observações:** Kit contém banheira, mantas, fraldas, lençóis, sabonete, creme, termômetro, bolsa, coletor de leite materno. Intersetorial com Saúde e Educação (EJA).

---

### Programa Ressignifica Hortolândia
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (Dep. Inclusão Produtiva e Geração de Renda)
- **Secretarias parceiras:** Governo, Habitação, Segurança Pública, Educação, Esportes, Saúde
- **Público-alvo:** Moradores em situação de rua
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade / Intersetorial
- **Origem:** Municipal — lançado dezembro/2023. Regulamentado pelo Decreto Federal 7.053/2009
- **Benefício:** Bolsa mensal de R$ 700 + previsão de cesta básica e auxílio aluguel
- **Vagas iniciais:** 10 participantes
- **Requisitos:** Assiduidade em atendimentos de saúde + participação no ACERTE + oficinas de planejamento financeiro
- **Observações:** Bolsistas trabalham nos CRAS como auxiliares. Vinculado ao Centro POP, CREAS e Casa de Passagem.

---

### Bolsa Creche
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **Público-alvo:** Crianças de 6 meses a 3 anos e 6 meses sem vaga na rede pública
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Origem:** Municipal
- **Documentos exigidos:** Certidão de nascimento, comprovante de endereço, Cartão Cidadão, carteira de vacinação
- **Observações:** Garante vaga em creche conveniada quando não houver disponibilidade na rede municipal.

---

## Grupo 4 — Segurança Alimentar

### Banco de Alimentos de Hortolândia (BAH)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia (Dep. Segurança Alimentar)
- **Público-alvo:** Pessoas em insegurança alimentar via 19 OSCs parceiras
- **Vínculo CadÚnico:** Indireto (via OSCs)
- **Nível de proteção:** Alimentar
- **Origem:** Municipal — criado em 2007
- **Alcance:** 19 organizações sociais / 1.762 pessoas beneficiadas (2024)
- **Observações:** Parte do SISAN. Arrecada, seleciona, processa, armazena e distribui alimentos. Recebe produtos do PAA (agricultura familiar = 26% do volume).

---

### PAA — Programa de Aquisição de Alimentos
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia (Dep. Segurança Alimentar)
- **Público-alvo:** Agricultores familiares (fornecedores) + beneficiários do Banco de Alimentos
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Alimentar
- **Origem:** Federal
- **Observações:** Compra direta da agricultura familiar local. Alimenta o Banco de Alimentos com produtos frescos.

---

### Distribuição de Cestas Básicas
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social / Fundo Social de Solidariedade
- **Público-alvo:** Famílias em vulnerabilidade
- **Vínculo CadÚnico:** Sim (via CRAS)
- **Nível de proteção:** Básico / Alimentar
- **Origem:** Municipal
- **Observações:** Distribuição regular pelo CRAS e Fundo Social. Distribuição emergencial via entidades cadastradas no CMDCA para famílias fora dos critérios do SUAS.

---

### CREAN — Centro de Referência em Educação Alimentar e Nutricional
- **Tipo:** A — Serviço Direto (em implantação em 2023)
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **Público-alvo:** Estudantes da rede municipal e população geral
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Alimentar
- **Origem:** Municipal — anunciado em abr/2023
- **Localização prevista:** Jd. Terras de Santa Maria
- **Observações:** Laboratório de técnica dietética, auditório, aulas de alimentação saudável e geração de renda.

---

### Escola Comunitária
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia (Dep. Segurança Alimentar)
- **Público-alvo:** População geral, foco em geração de renda
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Alimentar / Produtiva
- **Origem:** Municipal
- **Localização:** Jardim Novo Ângulo
- **Observações:** Oficinas culinárias com foco em geração de renda. Parceria com SENAI (ex: Petit Four). ⚠️ Verificar se é o mesmo equipamento que a "Cozinha Comunitária" listada no site oficial ou se são serviços distintos.

---

### Cozinha Comunitária — Curso de Culinária e Alimentação Saudável *(NOVO — v03)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia (Dep. Segurança Alimentar)
- **Público-alvo:** Comunidade geral, foco em geração de renda
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Alimentar / Produtiva
- **Origem:** Municipal
- **Observações:** (Incluído na v03 — fonte: site oficial, serviços da Sec. Educação). ⚠️ Verificar se é o mesmo equipamento que a "Escola Comunitária" do Jd. Novo Ângulo ou se é serviço/localização distinta.

---

## Grupo 5 — Habitação

### Agora a Casa é Sua
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **Público-alvo:** Moradores de loteamentos irregulares
- **Vínculo CadÚnico:** Indireto (cadastro social próprio)
- **Nível de proteção:** Habitação
- **Origem:** Municipal + parceria estadual (Cidade Legal)
- **Alcance 2021–2024:** ~3.000 títulos entregues / meta 2024: 4.578 moradias regularizadas
- **Observações:** Principal programa de regularização fundiária da história do município.

---

### Programa Vida Longa (Estadual)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação (contrapartida municipal)
- **Público-alvo:** Idosos em situação de vulnerabilidade com vínculos familiares fragilizados, inseridos no CadÚnico, residentes há ≥ 2 anos no município
- **Vínculo CadÚnico:** Sim — critério explícito de elegibilidade
- **Nível de proteção:** Habitação / Idoso
- **Origem:** Estadual (Sec. Desenvolvimento Urbano e Habitação — SP)
- **Vagas Hortolândia:** 28 unidades habitacionais anunciadas abr/2024
- **Contrapartida municipal:** Indicação de beneficiários + doação de terrenos + gestão e manutenção

---

### Minha Casa, Minha Vida — Hortolândia
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **Público-alvo:** Famílias em vulnerabilidade habitacional, selecionadas por pontuação (Portaria MCID nº 738/2024)
- **Vínculo CadÚnico:** Sim — critério de elegibilidade federal
- **Nível de proteção:** Habitação
- **Origem:** Federal
- **Status (v02):** 400 unidades em construção no Jardim Amanda desde início de 2026. Previsão de entrega: 18 meses. Próxima etapa: mais 800 unidades.
- **Processo seletivo:** 1.000 famílias pré-selecionadas → 520 selecionadas (400 titulares + 120 suplentes). Sistema de pontuação por prioridade, sem sorteio.
- **Contato:** WhatsApp (19) 99635-4274 / Tel. (19) 3965-1400 ramais 7810, 7806, 7804, 7811
- **Observações:** (Atualizado na v02 — fonte: Tribuna Liberal 24/02/2026) Território: Jardim Amanda → candidato a DIM_TERRITORIO.

---

### PHLIS — Plano Municipal de Habitação de Interesse Social
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Habitação
- **Origem:** Municipal + consultoria Demacamp
- **Observações:** Instrumento de planejamento habitacional para 10 anos. Em elaboração em 2024. Identifica núcleos vulneráveis. Não é programa de atendimento direto.

---

## Grupo 6 — Inserção Produtiva e Qualificação

### ACERTE — Ação Cidadã de Requalificação, Trabalho e Educação
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. Relações Institucionais) *(confirmado na v02)*
- **Secretarias parceiras:** Inclusão e Desenvolvimento Social (encaminhadora via CRAS/CadÚnico)
- **Público-alvo:** Pessoas em vulnerabilidade socioeconômica, incluindo egressos de programas sociais e população em situação de rua
- **Faixa etária:** 18 anos ou mais
- **Requisito de residência:** Mínimo 12 meses no município
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Produtivo
- **Origem:** Municipal
- **Benefício:** Bolsa-auxílio R$ 710 + cesta básica
- **Modalidades ativas (fev/2026):** Costura Industrial, Serviços Gerais
- **Observações:** Requisito obrigatório do Programa Ressignifica Hortolândia.

---

### PAT — Posto de Atendimento ao Trabalhador
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação (Dep. do Trabalho)
- **Público-alvo:** Desempregados em geral, incluindo PCD (vagas exclusivas)
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Produtivo
- **Origem:** Estadual / Municipal
- **Canais:** WhatsApp, SINE Fácil, Emprega Brasil

---

### Banco do Povo *(NOVO — v03)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação (Dep. Empreendedorismo e Microempresas)
- **Público-alvo:** Microempreendedores em situação de vulnerabilidade
- **Vínculo CadÚnico:** Indireto (a confirmar — possível integração para público de baixa renda)
- **Nível de proteção:** Produtivo
- **Origem:** Estadual (Banco do Povo Paulista) / Municipal
- **Observações:** (Incluído na v03 — fonte: site oficial, serviços da Sec. Desenvolvimento Econômico). Crédito popular para formalização e capital de giro. Integrado à Casa do Empreendedor. Verificar se há critério de renda ou vínculo com CadÚnico para acesso.

---

### Programa Meu Emprego — Trabalho em Equipe
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (DIPGR)
- **Secretarias parceiras:** Desenvolvimento Econômico + PAT + ETEC
- **Público-alvo:** Jovens de 16 a 20 anos (1º emprego) + desempregados com +3 meses de inatividade + beneficiários do seguro-desemprego
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Produtivo
- **Origem:** Estadual + Municipal
- **Metodologia:** CSTEC — grupos de troca de experiências
- **Parceiros:** Associação dos Patrulheiros e Guarda Mirim + ETEC Hortolândia

---

### Fundo Social de Solidariedade — Cursos Profissionalizantes
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Fundo Social de Solidariedade)
- **Público-alvo:** Pessoas a partir de 16 anos, foco em vulnerabilidade socioeconômica
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Produtivo
- **Origem:** Municipal
- **Cursos 2023:** Empreendedorismo, educação financeira, artesanato, auxiliar de RH, games, açougueiro, operador de logística, inspetor de qualidade (SENAI), IA em Nuvem
- **Espaço:** "Capacita Hortolândia" — Rua Estados Unidos, 217, Jd. Santa Clara do Lago II
- **Observações:** ⚠️ Mesmo endereço do CRAS Santa Clara — verificar se é o mesmo espaço físico.

---

### Projeto Escolinhas Esportivas
- **Tipo:** A — Serviço Direto (confirmado com base na estrutura de atendimento identificada)
- **Secretaria responsável:** Esporte e Lazer
- **Departamento executor:** Departamento de Esportes, Competições, Eventos e Lazer *(confirmado na v03 — site oficial)*
- **Público-alvo:** População geral; destaque para pessoas com deficiência (~100 alunos PCD em 2026)
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** N/A — Esporte / Inclusão Social
- **Origem:** Municipal
- **Modalidades:** 25 (karatê, judô, basquete, capoeira, balé, natação, futebol, lutas, entre outras)
- **Alcance:** Mais de 7.000 atendimentos (treinos + alto rendimento)
- **Parcerias PCD:** "Nadando com Daniel Dias" e "Luta pela Vida"
- **Observações:** (Incluído na v02 — atualizado na v03.) Verificar integração do atendimento PCD com o cadastro municipal de PCD ou CadÚnico.

---

## Grupo 7 — Públicos Específicos / Direitos Humanos
*(Vinculados ao **Departamento de Direitos Humanos e Políticas Públicas** — Secretaria de Governo)*

> ✅ **Correção de nomenclatura (v03):** O nome oficial do departamento é **"Departamento de Direitos Humanos e Políticas Públicas"** (não apenas "Dep. Direitos Humanos"). Fonte: site oficial, página da Secretaria de Governo.

---

### Cadastro e Políticas para PCD
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo (Dep. Direitos Humanos e Políticas Públicas)
- **Público-alvo:** Pessoas com deficiência física, visual, auditiva, mental, motora, TEA, deficiências invisíveis
- **Vínculo CadÚnico:** Indireto (mapeamento próprio iniciado ago/2023)
- **Observações:** Cadastro municipal PCD iniciado ago/2023. Conselho Municipal da PCD (CMPD) biênio 2023-2025. ⚠️ Pendência v02: A Tribuna Liberal (01/03/2026) registra o "Departamento de Políticas Públicas para Pessoas com Deficiência" em ação operacional direta no atendimento emergencial de 26/02/2026 — verificar se possui programas próprios com FATO_ATENDIMENTO.

---

### Políticas para Pessoa Idosa
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo (Dep. Direitos Humanos e Políticas Públicas)
- **Público-alvo:** Idosos, especialmente em vulnerabilidade
- **Vínculo CadÚnico:** Indireto
- **Marco legal:** Estatuto do Idoso — Lei 10.741/2003

---

### CCMI — Centro de Convivência da Melhor Idade (Remanso Campineiro)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. Direitos Humanos e Políticas Públicas)
- **Público-alvo:** Idosos 60+
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Básico / Direitos
- **Atividades:** Capoterapia, MVE, Gincana da Melhor Idade (anual), bailes temáticos, teatro
- **Observações:** Cadastro próprio de idosos. Coordenação: psicóloga Fernanda Fadiga.

---

### Políticas para a Juventude
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo (Dep. Direitos Humanos e Políticas Públicas)
- **Público-alvo:** Jovens de 15 a 29 anos
- **Programas vinculados:** Cursinho Popular, Jovem Empreendedor, Primeiro Emprego, Semana da Juventude

---

### Políticas de Igualdade Racial
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Governo (Dep. Direitos Humanos e Políticas Públicas)
- **Público-alvo:** População negra, indígena, comunidades tradicionais
- **Marco legal:** Estatuto da Igualdade Racial — Lei 12.288/2010
- **Observações:** FOMPIR — Fórum Municipal de Promoção da Igualdade Racial.

---

### CRAM — Centro de Referência de Atendimento à Mulher
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (**Departamento de Mulheres**) *(nomenclatura corrigida na v03)*
- **Público-alvo:** Mulheres em situação de violência ou vulnerabilidade
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Especial

> ✅ **Correção de nomenclatura (v03):** O nome oficial é **"Departamento de Mulheres"** (não "Dep. da Mulher"). Fonte: site oficial, página da Secretaria de Governo.

---

### Viva Mais *(Pendência 4 resolvida na v03)*
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (**Departamento de Relações Institucionais**) *(confirmado na v03)*
- **Público-alvo:** Comunidade geral
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** N/A — Bem-estar / Cultural
- **Origem:** Municipal
- **Atividades confirmadas (site oficial):** Artes Plásticas e Desenho, Ballet Infantil, Crochê e Tricô, Violão e Viola, Dança do Ventre
- **Observações:** (Pendência resolvida na v03 — fonte: site oficial, página "Todos os Serviços" e Secretaria de Governo.) Programa de atividades físicas e culturais coordenado pelo Dep. de Relações Institucionais. Verificar se gera registro de atendimento próprio.

---

### Ambulatório Trans
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Saúde (Atenção Especializada)
- **Público-alvo:** População transexual (~4.500 pessoas estimadas no município)
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Saúde / Direitos
- **Localização:** CEI — Av. Thereza Ana Cecon Breda, 1115, Vila São Pedro
- **Início:** Janeiro/2024. 20 pacientes acompanhados inicialmente.

---

### Comitê Intersetorial de Políticas para a Primeira Infância
- **Tipo:** B — Política Articulada
- **Secretaria responsável:** Educação, Ciência e Tecnologia (coordenação)
- **Público-alvo:** Crianças de 0 a 6 anos
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal — Decretos 5.353 (jan/2024) e 5.360 (fev/2024)
- **Composição:** 15 secretarias + Legislativo + OAB + 5 conselhos + Fundo Social

---

## Grupo 8 — Formação Cultural *(NOVO — v03)*
*(Vinculados à **Secretaria Municipal de Cultura**)*

> **Critério de inclusão:** Programas de formação cultural com acesso universal e gratuito que atendem diretamente a população, com interface relevante para públicos em vulnerabilidade (juventude, terceira idade, inclusão). Registrados como bloco agrupado.

---

### Formações Culturais — Secretaria de Cultura (bloco)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Cultura (Sec. Municipal de Cultura)
- **Departamento executor:** Departamento de Cidadania Cultural
- **Público-alvo:** Comunidade geral, acesso universal e gratuito
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Cultural / Inclusão Social
- **Origem:** Municipal
- **Modalidades confirmadas no site oficial:**
  - Formação Musical (instrumentos, teoria, harmonia; curso técnico previsto)
  - Artes Cênicas — Teatro, Dança e Circo (3 níveis + parceria SENAC com DRT)
  - Artes Visuais — Desenho artístico, fotografia, pintura em tela
  - Artes Urbanas — Poesia/batalha de rimas, DJ, grafitti
  - Literatura e Leitura — Contação de histórias, produção de texto, projetos de incentivo à leitura ("Achei um Livro Hortolândia", "Banca de Troca de Livros", "Gostou? Leva para Casa")
  - Produção em Audiovisual — Web rádio, inicialização cinematográfica
  - Produção, Patrimônio e Memória — Viola, violão, catira, folia de reis
  - Cursos Livres — Coral Jovem, Ballet, Dança de Rua, Dança do Ventre, Capoeira, Jazz, Xilofone, Piano, Bateria, Violão, Canto Coral, Artes para Crianças, Contação de Histórias, Teatro, Circo, Oboé, entre outros
- **Observações:** (Incluído na v03 — fonte: site oficial da Secretaria de Cultura + texto fornecido pelo usuário.) Volume expressivo de oferta cultural gratuita. Verificar se existe registro de matrículas/atendimentos que permitam modelagem em FATO_ATENDIMENTO.

---

## Grupo 9 — Governança e Conselhos
*(Não são programas de atendimento — são instâncias de governança)*

| Conselho | Sigla | Vínculo |
|---------|-------|---------|
| Conselho Municipal de Segurança Alimentar | COMSEA | Sec. Educação |
| Câmara Intersetorial de Seg. Alimentar e Nutricional | CAISAN | Intersetorial (criada jan/2024) |
| Conselho Municipal da Pessoa com Deficiência | CMPD | Sec. Governo / Dep. Direitos Humanos e Políticas Públicas |
| Conselho Municipal dos Direitos da Criança e Adolescente | CMDCA | Sec. Governo |
| Conselho Municipal de Assistência Social | CMAS | Sec. Inclusão |
| Conselho Municipal do Idoso | CMI | Sec. Governo / Dep. Direitos Humanos e Políticas Públicas |
| Conselho Municipal da Juventude | CMJ | Sec. Governo / Dep. Direitos Humanos e Políticas Públicas |
| Fórum Municipal de Promoção da Igualdade Racial | FOMPIR | Sec. Governo / Dep. Direitos Humanos e Políticas Públicas |
| Conselho Tutelar I | CT I | Sec. Governo / CMDCA |
| Conselho Tutelar II | CT II | Sec. Governo / CMDCA |

---

## Entidades parceiras (OSCs) identificadas

| Entidade | Foco |
|---------|------|
| Instituto Esperançar | Abrigo Institucional (pop. rua) |
| AMAAH | Autismo |
| APAE | Deficiência intelectual |
| CADEFI / CENDEFI | Deficiência |
| AHDV | Deficiência visual |
| Instituto Pernas Voluntárias | PCD |
| Todos Pelo Autismo | Autismo |
| Luta pela Vida Hortolândia | PCD / esporte |
| Associação dos Patrulheiros e Guarda Mirim | Juventude |
| OSCs parceiras CRAS (12 entidades) | Projetos sociais para crianças e adolescentes |

---

## Dado de contexto — Mercado formal

- Empregos formais no município: 49.100 (CAGED, jan–mar/2023)
- Remuneração média formal: R$ 4.700 (acima da média estadual de R$ 3.700)
- CadÚnico out/2022: 29.698 famílias / 70.456 pessoas
- CadÚnico dez/2025: ~73.000 pessoas
- População estimada: ~240.000 habitantes

---

## Pendências e pontos a confirmar

1. **Capacita Hortolândia** — mesmo endereço do CRAS Santa Clara (Rua Estados Unidos, 217). Verificar se é o mesmo espaço físico ou apenas o mesmo logradouro.
2. ✅ **ACERTE** — secretaria responsável confirmada na v02: Secretaria de Governo, Dep. Relações Institucionais.
3. **DECOLA Juventude** — incluída no e-book como programa de inserção produtiva para jovens. Não apareceu em material de 2023–2024 nem na varredura do site. Verificar status atual.
4. ✅ **Viva Mais** — secretaria e departamento confirmados na v03: Secretaria de Governo, Dep. Relações Institucionais.
5. **Cobertura territorial dos 7 CRAS** — cruzar com `loteamentosregiao.xls` para padronizar nomes.
6. **Conselho Tutelar x CRAS** — listas de bairros não coincidem com áreas dos CRAS. Mapeamento territorial necessário.
7. **Departamento de PCD** — verificar se possui programas próprios com FATO_ATENDIMENTO (pendência da v02 ainda aberta).
8. **Escolinhas Esportivas x CadÚnico** — verificar integração formal do atendimento PCD com cadastro municipal de PCD ou CadÚnico.
9. **Fatec em Hortolândia** — acompanhar definição dos cursos e início das operações (reunião de 26/02/2026).
10. **Escola Comunitária x Cozinha Comunitária** — verificar se são o mesmo equipamento ou serviços/localizações distintas.
11. **Serviço de Atendimento Domiciliar x Serviço de Proteção Especial para PCD/Idosos** — verificar se são programas distintos ou modalidades do mesmo serviço.
12. **Banco do Povo** — verificar se há critério de renda ou vínculo com CadÚnico para acesso.
13. **Formações Culturais** — verificar se existe sistema de registro de matrículas/atendimentos para modelagem em FATO_ATENDIMENTO.

---

## Log de alterações

| Versão | Data | Alterações |
|--------|------|------------|
| v01 | 27/02/2026 | Criação do catálogo — levantamento documental 2023–2024 |
| v02 | 28/02/2026 | Correção do ACERTE (Sec. Governo); inclusão do Atendimento Emergencial (evento 26/02/2026); atualização do MCMV (Jd. Amanda); inclusão das Escolinhas Esportivas; resolução pendência 2 (ACERTE) |
| v03 | 01/03/2026 | Varredura site oficial (01/03/2026): inclusão de Viva Mais (pendência 4 resolvida), Serviço Atendimento Domiciliar PCD/Idosos, Serviço Proteção Especial PCD/Idosos, Banco do Povo, Cozinha Comunitária, bloco Formações Culturais (Grupo 8); correção de nomenclatura de dois departamentos (Dep. Direitos Humanos e Políticas Públicas; Dep. de Mulheres); confirmação do departamento executor das Escolinhas Esportivas; reorganização para 9 grupos; 4 novas pendências adicionadas |

---

*Documento gerado a partir de levantamento documental. Atualizado incrementalmente via ciclo jornalístico e varredura do site oficial. Sujeito a revisão e atualização.*
