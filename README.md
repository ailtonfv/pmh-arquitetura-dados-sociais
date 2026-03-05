# Atlas Social de Hortolândia
Arquitetura de Dados Sociais para Políticas Públicas Municipais

Repositório do projeto **Atlas Social de Hortolândia**, iniciativa de arquitetura de dados sociais aplicada à política socioassistencial do município de Hortolândia – SP.

O projeto busca estruturar uma **infraestrutura analítica mínima** capaz de compreender e acompanhar a dinâmica da vulnerabilidade social no território municipal, utilizando dados públicos já existentes e respeitando integralmente a legislação de proteção de dados.

---

# Contexto

Hortolândia possui aproximadamente **240 mil habitantes** e cerca de **73 mil pessoas inscritas no Cadastro Único** — quase **1 em cada 3 moradores**.

Apesar da escala da política socioassistencial, os dados disponíveis ainda não permitem responder com precisão perguntas fundamentais para a gestão pública, como:

- Quem está sendo atendido?
- Onde estão as famílias que não estão sendo atendidas?
- Quanto tempo as famílias permanecem em situação de vulnerabilidade?
- Quantas pessoas conseguem alcançar emancipação social?

Este projeto busca estruturar uma **infraestrutura analítica mínima** capaz de responder a essas perguntas de forma sistemática.

---

# Princípio central

> **A arquitetura de dados deve refletir a política pública — nunca substituí-la.**

A proposta de modelagem:

- não altera fluxos institucionais
- não cria novos cadastros
- não redefine competências administrativas

Ela apenas organiza os **dados já existentes**, permitindo uma leitura:

- estratégica  
- territorial  
- longitudinal  

da política socioassistencial municipal.

---

# Arquitetura analítica do projeto

A lógica analítica do Atlas Social organiza a política pública na seguinte cadeia:

Pessoa
↓
Família
↓
Domicílio
↓
Território
↓
Programa Social
↓
Serviço
↓
Resultado


Essa estrutura permite compreender a política socioassistencial como um **processo territorial e longitudinal**, e não apenas como registros administrativos isolados.

---

# Estrutura do repositório

| Diretório | Conteúdo |
|-----------|----------|
| `00_governanca` | princípios arquitetônicos, fundamentos institucionais e LGPD |
| `01_modelagem_conceitual` | definição das entidades centrais da política social |
| `02_modelagem_logica` | esquemas de tabelas e dicionários de dados |
| `03_indicadores_mvp` | definição dos indicadores estruturantes do sistema |
| `04_documento_tecnico` | documentação formal da arquitetura analítica |
| `05_plano_evolutivo` | roteiro de evolução do projeto |

---

# Modelo de dados (visão simplificada)

O modelo segue princípios clássicos de **modelagem analítica dimensional**.

## Dimensões principais

- Pessoa  
- Família  
- Território  
- Programas sociais  
- Unidades de atendimento  
- Normas jurídicas  
- Colegiados e governança  

## Tabelas de fatos

- Atendimentos  
- Concessão de benefícios  
- Participação em programas sociais  

Essas estruturas permitem análises **territoriais, temporais e institucionais** da política pública.

---

# O que este repositório **não contém**

Por razões legais e éticas, este repositório **não inclui**:

- dados pessoais
- microdados do CadÚnico
- informações identificáveis de cidadãos
- dados operacionais de sistemas municipais

O conteúdo disponibilizado inclui apenas:

- estruturas de dados
- dicionários
- esquemas analíticos
- documentação metodológica
- exemplos sintéticos

---

# Tecnologia utilizada no MVP

| Camada | Tecnologia |
|------|-------------|
| Banco de dados | SQLite |
| Ambiente | Debian 12 |
| Versionamento | GitHub |
| Próxima etapa | PostgreSQL + pipeline ELT |

---

# Contexto institucional

Município: **Hortolândia – SP**

Secretaria: **Inclusão e Desenvolvimento Social**

Responsável técnico: **Ailton Vendramini**

Ano de início: **2026**

Fase atual: **MVP — validação técnica e estratégica**

---

# Objetivo de longo prazo

Construir uma **arquitetura de dados sociais replicável para municípios brasileiros**, permitindo integrar:

- Cadastro Único
- rede socioassistencial
- equipamentos públicos
- organizações da sociedade civil
- análise territorial da vulnerabilidade social

---

# Licença

Projeto institucional público.

Não contém dados pessoais e segue os princípios da **Lei Geral de Proteção de Dados (LGPD)** e boas práticas de **governança de dados no setor público**.
