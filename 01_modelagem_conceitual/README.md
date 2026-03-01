# 01 — Modelagem Conceitual

Esta pasta contém os documentos que definem **o que o sistema precisa conhecer** antes de qualquer linha de código ou esquema de banco de dados.

A modelagem conceitual responde à pergunta: quais são as entidades do mundo real que o projeto precisa representar, e como elas se relacionam?

---

## Conteúdo atual

### `dim_programa_v03.md`
Catálogo dos programas municipais de assistência social, habitação, segurança alimentar, inserção produtiva, direitos humanos e formação cultural de Hortolândia.

Extraído a partir de levantamento documental cobrindo 2023–2024, atualizado incrementalmente via ciclo jornalístico (Tribuna Liberal) e varredura do site oficial da Prefeitura. Organizado em 9 grupos com mais de 35 programas catalogados. Para cada programa registra: secretaria responsável, departamento executor, público-alvo, vínculo com o CadÚnico, tipo de intervenção (serviço direto ou política articuladora) e nível de proteção social.

Este catálogo é a base para a futura tabela `DIM_PROGRAMA` no banco de dados.

### `dim_gestor_v02.md`
Catálogo dos gestores municipais de Hortolândia com relevância para o projeto de inteligência territorial da assistência social.

Cobre prefeito, vice-prefeito, secretários titulares, secretários adjuntos, diretores de departamentos estratégicos e presidentes de conselhos municipais. Inclui campo `ativo` para rastreamento de substituições sem perda de histórico.

Este catálogo é a base para a futura tabela `DIM_GESTOR` no banco de dados e alimenta o campo `secretaria_responsavel` do `DIM_PROGRAMA`.

### `dim_territorio_cras_v01.md`
Mapeamento dos 7 CRAS de Hortolândia com seus respectivos loteamentos de abrangência.

Fonte: planilha oficial da Secretaria de Inclusão e Desenvolvimento Social, atualizada em 06/02/2026. Os nomes dos loteamentos estão em processo de padronização — serão ajustados no cruzamento com a base oficial de loteamentos do município.

Este documento é a base para a futura tabela `DIM_TERRITORIO` no banco de dados.

---

## Os 7 CRAS de Hortolândia

| CRAS | Homenageado | Endereço |
|------|------------|---------|
| Jardim Santa Clara | — | Rua Estados Unidos, 217 |
| Jardim Amanda | — | Av. Tarsila do Amaral, 540 |
| Jardim Novo Ângulo | — | Rua Francisco Bereta, 330 |
| Rosolém | Joel Alves Assunção | Rua Guido Rosolém, 177 |
| Primavera | Chico Vigilante | Rua Amoreira, 35 |
| Jardim Brasil | Maria Humilde Antunes (Zuma) | Rua da Amizade, 240 |
| Vila Real | — | Rua Ernesto Bergamasco, 185 |

---

## O que vem a seguir nesta pasta

- Mapeamento definitivo de loteamentos com grafia padronizada
- Diagrama conceitual Pessoa → Família → Território → Programa
- Definição formal das entidades e seus atributos principais

---

## Relação com outras pastas

Os documentos desta pasta alimentam diretamente a `02_modelagem_lógica`, onde as entidades conceituais se tornam tabelas com campos, tipos e relacionamentos definidos.
