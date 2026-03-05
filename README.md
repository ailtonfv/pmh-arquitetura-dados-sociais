# Atlas Social de Hortolândia
Arquitetura de Dados Sociais para Políticas Públicas Municipais

Repositório do projeto **Atlas Social de Hortolândia**, iniciativa de arquitetura de dados sociais aplicada à política socioassistencial do município.

O projeto desenvolve uma infraestrutura analítica mínima para compreender e acompanhar a dinâmica da vulnerabilidade social no território municipal, utilizando dados públicos já existentes e respeitando integralmente a legislação de proteção de dados.

---

# Contexto

Hortolândia possui aproximadamente **240 mil habitantes** e cerca de **73 mil pessoas inscritas no Cadastro Único** — quase **1 em cada 3 moradores**.

Apesar da escala da política social, os dados disponíveis ainda não permitem responder com precisão perguntas fundamentais para a gestão pública, como:

- Quem está sendo atendido?
- Onde estão as famílias que não estão sendo atendidas?
- Quanto tempo as famílias permanecem em situação de vulnerabilidade?
- Quantas conseguem alcançar emancipação social?

Este projeto busca estruturar uma **infraestrutura analítica mínima** para responder a essas perguntas.

---

# Princípio central

> **A arquitetura de dados deve refletir a política pública — nunca substituí-la.**

A proposta de modelagem:

- não altera fluxos institucionais
- não cria novos cadastros
- não redefine competências administrativas

Ela organiza os **dados já existentes**, permitindo leitura:

- estratégica
- territorial
- longitudinal

da política socioassistencial municipal.

---

# Cadeia analítica do modelo

Pessoa → Família → Território → Programa → Serviço → Resultado

Esta cadeia estrutura a lógica analítica utilizada no projeto e orienta a modelagem dos dados.

---

# Estrutura do repositório

| Diretório | Conteúdo |
|-----------|----------|
| `00_governanca` | princípios arquitetônicos, LGPD e escopo institucional |
| `01_modelagem_conceitual` | definição das entidades centrais da política social |
| `02_modelagem_logica` | esquemas de tabelas e dicionários de dados |
| `03_indicadores_mvp` | indicadores estruturantes da análise social |
| `04_documento_tecnico` | documentação formal da arquitetura |
| `05_plano_evolutivo` | roteiro de expansão do projeto |

---

# O que este repositório **não contém**

Por razões legais e éticas, este repositório **não inclui**:

- dados pessoais
- microdados do CadÚnico
- informações identificáveis de cidadãos
- dados operacionais dos sistemas municipais

O conteúdo disponibilizado inclui apenas:

- estruturas de dados
- dicionários
- esquemas analíticos
- documentação metodológica
- exemplos sintéticos.

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

Fase atual: **MVP – validação técnica e estratégica**

---

# Licença

Projeto institucional público.

Não contém dados pessoais e segue os princípios da **Lei Geral de Proteção de Dados (LGPD)** e boas práticas de **governança de dados no setor público**.

---

# Objetivo de longo prazo

Construir uma **arquitetura de dados sociais replicável para municípios brasileiros**, permitindo integração entre:

- Cadastro Único
- rede socioassistencial
- equipamentos públicos
- organizações da sociedade civil
- análise territorial da vulnerabilidade social.
