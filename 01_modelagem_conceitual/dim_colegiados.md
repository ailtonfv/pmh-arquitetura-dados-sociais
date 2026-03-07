# DIM_COLEGIADOS — Colegiados Municipais de Hortolândia (SP)

**Versão:** v02  
**Versão anterior:** v01 (05/03/2026)  
**Data de atualização:** 07/03/2026  
**Fonte:** colegiados_04_03_2026.docx + ciclo jornalístico 04–08/03/2026 (Tribuna Liberal)  
**Responsável:** Ailton Vendramini / Claude (Anthropic)  
**Total registrado:** 28 colegiados

**Atualizações v02:**
- COL009 (CMDM): presidente identificada — Madalena Santos (a confirmar nome completo)
- Decisão metodológica registrada: presidentes de conselhos pertencem ao DIM_COLEGIADOS, não ao DIM_GESTOR
- P03 parcialmente resolvida para COL009
- Pendência P06 aberta (revisão dos presidentes dos conselhos prioritários)

---

## Nota Metodológica

Esta dimensão registra as instâncias colegiadas do município de Hortolândia:
conselhos municipais, câmaras intersetoriais e colegiados internos de gestão.

**Relevância para o projeto:**  
Os colegiados com interface direta com a política socioassistencial são fontes
institucionais legítimas de informação e futuras partes interessadas no
sistema de inteligência territorial.

**Colegiados prioritários para o projeto:**  
CMAS · CMDCA · CMI · COMSEA · CMPcD · CMDM · COMJUV · CMH

**Decisão metodológica — presidentes de conselhos:**  
Presidentes de conselhos municipais exercem papel de controle social, não de gestão
do Executivo. Seus registros pertencem ao DIM_COLEGIADOS (campo `presidente`), não
ao DIM_GESTOR. Exceção documentada: Sunne Teixeira dos Santos, registrada em
DIM_GESTOR por acúmulo de função com o Executivo (Secretária Adjunta de Meio Ambiente
+ Presidente do CMMA) — verificação pendente.

---

## Tabela de Colegiados

| id | sigla | nome completo | tipo | área | interface SUAS | presidente | observação |
|----|-------|---------------|------|------|----------------|------------|------------|
| COL001 | CAISAN | Câmara Intersetorial de Segurança Alimentar e Nutricional | câmara | segurança alimentar | Sim | A identificar | Articula COMSEA e ação intersetorial |
| COL002 | — | Colegiado do Programa de Avaliação de Desempenho | colegiado | gestão pública | Indireta | A identificar | Interno ao executivo |
| COL003 | — | Colegiado do Programa de Capacitação e Aperfeiçoamento | colegiado | gestão pública | Indireta | A identificar | Interno ao executivo |
| COL004 | CMPAP | Conselho Municipal de Política e Administração de Pessoal | conselho | administração pública | Não | A identificar | RH municipal |
| COL005 | CMI | Conselho Municipal do Idoso | conselho | assistência social | ✅ Alta | A identificar | Base: Lei 10.741/2003 |
| COL006 | COMPIR | Conselho Municipal da Promoção da Igualdade Racial | conselho | direitos humanos | Sim | A identificar | Interface com G7 — Igualdade Racial |
| COL007 | CMPcD | Conselho Municipal da Pessoa com Deficiência | conselho | direitos humanos | ✅ Alta | A identificar | Base: Lei 13.146/2015 |
| COL008 | COMJUV | Conselho Municipal da Juventude | conselho | juventude | Sim | A identificar | Base: Lei 12.852/2013 |
| COL009 | CMDM | Conselho Municipal dos Direitos da Mulher | conselho | direitos humanos | Sim | Madalena Santos ⚠️ | Nome completo a confirmar via Diário Oficial ou ata. Fonte: Tribuna Liberal, 05/03/2026. Interface com CRAM e Lei Maria da Penha |
| COL010 | CMDEH | Conselho Municipal de Desenvolvimento Econômico | conselho | desenvolvimento econômico | Indireta | A identificar | Interface com G6 — Inserção Produtiva |
| COL011 | CMMA | Conselho Municipal de Meio Ambiente | conselho | meio ambiente | Não | Sunne Teixeira dos Santos ⚠️ | Registrada também como Sec. Adjunta de Meio Ambiente em DIM_GESTOR — verificar acúmulo |
| COL012 | CMPDA | Conselho Municipal de Proteção e Defesa dos Animais | conselho | proteção animal | Não | A identificar | — |
| COL013 | CMAS | Conselho Municipal de Assistência Social | conselho | assistência social | ✅ Alta | A identificar | Deliberativo. Registra OSCs. Base: LOAS |
| COL014 | COMSEA | Conselho Municipal de Segurança Alimentar e Nutricional | conselho | segurança alimentar | ✅ Alta | A identificar | Interface com G4 — Segurança Alimentar |
| COL015 | CMDCA | Conselho Municipal dos Direitos da Criança e do Adolescente | conselho | assistência social | ✅ Alta | A identificar | Registra OSCs. Base: ECA |
| COL016 | CMH | Conselho Municipal de Habitação | conselho | habitação | Sim | A identificar | Interface com G5 — Habitação |
| COL017 | CME-ESP | Conselho Municipal de Esportes | conselho | esportes | Não | A identificar | Sigla original CME — diferenciada de COL022 |
| COL018 | CMPC | Conselho Municipal de Política Cultural | conselho | cultura | Não | A identificar | — |
| COL019 | CAE | Conselho de Alimentação Escolar | conselho | educação | Sim | A identificar | Interface com segurança alimentar |
| COL020 | CMS | Conselho Municipal de Saúde | conselho | saúde | Sim | Mauro Selço Salvino de Mendonça ⚠️ | Fonte: Relatório Quadrimestral 3º Trim./2025. Interface intersetorial SUAS × SUS |
| COL021 | COMSAB | Conselho Municipal de Saneamento Básico | conselho | saneamento | Não | A identificar | — |
| COL022 | CME-EDU | Conselho Municipal de Educação | conselho | educação | Indireta | A identificar | Sigla original CME — diferenciada de COL017. Interface com evasão escolar |
| COL023 | COMTUR | Conselho Municipal de Turismo | conselho | turismo | Não | A identificar | — |
| COL024 | CACS FUNDEB | Conselho de Acompanhamento e Controle Social do FUNDEB | conselho | educação | Não | A identificar | Fiscalização do FUNDEB |
| COL025 | — | Conselho Municipal do Fundo Social de Solidariedade | conselho | assistência social | Sim | A identificar | Interface com Fundo Social — Cuidar, cestas |
| COL026 | — | Conselho Gestor do Fundo Municipal de Saneamento Básico | conselho | saneamento | Não | A identificar | — |
| COL027 | CMTER | Conselho Municipal de Trabalho, Emprego e Renda | conselho | trabalho | Sim | A identificar | Interface com G6 — Inserção Produtiva |
| COL028 | COMUSPH | Conselho Municipal dos Usuários do Serviço Público | conselho | administração pública | Indireta | A identificar | Controle social geral |

