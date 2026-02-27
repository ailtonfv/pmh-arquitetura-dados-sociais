# pmh-arquitetura-dados-sociais

Repositório de desenvolvimento do projeto de arquitetura analítica do CadÚnico municipal de Hortolândia — SP.

## O que é este projeto

Hortolândia tem aproximadamente 240 mil habitantes e cerca de 73 mil pessoas inscritas no CadÚnico — quase 1 em cada 3 moradores. Apesar da escala, os dados disponíveis não permitem ainda responder perguntas básicas: quem está sendo atendido, onde estão os que não estão sendo atendidos, quanto tempo as famílias permanecem em situação de vulnerabilidade, quem conseguiu emancipação.

Este projeto constrói a infraestrutura analítica mínima para responder essas perguntas — partindo de dados já existentes, sem depender de convênios federais ou novos sistemas, e respeitando integralmente a LGPD.

## Princípio central

> A arquitetura de dados deve refletir a política pública — nunca substituí-la.

A modelagem proposta não altera fluxos institucionais, não cria novos cadastros e não redefine competências administrativas. Ela organiza os dados já existentes para permitir leitura estratégica, territorial e longitudinal da política socioassistencial.

## Cadeia analítica

```
Pessoa → Família → Território → Programa → Serviço → Resultado
```

## O que este repositório contém

| Pasta | Conteúdo |
|---|---|
| `00_governança` | Princípios arquiteturais, LGPD, escopo do MVP |
| `01_modelagem_conceitual` | Catálogo de programas municipais, territórios por CRAS |
| `02_modelagem_lógica` | Esquemas das tabelas, dicionário de dados |
| `03_indicadores_mvp` | Definição e fórmulas dos três indicadores estruturantes |
| `04_documento_técnico` | Documentação formal do sistema |
| `05_plano_evolutivo` | Roadmap e direção de longo prazo |

## O que este repositório não contém

- Dados pessoais de nenhuma natureza
- Microdados do CadÚnico ou de qualquer sistema municipal
- Informações que permitam identificar pessoas ou famílias

Apenas código, esquemas, dicionários e amostras sintéticas.

## Tecnologia do MVP

- **Banco de dados:** SQLite (fase inicial — prototipagem)
- **Ambiente de execução:** Debian 12 (máquina institucional)
- **Versionamento:** GitHub
- **Evolução futura:** PostgreSQL, pipeline ELT, integração via API

## Contexto institucional

- **Município:** Hortolândia — SP
- **Secretaria:** Inclusão e Desenvolvimento Social
- **Responsável técnico:** Ailton Vendramini
- **Início do projeto:** 2026
- **Fase atual:** MVP — validação técnica e estratégica

## Licença

Projeto de uso institucional público. Sem dados pessoais. Alinhado à LGPD e às boas práticas de governança de dados do setor público.


