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