---

## Recorte Estratégico para o Projeto

### 🔴 Interface Alta com SUAS / Assistência Social

| sigla | nome | presidente | papel no projeto |
|-------|------|------------|-----------------|
| CMAS | Cons. Municipal de Assistência Social | A identificar | Registra OSCs, aprova planos, fiscaliza serviços |
| CMDCA | Cons. Direitos da Criança e do Adolescente | A identificar | Registra OSCs de proteção infanto-juvenil |
| CMI | Cons. Municipal do Idoso | A identificar | Interface com serviços de idosos |
| COMSEA | Cons. Segurança Alimentar | A identificar | Interface com G4 — segurança alimentar |
| CMPcD | Cons. Pessoa com Deficiência | A identificar | Interface com serviços PCD |

### 🟡 Interface Relevante (Intersetorial)

| sigla | nome | presidente | papel no projeto |
|-------|------|------------|-----------------|
| CMS | Cons. Municipal de Saúde | Mauro Selço Salvino de Mendonça ⚠️ | Cruzamento SUAS × SUS |
| CMH | Cons. Municipal de Habitação | A identificar | Cruzamento assistência × habitação |
| CMTER | Cons. de Trabalho, Emprego e Renda | A identificar | Cruzamento assistência × empregabilidade |
| CMDM | Cons. Direitos da Mulher | Madalena Santos ⚠️ | Interface com CRAM e rede de proteção |
| CAISAN | Câmara Intersetorial Seg. Alimentar | A identificar | Articulação intersetorial nutricional |
| COL025 | Cons. Fundo Social de Solidariedade | A identificar | Interface com programas emergenciais |

---

## Pendências

| # | pendência | prioridade | status |
|---|-----------|------------|--------|
| P01 | Confirmar siglas oficiais de COL002, COL003, COL025 e COL026 | Baixa | Aberta |
| P02 | Confirmar siglas oficiais de CME-ESP (COL017) e CME-EDU (COL022) junto à Prefeitura | Média | Aberta |
| P03 | Identificar presidentes / coordenadores dos conselhos prioritários | Média | **Parcialmente resolvida** — COL009 (Madalena Santos, a confirmar) e COL011/COL020 identificados |
| P04 | Confirmar periodicidade de reuniões dos conselhos com interface SUAS | Média | Aberta |
| P05 | Verificar quais OSCs estão registradas no CMAS e no CMDCA — cruzar com dim_osc_v03 | Alta | Aberta |
| P06 | Confirmar nome completo de Madalena Santos (COL009) via Diário Oficial ou ata do conselho | Alta | Aberta |
| P07 | Verificar acúmulo de função de Sunne Teixeira dos Santos: Sec. Adjunta Meio Ambiente × Presidente CMMA — decisão de manter ou migrar registro do DIM_GESTOR | Média | Aberta |

---

## Log de Alterações

| Versão | Data | Alterações |
|--------|------|------------|
| v01 | 05/03/2026 | Criação — 28 colegiados registrados a partir de colegiados_04_03_2026.docx |
| v02 | 07/03/2026 | Coluna `presidente` adicionada à tabela principal e ao recorte estratégico; COL009 (CMDM): Madalena Santos identificada como presidente (Tribuna Liberal 05/03/2026, a confirmar); COL011 (CMMA): Sunne Teixeira dos Santos registrada (fonte DIM_GESTOR); COL020 (CMS): Mauro Selço Salvino de Mendonça registrado (fonte Relatório Quadrimestral); decisão metodológica sobre presidentes de conselhos × DIM_GESTOR documentada; P03 parcialmente resolvida; P06 e P07 abertas |

---

*Documento de modelagem conceitual. Uso interno do projeto Atlas Social de Hortolândia.*
