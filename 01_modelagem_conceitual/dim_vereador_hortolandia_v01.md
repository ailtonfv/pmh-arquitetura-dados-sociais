# DIM_VEREADOR — Vereadores de Hortolândia (Interface Legislativa da Assistência Social)

**Versão:** 02 (proposta)  
**Data:** 03/03/2026  
**Responsável:** Ailton Vendramini  
**Fonte primária:** SAPL — Câmara Municipal de Hortolândia (sapl.hortolandia.sp.leg.br)  
**Repositório:** Projeto CadÚnico — Hortolândia  

---

## 1) Objetivo
Registrar vereadores (Legislativo municipal) como **entidade rastreável** para:
- atribuir autoria de **Projetos de Lei (PL/PLC/etc.)**;
- permitir perguntas auditáveis do tipo:
  - *“Qual vereador propôs este PL?”*
  - *“Qual PL originou esta Lei?”*
  - *“Que leis criaram/alteraram programas do DIM_PROGRAMA?”*
- consolidar um **grafo normativo** que sustenta programas/serviços/unidades da Assistência Social.

---

## 2) Princípio estruturante
O modelo deve suportar:
- **mudança de legislatura** (pessoas entram/saem);
- **mudança de partido e situação de exercício**;
- **mudança normativa** (PL vira norma, norma altera programa, etc.);
- rastreabilidade de autoria e responsabilidades **sem depender de memória institucional**.

---

## 3) Posição na cadeia relacional do projeto (grafo)
DIM_VEREADOR  
&nbsp;&nbsp;↓ (1:N)  
DIM_PL (matérias legislativas: PL, PLC, PDL, PR, etc.)  
&nbsp;&nbsp;↓ (N:N) via REL_PL_NORMA  
DIM_NORMA_JURIDICA (Lei/Decreto/Portaria/Resolução/...)  
&nbsp;&nbsp;↓ (N:N) via REL_NORMA_PROGRAMA  
DIM_PROGRAMA → DIM_SERVICO → DIM_UNIDADE → DIM_LOTEAMENTO → (Pessoa/Família/Território)

> **Nota crítica:** PL → Norma não é sempre 1:1. Um PL pode resultar em substitutivo, virar outra numeração, ou consolidar alterações; e uma norma pode ter origem em PL do Executivo. Por isso, **REL_PL_NORMA** é a forma “à prova de realidade”.

---

## 4) Regras de modelagem (essenciais)
- Vereador é **autor** (pessoa política) com atributos próprios e históricos.
- O “tema” (assistência social etc.) é atributo do **PL** e/ou da **Norma**, não do vereador.
- “Secretaria vinculada” é atributo **derivado** (a partir do programa/unidade) e deve ficar em:
  - DIM_PL (campo sugestivo) e/ou
  - REL_PL_NORMA / REL_NORMA_PROGRAMA (campo de rastreio), evitando “chute” na DIM_VEREADOR.

---

## 5) Estrutura da DIM_VEREADOR (dicionário de dados)

### 5.1 Campos (propostos)
- **id_vereador** (PK surrogate)
- **cod_vereador** (ex.: V001…; seu padrão interno)
- **nome_politico** (nome parlamentar / como aparece no SAPL)
- **nome_completo** (nome civil)
- **partido_sigla** (sigla atual)
- **legislatura** (ex.: 9ª Legislatura 2025–2028)
- **inicio_mandato** (YYYY-MM-DD, quando disponível)
- **fim_mandato** (YYYY-MM-DD, quando aplicável)
- **em_exercicio** (S/N)
- **tipo_ingresso** (Eleito | Suplente | Substituição | A confirmar)
- **cargo_mesa** (Presidente | Vice | 1º Secretário | 2º Secretário | NULL)
- **email_institucional** (se houver)
- **fonte_confirmacao** (SAPL | Diário Oficial | Jornal | A confirmar)
- **url_perfil_sapl** (link do parlamentar no SAPL)
- **observacoes**

### 5.2 Regras de qualidade
- `nome_politico` deve bater com SAPL (fonte canônica).
- `nome_completo` pode exigir validação cruzada (SAPL/Diário Oficial).
- `em_exercicio = N` exige motivo documentado em `observacoes` (licença, cassação, término etc.).
- `partido_sigla`: aceitar histórico? (se quiser histórico, vira tabela REL_VEREADOR_PARTIDO; por ora, manter o “atual” e registrar troca em observações).

---

## 6) Tabela inicial — 9ª Legislatura (2025–2028)

### 6.1 Vereadores em exercício
| cod_vereador | nome_politico              | nome_completo                         | partido_sigla | legislatura              | em_exercicio | cargo_mesa   | fonte |
|---|---|---|---|---|---|---|---|
| V001 | Aldemir Clemente          | Aldemir Clemente da Silva             | PODE          | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V002 | Ananias                   | Ananias José Barbosa                  | REPUBLICANOS  | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V003 | Carrão da Nova Europa     | Carlos Rodrigues de Oliveira          | PV            | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V004 | Cesinha Brasil            | Cícero César Brasil                   | PSB           | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V005 | Nei Prazeres              | Claudinei Prazeres de Barros          | PP            | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V006 | Clemilton Silva           | Clemilton Alves da Silva              | PL            | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V007 | Clodoaldo                 | Clodoaldo Santos da Silva             | PODE          | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V008 | Daniel Laranjeira         | Daniel Laranjeira                     | PSD           | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V009 | Derli                     | Derli de Jesus Athanazio Bueno        | PCdoB         | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V010 | Dionatan Domingues        | Dionata Domingues                     | PP            | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V011 | Zaca                      | Edimilson Marcelo Afonso              | REPUBLICANOS  | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V012 | Edivildo                  | Edivaldo Sousa Araújo                 | PP            | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V013 | Ceará                     | Edivam Campos de Albuquerque          | UNIÃO         | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V014 | Luiz Regional             | Luiz Carlos Silva Meira               | REPUBLICANOS  | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V015 | Paulão                    | Paulo Pereira Filho                   | REPUBLICANOS  | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V016 | Régis da Serralheria      | Reginaldo Roberto Rodrigues da Costa  | PSB           | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V017 | Professora Roberta Diniz  | Roberta Morais Diniz                  | PT            | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V018 | Sidney Cabrito            | Sidney Eloi Vianna                    | PSB           | 9ª (2025–2028)           | S | A confirmar | SAPL |
| V019 | Nego (apelido a confirmar) | Valdecir Alves Pereira               | PSD           | 9ª (2025–2028)           | S | A confirmar | SAPL |

### 6.2 Vereadores fora de exercício
| cod_vereador | nome_politico | nome_completo               | partido_sigla | legislatura    | em_exercicio | motivo      | fonte |
|---|---|---|---|---|---|---|---|
| V020 | Léo do LM | Leonardo Martins Moreira | PSB | 9ª (2025–2028) | N | A confirmar | SAPL |

**Nota:** Lenivaldo Pauliuki — ex-vereador; migrou para o Executivo municipal (Secretário Adjunto). Deve aparecer como **autor histórico** no SAPL em legislaturas anteriores e poderá surgir em DIM_PL (autor) ao mapear anos passados.

---

## 7) Saídas (perguntas que o modelo precisa responder)
- Qual vereador propôs este PL? → **DIM_VEREADOR → DIM_PL**
- Qual PL originou esta Lei? → **DIM_PL → REL_PL_NORMA → DIM_NORMA_JURIDICA**
- Esta norma ainda é vigente? → **DIM_NORMA_JURIDICA.ativo / data_revogacao**
- Esta norma foi alterada ou revogada por outra? → **DIM_NORMA_JURIDICA.norma_revogadora**
- Qual lei criou/alterou determinado programa? → **REL_NORMA_PROGRAMA**

---

## 8) Pendências e evolução (roteiro objetivo)
- Confirmar **Mesa Diretora** (cargo_mesa) no SAPL/Diário.
- Confirmar **“Nego”** (nome político padronizado, sem ruído).
- Extrair **listagem completa de PLs 2025–2026** e preencher DIM_PL + REL_PL_NORMA.
- Criar **DIM_COMISSAO** e **REL_VEREADOR_COMISSAO** (opcional, mas valioso para “temas sociais”).
- Mapear autores do Executivo em DIM_PL: usar campo `autor_tipo` em DIM_PL (Vereador | Comissão | Executivo | Outro).

---

## 9) Referências (base normativa e institucional)
- BRASIL. Constituição da República Federativa do Brasil de 1988, arts. 203–204.  
- BRASIL. Lei nº 8.742, de 7 de dezembro de 1993 (LOAS).  
- CNAS. Resolução nº 109, de 11 de novembro de 2009 (Tipificação Nacional de Serviços Socioassistenciais).  
- Câmara Municipal de Hortolândia. SAPL — Sistema de Apoio ao Processo Legislativo (repositório oficial de matérias e normas).  
